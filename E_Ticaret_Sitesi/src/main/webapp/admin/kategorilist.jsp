<%@page import="com.mycompany.e_ticaret_sitesi.entities.Kategori"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.KategoriDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.dao.UrunDao"%>
<%@page import="com.mycompany.e_ticaret_sitesi.helper.FactoryProvider"%>
<%@page import="com.mycompany.e_ticaret_sitesi.entities.Urun"%>
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

        KategoriDao udao = new KategoriDao(FactoryProvider.getFactory());
        List<Kategori> klist = udao.getCategories();

    %>
</head>
<body>


    <table class="table">

        <thead class="thead-light">
            <tr>
                <th scope="col">Kategori No</th>
                <th scope="col">Kategori Baslik</th>
                <th scope="col">Kategori Aciklama</th>
            </tr>
        </thead>

        <tbody>
            <%            for (Kategori k : klist) {
            %>
            <tr>
                <th scope="row"><%= k.getKategori_id() %></th>
                <td><%= k.getKategori_baslik()  %></td>
                <td><%= k.getKategori_aciklama()  %></td>

            </tr>
            <%}
            %>
        </tbody>
    </table>
</body>
</html>
