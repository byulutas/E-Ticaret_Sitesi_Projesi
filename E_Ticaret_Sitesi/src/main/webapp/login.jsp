<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kullanıcı Girişi - WebMarket</title>
    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div  class="col-md-6 offset-md-4">
            <div class="card mt-3">
                <div class="card-header custom-bg text-white " >
                    <h1>Giriş Yapın  </h1>

                </div>
                <%@include file="components/message.jsp"%>
                <div class="card-body">
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>
                        <a href="register.jsp" class="text-center d-block mb-2">Kayıtlı Değilseniz Buraya Tıklayın</a>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary custom-bg border-0">Giriş Yap</button>
                            <button type="reset" class="btn btn-primary custom-bg border-0">Sıfırla</button>
                        </div>
                    </form>

                </div>
                <div class="card-footer">

                </div>

            </div>
        </div>
    </div>
</body>
</html>
