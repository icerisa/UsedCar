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
import model.Calculator;

public class CalCustomLoan extends HttpServlet {

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
        long want = Long.parseLong(request.getParameter("loanTotal"));
        int maxLoan = Integer.parseInt(request.getParameter("maxLoan"));
        int maxTerm = Integer.parseInt(request.getParameter("maxTerm"));
        int income = Integer.parseInt(request.getParameter("income"));
        int dept = Integer.parseInt(request.getParameter("dept"));
        float rate48 = Float.parseFloat(request.getParameter("rate48")) / 100f;
        float rate60 = Float.parseFloat(request.getParameter("rate60")) / 100f;
        float rate72 = Float.parseFloat(request.getParameter("rate72")) / 100f;
        PrintWriter out = response.getWriter();
        float[] loanCal = new float[3], atleastIncomeCal = new float[3];
        int[] deptCal = new int[3];
        DecimalFormat df = new DecimalFormat("##,###,###,###");
        //-------------- การคำนวณ
        if (want <= maxLoan) {
            if (maxTerm >= 48) {
                //ค่างวดต่อเดือน
                loanCal[0] = (rate48 * want * (48 / 12) + want) / 48f;
                //รายได้ขั้นต่ำ
                atleastIncomeCal[0] = loanCal[0] * 2;
                //ภาระหนี้สูงสุด
                deptCal[0] = (int) (atleastIncomeCal[0] * 0.85f - loanCal[0]);
                deptCal[0] = (deptCal[0] * 1000) / 100000 * 100; // ปัดเศษหลักร้อยลง
            }
            if (maxTerm >= 60) {
                //ค่างวดต่อเดือน
                loanCal[1] = (rate60 * want * (60 / 12) + want) / 60f;
                //รายได้ขั้นต่ำ
                atleastIncomeCal[1] = loanCal[1] * 2;
                //ภาระหนี้สูงสุด
                deptCal[1] = (int) (atleastIncomeCal[1] * 0.85f - loanCal[1]);
                deptCal[1] = (deptCal[1] * 1000) / 100000 * 100; // ปัดเศษหลักร้อยลง
            }
            if (maxTerm >= 72) {
                //ค่างวดต่อเดือน
                loanCal[2] = (rate72 * want * (72 / 12) + want) / 72f;
                //รายได้ขั้นต่ำ
                atleastIncomeCal[2] = loanCal[2] * 2;
                //ภาระหนี้สูงสุด
                deptCal[2] = (int) (atleastIncomeCal[2] * 0.85f - loanCal[2]);
                deptCal[2] = (deptCal[2] * 1000) / 100000 * 100; // ปัดเศษหลักร้อยลง
            }
            System.out.println("Loan : " + loanCal[0] + " " + loanCal[1] + " " + loanCal[2]);
            //-------------- การคำนวณ
            //----------------------- การแสดงผล ค่างวดต่อเดือน
            System.out.println("Income : " + income);
            System.out.println("Dept : " + dept);
            float loanToShow[] = new float[3];
            for (int i = 0; i < 3; i++) {
                loanToShow[i] = loanCal[i];
                if (income != 0) { //ถ้า Income ไม่ใช่ 0
                    if (income >= atleastIncomeCal[i]) {//รายได้ที่กรอก มากกว่ารายได้ขั้นต่ำ
                        if ((loanCal[i] + dept) / ((float) income) > 0.85f) {// ถ้าหนี้ รวมกับค่างวดหารรายได้เยอะกว่า 0.85
                            if (dept > deptCal[0]) {//หนี้ที่กรอกมากกว่าภาระหนี้สูงสุด
                                loanToShow[i] = 0;
                            }
                        }
                    } else { //รายได้น้อยกว่าราได้ขั้นต่ำ
                        loanToShow[i] = 0;
                    }
                }
            }
            out.println("<tr id=\"loanCalResult\">");
            out.println("<td class=\"container3\"><span class=\"sizeme\">ค่างวดต่อเดือน </span></td>");
            for (int i = 0; i < 3; i++) {
                out.println("<td>" + (loanToShow[i]!=0?df.format(loanToShow[i]):"-") + "</td>");
            }
            out.println("</tr>");
            if (income == 0) { //ไม่กรอกรายได้
                //----------------------- การแสดงผล รายได้ขั้นต่ำต่อเดือน
                out.println("<tr id=\"atleastIncomeCalResult\">");
                out.print("<td class=\"container3\"><span class=\"sizeme\">รายได้ขั้นต่ำต่อเดือน </span></td>");
                for (int i = 0; i < 3; i++) {
                    out.println("<td>" + (atleastIncomeCal[i]!=0?df.format(atleastIncomeCal[i]):"-") + "</td>");
                }
                out.println("</tr>");
                //--------------------- การแสดงผลภาระหนี้สูงสุดต่อเดือน
                out.println("<tr id=\"highestDeptCalResult\">");
                out.println("<td class=\"container3\"><span class=\"sizeme\">ภาระหนี้สูงสุดต่อเดือน </span></td>");
                for (int i = 0; i < 3; i++) {
                    out.println("<td>" + (deptCal[i]!=0?df.format(deptCal[i]):"-") + "</td>");
                }
                out.println("</tr>");
            } else { //กรอกรายได้
                if (dept == 0) {//ไม่กรอกหนี้
                    float[] deptCalNoInput = new float[3];
                    for (int i = 0; i < 3; i++) {
                        if(loanToShow[i]!=0)
                            deptCalNoInput[i] = income * 0.85f - loanCal[i];
                    }
                    //--------------------- การแสดงผลภาระหนี้สูงสุดต่อเดือนต่อเมื่อไม่ได้กรอกหนี้
                    out.println("<tr id=\"highestDeptCalResult\">");
                    out.println("<td class=\"container3\"><span class=\"sizeme\">ภาระหนี้สูงสุดต่อเดือน </span></td>");
                    for (int i = 0; i < 3; i++) {
                        out.println("<td>" + (deptCalNoInput[i]!=0?df.format(deptCalNoInput[i]):"-") + "</td>");
                    }
                    out.println("</tr>");
                }
            }
        } else {            
            out.print("Input Error");
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
