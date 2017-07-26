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
    int bookId;
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
        this.bookId = sub_model;
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

    public int getBookId() {
        return bookId;
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
        return "Calculator{" + "gradeTent=" + gradeTent + ", brandId=" + brandId + ", model=" + model + ", year=" + year + ", sub_modelId=" + bookId + ", middle_price=" + middle_price + ", ncbType=" + ncbType + ", income=" + income + ", dept=" + dept + ", month=" + month + ", occupation=" + occupation + ", guarantee=" + guarantee + ", pdpg_used=" + pdpg_used + ", ncb=" + ncb + ", rate=" + rate + '}';
    }

    public void getAllData() {
        int carAgeId = carAge.getCarAgeId(this.year);
        if (carAgeId > -1) {
            pdpg_used pdpg = new pdpg_used();
            pdpg.getData(this.gradeTent, this.ncbType, this.occupation, carAgeId);
            this.pdpg_used = pdpg;// find pdpg_used that match with information
            Rate rate = new Rate();
            rate.getData(guarantee,Brand.getBrandTypeFromId(brandId), year, KKBook.getAutoTypeFromId(bookId), pdpg.getMaxTerm());
            this.rate = rate;// find rate that match with information
        }
        this.ncb = new NCB(this.ncbType);
    }
    
    public void saveTransaction(int accountId){        
        try {
            Connection con = DBConnector.getConnection();
            String sql = "INSERT INTO `transaction`(`customerIncome`, `customerDebt`, `debtSecure`, `bookId`, `accountId`) VALUES (?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, this.income);
            pstm.setInt(2, this.dept);
            pstm.setInt(3, this.guarantee);
            pstm.setInt(4, this.bookId);
            pstm.setInt(5, accountId);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                // success
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }    
    }
}
