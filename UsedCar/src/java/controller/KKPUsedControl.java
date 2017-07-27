/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NCB;
import model.pdpg_used;

/**
 *
 * @author yacth_Mon
 */
public class KKPUsedControl extends HttpServlet {

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
        int gradeTentId = Integer.parseInt(request.getParameter("gradeTent"));
        int NCB_Type = Integer.parseInt(request.getParameter("NCBType"));
        String occupation = request.getParameter("occupation");
        int carAgeId = Integer.parseInt(request.getParameter("carAge"));
        int maxLTV = Integer.parseInt(request.getParameter("maxLTV"));
        int maxTerm = Integer.parseInt(request.getParameter("maxTerm"));
        String guarantee = request.getParameter("guarantee");
        int DBR = Integer.parseInt(request.getParameter("DBR"));
        int IIR = Integer.parseInt(request.getParameter("IIR"));
        long exceptIncome = 0;
        if (Integer.parseInt(guarantee) == 0) {// ถ้ายกเว้นผู้ค้ำประกันได้
            //ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า 30,000 บาท หรือ ปรับ LTV<=90% เทอมไม่เกิน 72	            
            DecimalFormat df = new DecimalFormat("##,###,###,###");
            exceptIncome = Long.parseLong(request.getParameter("exceptIncome"));
            int atleastIncome = Integer.parseInt(request.getParameter("atleastIncome"));
            int LTVPercent = Integer.parseInt(request.getParameter("LTVPercent"));
            int longestTerm = Integer.parseInt(request.getParameter("longestTerm"));
            guarantee = "ยกเว้นผู้ค้ำประกันได้ ถ้ารายได้มากกว่า " + df.format(atleastIncome) + " บาท หรือ ปรับ LTV<=" + LTVPercent + "% เทอมไม่เกิน " + longestTerm;
        } else {
            //ต้องมีผู้ค้ำประกัน
            guarantee = "ต้องมีผู้ค้ำประกัน";
        }
        String NCB_Name = NCB.getNCBNameFromType(NCB_Type);
        boolean result = pdpg_used.addPDPG_Used(gradeTentId, NCB_Type, NCB_Name, occupation, carAgeId, maxLTV, maxTerm, DBR, IIR, exceptIncome, guarantee);
        String notiHead = "Action Result";
        String notiMessage = "";
        if (result) {
            notiMessage = "การเพิ่มสำเร็จ";
        } else {
            notiMessage = "การเพิ่มไม่สำเร็จ";
        }
        request.setAttribute("notiHead", notiHead);
        request.setAttribute("notiMessage", notiMessage);
        request.setAttribute("showNoti", "true");
        request.setAttribute("refreshPage", request.getContextPath() + "/Update");
        getServletContext().getRequestDispatcher("/Update").forward(request, response);
//        response.sendRedirect(request.getContextPath() + "/Update");
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
//        if (request.getParameter("gradeTent") != null) { // if doGet and have data
            processRequest(request, response);
//        } else { // if doGet and don't have data 
//            response.sendRedirect(request.getContextPath() + "/Update");
//        }

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
        request.setCharacterEncoding("UTF-8");
        String target = request.getParameter("target");        
        if (target != null) {
            if (target.equalsIgnoreCase("delete")) {
                int deleteId = Integer.parseInt(request.getParameter("id"));
                if (pdpg_used.deletePDPG_UsedData(deleteId)) {
                    //success
                } else {
                    //not success
                }
            }
        } else {
            int targetId = Integer.parseInt(request.getParameter("dataId"));
            int gradeTentId = Integer.parseInt(request.getParameter("gradeTent"));
            int NCB_Type = Integer.parseInt(request.getParameter("NCBType"));
            String occupation = request.getParameter("occupation");
            int carAgeId = Integer.parseInt(request.getParameter("carAge"));
            int maxLTV = Integer.parseInt(request.getParameter("maxLTV"));
            int maxTerm = Integer.parseInt(request.getParameter("maxTerm"));
            String guarantee = request.getParameter("guarantee");
            int DBR = Integer.parseInt(request.getParameter("DBR"));
            int IIR = Integer.parseInt(request.getParameter("IIR"));
            long exceptIncome = Long.parseLong(request.getParameter("exceptIncome"));
            String NCB_Name = NCB.getNCBNameFromType(NCB_Type);
            boolean result = pdpg_used.updatePDPG_Used(targetId, gradeTentId, NCB_Type, NCB_Name, occupation, carAgeId, maxLTV, maxTerm, DBR, IIR, exceptIncome, guarantee);
            String notiHead = "Action Result";
            String notiMessage = "";
            if (result) {
                notiMessage = "การแก้ไขข้อมูลสำเร็จ";
            } else {
                notiMessage = "การแก้ไขข้อมูลไม่สำเร็จ";
            }
            request.setAttribute("notiHead", notiHead);
            request.setAttribute("notiMessage", notiMessage);
            request.setAttribute("showNoti", "true");
            request.setAttribute("refreshPage", request.getContextPath() + "/Update");
            getServletContext().getRequestDispatcher("/Update").forward(request, response);
//            response.sendRedirect(request.getContextPath() + "/Update");
        }

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
