<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO8859-1">
<title>Connexion à A vos Marques</title>
</head>
<body>
<form action="login.jsp" method="get">
Login: <input type="text" id="identifiant" name="identifiant">
<br/>
mot de passe: <input type="password" id="motDePasse" name="motDePasse">
<br/>
<input type="submit" id="go">
</form>

<%
try
{
    String identifiant = request.getParameter("identifiant");
    String motDePasse = request.getParameter("motDePasse");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from utilisateurs where ident='"+identifiant+"' and pass='"+motDePasse+"' limit 0,1");

    if(rs.next())
    {
         out.println("Vous êtes bien connecté "+identifiant);
    }
    else
    {
        out.println("Erreur d'authentification pour"+identifiant);
    }
}
catch(Exception e)
{
    out.println(e.toString());
}
%>
</body>
</html>