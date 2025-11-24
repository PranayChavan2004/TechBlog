<%-- 
    Document   : index
    Created on : 11 Aug 2025, 9:51:59 am
    Author     : pranay umesh chavan
--%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css links,bootstrap css links-->
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
    /* Modern Gradient Background */
.banner-section {
    background: linear-gradient(135deg, #6200EE, #7B32FF, #9D5CFF, #6200EE);
    background-size: 300% 300%;
    animation: gradientBG 10s ease infinite;
    padding: 100px 0;
    color: white;
    position: relative;
}

/* Gradient Animation */
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Floating Shapes */
.floating-shape {
    position: absolute;
    background: rgba(255,255,255,0.1);
    backdrop-filter: blur(5px);
    width: 120px;
    height: 120px;
    border-radius: 20px;
    animation: float 6s infinite ease-in-out;
}

@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-25px); }
    100% { transform: translateY(0px); }
}

/* Buttons */
.banner-btn {
    border-radius: 30px;
    padding: 12px 30px;
    font-size: 1.1rem;
    transition: 0.3s;
}

.banner-btn:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 20px rgba(255,255,255,0.3);
}

/* Typing Effect */
.typing {
  overflow: hidden;
  border-right: 4px solid white;
  white-space: nowrap;
  animation: typing 4s steps(30) infinite alternate, blink 0.6s infinite;
  width: 300px;
  font-size: 1.5rem;
  margin-bottom: 15px;
   display: inline-block;
  margin: 0 auto;
}

@keyframes typing {
  from { width: 0; }
  to { width: 380px; }
}

@keyframes blink {
  0% { border-color: transparent; }
  50% { border-color: white; }
  100% { border-color: transparent; }
}

    
    .card {
    border: none;
    border-radius: 15px;
    transition: 0.3s;
    overflow: hidden;
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 25px rgba(0,0,0,0.15);
}

.card-img-top {
    transition: transform 0.4s ease;
}

.card:hover .card-img-top {
    transform: scale(1.08);
}

.card-title {
    font-weight: 700;
    font-size: 1.2rem;
    color: #333;
}

.card-text {
    color: #555;
}

.btn-gradient {
    background: linear-gradient(45deg, #0062ff, #00b7ff);
    border: none;
    transition: 0.3s;
}

.btn-gradient:hover {
    background: linear-gradient(45deg, #0049c4, #0091cc);
    transform: translateY(-2px);
}

.like-btn {
    transition: 0.2s ease;
}

.like-btn:hover {
    background-color: #ffdddd !important;
    border-color: #ff5c5c !important;
}

</style>




    </head>
    <body>

        <!--navbar using normal_navbar.jsp-->
        <%@include file="normal_navbar.jsp" %>
        
        <!--banner-->
<!-- Modern Interactive Banner -->
<div class="banner-section">

    <!-- Floating shapes -->
    <div class="floating-shape" style="top: 20px; left: 30px;"></div>
    <div class="floating-shape" style="bottom: 40px; right: 50px; width: 90px; height: 90px;"></div>

    <div class="container text-center ">

        <!-- Main heading -->
        <h1 class="display-4 fw-bold mb-1">
            Welcome to <span style="color:#ffe600;">TechBlog</span>
        </h1>

        <div class="typing mx-auto mt-2">
            Explore the world of Technology...
        </div>


        <p class="lead">
            A place where you learn, explore, and stay updated with the latest tech,
            gadgets, software, coding trends, and innovations.
        </p>

        <!-- Buttons -->
        <div class="mt-4">
            <a href="registration_page.jsp" class="btn btn-light banner-btn me-3">
                <i class="fa fa-user-plus"></i> &nbsp; Start! It's Free
            </a>

            <a href="login_page.jsp" class="btn btn-outline-light banner-btn">
                <i class="fa fa-user-circle"></i> &nbsp; Login
            </a>
        </div>

    </div>
</div>

        
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<%
   User user = (User) session.getAttribute("currentUser");


    // Handle null cid
    String cidParam = request.getParameter("cid");
    int cid = 0;

    if (cidParam != null) {
        try {
            cid = Integer.parseInt(cidParam);
        } catch (Exception e) {
            cid = 0;
        }
    }

    PostDao d = new PostDao(ConnectionProvider.getConnection());
    List<Post> posts = (cid == 0) ? d.getAllPosts() : d.getPostByCatId(cid);

    if (posts == null || posts.size() == 0) {
%>
        <h4 class="text-center mt-4 text-danger">No posts available!</h4>
<%
        return;
    }
%>

<!--start of card-->


<div class="container mt-4">
    <div class="row">

        <%
            int count = 0;

            for (Post p : posts) {

                // break row after every 3 cards
                if (count % 3 == 0 && count != 0) {
        %>
    </div>
    <div class="row mt-4">
        <%
            }
        %>

        <div class="col-md-4 mb-4">
            <div class="card shadow-sm">

                <!-- Blog Image -->
                <img src="blog_pics/<%= p.getpPic()%>" 
                     class="card-img-top"
                     style="height:220px; object-fit:cover;"
                     alt="blog">

                <div class="card-body">
                    <!-- Title -->
                    <h5 class="card-title"><%= p.getpTitle()%></h5>

                    <!-- Short Content -->
                    <p class="card-text" style="height:80px; overflow:hidden;">
                        <%= p.getpContent()%>
                    </p>

                    <!-- Read More Button -->
                    <a href="show_blog_page.jsp?post_id=<%= p.getpId()%>"
                       class="btn btn-gradient text-white w-100 mt-2">
                        <i class="fa fa-book-open me-1"></i> Read More
                    </a>
                </div>

                <!-- Footer Section -->
                <div class="card-footer bg-white d-flex justify-content-between align-items-center">

                    <%
                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                        int likes = ld.countLikeOnPost(p.getpId());
                    %>

                    <!-- Like Button -->
                    <a href="#!"
                       onclick="doLike(<%= p.getpId()%>, <%= user != null ? user.getId() : 0%>)"
                       class="btn btn-outline-danger btn-sm like-btn">
                        <i class="fa fa-heart"></i> 
                        <span class="like-counter"><%= likes%></span>
                    </a>

                    <!-- Comment Button -->
                    <a href="#!" class="btn btn-outline-secondary btn-sm">
                        <i class="fa fa-comment"></i> 20
                    </a>

                </div>

            </div>
        </div>

        <%
                count++;
            }
        %>

    </div>
</div>


       
        
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
