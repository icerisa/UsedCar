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
import java.util.Calendar;
import java.util.Locale;

/**
 *
 * @author yacth_Mon
 */
public class Calculator {
    int gradeTent;
    int brandId; 
    String model;
    int year;
    String sub_model;
    long middle_price;
    int NCB;
    int income;
    int dept;    
    pdpg_used pdpg_used;
    
    public Calculator(int gradeTent,int brandId, String model, int year, String sub_model, long middle_price, int NCB, int income, int dept) {
        this.gradeTent = gradeTent;
        this.brandId = brandId;
        this.model = model;
        this.year = year;
        this.sub_model = sub_model;
        this.middle_price = middle_price;
        this.NCB = NCB;
        this.income = income;
        this.dept = dept;
    }

    public Calculator() {
    }

    public pdpg_used getPdpg_used() {
        return pdpg_used;
    }

    public int getGradeTent() {
        return gradeTent;
    }

    public int getBrandId() {
        return brandId;
    }

    public String getModel() {
        return model;
    }

    public int getYear() {
        return year;
    }

    public String getSub_model() {
        return sub_model;
    }

    public long getMiddle_price() {
        return middle_price;
    }

    public int getNCB() {
        return NCB;
    }

    public int getIncome() {
        return income;
    }

    public int getDept() {
        return dept;
    }

    @Override
    public String toString() {
        return "Calculator{" + "gradeTent=" + gradeTent + ", brandId=" + brandId + ", model=" + model + ", year=" + year + ", sub_model=" + sub_model + ", middle_price=" + middle_price + ", NCB=" + NCB + ", income=" + income + ", dept=" + dept + ", pdpg_used=" + pdpg_used +", car_age="+getCarAgeId() +'}';
    }

    public void getPDPG_UsedData() {
        int carAgeId = getCarAgeId();
        if (carAgeId > -1) {
            pdpg_used data = new pdpg_used();
            //int gradeTentId, int ncb_type,String occupation, int carAgeId
            //data.getData(this.gradeTent, this.NCB, , ? occupation ?, carAgeId);
            //this.pdpg_used = data;
        }
    }

    public int getCarAgeId() {
        int carAge = Calendar.getInstance(new Locale("US")).get(Calendar.YEAR) - this.year;        
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM caryear";
            PreparedStatement pstm = con.prepareStatement(sql);            
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                String check = rs.getString("Year");
                int between = check.indexOf("-"); // find if between type like 0-7 or 8-10
                if (between > 0) {
                    int low = Integer.parseInt(check.substring(0, between));
                    int high = Integer.parseInt(check.substring(between+1));
                    if (carAge >= low && carAge <= high) {// if carAge in range
                        return rs.getInt("yearId");                        
                    }
                }
                int greater = check.indexOf("+"); // find if it greater than type like 11+
                if (greater > 0) {
                    int number = Integer.parseInt(check.substring(0, greater));
                    if (carAge > number) { // if carAge more than greater
                        return rs.getInt("yearId");
                    }
                }
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
        return -1;
    }
}
