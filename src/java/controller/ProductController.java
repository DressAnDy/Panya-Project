/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import products.productsDAO;
import products.productsDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author Admin
 */
public class ProductController extends HttpServlet {

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
String action = request.getParameter("action");
        
        productsDAO dao = new productsDAO();
        String keyword = request.getParameter("keyword");
        String sortCol = request.getParameter("sortCol");

        HttpSession session = request.getSession();

        try {
            if (action == null || action.equals("list")) {
                List<productsDTO> productList = dao.list(keyword, sortCol);
                request.setAttribute("productlist", productList);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }else if (action.equals("details")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format");
                }

                productsDTO product = dao.getProductById(id); // Implement getProductById in DAO

                // Set product as request attribute and forward to admin.jsp
                request.setAttribute("product", product);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }else if(action.equals("delete")){
                
                Integer id = null;
                try{
                    id = Integer.parseInt(request.getParameter("id"));
                }catch(NumberFormatException nx){
                
                }
                if(id != null){
                    dao.delete(id);
                }
                List<productsDTO> productList = dao.list(keyword, sortCol);
                request.setAttribute("productlist", productList);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            log("Error processing request: " + e.getMessage());
            e.printStackTrace();
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
