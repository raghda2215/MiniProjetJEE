<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Affecter Employé à un Voyage</title>
</head>
<body>
<h2>Affecter Employé</h2>

<form method="post" action="${pageContext.request.contextPath}/affecterEmploye">
    <label for="employeId">ID Employé :</label>
    <input type="number" name="employeId" required /><br/>

    <label for="voyageId">ID Voyage :</label>
    <input type="number" name="voyageId" required /><br/>

    <label for="role">Rôle :</label>
    <input type="text" name="role" placeholder="chauffeur, agent, ..." required /><br/>

    <input type="submit" value="Affecter"/>
</form>

</body>
</html>
