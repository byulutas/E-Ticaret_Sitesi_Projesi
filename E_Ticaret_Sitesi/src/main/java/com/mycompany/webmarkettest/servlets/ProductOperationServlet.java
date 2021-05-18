package com.mycompany.webmarkettest.servlets;


import com.mycompany.e_ticaret_sitesi.dao.KategoriDao;
import com.mycompany.e_ticaret_sitesi.dao.UrunDao;
import com.mycompany.e_ticaret_sitesi.entities.Kategori;
import com.mycompany.e_ticaret_sitesi.entities.Urun;
import com.mycompany.e_ticaret_sitesi.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // servlet2
            //add category
            //add product
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                //add category
                // fetching kategori veri
                String baslik = request.getParameter("kat_baslik");
                String aciklama = request.getParameter("kat_aciklama");

                Kategori kategori = new Kategori();
                kategori.setKategori_baslik(baslik);
                kategori.setKategori_aciklama(aciklama);

                //kategori veritabanına kayıt yapma
                KategoriDao kategoriDao = new KategoriDao(FactoryProvider.getFactory());

                int katId = kategoriDao.saveCategory(kategori);
                // out.println("Kategori kaydedildi");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Kategori başarıyla eklendi:" + katId);
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addproduct")) {
                //addproduct
                //work
                String urun_adi = request.getParameter("urun_adi");
                String urun_aciklama = request.getParameter("urun_aciklama");
                int urun_fiyati = Integer.parseInt(request.getParameter("urun_fiyati"));
                int indirim = Integer.parseInt(request.getParameter("indirim"));
                int urun_adeti = Integer.parseInt(request.getParameter("urun_adeti"));
                int kat_id = Integer.parseInt(request.getParameter("kategori_id"));
                Part part = request.getPart("resim");

                Urun u = new Urun();
                u.setUrun_adi(urun_adi);
                u.setUrun_aciklama(urun_aciklama);
                u.setUrun_fiyati(urun_fiyati);
                u.setIndirim(indirim);
                u.setUrun_adeti(urun_adeti);
                u.setUrun_resmi(part.getSubmittedFileName());

                //get kategori by id
                KategoriDao kdao = new KategoriDao(FactoryProvider.getFactory());
                Kategori kategori = kdao.getKategoriById(kat_id);

                u.setKategori(kategori);

                //urun kaydet
                UrunDao udao = new UrunDao(FactoryProvider.getFactory());
                udao.saveUrun(u);

                //resim upload
                //fotoğrafı yükle yolunu bul
                String path = request.getRealPath("img") + File.separator + "urunler" + File.separator + part.getSubmittedFileName();
                System.out.println(path);

                //kod yükleniyor
                try {

                    FileOutputStream fos = new FileOutputStream(path);
                    InputStream is = part.getInputStream();

                    //verileri okumak
                    byte[] data = new byte[is.available()];
                    is.read(data);

                    //verileri yazmak
                    fos.write(data);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                out.println("Ürün kaydetme başarılı..." + u.getUrun_id());
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Ürün başarıyla eklendi:");
                response.sendRedirect("admin.jsp");
                return;

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
