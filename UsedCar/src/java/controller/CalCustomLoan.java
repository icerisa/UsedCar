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

/**
 *
 * @author yacth_Mon
 */
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
        System.out.println("Pass");
        long want = Long.parseLong(request.getParameter("loanTotal"));
        int maxTerm = Integer.parseInt(request.getParameter("maxTerm"));
        float rate = Float.parseFloat(request.getParameter("rate"));
        System.out.println(want);
        System.out.println(maxTerm);
        PrintWriter out = response.getWriter();
        float[] loanCal=new float[3],incomeCal = new float[3];
        int[] deptCal = new int[3];
        DecimalFormat df = new DecimalFormat("##,###,###,###.##");
        //----------------------- ค่างวดต่อเดือน
        out.println("<tr id=\"loanCalResult\">");
        out.println("<td class=\"container3\"><span class=\"sizeme\">ค่างวดต่อเดือน </span></td>");        
        if(maxTerm>=48){
            loanCal[0] = (rate * want * (48 / 12) + want) / 48f;            
        }
        if(maxTerm>=60){
            loanCal[1] = (rate * want * (60 / 12) + want) / 60f;            
        }
        if(maxTerm>=72){
            loanCal[2] = (rate * want * (72 / 12) + want) / 72f;            
        }
        out.println("<td>" +df.format(loanCal[0])+"</td>");
        out.println("<td>" +df.format(loanCal[1])+"</td>");
        out.println("<td>" +df.format(loanCal[2])+"</td>");
        out.println("</tr>");
        //----------------------- รายได้ขั้นต่ำต่อเดือน
        out.println("<tr id=\"atleastIncomeCalResult\">");
        out.print("<td class=\"container3\"><span class=\"sizeme\">รายได้ขั้นต่ำต่อเดือน </span></td>");
        if(maxTerm>=48){
            incomeCal[0] = loanCal[0]*2;         
        }
        if(maxTerm>=60){
            incomeCal[1] = loanCal[1]*2;         
        }
        if(maxTerm>=72){
            incomeCal[2] = loanCal[2]*2;           
        }
        out.println("<td>" +df.format(incomeCal[0])+"</td>");
        out.println("<td>" +df.format(incomeCal[1])+"</td>");
        out.println("<td>" +df.format(incomeCal[2])+"</td>");
        out.println("</tr>");
        //--------------------- ภาระหนี้สูงสุดต่อเดือน
        out.println("<tr id=\"highestDeptCalResult\">");
        out.println("<td class=\"container3\"><span class=\"sizeme\">ภาระหนี้สูงสุดต่อเดือน </span></td>");
        if(maxTerm>=48){
            deptCal[0] = (int)(incomeCal[0]*0.85f - loanCal[0]);
            deptCal[0] = (deptCal[0]/1000)*1000; // ปัดเศษหลักร้อยลง
        }
        if(maxTerm>=60){
            deptCal[1] = (int)(incomeCal[1]*0.85f - loanCal[1]);
            deptCal[1] = (deptCal[1]/1000)*1000; // ปัดเศษหลักร้อยลง
        }
        if(maxTerm>=72){
            deptCal[2] = (int)(incomeCal[2]*0.85f - loanCal[2]);
            deptCal[2] = (deptCal[2]/1000)*1000; // ปัดเศษหลักร้อยลง
        }
        out.println("<td>" +df.format(deptCal[0])+"</td>");
        out.println("<td>" +df.format(deptCal[1])+"</td>");
        out.println("<td>" +df.format(deptCal[2])+"</td>");
        out.println("</tr>");

//                                <tr id="highestDeptCalResult">
//                                    <td class="container3"><span class="sizeme">ภาระหนี้สูงสุดต่อเดือน </span></td>
//                                    <td>13,000 </td>
//                                    <td>12,000 </td>
//                                    <td>11,000 </td>
//                                </tr>
        
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
