
package com.tech.blog.dao;
import java.sql.*;

public class LikeDao {
    Connection con;
    
    public LikeDao(Connection con){
        this.con=con;
    }
    
    public boolean insertLike(int pid,int uid){
        boolean state=false;
        try{
            
            String query="insert into liked(pid,uid) values(?,?)";
            // we are setting values
            PreparedStatement  ps=con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2,uid);
            
            ps.executeUpdate();
            state=true;
            
            
            
        }catch(Exception e){
            e.printStackTrace();
                    
        }
        
        return state;
    }
    
    
    public int countLikeOnPost(int pid){
        int count=0;
        try{
        
        String query="select count(*) from liked where pid=?";
        PreparedStatement  ps=this.con.prepareStatement(query);
        ps.setInt(1,pid);
        ResultSet set=ps.executeQuery();
        
        if(set.next()){
            count=set.getInt("count(*)");
            
        }
        
        
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public boolean isLikedByUser(int pid,int uid){
        boolean state=false;
        
        
        try{
            
            PreparedStatement  ps=this.con.prepareStatement("select * from liked where pid=? and uid=?");
            ps.setInt(1, pid);
            ps.setInt(2,uid);
            
            ResultSet set=ps.executeQuery();
            if(set.next()){
                state=true;
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return state;
        
        
    }
    
    public boolean deleteLike(int pid,int uid){
        boolean state=false;
        
        try{
            
        PreparedStatement ps=this.con.prepareStatement("delete from liked where pid=? and uid=?");
        ps.setInt(1,pid);
        ps.setInt(2,uid);
        ps.executeUpdate();
        state=true;
        

            
        }catch(Exception e){
            e.printStackTrace();
        }
        return state;
        
    }
}
