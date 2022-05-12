package controller;

/**
 *
 * @author Jared
 */
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import model.Product;
import product.dao.*;

public class DeviceCatalogueController {

    private static final Scanner in = new Scanner(System.in);
    private DBConnector connector;
    private Connection conn;
    private DBManager db;

    public static void main(String[] args) throws SQLException {
        new TestDB().runQueries();
    }

    public TestDB() {
        try {
            connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private char readChoice() {
        System.out.print("Operation CRUDS or * to exit: ");
        return in.nextLine().charAt(0);
    }

    private void runQueries() {
        char c;

        while ((c = readChoice()) != '*') {
            switch (c) {
                case 'C':
                    testCreate();
                    break;
                case 'R':
                    testRead();
                    break;
                case 'U':
                    testUpdate();
                    break;
                case 'D':
                    testDelete();
                    break;
                case 'S':
                    showAll();
                    break;
                default:
                    System.out.println("Unknown Command");

            }
        }
    }

    private void testRead() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void showAll() {
        try {
            ArrayList<Product> products = db.fetchProducts();
            System.out.println("STUDENTS TABLE: ");
            products.stream().forEach((product)
                    -> {
                System.out.printf("%-20s %-30s %-40s %-30s %-20s %-10s \n", product.getPRODUCTID(), product.getPRODUCTNAME(), product.getSTOCK(), product.getPRICE(), product.getDESCRIPTION(), product.getARCHIVED());
            });
            System.out.println();
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void testCreate() {
        System.out.print("PRODUCTID: ");
        int PRODUCTID = in.nextInt();
        in.nextLine();

        System.out.print("PRODUCTNAME: ");
        String PRODUCTNAME = in.nextLine();
        in.nextLine();

        System.out.print("STOCK: ");
        int STOCK = in.nextInt();
        in.nextLine();

        System.out.print("PRICE: ");
        float PRICE = in.nextFloat();
        in.nextLine();

        System.out.print("DESCRIPTION: ");
        String DESCRIPTION = in.nextLine();
        in.nextLine();

        System.out.print("ARCHIVED: ");
        int ARCHIVED = in.nextInt();
        in.nextLine();

        try {
            db.addProduct(PRODUCTID, PRODUCTNAME, STOCK, PRICE, DESCRIPTION, ARCHIVED);
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Product is added to the database.");
    }

    private void testUpdate() {
        System.out.print("PRODUCTID: ");
        int PRODUCTID = in.nextInt();
in.nextLine();

        try {
            System.out.print("PRODUCTNAME: ");
            String PRODUCTNAME = in.nextLine();
            in.nextLine();

            System.out.print("STOCK: ");
            int STOCK = in.nextInt();
            in.nextLine();

            System.out.print("PRICE: ");
            float PRICE = in.nextFloat();
            in.nextLine();

            System.out.print("DESCRIPTION: ");
            String DESCRIPTION = in.nextLine();
            in.nextLine();

            System.out.print("ARCHIVED: ");
            int ARCHIVED = in.nextInt();
            in.nextLine();
            db.updateProduct(PRODUCTID, PRODUCTNAME, STOCK, PRICE, DESCRIPTION, ARCHIVED);
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void testDelete() {

        System.out.print("ProductID: ");
        int PRODUCTID = in.nextInt();
        in.nextLine();
        try {
            db.deleteProduct(PRODUCTID);
        } catch (SQLException ex) {
        }
    }
}
