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
import model.Rate;

/**
 *
 * @author yacth_Mon
 */
public class RateControl extends HttpServlet {

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
        String target = request.getParameter("target");
        boolean result;//result of process
        String notiHead = "";
        String notiMessage = "";
        int id;
        int guarantee,brandType,carYear,autoTypeId,term;
        float rate;
        switch (target) {
            case "add":
                guarantee = Integer.parseInt(request.getParameter("guarantee"));
                brandType = Integer.parseInt(request.getParameter("brandType"));
                carYear = Integer.parseInt(request.getParameter("carYear"));
                autoTypeId = Integer.parseInt(request.getParameter("autoType"));
                term = Integer.parseInt(request.getParameter("term"));
                rate = Float.parseFloat(request.getParameter("rate"));
                result = new Rate(guarantee, brandType, carYear, autoTypeId, term, rate).addRate();
                notiHead = "Add rate result";
                if (result) {
                    notiMessage = "การเพิ่มสำเร็จ";
                } else {
                    notiMessage = "การเพิ่มไม่สำเร็จ";
                }
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("dataId"));
                result = Rate.deleteRate(id);
                notiHead = "Delete rate result";
                if (result) {
                    notiMessage = "การลบสำเร็จ";
                } else {
                    notiMessage = "การลบไม่สำเร็จ";
                }
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("dataId"));
                guarantee = Integer.parseInt(request.getParameter("guarantee"));
                brandType = Integer.parseInt(request.getParameter("brandType"));
                carYear = Integer.parseInt(request.getParameter("carYear"));
                autoTypeId = Integer.parseInt(request.getParameter("autoType"));
                term = Integer.parseInt(request.getParameter("term"));
                rate = Float.parseFloat(request.getParameter("rate"));
                result = Rate.updateRate(id, guarantee, brandType, carYear, autoTypeId, term, rate);
                notiHead = "Edit rate result";
                if (result) {
                    notiMessage = "การแก้ไขสำเร็จ";
                } else {
                    notiMessage = "การแก้ไขไม่สำเร็จ";
                }

        }
        request.setAttribute("notiHead", notiHead);
        request.setAttribute("notiMessage", notiMessage);
        request.setAttribute("showNoti", "true");
        getServletContext().getRequestDispatcher("/Manage_Rate").forward(request, response);
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
