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
import javax.servlet.http.HttpSession;
import model.Account;
import model.Calculator;
import model.Rate;

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
        request.setCharacterEncoding("UTF-8"); //brandId, model, month ,year, sub_model, middle_price, NCB, occupation, income, dept , guarantee
        String incomeRaw = request.getParameter("income");
        String deptRaw = request.getParameter("debt");
        try {
            int gradeTent = Integer.parseInt(request.getParameter("gradeTent"));
            int brandId = Integer.parseInt(request.getParameter("brandId"));
            String model = request.getParameter("model");
            int month = Integer.parseInt(request.getParameter("month"));
            int year = Integer.parseInt(request.getParameter("year"));
            int sub_model = Integer.parseInt(request.getParameter("sub_model"));
            long middle_price = Long.parseLong(request.getParameter("middle_price"));
            int NCB = Integer.parseInt(request.getParameter("NCB"));
            String occupation = request.getParameter("occupation");
            int income = 0;
            int dept = 0;
            if (!incomeRaw.isEmpty() && !deptRaw.isEmpty()) {
                income = Integer.parseInt(incomeRaw);
                dept = Integer.parseInt(deptRaw);
            }
            int guarantee = Integer.parseInt(request.getParameter("guarantee"));
            Calculator cal = new Calculator(gradeTent, brandId, model, year, month, sub_model, middle_price, NCB, occupation, income, dept, guarantee);
            cal.getAllData();
//        PrintWriter out = response.getWriter();
//        out.print(cal); // Check value giving to cal
            // ------- Transaction Work --------
            HttpSession session = request.getSession(false);
            cal.saveTransaction(((Account)session.getAttribute("Account")).getAccountId());
            // ------- Transaction Work --------
            System.out.println(cal);
            request.setAttribute("Calculator", cal);
            if (cal != null || cal.getNcb() != null || cal.getRate() != null || cal.getPdpg_used() != null) {
                request.getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);
            } else {
                request.getServletContext().getRequestDispatcher("/500error.jsp").forward(request, response);
                System.out.println("RATE == null");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("Message", "Number format error (ค่าที่ส่งผิดพลาด)");
            request.setAttribute("Exception", e);
            request.getServletContext().getRequestDispatcher("/500error.jsp").forward(request, response);
        } catch (NullPointerException e) {
            request.setAttribute("Message", "Null pointer exception (หาข้อมูลไม่เจอ)");
            request.setAttribute("Exception", e);
            request.getServletContext().getRequestDispatcher("/500error.jsp").forward(request, response);
        }

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
