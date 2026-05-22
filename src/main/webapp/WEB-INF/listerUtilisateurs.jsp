<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Utilisateur" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des utilisateurs</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<h1>Liste des utilisateurs</h1>

<div class="toolbar">
    <a class="btn-add" href="<%= request.getContextPath() %>/add">+ Ajouter un utilisateur</a>
</div>

<%
    List<Utilisateur> utilisateurs = (List<Utilisateur>) request.getAttribute("utilisateurs");

    String message = request.getParameter("message");
    String status = request.getParameter("status");
    if(message != null && status != null) {
%>
    <div class="message <%= status.equals("success") ? "success" : "error"  %>">
        <%= message %>
    </div>
<%
    }

    if (utilisateurs == null || utilisateurs.isEmpty()) {
%>
    <div class="message empty">Aucun utilisateur trouvé.</div>
<%
    } else {
%>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Login</th>
                <th>Mot de passe</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Utilisateur u : utilisateurs) {
        %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getNom() %></td>
                <td><%= u.getPrenom() %></td>
                <td><%= u.getLogin() %></td>
                <td><%= u.getPassword() %></td>
                <td>
                    <a class="btn-edit" href="<%= request.getContextPath() %>/update?id=<%= u.getId() %>">modifier</a>
                    <a class="btn-delete" href="<%= request.getContextPath() %>/delete?id=<%= u.getId() %>">supprimer</a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
<%
    }
%>

</body>
</html>
