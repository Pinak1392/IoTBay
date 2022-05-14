///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package model;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author Andy
// */
//public class Item {
//    public int id;
//    public String name;
//    public String desc;
//    public float price;
//    public int quantity;
//    private static List<Item> catalogue = new ArrayList<Item>();
//    private static List<Item> cart = new ArrayList<Item>();
//    
//    public Item(int id, String name, String desc, float price) {
//        this.id = id;
//        this.name = name;
//        this.desc = desc;
//        this.price = price;
//        if (!CatalogueContains(id)) {
//            catalogue.add(this);
//        }
//    }
//    
//    public int GetId(){
//        return id;
//    }
//    
//    public String GetName(){
//        return name;
//    }
//    
//    public String GetDesc(){
//        return desc;
//    }
//    
//    public float GetPrice(){
//        return price;
//    }
//    
//    public static Item GetItem(int id){
//        for (Item i : catalogue) {
//            if (i.id == id) {
//                return i;
//            }
//        }
//        return null;
//    }
//    
//    public static List<Item> GetCatalogue() {
//        return catalogue;
//    }
//    
//    public static List<Item> GetCart() {
//        return cart;
//    }
//    
//    public static boolean CatalogueContains(int id) {
//        for (Item i : catalogue) {
//            if (i.id == id) {
//                return true;
//            }
//        }
//        return false;
//    }
//    
//    public static boolean CartContains(int id) {
//        for (Item i : cart) {
//            if (i.id == id) {
//                return true;
//            }
//        }
//        return false;
//    }
//    
//    public static void AddToCart(int id) {
//        if (CartContains(id)) {
//            for (int i = 0; i < cart.size(); i++) {
//                if (cart.get(i).id == id) {
//                    cart.get(i).quantity++;
//                }
//            }
//        }
//        else {
//            for (Item i : catalogue) {
//                if (i.id == id) {
//                    i.quantity = 1;
//                    cart.add(i);
//                }
//            }
//        }
//    }
//    
//    public static void ClearCart() {
//        cart.clear();
//    }
//    
//    public static float CalculateTotal() {
//        float total = 0.0f;
//        for (Item i : cart) {
//            total += i.price * i.quantity;
//        }
//        return total;
//    }
//    
//    public static int CartSize() {
//        int total = 0;
//        for (Item i : cart) {
//            total += i.quantity;
//        }
//        return total;
//    }
//    
//    public static int CatalogueSize() {
//        int total = 0;
//        for (Item i : catalogue) {
//            total++;
//        }
//        return total;
//    }
//}