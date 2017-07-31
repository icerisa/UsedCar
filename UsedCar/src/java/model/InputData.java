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
public class InputData {
    String gradeTent;
    String brand;
    String model;
    String year;
    String month;
    String subModel;
    String middlePrice;
    String NCB;
    String occupation;
    String income;
    String dept;
    String guarantee;

    public InputData() {
    }

    public InputData(String gradeTent, String brand, String model, String year, String month, String subModel, String middlePrice, String NCB, String occupation, String income, String dept, String guarantee) {
        this.gradeTent = gradeTent;
        this.brand = brand;
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

    public String getGradeTent() {
        return gradeTent;
    }

    public void setGradeTent(String gradeTent) {
        this.gradeTent = gradeTent;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getSubModel() {
        return subModel;
    }

    public void setSubModel(String subModel) {
        this.subModel = subModel;
    }

    public String getMiddlePrice() {
        return middlePrice;
    }

    public void setMiddlePrice(String middlePrice) {
        this.middlePrice = middlePrice;
    }

    public String getNCB() {
        return NCB;
    }

    public void setNCB(String NCB) {
        this.NCB = NCB;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }
    
}
