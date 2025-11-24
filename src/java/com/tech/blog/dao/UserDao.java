// to perform CRUD operation on data from registration form 
package com.tech.blog.dao;

/**
 *
 * @author pranay umesh chavan
 */
import java.util.*;
import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {
    private Connection con;

    // this class will call only when we create its constructor in other classes and methods
    public UserDao(Connection con) {
        this.con = con;
    }
    
//    method to insert data of user in database
    public boolean saveUser(User user)// create object of User class to user data inside User class
    { 
        boolean state=false;
        
        //user to database
        try{
        //user to database
        
        String query="insert into users(name,email,password,gender,about) values(?,?,?,?,?);";
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,user.getName());
        ps.setString(2,user.getEmail());
        ps.setString(3,user.getPassword());
        ps.setString(4,user.getGender());
        ps.setString(5,user.getAbout());
        
        ps.executeUpdate();
        // if all this statements executes then we are changing state to true
        state=true;
        
        
        
           }catch(Exception e){
               e.printStackTrace();
               System.out.println("SQL ERROR: " + e.getMessage());
           }
        return state;
    }
    // getting user by email and password 
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            
            String query="select * from users where email=? and password=?;";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet set=ps.executeQuery();
            
            if(set.next()){
                user=new User();
                // data from database setting to User object to print that 
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setRdate(set.getTimestamp("rdate"));
                 user.setProfile(set.getString("profile"));
                // if all that stored in the user then this will return otherwise we initially set user=null that will print
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean updateUser(User user){
        boolean state=false;
        try{
            String query="update users set name=?,email=?,password=?,about=?,profile=? where id=?;";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getAbout());
            ps.setString(5,user.getProfile());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
            state=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return state;
    }
    
    
}
