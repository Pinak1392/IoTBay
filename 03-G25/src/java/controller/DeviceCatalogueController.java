package controller;

/**
 * @author Jared
 */
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import model.Product;
import product.dao.*;

public class test {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            System.out.print("PRODUCTID: ");
            int PRODUCTID = in.nextInt();

            System.out.print("PRODUCTNAME: ");
            String PRODUCTNAME = in.nextLine();

            System.out.print("STOCK: ");
            int STOCK = in.nextInt();

            System.out.print("PRICE: ");
            float PRICE = in.nextFloat();

            System.out.print("DESCRIPTION: ");
            String DESCRIPTION = in.nextLine();

            System.out.print("ARCHIVED: ");
            int ARCHIVED = in.nextInt();

            db.addProduct(PRODUCTID, PRODUCTNAME, STOCK, PRICE, DESCRIPTION, ARCHIVED);

            System.out.println("User is added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}

