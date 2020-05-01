<%-- 
    Document   : create
    Created on : Apr 28, 2020, 8:49:20 PM
    Author     : gabs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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

        #save{
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
    <h1>New Opportunity</h1>
    <center>
        <form action="${pageContext.request.contextPath}/api/app/create" method="POST">
            <table>
                <tr>
                    <td>Company</td>
                    <td><input type="text" name="company" placeholder="Company"></td>
                    <td>Job Title</td>
                    <td><input type="text" name="jobTitle" placeholder="Job Title"></td>
                </tr>
                <tr>
                    <td>Job Posting URL</td>
                    <td><input type="text" name="jobUrl" placeholder="https://"></td>
                   <td> <label for="status">Status:</label> </td>
                   <td> <select id="status" name="status">
                        <option value="Applied">Applied</option>
                        <option value="Interview">Interview</option>
                        <option value="Offer">Offer</option>
                        <option value="Rejected">Rejected</option>
                    </select>
                   </td>
                </tr>
                <tr>
                    <td> <label for="jobBoard">jobBoard:</label> </td>
                    <td> <select id="jobBoard" name="jobBoard">
                    </select>
                    </td>
                </tr>

                    <script type="text/javascript">
                        var xml = "<Jobs>";
                        xml += "<JobBoard>";
                        xml += "<Name>LinkedIn</Name>";
                        xml += "</JobBoard>";
                        xml += "<JobBoard>";
                        xml += "<Name>Indeed</Name>";
                        xml += "</JobBoard>";
                        xml += "<JobBoard>";
                        xml += "<Name>AngelList.co</Name>";
                        xml += "</JobBoard>";
                        xml += "<JobBoard>";
                        xml += "<Name>GithuBJobs</Name>";
                        xml += "</JobBoard>";
                        xml += "<JobBoard>";
                        xml += "<Name>StackOverflow</Name>";
                        xml += "</JobBoard>";
                        xml += "<JobBoard>";
                        xml += "<Name>wayUp</Name>";
                        xml += "</JobBoard>";
                        xml += "<JobBoard>";
                        xml += "<Name>Career Fair</Name>";
                        xml += "</JobBoard>";
                        var jobBoards = $(xml).find("jobBoard");
                        var ddl = $("#jobBoard");
                        jobBoards.each(function () {
                            var option = $("<option />");

                            //Set Customer Name in Text part.
                            option.html($(this).find("Name").text());

                            //Add the Option element to DropDownList.
                            ddl.append(option);
                        });
                    </script>



                <tr>
                    <td><input type="submit" id="save" name="save" value="Save"></td>
                </tr>
            </table>
        </form>
    </center>
</div>
</body>
</html>
