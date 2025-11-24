<%-- 
    Document   : login_page.jsp
    Created on : 13 Aug 2025, 7:05:39 am
    Author     : pranay umesh chavan
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!--css,bootstrap css and font animation links below-->
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
        
        <!--navbar --> 
        <%@include file="normal_navbar.jsp" %>
        
        <!--login page-->
        <main  class="d-flex  align-items-center primary-background banner-background" style="height:70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        
                        <!--creating card-->
                        <div class="card">
                            
                            <!--header of card-->
                            <div class="card-header p-third text-white text-center"> <!--we are using text-center in class card-header so all text in header of card will center align-->
                                <span class="fa fa-user-circle-o fa-2x"></span>
                                <br>
                                <p>Login here</p>
                                
                            </div>
<!-- using alert message here if any user fill wrong login details then message will show above login body-->

<%
    Message m = (Message) session.getAttribute("msg");
    if (m != null) {
%>
<div class="alert <%= m.getCssClass() %> text-center" role="alert">
    <%= m.getContent() %>
</div>
<%
        // remove message after showing it once
        session.removeAttribute("msg");
    }
%>

                            
                            <!--body of card-->
                            <div class="card-body">
                                <!--creating form using bootstrap form-->
<form action="LoginServlet"  method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input  name="email"  required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input  name="password"  required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <br>
  <button type="submit" class="btn btn-primary primary-background">Submit</button>
</form>
                                
                            </div>
                            

                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        
        <!--javascript-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
  <script src="JS/myjs.js" type="text/javascript"></script>
    </body>
</html>
