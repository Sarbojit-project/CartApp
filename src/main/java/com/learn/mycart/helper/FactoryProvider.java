
package com.learn.mycart.helper;


import java.lang.module.Configuration;
import org.hibernate.SessionFactory;


public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory(){
        
        try {
            if(factory == null){
                factory = new org.hibernate.cfg.Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
                
                
	        
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factory;
    }

    private static SessionFactory buildSessionFactory() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
