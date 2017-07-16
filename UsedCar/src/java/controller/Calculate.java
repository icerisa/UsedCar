/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Calculator;
import model.Rate;

/**
 *
 * @author yacth_Mon
 */
public class Calculate extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8"); //brandId, model, year, sub_model, middle_price, NCB, income, dept
        int gradeTent = Integer.parseInt(request.getParameter("gradeTent"));
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        String model = request.getParameter("model");
        int year = Integer.parseInt(request.getParameter("year"));
        int sub_model = Integer.parseInt(request.getParameter("sub_model"));
        long middle_price = Long.parseLong(request.getParameter("middle_price"));
        int NCB = Integer.parseInt(request.getParameter("NCB"));
        int income = Integer.parseInt(request.getParameter("income"));
        int dept = Integer.parseInt(request.getParameter("debt"));        
        Calculator cal = new Calculator(gradeTent,brandId,model,year,sub_model,middle_price,NCB,income,dept);
        cal.getAllData();
        PrintWriter out = response.getWriter();
        out.print(cal); // Check value giving to cal
        out.print("<br>");
//        request.setAttribute("Calculator", cal);
//        request.getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);
        // After all value is correct we going to get data from pdpg_used
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
