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
import java.util.logging.Level;
import java.util.logging.Logger;

public class Account {

    int accountId;
    String userName;
    String accountName;
    String accountSurname;
    String accountEmail;
    String accountPhone;
    int gradeTentId;
    boolean admin;

    public Account() {
    }

    public Account(String userName, String accountName, String accountSurname, String accountEmail, String accountPhone, int gradeTentId, boolean admin) {        
        this.userName = userName;
        this.accountName = accountName;
        this.accountSurname = accountSurname;
        this.accountEmail = accountEmail;
        this.accountPhone = accountPhone;
        this.gradeTentId = gradeTentId;
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

    public int getGradeTentId() {
        return gradeTentId;
    }

    public boolean isAdmin() {
        return admin;
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
                this.gradeTentId = rs.getInt("gradeTentId");
                this.admin = rs.getInt("userType") == 0 ? true : false;// if userType 0 is Admin
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    public boolean doRegister(String password) {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "INSERT INTO `account`( `username`, `password`, `accountName`, `accountSurname`, `accountEmail`, `accountPhone`, `gradeTentId`, `userType`) "
                    + "VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, this.userName);
            pstm.setString(2, md5(password));
            pstm.setString(3, this.accountName);
            pstm.setString(4, this.accountSurname);
            pstm.setString(5, this.accountEmail);
            pstm.setString(6, this.accountPhone);
            pstm.setInt(7, this.gradeTentId);
            pstm.setInt(8, this.admin ? 0 : 1); //only if this user is admin then userType should be 0
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

    public static boolean doDeleteAccount(String username) {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "DELETE FROM `account` WHERE username=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setString(1, username);
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
