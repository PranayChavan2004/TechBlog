<%-- 
    Document   : registration_page.jsp
    Created on : 13 Aug 2025, 7:52:02 am
    Author     : pranay umesh chavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
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
</style>
    </head>
    <body>
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex  align-items-center primary-background " style="padding-bottom: 80px;" >
            
            <div class="container">
                
                <div class="col-md-6  offset-md-3"><!-- we give offset-md-4 for shifting the column to center
                                                   in bootstrap row have 12 parts offset-md-4 shift column 4-part from left --> 
                   
                    <!--creating card-->
                    <div class="card">
                        
                        <div class="card-header p-third text-white text-center">
                            <span class="fa fa-user-plus"></span><br>
                            <p>Register Here</p>
                            
                            
                            
                        </div>
                        
                        <div class="card-body">
                            <form  id="reg-form"  action="Registration"  method="POST">
                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp">
                                </div>
                                
                                
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input  name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                
                                
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="gender" class="form-label">Select Gender</label>
                                    <br>
                                    <input name="user_gender" type="radio"  id="gender" ">Male                                   
                                    <input name="user_gender" type="radio"  id="gender" >Female

                                </div>
                                
                                
                                <div class="mb-3 form-group">
                                    <textarea  name="user_about" class="form-control"    rows="5" placeholder="Enter Something about Yourself"></textarea>
                                </div>
                                
                                <div class="mb-3 form-check">
                                    <input name="terms" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label   class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                </div>
                                
                                <button type="submit" class="btn btn-primary primary-background">Submit</button>
                            </form>

                            
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
  <!-- using this script to support AJAX -->
  <script src="JS/myjs.js" type="text/javascript"></script>
  <!-- using this script so we can give message and redirect to login page after successful registration of the user-->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
      
      <!-- using AJAX here -->
      $(document).ready(function(){
          
          $('#reg-form').on('submit',function(event) {
              console.log("loaded...");
              event.preventDefault();
              let form=new FormData(this);
              
              //send to register servlet
              $.ajax({
                  url:"Registration",
                  type:'POST',
                  data:form,
                  success:function (data,textStatus,jqXHR){
                      console.log(data)
                      
                        
                      swal("User Registered Successfully...Redirectiong to Login Page ")
                      .then((value) => {
                      window.location="login_page.jsp"
                      });
             
                  },
                  error: function(jqXHR, textStatus,errorThrown){
                  swal("Something Went Wrong... ");
        },
                  processData: false,
                  contentType: false
                  
              });
          });
          
          
      });
      
      
  </script>
    </body>
</html>
