<%@page import="com.mycompany.e_ticaret_sitesi.entities.Urun"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.UrunDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KullaniciDao"%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kategori"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KategoriDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.FactoryProvider"%>
<%@page import="jdk.nashorn.internal.runtime.regexp.JoniRegExp"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kullanici"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Kullanici kullanici=(Kullanici)session.getAttribute("current-user");
    if(kullanici==null){
        session.setAttribute("message","Giriş yapmadınız !! Önce oturum açın");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(kullanici.getKullanici_tipi().equals("normal")){
            session.setAttribute("message","Yönetici değilsin !!Bu sayfaya erişemezsin");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%
    KategoriDao kdao = new KategoriDao(FactoryProvider.getFactory());
    KullaniciDao kullanicidao = new KullaniciDao(FactoryProvider.getFactory());
    UrunDao udao = new UrunDao(FactoryProvider.getFactory());
    List<Kategori> list = kdao.getCategories();
    List<Kullanici> kulist = kullanicidao.getAllKullanici();
    List<Urun> ulist = udao.getAllUrun();    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Panel</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
<div class="container admin"> 
    <div class="container-fluid mt-3">
        <%@include  file="components/message.jsp" %>
    </div>
    <div class="row mt-3">
        <!--birinci col-->
        <div class="col-md-4">
            <!--birinci box-->            
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/team.png" alt="kullanici_icon"> 
                    </div>
                    <h1><%= kulist.size() %></h1>
                    <h1 class="text-uppercase text-muted">Kullanıcılar</h1>
                    <a href="admin/kullanicilist.jsp">Detaylı İncelemek İçin Tıklayınız.</a>

                </div>

            </div>

        </div>
        <!--ikinci col-->       
        <div class="col-md-4">
            <!--ikinci box-->
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/liste.png" alt="kategori_icon"> 
                    </div>
                    <h1><%= list.size() %></h1>
                    <h1 class="text-uppercase text-muted">Kategoriler</h1>
                    <a href="admin/kategorilist.jsp">Detaylı İncelemek İçin Tıklayınız.</a>

                </div>

            </div>


        </div>
        <!--ücüncü col-->
        <div class="col-md-4">
            <!--ücüncü box-->
            <div class="card">
                <div class="card-body text-center"> 
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/urun.png" alt="urun_icon"> 
                    </div>
                    <h1><%= ulist.size() %></h1>
                    <h1 class="text-uppercase text-muted" >Ürünler</h1>
                    <a href="admin/urunlist.jsp">Detaylı İncelemek İçin Tıklayınız.</a>

                </div>

            </div>


        </div>            
    </div>
    <!--İkinci Row-->
    <div class="row mt-3">
        <!--İkinci row:birinci col-->       
        <div class="col-md-6">
            <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/keys.png" alt="kategori_ekle_icon"> 
                    </div>
                    <p class="mt-2">Yeni Kategori Eklemek İçin Burayı Tıklayın</p>
                    <h1 class="text-uppercase text-muted">Kategori Ekle</h1>
                </div>

            </div>


        </div>
        <!--İkinci row:birinci col-->
        <div class="col-md-6">
            <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/ekle.png" alt="urun_ekle_icon"> 
                    </div>
                    <p class="mt-2">Yeni Ürün Eklemek İçin Burayı Tıklayın</p>
                    <h1 class="text-uppercase text-muted">Ürün Ekle</h1>

                </div>

            </div>

        </div>        

    </div>



</div>
<!-- Kategori ekle modal-->
<!-- Button trigger modal -->

<!-- Kategori Ekle modal -->
<!-- Modal -->
<div class="modal fade" id="add-category-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white" >
                <h5 class="modal-title" id="staticBackdropLabel">Kategori detayını doldurunuz</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="ProductOperationServlet" method="post" >

                    <input type="hidden" name="operation" value="addcategory">

                        <div class="form-group">
                            <input type="text" class="form-control" name="kat_baslik" placeholder="Kategori Başlığını Girin" required />
                        </div>
                        <div class="form-group mt-2">
                            <textarea style="height: 300px;" class="form-control" placeholder="Kategori Açıklamasını Giriniz" name="kat_aciklama" required ></textarea>
                        </div>

                        <div class="container text-center mt-2" >
                            <button class="btn btn-outline-success">Kategori Ekle</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>

                        </div>


                </form>

            </div>
        </div>
    </div>
</div>

<!--  Kategori ekle modal sonu-->
<!-- Urun Ekle modal -->
<div class="modal" id="add-product-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Ürün Detayları</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!--form-->

                <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="operation" value="addproduct">

                        <!--Urun adını-->
                        <div class="form-group mt-3">
                            <input type="text" class="form-control" placeholder="Ürün adını giriniz" name="urun_adi" required />                                    
                        </div>
                        <!--Urun_Aciklama-->    
                        <div class="form-group mt-3">
                            <textarea style="height: 150px;" class="form-control" placeholder="Ürün açıklamasını giriniz" name="urun_aciklama" ></textarea>
                        </div>
                        <!--Urun_Fiyati--> 
                        <div class="form-group mt-3">
                            <input type="number" class="form-control" placeholder="Ürün fiyatını giriniz" name="urun_fiyati" required />                                    
                        </div>
                        <!--İndirim-->               
                        <div class="form-group mt-3">
                            <input type="number" class="form-control" placeholder="Ürün indirimini giriniz" name="indirim" required />                                    
                        </div>              
                        <!--Urun Adeti-->    
                        <div class="form-group mt-3">
                            <input type="number" class="form-control" placeholder="Ürün adetini giriniz" name="urun_adeti" required />                                    
                        </div>  
                        <!--urun kategori-->

                        <div class="form-group mt-3">
                            <select name="kategori_id" class="form-control" id="">
                                <%                                    for (Kategori k : list) {
                                %>
                                <option value="<%=k.getKategori_id()%>"><%=k.getKategori_baslik()%></option>
                                <%}%>
                            </select>
                        </div>
                        <!-- urun dosya-->               
                        <div class="form-group mt-3">
                            <label for="urun_resmi">Ürünün resmini seçin:</label>
                            <br>
                            <input type="file" id="urun_resmi" name="resim" required/>
                        </div>
                        <!-- gönder düğmesi-->
                        <div class="container text-center mt-3" >

                            <button class="btn btn-outline-success">Ürün Ekle</button>

                        </div>
                </form>

                <!-- end form-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>

</div>
<!-- Urun ekle modal sonu-->

</body>
</html>
