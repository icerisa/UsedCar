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
import model.Account;

/**
 *
 * @author yacth_Mon
 */
public class Manage_user extends HttpServlet {

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
        String target = (String) request.getParameter("target");
        String notiHead = "", notiMessage = "";
        boolean result = false;
        int resultInt = 0; // for receive result that have more than succes and failed        
        switch (target) {
            case "resetPassword":
                notiHead = "Reset Password Result";
                result = Account.doResetPassword(request.getParameter("username"), request.getParameter("passwordRetry"));
                if (result) {
                    notiMessage = "การรีเซ็ตรหัสผ่าน สำเร็จ!";
                } else {
                    notiMessage = "การรีเซ็ตรหัสผ่าน ล้มเหลว!";
                }
                break;
            case "createAccount":
                notiHead = "Create Account Result";
                Account a = new Account(request.getParameter("username"), "New user", "surname", "default email", "0800000000", false);
                resultInt = a.doRegister(request.getParameter("passwordRetry"));
                if (resultInt == Account.ResultCode.SUCCESS) {//Success
                    notiMessage = "การสร้างบัญชีผู้ใช้ สำเร็จ!";
                    result = true;
                } else if (resultInt == Account.ResultCode.USERNAME_DUPLICATE) { // Error : Duplicate Username
                    notiMessage = "การสร้างบัญชีผู้ใช้ ล้มเหลว! มี Username ดังกล่าวอยู่ในระบบอยู่แล้ว";
                } else {// Other error
                    notiMessage = "การสร้างบัญชีผู้ใช้ ล้มเหลว!";
                }
                break;
            case "deleteAccount":
                notiHead = "Delete Account Result";
                resultInt = Account.doDeleteAccount(request.getParameter("username"));
                if (resultInt == Account.ResultCode.SUCCESS) {
                    notiMessage = "การลบบัญชี สำเร็จ!";
                } else if (resultInt == Account.ResultCode.USERNAME_NOT_FOUND) {
                    notiMessage = "การลบบัญชี ล้มเหลว! ไม่มี Username ดังกล่าวอยู่ในระบบ";
                } else {
                    notiMessage = "การลบบัญชี ล้มเหลว!";
                }
                break;
        }
        request.setAttribute("notiHead", notiHead);
        request.setAttribute("notiMessage", notiMessage);
        request.setAttribute("showNoti", "true");
        getServletContext().getRequestDispatcher("/manage_user.jsp").forward(request, response);
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
        getServletContext().getRequestDispatcher("/manage_user.jsp").forward(request, response);
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
