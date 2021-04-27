<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.Helper"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KategoriDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kategori"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Urun"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.UrunDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.FactoryProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WebMarket - AnaSayfa</title>
    <%@include file="components/common_css_js.jsp" %>

</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <div class="container-fluid">    
    <div class="row mt-3">
        <%         
            String kat=null;
            kat =request.getParameter("kategori");
            UrunDao udao = new UrunDao(FactoryProvider.getFactory());
            List<Urun> ulist=udao.getAllUrun();
             if(kat==null){
                ulist = udao.getAllUrun();
             }else if( kat==null || kat.trim().equals("all")){
                ulist = udao.getAllUrun();
            }else{
                 int kid=Integer.parseInt(kat.trim());
                 udao.getAllUrunById(kid);
            }
            
            KategoriDao cdao = new KategoriDao(FactoryProvider.getFactory());
            List<Kategori> klist = cdao.getCategories();
        %>

    <!--kategorileri göster*-->
    <div class="col-md-2">
        <div class="list-group mt-4">
            <a href="index.jsp?kategori=all" class="list-group-item  list-group-item active" aria-current="true">
                Tüm ürünler
            </a>
            <%for (Kategori k : klist) {
            %>

            <a href="index.jsp?kategori=<%= k.getKategori_id() %>" class="list-group-item list-group-item-action"><%= k.getKategori_baslik()%></a>

            <%}%>
        </div>
    </div>

    <!--ürünleri göster-->
    <div class="col-md-8">

        <!--row-->
        <div class="row mt-4">
            <!--col:12-->
            <div class="col-md-12 " >
               <div class="card-columns">
                    <!--Urunler-->
                    <%
                        for (Urun u : ulist) {
                    %>
                    
                    <!--urun card-->
                    <div class="card urun-card" >
                        <div class="container text-center ">
                            <img src="img/urunler/<%=u.getUrun_resmi()%>" style="max-height: 200px;max-width:100%; width:  " class="card-img-top mt-2" alt="...">
                        </div>

                        <div class="card-body">
                            <h5 class="card-title"><%= u.getUrun_adi()%></h5>
                            <p class="card-text">
                                <%= Helper.get50Words(u.getUrun_aciklama())%>
                            </p>
                        </div>
                        <div class="card-footer mt-4 text-center">
                            <button class="btn custom-bg text-white" onclick=""> Sepete ekle </button>
                            <button class="btn btn-outline-success" >&#8378; <%= u.getIndirimdenSonraFiyat() %>/- <span class="text-secondary discount-label">&#8378; <%= u.getUrun_fiyati() %> % <%= u.getIndirim() %> indirim</span> </button>
                        </div>    
                    </div>
                 
                </div> 
                    <%}
                        if(ulist.size()==0){
                            out.println("Bu kategoride öğe yok");
                        }
                    %>
                </div>
        </div>
    </div>
</div>

</body>
</html>
