package com.mycompany.webmarkettest.servlets;


import com.mycompany.e_ticaret_sitesi.entities.Kullanici;
import com.mycompany.e_ticaret_sitesi.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

 
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try{
                String kullanici_adi=request.getParameter("kullanici_adi");
                String email=request.getParameter("email");
                String sifre=request.getParameter("sifre");
                String telefon=request.getParameter("telefon");
                String adres=request.getParameter("adres");
          
                //validations
                if(kullanici_adi.isEmpty()){
                    out.println("Kullanici Adi Boş");
                    return;
                }
                
                //Verileri depolamak için kullanıcı nesnesi oluşturma
                Kullanici kullanici= new Kullanici(kullanici_adi,email,sifre,telefon,"default.jpg",adres,"normal");
                
                Session hibernateSession=FactoryProvider.getFactory().openSession();
                Transaction tx= hibernateSession.beginTransaction();
                int kullanici_id= (int) hibernateSession.save(kullanici);
                
                
             
                tx.commit();
                hibernateSession.close();
                
              HttpSession httpSession = request.getSession();
              httpSession.setAttribute("message","Registration Successful !!"+kullanici_id);  

              //response.sendRedirect("register.jsp");
              //return;
              
            }catch(Exception e){
               e.printStackTrace();
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
