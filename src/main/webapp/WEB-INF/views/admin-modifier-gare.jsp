<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Modifier la gare</h2>
<form method="post" action="gares">
    <input type="hidden" name="action" value="modifier" />
    <input type="hidden" name="id" value="${gare.id}" />
    Nom: <input type="text" name="nom" value="${gare.nom}" /><br />
    Ville: <input type="text" name="ville" value="${gare.ville}" /><br />
    <button type="submit">Enregistrer</button>
</form>
