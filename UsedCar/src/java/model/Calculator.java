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
import java.util.Locale;


public class Calculator {
    int gradeTent;
    int brandId; 
    String model;
    int year;
    int sub_modelId;
    long middle_price;
    int ncbType;
    int income;
    int dept; 
    int month;
    String occupation;
    int guarantee;
    pdpg_used pdpg_used;
    NCB ncb;
    Rate rate;
    
    public Calculator(int gradeTent,int brandId, String model, int year,int month, int sub_model, long middle_price, int NCBType,String occupation, int income, int dept , int guarantee) {
        this.gradeTent = gradeTent;
        this.brandId = brandId;
        this.model = model;
        this.year = year;
        this.month = month;
        this.sub_modelId = sub_model;
        this.middle_price = middle_price;
        this.ncbType = NCBType;
        this.occupation = occupation;
        this.income = income;
        this.dept = dept;
        this.guarantee = guarantee;
    }   

    public Calculator() {
    }

    public NCB getNcb() {
        return ncb;
    }

    public Rate getRate() {
        return rate;
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

    public int getSub_modelId() {
        return sub_modelId;
    }

    public long getMiddle_price() {
        return middle_price;
    }

    public int getNCBType() {
        return ncbType;
    }

    public int getIncome() {
        return income;
    }

    public int getDept() {
        return dept;
    }

    public int getNcbType() {
        return ncbType;
    }

    public int getMonth() {
        return month;
    }

    public String getOccupation() {
        return occupation;
    }

    public int getGuarantee() {
        return guarantee;
    }
    
    @Override
    public String toString() {
        return "Calculator{" + "gradeTent=" + gradeTent + ", brandId=" + brandId + ", model=" + model + ", year=" + year + ", sub_modelId=" + sub_modelId + ", middle_price=" + middle_price + ", ncbType=" + ncbType + ", income=" + income + ", dept=" + dept + ", month=" + month + ", occupation=" + occupation + ", guarantee=" + guarantee + ", pdpg_used=" + pdpg_used + ", ncb=" + ncb + ", rate=" + rate + '}';
    }

    public void getAllData() {
        int carAgeId = getCarAgeId();
        if (carAgeId > -1) {
            pdpg_used pdpg = new pdpg_used();
            pdpg.getData(this.gradeTent, this.ncbType, this.occupation, carAgeId);
            this.pdpg_used = pdpg;// find pdpg_used that match with information
            Rate rate = new Rate();
            rate.getData(guarantee,Brand.getBrandTypeFromId(brandId), year, KKBook.getAutoTypeFromId(sub_modelId), pdpg.getMaxTerm());
            this.rate = rate;// find rate that match with information
        }
        this.ncb = new NCB(this.ncbType);
    }

    public int getCarAgeId() {
        int carAge = Calendar.getInstance(new Locale("US")).get(Calendar.YEAR) - this.year;        
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
                    int high = Integer.parseInt(check.substring(between+1));
                    if (carAge >= low && carAge <= high) {// if carAge in range
                        return rs.getInt("ageId");                        
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
        } catch (SQLException e) {
            System.out.println(e);
        };
        return -1;
    }
}
