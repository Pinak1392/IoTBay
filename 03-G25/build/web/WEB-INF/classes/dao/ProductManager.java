/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Admin
 */
import java.util.ArrayList;
import java.sql.*;
import java.util.List;
import model.Product;

/**
 *
 * @author Jared
 */
public class ProductManager {

    private final Statement st;

    public ProductManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

//find  products
    public Product findProduct(String PRODUCTNAME, String DESCRIPTION) throws SQLException {
        String fetch = "SELECT * FROM ADMIN1.PRODUCT WHERE PRODUCTNAME = '" + PRODUCTNAME + "' and DESCRIPTION '" + DESCRIPTION + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String PRODUCTNAME1 = rs.getString(2);
            String DESCRIPTION1 = rs.getString(5);
            if (PRODUCTNAME1.equals(PRODUCTNAME) && DESCRIPTION1.equals(DESCRIPTION)) {
                int PRODUCTID = rs.getInt(1);
                int STOCK = rs.getInt(3);
                float PRICE = rs.getFloat(4);
                int ARCHIVED = rs.getInt(6);
                return new Product(PRODUCTID, PRODUCTNAME1, STOCK, PRICE, DESCRIPTION, ARCHIVED);

            }

        }
        return null;
    }

//List all products for customers and staff
    public ArrayList<Product> fetchProducts() throws SQLException {
        String fetch = "SELECT PRODUCTID, PRODUCTNAME, STOCK, PRICE, DESCRIPTION, ARCHIVED FROM PRODUCT";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();

        while (rs.next()) {
            int PRODUCTID = rs.getInt("PRODUCTID");
            String PRODUCTNAME1 = rs.getString("PRODUCTNAME");
            int STOCK = rs.getInt("STOCK");
            float PRICE = rs.getFloat("PRICE");
            String DESCRIPTION1 = rs.getString("DESCRIPTION");
            int ARCHIVED = rs.getInt("ARCHIVED");
            temp.add(new Product(PRODUCTID, PRODUCTNAME1, STOCK, PRICE, DESCRIPTION1, ARCHIVED));
        }
        return temp;
    }

//Staff user create/add product and its details
    public void addProduct(int PRODUCTID, String PRODUCTNAME, int STOCK, float PRICE, String DESCRIPTION, int ARCHIVED) throws SQLException {
        st.executeUpdate("INSERT INTO ADMIN1.PRODUCT " + "VALUES ("+PRODUCTID+", '"+PRODUCTNAME+"', "+STOCK+", "+PRICE+", '"+DESCRIPTION+"', "+ARCHIVED+")");
    }

//Staff user update saved product details

public void updateProduct(int PRODUCTID, String PRODUCTNAME, int STOCK, float PRICE, String DESCRIPTION, int ARCHIVED) throws SQLException {
    st.executeUpdate("UPDATE ADMIN1.PRODUCT SET PRODUCTID="+PRODUCTID+",PRODUCTNAME='"+PRODUCTNAME+"',STOCK="+STOCK+",PRICE="+PRICE+",DESCRIPTION='"+DESCRIPTION+"',ARCHIVED="+ARCHIVED+" WHERE PRODUCTID ="+PRODUCTID+"");
}
     
//Staff user delete product records
    public void deleteProduct(int PRODUCTID) throws SQLException {
        st.executeUpdate("DELETE FROM ADMIN1.PRODUCT WHERE PRODUCTID ="+PRODUCTID);
    }

}

