
package model;

/**
 *
 * @author Jared
 */
public class Product {
    private int PRODUCTID;
    private String PRODUCTNAME;
    private int STOCK;
    private float PRICE;
    private String DESCRIPTION;
    private int ARCHIVED;


public Product(int PRODUCTID, String PRODUCTNAME, int STOCK, float PRICE, String DESCRIPTION, int ARCHIVED) {

    this.PRODUCTID = PRODUCTID;
    this.PRODUCTNAME = PRODUCTNAME;
    this.STOCK = STOCK;
    this.PRICE = PRICE;
    this.DESCRIPTION = DESCRIPTION;
    this.ARCHIVED = ARCHIVED;
}

    public int getPRODUCTID() {
        return PRODUCTID;
    }

    public String getPRODUCTNAME() {
        return PRODUCTNAME;
    }

    public int getSTOCK() {
        return STOCK;
    }

    public float getPRICE() {
        return PRICE;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public int getARCHIVED() {
        return ARCHIVED;
    }

    public void setPRODUCTID(int PRODUCTID) {
        this.PRODUCTID = PRODUCTID;
    }

    public void setPRODUCTNAME(String PRODUCTNAME) {
        this.PRODUCTNAME = PRODUCTNAME;
    }

    public void setSTOCK(int STOCK) {
        this.STOCK = STOCK;
    }

    public void setPRICE(float PRICE) {
        this.PRICE = PRICE;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public void setARCHIVED(int ARCHIVED) {
        this.ARCHIVED = ARCHIVED;
    }

}