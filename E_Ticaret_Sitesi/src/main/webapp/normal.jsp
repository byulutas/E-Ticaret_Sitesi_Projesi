<%@page import="com.mycompany.e_ticaret_sitesi.dao.UrunDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Urun"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KategoriDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kategori"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"/> -->
    <title>
        Web Market
    </title>
    <title>www.cinki.com</title>
    <style type="text/css">
        #div1  {float: left;
                background: #edeaea;
                height: 100px;
                width: 150px;
        }
        #div2  {float: left;
                margin:auto;
                background: #edeaea;
                height: 1000px;
                width: 1195px;
        }
        #div3  {float: left;
                background: #edeaea;
                height: 200px;
                width: 150px;
        }
    </style>
    <link rel="stylesheet" href="index.css"/>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <%@include file="components/common_css_js.jsp" %>
    <%
        String kat = null;
        kat = request.getParameter("kategori");
        UrunDao udao = new UrunDao(FactoryProvider.getFactory());
        List<Urun> ulist = udao.getAllUrun();
        if (kat == null) {
            ulist = udao.getAllUrun();
        } else if (kat == null || kat.trim().equals("all")) {
            ulist = udao.getAllUrun();
        } else {
            int kid = Integer.parseInt(kat.trim());
            udao.getAllUrunById(kid);
        }

        KategoriDao cdao = new KategoriDao(FactoryProvider.getFactory());
        List<Kategori> klist = cdao.getCategories();
    %>
    <script>

        function Delete(e) {
            let items = [];
            JSON.parse(localStorage.getItem('items')).map(data => {
                if (data.id != e.parentElement.parentElement.children[0].textContent) {

                    items.push(data);

                }
            });
            localStorage.setItem('items', JSON.stringify(items));
            window.location.reload();
        }
        ;
    </script>
</head>
<body>
<div class="main">
    <%@include file="components/navbar.jsp" %>
    <!--kategorileri göster*-->
    <div class="col-md-12">
        <!--kategorileri göster*-->
        <div class="col-md-3" id="div1">
            <div class="list-group mt-4">
                <a href="index.jsp?kategori=all" class="list-group-item  list-group-item active" aria-current="true">
                    Tüm ürünler
                </a>
                <%for (Kategori k : klist) {
                %>

                <a href="index.jsp?kategori=<%= k.getKategori_id()%>" class="list-group-item list-group-item-action"><%= k.getKategori_baslik()%></a>

                <%}%>
            </div>
        </div>
        <div class="itemsBox col-md-9" id="div2" >
            <%            for (Urun u : ulist) {
            %>
            <div class="item col-md-3">
                <img src="img/urunler/<%=u.getUrun_resmi()%>" alt=""/>
                <div class="itemInfo">
                    <h1><%= u.getUrun_adi()%></h1>
                    <p>&#8378;<span><%= u.getUrun_fiyati()%></span></p>
                    <a href="urun/urundetay.jsp?urun_id= <%= u.getUrun_id()%>">Incele </a>
                    <a href="#" title="add to cart" class="attToCart">Sepete Ekle</a>
                </div>
            </div>

            <%}
                if (ulist.size() == 0) {
                    out.println("Bu kategoride ö?e yok");
                }
            %>
        </div>
    </div>
</div>
<div class="cartBox">
    <div class="cart">
        <i class="fa fa-close"></i>
        <h1>Sepet</h1>
        <table></table>
        <div>
            <button type="button" class="btn btn-primary checkout-btn"  onclick="goToCheckout()">Ödeme</button>
        </div>
    </div>
</div>


<!-- script -->
<script src="index.js"></script>
<script src="js/script.js"></script>
</body>
</html>
