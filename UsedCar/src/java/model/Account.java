/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.DBConnector;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Account {

    int accountId;
    String userName;
    String accountName;
    String accountSurname;
    String accountEmail;
    String accountPhone;
    boolean admin;
    // Result Code
    public static class ResultCode{ public static final int UNKNOW_ERROR = 0, SUCCESS = 1, USERNAME_DUPLICATE = 2, USERNAME_NOT_FOUND = 3;}
    public Account() {
    }

    public Account(String userName, String accountName, String accountSurname, String accountEmail, String accountPhone, boolean admin) {        
        this.userName = userName;
        this.accountName = accountName;
        this.accountSurname = accountSurname;
        this.accountEmail = accountEmail;
        this.accountPhone = accountPhone;
        this.admin = admin;
    }

    public int getAccountId() {
        return accountId;
    }

    public String getUserName() {
        return userName;
    }

    public String getAccountName() {
        return accountName;
    }

    public String getAccountSurname() {
        return accountSurname;
    }

    public String getAccountEmail() {
        return accountEmail;
    }

    public String getAccountPhone() {
        return accountPhone;
    }


    public boolean isAdmin() {
        return admin;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public void setAccountSurname(String accountSurname) {
        this.accountSurname = accountSurname;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }

    public void setAccountPhone(String accountPhone) {
        this.accountPhone = accountPhone;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public boolean confirmPassword(String password){
       boolean result = false;
        String passwordEncrypt = md5(password);
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM account WHERE id=? AND password=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, this.accountId);
            pstm.setString(2, passwordEncrypt);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    
    public boolean doLogin(String username, String password) {
        boolean result = false;
        String passwordEncrypt = md5(password);
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM account WHERE username=? AND password=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, username);
            pstm.setString(2, passwordEncrypt);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                this.accountId = rs.getInt("accountId");
                this.userName = rs.getString("username");
                this.accountName = rs.getString("accountName");
                this.accountSurname = rs.getString("accountSurname");
                this.accountEmail = rs.getString("accountEmail");
                this.accountPhone = rs.getString("accountPhone");                
                this.admin = rs.getInt("userType") == 0 ? true : false;// if userType 0 is Admin
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public int doRegister(String password) {
        int result = ResultCode.UNKNOW_ERROR; // UNKNOW ERROR FIRST
        try {
            Connection con = DBConnector.getConnection();
            String sql = "INSERT INTO `account`( `username`, `password`, `accountName`, `accountSurname`, `accountEmail`, `accountPhone`, `userType`) "
                    + "VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, this.userName);
            pstm.setString(2, md5(password));
            pstm.setString(3, this.accountName);
            pstm.setString(4, this.accountSurname);
            pstm.setString(5, this.accountEmail);
            pstm.setString(6, this.accountPhone);            
            pstm.setInt(7, this.admin ? 0 : 1); //only if this user is admin then userType should be 0
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = ResultCode.SUCCESS; // Success
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error code : " + e.getErrorCode());
            if(e.getErrorCode()==1062){ // 1062 is duplicate error code
                result = ResultCode.USERNAME_DUPLICATE; // Duplicate username
            }
        } catch(Exception e){
            System.out.println(e);
        }
        return result;
    }
    
    public boolean doUpdate() {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "UPDATE `account` SET `accountName`=?,`accountSurname`=?,`accountEmail`=?,`accountPhone`=? WHERE `accountId`=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, this.accountName);
            pstm.setString(2, this.accountSurname);
            pstm.setString(3, this.accountEmail);
            pstm.setString(4, this.accountPhone);
            pstm.setInt(5, this.accountId);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public static boolean doResetPassword(String username, String password) {
        boolean result = false;
        String passwordEncrypt = md5(password);
        try {
            Connection con = DBConnector.getConnection();
            String sql = "UPDATE `account` SET `password`=? WHERE username=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, passwordEncrypt);
            pstm.setString(2, username);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }   
    

    public static int doDeleteAccount(String username) {
        int result = ResultCode.UNKNOW_ERROR;//UNKNOW ERROR First
        try {
            Connection con = DBConnector.getConnection();
            String sql = "DELETE FROM `account` WHERE username=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, username);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = ResultCode.SUCCESS; // success
            } else if(rs == 0){
                result = ResultCode.USERNAME_NOT_FOUND; // USERNAME_NOT_FOUND
            }
            con.close();
        } catch (SQLException e){
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    
    public static String md5(String data) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(data.getBytes());
            byte byteData[] = md.digest();
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

}
