<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Kullanici kullanici=(Kullanici)session.getAttribute("current-user");
    if(kullanici==null){
        session.setAttribute("message","Giriş Yapmadınız !! Ödeme Sayfasına Erişmek için Önce Oturum Açın");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@include file="components/navbar.jsp" %>

<div class="container" >
    <div class="row">
        <div class="col-md-6">
            <!--card-->
            <div class="cartBox">
                <div class="cart">
                    <i class="fa fa-close"></i>
                    <h3 class="text-center mb-3">Seçtiğiniz Öğeler</h3>
                    <table></table>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!--form-details-->
            <h3 class="text-center mb-3">Sipariş İçin Detaylarınızı</h3>
            <form action="#!">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email adresiniz</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email Adresinizi Giriniz" >
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Adınız</label>
                    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Adınızı Giriniz">
                </div>
                <div class="form-group mb-3" >
                    <label for="exampleFormControlTextArea1">Teslimat Adresiniz</label>
                    <textarea class="form-control" id="exampleFormControlTextArea1" placeholder="Adresinizi Giriniz" rows="3" ></textarea>
                </div>
                <div class="container mb-3">
                    <button class="btn btn-outline-success mb-3" onclick="localStorage.getItem(name)" >Şimdi Sipariş Ver</button>
                    <button class="btn btn-outline-primary mb-3" onclick="goToNormal()">Alışverişe Devam Et</button>                    
                </div>
            </form>
        </div>        
    </div>

</div>
<script src="index.js"></script>
</body>
</html>
