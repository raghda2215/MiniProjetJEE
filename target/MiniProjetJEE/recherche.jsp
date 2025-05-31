<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Résultats de recherche</h2>
<c:forEach items="${trajets}" var="trajet">
    <p>${trajet.villeDepart} → ${trajet.villeArrivee} | ${trajet.date} | ${trajet.heureDepart} - ${trajet.heureArrivee} | ${trajet.prix}€ | Places: ${trajet.placesDisponibles}</p>
</c:forEach>
