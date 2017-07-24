/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 *
 * @author yacth_Mon
 */
public class carAge {

    int carAgeId;
    String age;

    public carAge(int carAgeId, String age) {
        this.carAgeId = carAgeId;
        this.age = age;
    }

    public carAge() {
    }

    public int getCarAgeId() {
        return carAgeId;
    }

    public void setCarAgeId(int carAgeId) {
        this.carAgeId = carAgeId;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public static int getCarAgeId(int currentYear) {
        int carAge = Calendar.getInstance(new Locale("US")).get(Calendar.YEAR) - currentYear;
        int result =-1;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM carage";
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                String check = rs.getString("age");
                int between = check.indexOf("-"); // find if between type like 0-7 or 8-10
                if (between > 0) {
                    int low = Integer.parseInt(check.substring(0, between));
                    int high = Integer.parseInt(check.substring(between + 1));
                    if (carAge >= low && carAge <= high) {// if carAge in range
                        result = rs.getInt("ageId");
                    }
                } else {
                    int greater = check.indexOf("+"); // find if it greater than type like 11+
                    if (greater > 0) {
                        int number = Integer.parseInt(check.substring(0, greater));
                        if (carAge >= number) { // if carAge equal or greater than
                            result = rs.getInt("ageId");
                        }
                    }
                }
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        };
        return result;
    }
    
    public static String getAgeFromId(int id){
        String result ="";
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT age FROM carage WHERE ageId=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = rs.getString("age");
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        };        
        return result;
    }
    
    public static Map<Integer,String> getAllCarAge(){
        Map<Integer,String> carAges =  new HashMap<Integer,String>();
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM carage";
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                carAges.put(rs.getInt("ageId"), rs.getString("age"));
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        };        
        return carAges;
    }
}
