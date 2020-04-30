
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <title>Hello</title>
</head>
<body>
<h2 class="hello-title">"Job Application Pipeline"</h2>

<form id="login" action="${pageContext.request.contextPath}/api/app/add" method="post">
    <label>Company name: </label>
    <input type="text" name="company">
    <br/>
    <label>Job Title: </label>
    <input type="text" name="jobTitle">
    <br/>
    <label>Submit</label>
    <input type = "submit" value = "index.jsp"/>
</form>


<c:if test="${not empty lists}">
<c:forEach items="${lists}" var="lists">
    ${lists}
</c:forEach>

</body>
</html>