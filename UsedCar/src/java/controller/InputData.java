/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.KKBook;

/**
 *
 * @author yacth_Mon
 */
public class InputData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");        
        PrintWriter out = response.getWriter(); 
        // รับ brandId มา ส่ง carModel กลับ ((1)เลือก brand เสร็จแล้ว )
        String brandIdParam = request.getParameter("brandId");
        if(brandIdParam != null){
            try{
                int brandId = Integer.parseInt(brandIdParam);                   
                ArrayList<String> models = KKBook.getAllModelFromBrand(brandId);
                out.print("<option value=''>กรุณาเลือก Model</option>");
                for(String model : models){
                    out.println("<option value='" + model +"'>"+model+"</option>");
                }                
            } catch (NumberFormatException e){
                out.print("<option value=''>Brand ที่เลือกผิดพลาด</option>");
            }
            return;
        }
        // รับ carModel มา แล้ว ((2) ส่ง Year กลับ) หรือ ((3) ส่ง carSubModels กลับ)
        String carModelParam = request.getParameter("carModel");
        if(carModelParam != null){            
            String yearParam = request.getParameter("year");
            // รับ year มา (มาพร้อม carModel) ส่ง carSubModels กลับไป ((3)เลือก year เสร็จแล้ว)
            if(yearParam != null){
                try{
                    int year = Integer.parseInt(yearParam);
                    String carModel = request.getParameter("carModel");
                    Map<Integer,String> carSubModels = KKBook.getAllSubModelFromModelYear(carModel, year);
                    out.print("<option value=''>กรุณาเลือก Sub Model</option>");
                    for(Map.Entry<Integer,String> subModel:carSubModels.entrySet()){
                        out.println("<option value='" + subModel.getKey()+"'>"+subModel.getValue()+"</option>");
                    }
                }catch(NumberFormatException e){
                    out.print("<option value=''>Year ที่เลือกผิดพลาด</option>");
                }
                return;
            } else { // รับ carModel มา ส่ง year กลับ ในกรณีที่ไม่ได้เลือก year มาด้วย ((2)เลือก model เสร็จแล้ว)
                ArrayList<Integer> years = KKBook.getAllYearFromModel(carModelParam);
                out.print("<option value=''>กรุณาเลือก Year</option>");
                for(int year:years){
                    out.println("<option value='" + year+"'>"+year+"</option>");
                }
                return;
            }
        }
        // รับ pkOfSubModel มา แล้ว return middle_price กลับ
        String pkOfSubModelParam = request.getParameter("pkOfSubModel");
        if(pkOfSubModelParam != null){
            try{
                int pkOfSubModel = Integer.parseInt(pkOfSubModelParam);
                int middle_price = KKBook.getMiddlePriceFromPK(pkOfSubModel);
                out.println(middle_price);
            } catch (NumberFormatException e){
                out.println("Sub Model ที่เลือกผิดพลาด");
            }
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
