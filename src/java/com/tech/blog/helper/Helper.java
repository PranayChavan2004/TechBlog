/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author pranay umesh chavan
 */
public class Helper {
    public static  boolean deleteFile(String path){
        boolean state=false;
        try{
            File file=new File(path);
            state=file.delete();
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return state;
        
    }
    
    public static boolean saveFile(InputStream is,String path){
        Boolean state=false;
        try{
            
            byte b[]=new byte[is.available()];
            is.read(b);
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            state=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return state;
        
    }
    
    
}
