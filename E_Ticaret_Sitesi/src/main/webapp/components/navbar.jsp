<%@page import="com.mycompany.e_ticaret_sitesi.entities.Urun"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.UrunDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kategori"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KategoriDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.FactoryProvider"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kullanici"%>
<%
    Kullanici kullanici1 = (Kullanici) session.getAttribute("current-user");

%>
<%    String kategori = request.getParameter("kategori");
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
%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container" >
        <div class="container-fluid">
            <div class="col-xs-2 col-md-2 main-logo">
                <a href="index.jsp"><img src="img\logo.png" alt="logo" class="logo img-responsive"></a>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Kategoriler
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <%for (Kategori k : kategorilist) {
                            %>
                            <li><a href="index.jsp?kategori= <%= k.getKategori_id()%>" class="dropdown-item" href="#"><%= k.getKategori_baslik()%></a></li>

                            <%}%>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <%
                        if (kullanici1 == null) {
                    %> 
                    <header id="header" class="header">
                        <div class="iconShopping" >
                            <i class="fa fa-shopping-cart"></i>
                            <p>0</p>
                        </div>
                    </header>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="login.jsp">Oturum Aç</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="register.jsp">Kayit Ol</a>
                    </li>
                    <%
                    } else {

                    %>
                    <header id="header" class="header">
                        <div class="iconShopping" >
                            <i class="fa fa-shopping-cart"></i>
                            <p>0</p>
                        </div>
                    </header>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#!"><%=kullanici1.getKullanici_adi()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="LogoutServlet">Çikis Yap</a>
                    </li>

                    <%    }

                    %>
                </ul>

            </div>
        </div>

    </div>
</nav>