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

        UrunDao udao = new UrunDao(FactoryProvider.getFactory());
        List<Urun> ulist = udao.getAllUrun();

    %>
</head>
<body>


    <table class="table">

        <thead class="thead-light">
            <tr>
                <th scope="col">Urun No</th>
                <th scope="col">Urun Adi</th>
                <th scope="col">Urun Fiyatı</th>
                <th scope="col">Urun Adeti</th>
            </tr>
        </thead>

        <tbody>
            <%            for (Urun u : ulist) {
            %>
            <tr>
                <th scope="row"><%= u.getUrun_id() %></th>
                <td><%= u.getUrun_adi() %></td>
                <td><%= u.getUrun_fiyati() %></td>
                <td><%= u.getUrun_adeti() %></td>
            </tr>
            <%}
            %>
        </tbody>
    </table>
</body>
</html>
