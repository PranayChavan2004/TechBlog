<%-- 
    Document   : profile
    Created on : 27 Oct 2025, 10:51:09 am
    Author     : pranay umesh chavan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"  %>
<%
// here we are getting session to print the login user details 
User user=(User)session.getAttribute("currentUser");
if(user==null){
// there is no user that login so sending to login page
response.sendRedirect("login_page.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    body {
            
            background: url(image/background.jpg);
            background-size: cover;
            background-attachment: fixed;
            
        }
    .banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 77% 97%, 50% 100%, 22% 97%, 0 100%, 0% 35%, 0 0);
    }
</style>
    </head>
    <body>
<!--  if user is login then to ensure we are printing some of its details-->
<!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
      <!--click on TechBlog to visit index page--> 
<!--click on TechBlog to visit index page--> 
<a class="navbar-brand" href="index.jsp">
    <span class="fa fa-mortar-board"></span>&nbsp;TechBlog
</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#"><span  class="fas fa-file-alt">&nbsp;</span>LearnCoding</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
               Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Programming Languages</a></li> 
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                <li><hr class="dropdown-divider bg-light"></li>

            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-bs-toggle="modal"  data-bs-target="#add-post-modal"><span class="fa fa-asterisk"></span>&nbsp;Do Post </a>
        </li>        
        
        
      </ul>
        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-Modal"><span class="fa fa-user-circle <%= user.getProfile()%>"></span>&nbsp;<%= user.getName()%></a>
        </li>
        
            <li class="nav-item">
            <a class="nav-link" href="LogoutServlet">Log Out</a>
        </li>
        </ul>
    </div>
  </div>
</nav>

<!--end of navbar-->

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

  <!--start of main body of page-->
  
  <main>
      <div class="container">
          
          <div class="row mt-4">
              <!--first column -->
              <div class="col-md-4">
                  <!--contains categories names--> 
                  <div class="list-group">
                      <a href="#" onclick="getPosts(0,this)"class="c-link list-group-item list-group-item-action active" aria-current="true">
                          All Posts
                      </a>
                      <%
                      PostDao pd=new PostDao(ConnectionProvider.getConnection());
                      ArrayList<Category> list1=pd.getAllCategories();
                      for(Category cc:list1){ 
                      
                          
                      %>
                      
                      <a href="#"  onclick="getPosts(<%=cc.getCid() %>,this)"class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                      <%
                          }
                      %>
                      </div>
                  
                  
              </div>
              <!--second column-->
              <div class="col-md-8" >
                  <!--contains posts-->
                  <div  class="container text-center"  id="loader">
                      <i class="fa fa-refresh fa-3x fa-spin"></i>
                      <h3 class="mt-2">Loading...  </h3>
                      
                  </div>
                  <div class="container-fluid" id="post-container" >
                      
                  </div>
                  
              </div>
                  
              
          </div>
      </div>

  </main>
  
  <!--end of body of page-->


<!--start of profile modal-->


<!-- Modal -->
<div class="modal fade" id="profile-Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white" >
        <h5 class="modal-title" id="exampleModalLabel">Profile Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
<img src="profile_pic/<%= user.getProfile() %>" class="img-fluid rounded-circle" alt="Profile Picture" style="max-width:150px;">
               <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
               <!--Details-->
               <div id="profile-details">
               <table class="table">

  <tbody>
    <tr>
      <th scope="row">Id</th>
      <td><%= user.getId()%></td>
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%= user.getEmail()%></td>
    </tr>
        <tr>
      <th scope="row">About</th>
      <td colspan="2"><%= user.getAbout()%></td>
    </tr>
            <tr>
      <th scope="row">Registered Date</th>
      <td colspan="2"><%= user.getRdate().toString()%></td>
    </tr>
  </tbody>
</table>
               </div>

    <!--profile edit-->
    <div id="profile-edit" style="display:none;">
        <h3 class="mt-2">Please Edit Carefully</h3>
        <form action="EditServlet"  method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Id : </td>
                    <td><%= user.getId()%></td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td><input type="email"  name="user_email" class="form-control" value="<%=user.getEmail()%>"></td>
                </tr>
                <tr>
                    <td>Name : </td>
                    <td><input type="text"  name="user_name" class="form-control" value="<%=user.getName()%>"></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="text"  name="user_password" class="form-control" value="<%=user.getPassword()%>"></td>
                </tr>
                <tr>
                    <td>About : </td>
                    <td>
                <textarea rows="5" class="form-control" name="user_about">
                    <%= user.getAbout()%>
                </textarea>
                    </td> 
                </tr>
                <tr>
                    <td>New Profile Picture : </td>
                    <td>
                <input type="file"  class="form-control" name="profile_photo">
                    </td> 
                </tr>
            </table><br>
                <div  class="container">
                    <button type="submit" class="btn btn-outline-primary">Save</button>
                </div>
        </form>
        
    </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button  id="edit-profile-button"  type="button" class="btn btn-primary" >Edit</button>
      </div>
    </div>
  </div>
</div> 

<!--end of profile modal-->
<!--start of add post modal-->



<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
<form action="AddPostServlet" method="post" enctype="multipart/form-data" id="add-post-form">
    <div class="form-group">
        <select name="cid" class="form-control" required>
            <option selected disabled>---- Select Category ----</option>
            <%
                PostDao pd1 = new PostDao(ConnectionProvider.getConnection());
                ArrayList<Category> list = pd1.getAllCategories();
                for (Category c : list) {
            %>
                <option value="<%= c.getCid() %>"><%= c.getName() %></option>
            <%
                }
            %>
        </select>
    </div>

    <div class="form-group">
        <input type="text" name="pTitle" placeholder="Enter post title" class="form-control" required>
    </div>

    <div class="form-group">
        <textarea name="pContent" class="form-control" style="height:200px" placeholder="Enter content" required></textarea>
    </div>

    <div class="form-group">
        <textarea name="pCode" class="form-control" style="height:150px" placeholder="Enter code (if any)"></textarea>
    </div>

    <label>Upload picture</label><br>
    <div class="form-group">
        <input type="file" name="pic" class="form-control" required>
    </div>
    <br>
    <div class="text-center">
        <button type="submit" class="btn btn-primary">Post</button>
    </div>
</form>
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!--end of add post modal-->

        <!--javascript-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <script src="JS/myjs.js" type="text/javascript"></script>
<script>
  $(document).ready(function(){
      let editStatus = false;
      
      $('#edit-profile-button').click(function(){
          if(editStatus == false){
              $("#profile-details").hide();
              $("#profile-edit").show();
              editStatus = true;
              $(this).text("Back");
          }
          else{
              $("#profile-details").show();
              $("#profile-edit").hide();
              editStatus = false; 
              $(this).text("Edit");
          }
      });
  });
</script>

<script>
$(document).ready(function (e) {
    $("#add-post-form").on("submit", function (event) {
        event.preventDefault(); // prevent page reload
        console.log("data submitted");

        let form = new FormData(this);

        $.ajax({
            url: "AddPostServlet",
            type: "POST",
            data: form,
            processData: false,
            contentType: false,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.trim() === 'done') {
                    swal("Done!!!", "Saved Successfully!", "success");
                } else {
                    swal("Error!", "Something went wrong!", "error");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("AJAX Error:", textStatus, errorThrown);
                swal("Error!", "Server not responding!", "error");
            }
        });
    });
});
</script>

<!--loading post using ajax-->
<script>
    function getPosts(catId,temp){
        $(".c-link").removeClass('active')
       $.ajax({
           url:"load_posts.jsp",
           data:{cid:catId},
           success:function(data,textStatus,jqXHR){
               console.log(data);
               $("#loader").hide();
               $('#post-container').html(data);
               $(temp).addClass('active')
           }
       });
    }
    $(document).ready(function(e){
        let allpostRef=$('.c-link')[0];
        getPosts(0,allpostRef);
        
    });
</script>
    
    
    </body>
</html>
