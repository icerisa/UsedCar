/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author yacth_Mon
 */
public class SaveInputData {
    int gradeTent; //
    int brandId; //
    String model;
    int year;
    int month;
    int subModel;//
    long middlePrice;
    int NCB;//
    String occupation;
    int income;
    int dept;
    int guarantee;//

    public SaveInputData() {
    }

    public SaveInputData(int gradeTent, int brand, String model, int year, int month, int subModel, long middlePrice, int NCB, String occupation, int income, int dept, int guarantee) {
        this.gradeTent = gradeTent;
        this.brandId = brand;
        this.model = model;
        this.year = year;
        this.month = month;
        this.subModel = subModel;
        this.middlePrice = middlePrice;
        this.NCB = NCB;
        this.occupation = occupation;
        this.income = income;
        this.dept = dept;
        this.guarantee = guarantee;
    }

    public int getGradeTent() {
        return gradeTent;
    }

    public void setGradeTent(int gradeTent) {
        this.gradeTent = gradeTent;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getSubModel() {
        return subModel;
    }

    public void setSubModel(int subModel) {
        this.subModel = subModel;
    }

    public long getMiddlePrice() {
        return middlePrice;
    }

    public void setMiddlePrice(long middlePrice) {
        this.middlePrice = middlePrice;
    }

    public int getNCB() {
        return NCB;
    }

    public void setNCB(int NCB) {
        this.NCB = NCB;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public int getIncome() {
        return income;
    }

    public void setIncome(int income) {
        this.income = income;
    }

    public int getDept() {
        return dept;
    }

    public void setDept(int dept) {
        this.dept = dept;
    }

    public int getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(int guarantee) {
        this.guarantee = guarantee;
    }
    

}
