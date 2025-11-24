/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pranay umesh chavan
 */
public class PostDao {
    Connection con;
    

    public PostDao(Connection con) {
        this.con=con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        
        try{
            
            String query="select * from categories;";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(query);
            
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c1=new Category(cid,name,description);
                list.add(c1);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
        
        
    }
    
    public boolean savePost(Post p){
        boolean flag=false;
        
        try{
            
            String query="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?);";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
            ps.setString(4, p.getpPic());
            ps.setInt(5, p.getCatId());
            ps.setInt(6, p.getUserId());
            ps.executeUpdate();
            flag=true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    public List<Post> getAllPosts(){
        
        List<Post> list =new ArrayList<>();
        
//        fetch all posts
try{
    
    PreparedStatement ps=con.prepareStatement("select * from posts order by pid desc");
    ResultSet rs=ps.executeQuery();
    
    while(rs.next()){
        int pid=rs.getInt("pId");
        String pTitle=rs.getString("pTitle");
        String pContent=rs.getString("pContent");
        String pCode=rs.getString("pCode");
        String pPic=rs.getString("pPic");
        Timestamp date=rs.getTimestamp("pDate");
        int catId=rs.getInt("catId");
        int userId=rs.getInt("userId");
        Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
        list.add(post);
    }
}catch(Exception e){
    e.printStackTrace();
}


        return list;
    }
      
       public List<Post> getPostByCatId(int catId){
           
           List<Post> list =new ArrayList<>();
        
//        fetch all posts by catId

try{
    
    PreparedStatement ps=con.prepareStatement("select * from posts where catId=?");
    ps.setInt(1, catId);
    ResultSet rs=ps.executeQuery();
    
    while(rs.next()){
        int pid=rs.getInt("pId");
        String pTitle=rs.getString("pTitle");
        String pContent=rs.getString("pContent");
        String pCode=rs.getString("pCode");
        String pPic=rs.getString("pPic");
        Timestamp date=rs.getTimestamp("pDate");
        int userId=rs.getInt("userId");
        Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
        list.add(post);
    }
}catch(Exception e){
    e.printStackTrace();
}


        return list;
       } 
       
       
       public Post getPostByPostId(int postId){
           Post post=null;
        
           String query="select * from posts where pId=?";
           try{
               
               
               PreparedStatement ps=con.prepareStatement(query);
               ps.setInt(1,postId);
               
               ResultSet  set=ps.executeQuery();
               if(set.next()){
                   
                           int pid=set.getInt("pId");
        String pTitle=set.getString("pTitle");
        String pContent=set.getString("pContent");
        String pCode=set.getString("pCode");
        String pPic=set.getString("pPic");
        Timestamp date=set.getTimestamp("pDate");
        int userId=set.getInt("userId");
        int cId=set.getInt("catId");
         post=new Post(pid, pTitle, pContent, pCode, pPic, date, cId, userId);
                   
               }
               
           }catch(Exception e){
               e.printStackTrace();
           }
           
           return post;
       }
    
}
