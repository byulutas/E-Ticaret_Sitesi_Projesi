package com.mycompany.webmarkettest.servlets;


import com.mycompany.e_ticaret_sitesi.dao.KullaniciDao;
import com.mycompany.e_ticaret_sitesi.entities.Kullanici;
import com.mycompany.e_ticaret_sitesi.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //coding area
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            //validations
            //authenticating user
            KullaniciDao kullaniciDao = new KullaniciDao(FactoryProvider.getFactory());
            Kullanici kullanici = kullaniciDao.getUserByEmailveSifre(email, password);
            //System.out.println(kullanici);
            HttpSession httpSession=request.getSession();
            if (kullanici == null) {
                httpSession.setAttribute("message", "geçersiz  giris | Tekrar giriniz");
                response.sendRedirect("login.jsp");
                return;
                
            } else {
                out.println("<h1> welcome" + kullanici.getKullanici_adi() +"</h1>");
            
                //login
                httpSession.setAttribute("current-user", kullanici);
                if(kullanici.getKullanici_tipi().equals("admin")){
                    //admin:admin.jsp
                    response.sendRedirect("admin.jsp");
                }else if(kullanici.getKullanici_tipi().equals("normal")){
                    //normal:normal.jsp                    
                    response.sendRedirect("normal.jsp");
                }else{
                    out.println("kullanıcı türünü tanımlamadık");
                }
                
                

                

            
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
