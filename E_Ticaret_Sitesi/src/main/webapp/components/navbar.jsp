<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kullanici"%>
<%
    Kullanici kullanici1 = (Kullanici) session.getAttribute("current-user");

%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container" >
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">WebMarket</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Kategoriler
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>

                </ul>
                <ul class="navbar-nav ml-auto">
                    <%                        if (kullanici1 == null) {
                    %> 
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="login.jsp">Oturum Aç</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="register.jsp">Kayit Ol</a>
                    </li>
                    <%
                    } else {

                    %>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#!"><%=kullanici1.getKullanici_adi()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="LogoutServlet">Ç?k?? Yap</a>
                    </li>
                    <%    }

                    %>
                </ul>
            </div>
        </div>

    </div>
</nav>