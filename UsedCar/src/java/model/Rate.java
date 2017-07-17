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

/**
 *
 * @author yacth_Mon
 */
public class Rate {
    int rateId;
    int brandTypeId;
    int carYear;
    int autoTypeId;
    int term;
    float rate;

    public Rate() {
    }

    public Rate(int rateId, int brandTypeId, int carYear, int autoTypeId, int term, float rate) {
        this.rateId = rateId;
        this.brandTypeId = brandTypeId;
        this.carYear = carYear;
        this.autoTypeId = autoTypeId;
        this.term = term;
        this.rate = rate;
    }

    public int getRateId() {
        return rateId;
    }

    public void setRateId(int rateId) {
        this.rateId = rateId;
    }

    public int getBrandTypeId() {
        return brandTypeId;
    }

    public void setBrandTypeId(int brandTypeId) {
        this.brandTypeId = brandTypeId;
    }

    public int getCarYear() {
        return carYear;
    }

    public void setCarYear(int carYear) {
        this.carYear = carYear;
    }

    public int getAutoTypeId() {
        return autoTypeId;
    }

    public void setAutoTypeId(int autoTypeId) {
        this.autoTypeId = autoTypeId;
    }

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public float getRateNumber() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    @Override
    public String toString() {
        return "Rate{" + "rateId=" + rateId + ", brandTypeId=" + brandTypeId + ", carYear=" + carYear + ", autoTypeId=" + autoTypeId + ", term=" + term + ", rate=" + rate + '}';
    }
    
    public void getData(int brandType,int carYear, int autoTypeId, int term){
        System.out.println(brandType + " : " + carYear + " : " + autoTypeId);
        try{
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM rate WHERE brandType=? AND carYear=? AND autoTypeId=? AND term=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, brandType);
            pstm.setInt(2, carYear);
            pstm.setInt(3, autoTypeId);
            pstm.setInt(4, term);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                this.rateId = rs.getInt("rateId");
                this.brandTypeId = rs.getInt("brandType");
                this.carYear = rs.getInt("carYear");
                this.autoTypeId = rs.getInt("autoTypeId");
                this.term = rs.getInt("term");
                this.rate = rs.getFloat("rate");
            }
        } catch(Exception e){
            System.out.println(e);
        }
    }
}
