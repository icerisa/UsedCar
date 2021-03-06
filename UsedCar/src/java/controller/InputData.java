/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.KKBook;


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
        //----------
        DecimalFormat df = new DecimalFormat("##,###,###,###.##");
        String target = request.getParameter("target");
        String brandIdParam = request.getParameter("brandId"); //(1)
        String carModelParam = request.getParameter("carModel");//(2),(3),(4)
        String yearParam = request.getParameter("year");//(3)
        String monthParam = request.getParameter("month");//(4)        
        String pkOfSubModelParam = request.getParameter("pkOfSubModel");//(5)
        switch (target) {
            case "getCarModel":
                // รับ brandId มา ส่ง carModel กลับ ((1)เลือก brand เสร็จแล้ว )                
                if (brandIdParam != null) {
                    try {
                        int brandId = Integer.parseInt(brandIdParam);
                        ArrayList<String> models = KKBook.getAllModelFromBrand(brandId);
                        out.print("<option value=''>กรุณาเลือก Model</option>");
                        for (String model : models) {
                            out.println("<option value='" + model + "'>" + model + "</option>");
                        }
                    } catch (NumberFormatException e) {
                        out.print("<option value=''>Brand ที่เลือกผิดพลาด</option>");
                    }
                    return;
                }
                break;
            case "getCarYear":
                // รับ carModel มา แล้ว ((2) ส่ง Year กลับ)                
                if (carModelParam != null) {
                    ArrayList<Integer> years = KKBook.getAllYearFromModel(carModelParam);
                    out.print("<option value=''>กรุณาเลือก Year</option>");
                    for (int year : years) {
                        out.println("<option value='" + year + "'>" + year + "</option>");
                    }
                    return;
                }
                break;
            case "getCarMonth":
                // รับ carYear + carModel มาแล้ว ((3)ส่ง Month กลับ
                if(carModelParam !=null && yearParam !=null ){
                    ArrayList<Integer> months = KKBook.getAllMonthFromModelYear(carModelParam, Integer.parseInt(yearParam));
                    out.print("<option value=''>กรุณาเลือก Month</option>");
                    for (int month : months) {
                        out.println("<option value='" + month + "'>" + (month==0?"-":month) + "</option>");
                    }
                    return;
                }
                break;
            case "getCarSubModel":
                // รับ year มา (มาพร้อม carModel) ส่ง carSubModels กลับไป ((4)เลือก year เสร็จแล้ว)
                if (yearParam != null && carModelParam!=null && monthParam!=null) {
                    try {
                        int year = Integer.parseInt(yearParam);
                        String carModel = request.getParameter("carModel");
                        Map<Integer, String> carSubModels = KKBook.getAllSubModelFromModelYear(carModel, year, Integer.parseInt(monthParam));
                        out.print("<option value=''>กรุณาเลือก Sub Model</option>");
                        for (Map.Entry<Integer, String> subModel : carSubModels.entrySet()) {
                            out.println("<option value='" + subModel.getKey() + "'>" + subModel.getValue() + "</option>");
                        }
                    } catch (NumberFormatException e) {
                        out.print("<option value=''>Month ที่เลือกผิดพลาด</option>");
                    }
                    return;
                }
                break;
            case "getMiddlePrice":
                // รับ pkOfSubModel มา แล้ว return middle_price กลับ        
                if (pkOfSubModelParam != null) {
                    try {
                        int pkOfSubModel = Integer.parseInt(pkOfSubModelParam);
                        int middle_price = KKBook.getMiddlePriceFromPK(pkOfSubModel);
//                        out.println(df.format(middle_price));
                        out.print(middle_price);
                    } catch (NumberFormatException e) {
                        out.println("Sub Model ที่เลือกผิดพลาด");
                    }
                }
                break;
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
