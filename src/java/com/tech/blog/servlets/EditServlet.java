/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author pranay umesh chavan
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            //            fetch all data
            String email=request.getParameter("user_email");
            String username=request.getParameter("user_name");
            String password=request.getParameter("user_password");
            String about=request.getParameter("user_about");
            Part part=request.getPart("profile_photo");
            String imageName=part.getSubmittedFileName();
            
//            getting user from session
             HttpSession s=request.getSession();
             User user=(User)s.getAttribute("currentUser");
             user.setEmail(email);
             user.setName(username);
             user.setPassword(password);
             user.setAbout(about);
            String oldFile=user.getProfile();
             user.setProfile(imageName);


             
//             update database data
            UserDao userdao=new UserDao(ConnectionProvider.getConnection());
            boolean ans=userdao.updateUser(user);
            if(ans){
                String path=request.getRealPath("/")+"profile_pic"+File.separator+user.getProfile();
                
                // if photo/file already exists at this location then it should be deleted
               String oldFilepath=request.getRealPath("/")+"profile_pic"+File.separator+oldFile;
                if(!oldFile.equals("default.png")){
                Helper.deleteFile(oldFilepath);
                }
                   if( Helper.saveFile(part.getInputStream(), path)){
                out.println("<h2>Profile Updated Successfully...<h2>");
                        Message msg=new Message("Profile Updated Successfully...","success","alert-success");
                        s.setAttribute("msg", msg);// setting msg value to attribute "msg" 
                

                   }
                   else{
                       out.println("<h2>File not Saved...<h2>");
                       Message msg=new Message("File not Saved","error","alert-danger");
                        s.setAttribute("msg", msg);// setting msg value to attribute "msg"
                       
                   }
                    
                
            }else{
                out.println("<h2>Data not Updated...<h2>");
                Message msg=new Message("Data not Updated","error","alert-danger");
                        s.setAttribute("msg", msg);// setting msg value to attribute "msg"
              

            }

              response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
