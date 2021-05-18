<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kullanici"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KullaniciDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="bootstrap.min.css" />
    <script src="jquery-3.4.1.slim.min.js" ></script>
    
    <%

        KullaniciDao kdao = new KullaniciDao(FactoryProvider.getFactory());
        List<Kullanici> klist = kdao.getAllKullanici();

    %>
</head>
<body>


    <table class="table">

        <thead class="thead-light">
            <tr>
                <th scope="col">Kullanici No</th>
                <th scope="col">Kullanici Adi</th>
                <th scope="col">Email</th>
                <th scope="col">Sifre</th>
                <th scope="col">Telefon</th>
                <th scope="col">Adres</th>
                <th scope="col">Kullanici Tipi</th>
            </tr>
        </thead>

        <tbody>
            <%            for (Kullanici k : klist) {
            %>
            <tr>
                <th scope="row"><%= k.getKullanici_id() %></th>
                <td><%= k.getKullanici_adi() %></td>
                <td><%= k.getEmail() %></td>
                <td><%= k.getSifre() %></td>
                <td><%= k.getTelefon() %></td>
                <td><%= k.getAdres() %></td>
                <td><%= k.getKullanici_tipi() %></td>
            </tr>
            <%}
            %>
        </tbody>
    </table>
</body>
</html>
