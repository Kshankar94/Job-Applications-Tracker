<%-- 
    Document   : welcome
    Created on : Apr 21, 2020, 6:17:10 AM
    Author     : gabs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background-color: lavender;
        }
        .table { display: table; }
        .tbody { display: table-row-group; }
        .tr { display: table-row; }
        .td { display: table-cell; }
    </style>
</head>
<body>
<ul class="nav nav-tabs nav-justified" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Home</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="/create_index" role="tab">Create</a>
    </li>
</ul>
</form>

<!-- Tab panes -->
<div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
        <p>Pipeline</p>
        <div class="span2" id="applicationHead">
            <table class="table table-condensed">

                <tr>
                    <td><b>Auto Id</b></td>
                    <td><b>Company name</b></td>
                    <td><b>Job Title</b></td>
                    <td><b>Status</b></td>
                    <td><b>Edit</b></td>
                </tr>

                <c:forEach items="${applications}" var="app" varStatus="count">

                    <tr>
<%--                        <td>${count}</td>--%>
                        <td>${app.id}</td>
                        <td>${app.company}</td>
                        <td>${app.jobTitle}</td>
                        <td>${app.status}</td>
                        <td><a href="/modify_index/${app.id}"><i class="fa fa-edit"></i> </a></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
<%--                    <td><b>Total Price: {shoppingCart.totalPrice}</b></td>--%>
                </tr>
            </table>
        </div>
    </div>

</div>
</div>

</body>
</html>
