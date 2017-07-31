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
    int gradeTent;
    int brand;
    String model;
    int year;
    int month;
    int subModel;
    long middlePrice;
    int NCB;
    String occupation;
    int income;
    int dept;
    int guarantee;

    public InputData() {
    }

    public InputData(int gradeTent, int brand, String model, int year, int month, int subModel, long middlePrice, int NCB, String occupation, int income, int dept, int guarantee) {
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
    

}
