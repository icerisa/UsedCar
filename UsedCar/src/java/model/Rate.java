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
import java.util.ArrayList;

public class Rate {

    int rateId;
    int brandTypeId;
    int guarantee; //ผู้ค้ำ
    int carYear;
    int autoTypeId;
    int term;
    float rate;
    float rate48;
    float rate60;
    float rate72;

    public Rate() {
    }

    public Rate(int rateId, int brandTypeId, int guarantee, int carYear, int autoTypeId, int term, float rate) {
        this.rateId = rateId;
        this.guarantee = guarantee;
        this.brandTypeId = brandTypeId;
        this.carYear = carYear;
        this.autoTypeId = autoTypeId;
        this.term = term;
        this.rate = rate;
    }

    public Rate(int guarantee, int brandTypeId, int carYear, int autoTypeId, int term, float rate) {
        this.brandTypeId = brandTypeId;
        this.guarantee = guarantee;
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

    public int getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(int guarantee) {
        this.guarantee = guarantee;
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

    public float getRate48() {
        return rate48;
    }

    public float getRate60() {
        return rate60;
    }

    public float getRate72() {
        return rate72;
    }

    @Override
    public String toString() {
        return "Rate{" + "rateId=" + rateId + ", brandTypeId=" + brandTypeId + ", guarantee=" + guarantee + ", carYear=" + carYear + ", autoTypeId=" + autoTypeId + ", term=" + term + ", rate=" + rate + ", rate48=" + rate48 + ", rate60=" + rate60 + ", rate72=" + rate72 + '}';
    }

    public static ArrayList<Rate> getAllRate() {
        ArrayList<Rate> rates = new ArrayList<Rate>();
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM rate";
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Rate rate = new Rate();
                rate.setRateId(rs.getInt("rateId"));
                rate.setGuarantee(rs.getInt("guarantee"));
                rate.setBrandTypeId(rs.getInt("brandType"));
                rate.setCarYear(rs.getInt("carYear"));
                rate.setAutoTypeId(rs.getInt("autoTypeId"));
                rate.setTerm(rs.getInt("term"));
                rate.setRate(rs.getFloat("rate"));
                rates.add(rate);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return rates;
    }
    
    public boolean addRate() {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "INSERT INTO `rate`( `guarantee`, `brandType`, `carYear`, `autoTypeId`, `term`, `rate`) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, getGuarantee());
            pstm.setInt(2, getBrandTypeId());
            pstm.setInt(3, getCarYear());
            pstm.setInt(4, getAutoTypeId());
            pstm.setInt(5, getTerm());
            pstm.setFloat(6, getRateNumber());
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
        return result;
    }
    
    public static boolean updateRate(int rateId,int guarantee,int brandTypeId,int carYear,int autoTypeId,int term, float rate){
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "UPDATE `rate` SET `guarantee`=?,`brandType`=?,`carYear`=?,`autoTypeId`=?,`term`=?,`rate`=? WHERE `rateId`=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, guarantee);
            pstm.setInt(2, brandTypeId);
            pstm.setInt(3, carYear);
            pstm.setInt(4, autoTypeId);
            pstm.setInt(5, term);
            pstm.setFloat(6, rate);
            pstm.setInt(7, rateId);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
        return result;
    }

    public static boolean deleteRate(int id) {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "DELETE FROM `rate` WHERE `rateId`=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
        return result;
    }

    public void getData(int guarantee, int brandType, int carYear, int autoTypeId, int term) {
        System.out.println(guarantee + " : " + brandType + " : " + carYear + " : " + autoTypeId);
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM rate WHERE guarantee=? AND brandType=? AND carYear=? AND autoTypeId=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, guarantee);
            pstm.setInt(2, brandType);
            pstm.setInt(3, carYear);
            pstm.setInt(4, autoTypeId);
            //pstm.setInt(5, term);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                this.rateId = rs.getInt("rateId");
                this.guarantee = rs.getInt("guarantee");
                this.brandTypeId = rs.getInt("brandType");
                this.carYear = rs.getInt("carYear");
                this.autoTypeId = rs.getInt("autoTypeId");
                this.term = rs.getInt("term");
                this.rate = rs.getFloat("rate");
                if (rs.getInt("term") == 48) {
                    this.rate48 = rs.getFloat("rate");
                }
                if (rs.getInt("term") == 60) {
                    this.rate60 = rs.getFloat("rate");
                }
                if (rs.getInt("term") == 72) {
                    this.rate72 = rs.getFloat("rate");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
