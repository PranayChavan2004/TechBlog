<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

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
    
   
/* Smooth card animation */
.post-card {
    border-radius: 15px;
    overflow: hidden;
    transition: all 0.3s ease-in-out;
    background: #ffffff;
}

.post-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
}

/* Image container */
.post-img {
    height: 230px;
    overflow: hidden;
    border-bottom: 1px solid #eee;
}

.post-img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: 0.35s ease-in-out;
}

/* Zoom effect on hover */
.post-card:hover img {
    transform: scale(1.12);
}

/* Title */
.post-title {
    font-size: 20px;
    font-weight: bold;
    color: #333;
}

/* Content trim */
.post-content {
    height: 75px;
    overflow: hidden;
    color: #555;
    font-size: 14px;
}

/* Buttons */
.btn-rounded {
    border-radius: 30px;
    padding: 5px 15px;
    font-size: 13px;
}

/* Footer */
.card-footer {
    border-top: 1px solid #e8e8e8;
}

/* Icons spacing */
.card-footer i {
    margin-right: 4px;
}


    </style>
    </head><!-- comment -->
    <body>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("login_page.jsp");
}
%>

<%
PostDao d=new PostDao(ConnectionProvider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts = (cid==0) ? d.getAllPosts() : d.getPostByCatId(cid);

if(posts.size()==0){
    out.println("<h4 class='text-center mt-5 text-muted'>No Post Available!</h4>");
    return;
}

for(Post p : posts){
%>

<div class="col-md-6 mt-4">

    <div class="card post-card shadow-sm">

        <!-- Image -->
        <div class="post-img">
            <img src="blog_pics/<%= p.getpPic() %>" alt="post-image">
        </div>

        <!-- Body -->
        <div class="card-body">
            <h5 class="post-title"><%= p.getpTitle() %></h5>
            <p class="post-content"><%= p.getpContent() %></p>

            <a href="show_blog_page.jsp?post_id=<%= p.getpId() %>"
               class="btn btn-primary btn-rounded w-100">
               <i class="fa fa-book-open"></i> Read More
            </a>
        </div>

        <!-- Footer -->
        <div class="card-footer d-flex justify-content-between align-items-center bg-light">

            <%
                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
            %>

            <!-- Like button -->
            <a href="#!" onclick="doLike(<%= p.getpId() %>,<%= user.getId() %>)"
               class="btn btn-outline-danger btn-rounded btn-sm d-flex align-items-center">
                <i class="fa fa-heart"></i>
                <span class="like-counter"><%= ld.countLikeOnPost(p.getpId()) %></span>
            </a>

            <!-- Comment button -->
            <a href="#!" class="btn btn-outline-secondary btn-rounded btn-sm d-flex align-items-center">
                <i class="fa fa-comment-alt"></i> 20
            </a>
        </div>
    </div>
</div>

<%
}
%>
    </body>
</html>