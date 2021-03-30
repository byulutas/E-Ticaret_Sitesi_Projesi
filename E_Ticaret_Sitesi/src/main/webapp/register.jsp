<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>New User</title>
    <%@include file="components/common_css_js.jsp" %>

</head>
<body>
    <%@include file="components/navbar.jsp" %>
<div class="container-fluid" >
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <%@include file="components/message.jsp" %>
                <div class="card-body px-5">
                    <div class="container text-center">
                        <img src="img/user.png" style="max-width: 100px;" class="img-fluid"></img>

                    </div>
                    <h3 class="text-center my-3">Buradan Kayıt Ol!!</h3>
                    <form action="RegisterServlet" method="post" >
                        <div class="form-group">
                            <label for="isim" class="form-label">Kullanıcı Adı</label>
                            <input name="kullanici_adi" type="text" class="form-control" id="isim" placeholder="Kullanıcı adınız giriniz" aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">E-mail Adresi</label>
                            <input name="email" type="email" class="form-control" id="email" placeholder="Email adresiniz giriniz" aria-describedby="emailHelp">
                        </div>

                        <div class="form-group">
                            <label for="sifre" class="form-label">Şifre</label>
                            <input name="sifre" type="password" class="form-control" id="sifre" placeholder="Şifrenizi giriniz" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="telefon" class="form-label">Telefon Numarası</label>
                            <input  name="telefon" type="number" class="form-control" id="telefon" placeholder="Telefon numaranızı giriniz" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="adres" class="form-label">Adres</label>
                            <textarea  name="adres" style="height: 200px" class="form-control" placeholder="Adresinizi giriniz"></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Kayıt Ol</button>
                            <button class="btn btn-outline-warning">Sıfırla</button>

                        </div>
                    </form>
                </div>            
            </div>

        </div>

    </div>

</div>
</body>
</html>
