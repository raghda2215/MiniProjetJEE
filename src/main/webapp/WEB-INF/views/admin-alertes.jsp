<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>Gestion des Alertes</title></head>
<body>
<h2>Envoyer une alerte</h2>

<form method="post" action="alertes">
    <label for="voyageId">ID du voyage :</label>
    <input type="number" name="voyageId" id="voyageId" required />

    <label for="statut">Type d’alerte :</label>
    <select name="statut" id="statut">
        <option value="retardé">Retardé</option>
        <option value="annulé">Annulé</option>
    </select>

    <button type="submit">Envoyer l’alerte</button>
</form>

<c:if test="${not empty message}">
    <p style="color:green;">${message}</p>
</c:if>

</body>
</html>
