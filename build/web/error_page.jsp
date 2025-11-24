<%-- 
    Document   : error_page
    Created on : 4 Oct 2025, 11:42:50 am
    Author     : pranay umesh chavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Something went wrong...</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="CSS/Mycss.css" rel="stylesheet" type="text/css"/>
        <!--here we used below link of font awesome5 intro from w3school so that we can use icons in our project
          in out normal_navbar.jsp we use font awesome classes in <span> so we can have icons before our text--> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--now we are using clip math to making structure like zig-zag we used it between banner and card 
    its like  /\/\/\  pattern. we are pasting link on this page because we want to use clip here on banner --> 
<style>
    .banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 77% 97%, 50% 100%, 22% 97%, 0 100%, 0% 35%, 0 0);
    }
</style>
    </head>
    <body>
        <div class="container text-center" >
            <img  style="height: 330px; width:330px"src="image/browser.png"  class="img-fluid"><!-- using img-fluid so our image can adjust according to screen size --> 
            <h2 class="display-5">Something went wrong</h2> 
            <%= exception%>
            <a  href="index.jsp" class="btn primary-background btn-large text-white mt-3">Home</a>
        </div>
    </body>
</html>
