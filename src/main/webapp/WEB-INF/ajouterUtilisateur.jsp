<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter un utilisateur</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<h1>Ajouter un utilisateur</h1>

<form method="post">
    <label for="nom">Nom</label>
    <input type="text" name="nom" id="nom" required>

    <label for="prenom">Prénom</label>
    <input type="text" name="prenom" id="prenom" required>

    <label for="login">Login</label>
    <input type="text" name="login" id="login" required>

    <label for="password">Mot de passe</label>
    <input type="password" name="password" id="password" required>

    <input type="submit" value="Ajouter">
</form>

<div class="toolbar">
    <a class="btn-add" href="<%= request.getContextPath() %>/list">← Retour à la liste</a>
</div>

</body>
</html>
