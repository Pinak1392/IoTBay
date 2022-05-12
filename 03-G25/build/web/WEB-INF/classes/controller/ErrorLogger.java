/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author limay
 */
import java.util.ArrayList;

public class ErrorLogger {
    private static ArrayList<String> errors = new ArrayList<>();
    
    public static void addErr(String errorMessage){
        errors.add(errorMessage);
    }
    
    public static ArrayList<String> getErrs(){
        ArrayList<String> temp = new ArrayList<>(errors);
        errors.clear();
        return temp;
    }
}
