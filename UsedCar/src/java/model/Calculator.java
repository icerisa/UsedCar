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
    //----------- คำนวน
    int rowToShow;
    float rate48, rate60, rate72;
    double[] loan = null, loan48 = null, loan60 = null, loan72 = null;
    int[] atleastIncome48 = null, atleastIncome60 = null, atleastIncome72 = null;
    int[] highestDept48 = null, highestDept60 = null, highestDept72 = null;

    //----------- คำนวน
    public Calculator(int gradeTent, int brandId, String model, int year, int month, int sub_model, long middle_price, int NCBType, String occupation, int income, int dept, int guarantee) {
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

    public int getRowToShow() {
        return rowToShow;
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

    public double getLoan(int i) {
        return loan[i];
    }

    public double getLoan48(int i) {
        return loan48[i];
    }

    public double getLoan60(int i) {
        return loan60[i];
    }

    public double getLoan72(int i) {
        return loan72[i];
    }

    public int getAtleastIncome48(int i) {
        return atleastIncome48[i];
    }

    public int getAtleastIncome60(int i) {
        return atleastIncome60[i];
    }

    public int getAtleastIncome72(int i) {
        return atleastIncome72[i];
    }

    public int getHighestDept48(int i) {
        return highestDept48[i];
    }

    public int getHighestDept60(int i) {
        return highestDept60[i];
    }

    public int getHighestDept72(int i) {
        return highestDept72[i];
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
            rate.getData(guarantee, Brand.getBrandTypeFromId(brandId), year, KKBook.getAutoTypeFromId(bookId), pdpg.getMaxTerm());
            this.rate = rate;// find rate that match with information
        }
        this.ncb = new NCB(this.ncbType);
    }

    public void saveTransaction(int accountId) {
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

    public void doCalculate(int rowToShow) {
        //------------- Initial ---------------------
        this.rowToShow = rowToShow;
        loan = new double[rowToShow];
        rate48 = getRate().getRate48() / 100f;
        rate60 = getRate().getRate60() / 100f;
        rate72 = getRate().getRate72() / 100f;
        if (this.pdpg_used.maxTerm >= 48) {
            loan48 = new double[rowToShow];//ถ้า Term มากกว่า 48 ค่อย new double[6] ให้
            atleastIncome48 = new int[rowToShow];// ประกาศ Array รายได้ขั้นต่ำ
            highestDept48 = new int[rowToShow];// ประกาศ Array ให้ภาระหนี้สูงสุด
        }
        if (this.pdpg_used.maxTerm >= 60) {
            loan60 = new double[rowToShow];//ถ้า Term มากกว่า 60 ค่อย new double[6] ให้
            atleastIncome60 = new int[rowToShow];// ประกาศ Array รายได้ขั้นต่ำ
            highestDept60 = new int[rowToShow];// ประกาศ Array ให้ภาระหนี้สูงสุด
        }
        if (this.pdpg_used.maxTerm >= 72) {
            loan72 = new double[rowToShow];//ถ้า Term มากกว่า 72 ค่อย new double[6] ให้
            atleastIncome72 = new int[rowToShow];// ประกาศ Array รายได้ขั้นต่ำ
            highestDept72 = new int[rowToShow];// ประกาศ Array ให้ภาระหนี้สูงสุด
        }
        //------------- Initial ---------------------
        //------------- Calculate -------------------
        for (int i = 0; i < rowToShow; i++) { // คำนวณค่าแต่ละ Row
            float currentLtv = (this.pdpg_used.maxLTV - (5 * i)) / 100f;
            loan[i] = currentLtv * middle_price;
            if (this.pdpg_used.maxTerm >= 48) { // 48 Term
                if (loan48 != null) { // ค่างวด
                    loan48[i] = (rate48 * loan[i] * (48 / 12) + loan[i]) / 48f;
                }
                if (atleastIncome48 != null) { //รายได้ขั้นต่ำ
                    atleastIncome48[i] = ((int) loan48[i]) * 2;
                }
                if (highestDept48 != null) {//ภาระหนี้สูงสุด
                    highestDept48[i] = (int) ((atleastIncome48[i] * 0.85f) - loan48[i]);
                    highestDept48[i] = (highestDept48[i] * 1000) / 100000 * 100; //ปัดเศษหลักร้อยทิ้ง
                }
            }
            if (this.pdpg_used.maxTerm >= 60) {// 60 Term
                if (loan60 != null) {// ค่างวด
                    loan60[i] = (rate60 * loan[i] * (60 / 12) + loan[i]) / 60f;
                }
                if (atleastIncome60 != null) {//รายได้ขั้นต่ำ
                    atleastIncome60[i] = ((int) loan60[i]) * 2;
                }
                if (highestDept60 != null) {//ภาระหนี้สูงสุด
                    highestDept60[i] = (int) ((atleastIncome60[i] * 0.85f) - loan60[i]);
                    highestDept60[i] = (highestDept60[i] * 1000) / 100000 * 100; //ปัดเศษหลักร้อยทิ้ง
                }
            }
            if (this.pdpg_used.maxTerm >= 72) { // 72 Term
                if (loan72 != null) {// ค่างวด
                    loan72[i] = (rate72 * loan[i] * (72 / 12) + loan[i]) / 72f;
                }
                if (atleastIncome72 != null) {//รายได้ขั้นต่ำ
                    atleastIncome72[i] = ((int) loan72[i]) * 2;
                }
                if (highestDept72 != null) {//ภาระหนี้สูงสุด
                    highestDept72[i] = (int) ((atleastIncome72[i] * 0.85f) - loan72[i]);
                    highestDept72[i] = (highestDept72[i] * 1000) / 100000 * 100; //ปัดเศษหลักร้อยทิ้ง
                }
            }
        }
        //------------- Calculate -------------------
    }
}
