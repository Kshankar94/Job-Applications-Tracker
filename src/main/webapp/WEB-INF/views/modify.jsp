<%--
    Document   : modify
    Created on : Apr 28, 2020, 8:49:20 PM
    Author     : gabs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding: 10px;
            }
            
            body{
                font-family: Avenir;
                font-style: normal;
                font-variant: normal;
                font-weight: 100;
            }
            
            h1{
                font-weight: 80;
                padding: 20px;
                display: inline-block;
            }
            
            div{
                size: auto;
                padding-top: 40px;
                width: 55%;
                height: 50%;
                border: 5px darkgrey;
                border-radius: 15px;
                background-color: lavender;
            }
            
            .center {
                margin: 0;
                position: fixed;
                top: 50%;
                left: 50%;
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
              }
              
            #profile, #company, #job_title {
                display: inline-block;
            }
            
            #modify{
                display: inline-block;
                position: fixed;
                right: 20%;
                border-radius: 5px;
                size: auto;
            }
            
            #delete{
                display: inline-block;
                position: fixed;
                right: 5%;
                border-radius: 5px;
                size: auto;
            }
            
        </style>
    </head>
    <body>
        <form action="form_profile" align="right" method="POST">
            <input type ="submit" id="profile" value="My Profile">
            <input type ="submit" id="profile" value="Logout">
        </form>
        <div class="center">
            <h1>Modify Opportunity</h1>
            <center>
                <form action="${pageContext.request.contextPath}/api/app/update" method="POST">
                    <table>
                        <tr>
                            <td>Auto ID</td>
                            <td><input type="text" name="id" value="${app.id}" readonly = "true"></td>
                            <td>Company</td> 
                            <td><input type="text" name="company" placeholder="Company" value="${app.company}"></td>
                            <td>Job Title</td> 
                            <td><input type="text" name="jobTitle" placeholder="Job Title" value = "${app.jobTitle}"></td>
                        </tr>
                        <tr>
                            <td>Job Posting URL</td> 
                            <td><input type="text" name="job_title" placeholder="https://"></td>
                            <td> <label for="status">Status:</label> </td>
                            <td> <select value = "${app.status}" id="status" name="status">
                                <option value="Applied">Applied</option>
                                <option value="Interview">Interview</option>
                                <option value="Offer">Offer</option>
                                <option value="Rejected">Rejected</option>
                            </select>
                            </td>
                            
                        </tr>
                        <tr>
                            <td><input type="submit" id="modify" name="modify" value="Modify"></td>
                        </tr>
                    </table>
                </form>
                <form action ="${pageContext.request.contextPath}/api/app/delete/${app.id}" method="POST"><td><input type="submit" id="delete" name="delete" value="Delete"></td></form>
            </center>   
        </div>
    </body>
</html>
