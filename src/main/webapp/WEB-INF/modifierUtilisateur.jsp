<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.Utilisateur" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier un utilisateur</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<% Utilisateur utilisateur = (Utilisateur) request.getAttribute("utilisateur"); %>

<h1>Modifier un utilisateur</h1>

<form action="<%= request.getContextPath() %>/update" method="post">
    <input type="hidden" name="id" value="<%= utilisateur.getId() %>">

    <label for="nom">Nom</label>
    <input type="text" name="nom" id="nom" value="<%= utilisateur.getNom() == null ? "" : utilisateur.getNom().trim() %>" required>

    <label for="prenom">Prénom</label>
    <input type="text" name="prenom" id="prenom" value="<%= utilisateur.getPrenom() == null ? "" : utilisateur.getPrenom().trim() %>" required>

    <label for="login">Login</label>
    <input type="text" name="login" id="login" value="<%= utilisateur.getLogin() == null ? "" : utilisateur.getLogin().trim() %>" required>

    <label for="password">Mot de passe</label>
    <input type="password" name="password" id="password" value="<%= utilisateur.getPassword() == null ? "" : utilisateur.getPassword() %>" required>

    <input type="submit" value="Modifier">
</form>

<div class="toolbar">
    <a class="btn-add" href="<%= request.getContextPath() %>/list">← Retour à la liste</a>
</div>

</body>
</html>
