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
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author yacth_Mon
 */
public class KKBook {
    int bookId;
    int brandId;
    String carModel;
    int carYear;
    int autoTypeId;
    String carSubModel;
    int carMiddlePrice;

    public KKBook(int bookId, int brandId, String carModel, int carYear, int autoTypeId, String carSubModel, int carMiddlePrice) {
        this.bookId = bookId;
        this.brandId = brandId;
        this.carModel = carModel;
        this.carYear = carYear;
        this.autoTypeId = autoTypeId;
        this.carSubModel = carSubModel;
        this.carMiddlePrice = carMiddlePrice;
    }
    
    public KKBook() {
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getCarModel() {
        return carModel;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
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

    public String getCarSubModel() {
        return carSubModel;
    }

    public void setCarSubModel(String carSubModel) {
        this.carSubModel = carSubModel;
    }

    public int getCarMiddlePrice() {
        return carMiddlePrice;
    }

    public void setCarMiddlePrice(int carMiddlePrice) {
        this.carMiddlePrice = carMiddlePrice;
    }
    
    public static ArrayList<String> getAllModelFromBrand(int brandId){
        ArrayList<String> models = new ArrayList<String>();
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT DISTINCT carModel FROM kk_book WHERE brandId=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setInt(1, brandId);
          ResultSet rs = pstm.executeQuery();
          while(rs.next()){
              models.add(rs.getString("carModel"));
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return models;
    }
    public static ArrayList<Integer> getAllYearFromModel(String model){
        ArrayList<Integer> years = new ArrayList<Integer>();
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT DISTINCT carYear FROM kk_book WHERE carModel=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setString(1, model);
          ResultSet rs = pstm.executeQuery();
          while(rs.next()){
              years.add(rs.getInt("carYear"));
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return years;
    }
    public static Map<Integer,String> getAllSubModelFromModelYear(String model, int year){
        Map<Integer,String> subModels = new HashMap<Integer,String>();
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT bookId,carSubModel FROM kk_book WHERE carModel=? AND carYear=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setString(1, model);
          pstm.setInt(2, year);
          ResultSet rs = pstm.executeQuery();
          while(rs.next()){              
              subModels.put(rs.getInt("bookId"),rs.getString("carSubModel"));
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return subModels;
    }
    
    public static int getMiddlePriceFromPK(int pk){
        int middle_price = 0;
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT carMiddlePrice FROM kk_book WHERE bookId=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setInt(1, pk);
          ResultSet rs = pstm.executeQuery();
          if(rs.next()){
              middle_price = rs.getInt("carMiddlePrice");
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return middle_price;
    }
    
    public static String getSubModelFromId(int id){
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT carSubModel FROM kk_book WHERE bookId=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setInt(1, id);
          ResultSet rs = pstm.executeQuery();
          if(rs.next()){
              return rs.getString("carSubModel");
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return "Sub Model not found";
    }
    public static int getAutoTypeFromId(int id){
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT autoTypeId FROM kk_book WHERE bookId=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setInt(1, id);
          ResultSet rs = pstm.executeQuery();
          if(rs.next()){
              return rs.getInt("autoTypeId");
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return -1;
    }
}
