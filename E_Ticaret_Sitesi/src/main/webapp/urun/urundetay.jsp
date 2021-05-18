
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kullanici"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kategori"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KategoriDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Urun"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.UrunDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link rel="stylesheet" href="urun/urundetay.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"></link>
                <link rel="stylesheet" href="css/style.css">
                    <!-- js-->
                    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
                    <script src="js/script.js"></script>
                    <%
                        Kullanici kullanici1 = (Kullanici) session.getAttribute("current-user");

                    %>
                    <%            String kategori = request.getParameter("kategori");
                        String id = request.getParameter("urun_id");
                        UrunDao urundao = new UrunDao(FactoryProvider.getFactory());
                        List<Urun> urunlist = urundao.getAllUrun();
                        if (kategori == null) {
                            urunlist = urundao.getAllUrun();
                        } else if (kategori == null || kategori.trim().equals("all")) {
                            urunlist = urundao.getAllUrun();
                        } else {
                            int kid = Integer.parseInt(kategori.trim());
                            urunlist = urundao.getAllUrunById(kid);
                        }
                        KategoriDao kategoridao = new KategoriDao(FactoryProvider.getFactory());
                        List<Kategori> kategorilist = kategoridao.getCategories();

                        int uid = Integer.parseInt(id.trim());
                        Urun u = urundao.getUrunId(uid);
                    %>
                    <title>JSP Page</title>
                    </head>
                    <body>
                    <div class="container">
                        <div class="card">
                            <div class="container-fliud">
                                <div class="wrapper row">
                                    <div class="preview col-md-6">

                                        <div class="preview-pic tab-content">
                                            <img src="img/urunler/<%=u.getUrun_resmi()%>" alt=""/>  
                                        </div>
                                        <ul class="preview-thumbnail nav nav-tabs">
                                            <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="img/urunler/<%=u.getUrun_resmi()%>" /></a></li>
                                        </ul>

                                    </div>
                                    <div class="details col-md-6">
                                        <h3 class="product-title"><%=u.getUrun_adi()%></h3>
                                        <div class="rating">
                                            <div class="stars">
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                            </div>
                                        </div>
                                        <p class="product-description"><%=u.getUrun_aciklama()%></p>
                                        <h4 class="price">urun fiyati: <span><%=u.getUrun_fiyati()%></span></h4>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- script -->
                    <script src="index.js"></script>
                    <script src="js/script.js"></script>
                    </body>
                    </html>
