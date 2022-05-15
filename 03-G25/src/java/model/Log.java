/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author limay
 */
public class Log {
    private String datetime;
    private String action;
    
    public Log(String datetime, String action) {
        this.datetime = datetime;
        this.action = action;
    }

    
    @Override
    public String toString() {
        return datetime + ": " + action;
    } 
}
