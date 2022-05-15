/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Sean
 */
public class Payment{
    private String fName;
    private String lName;
    private String adr;
    private String email;
    private int cardNo;
    private int cvv;
    private String expirydate;

        public Payment(String fName, String lName, String adr, String email, int cardNo, int cvv, String expirydate){
        this.fName = fName;
        this.lName = lName;
        this.email = email;
        this.adr = adr;
        this.cardNo = cardNo;
        this.cvv = cvv;
        this.expirydate = expirydate;
    }

    public String getfName() {
        return fName;
    }

    public String getlName() {
        return lName;
    }

    public String adr() {
        return adr;
    }

    public int cardNo() {
        return cardNo;
    }

    public int cvv() {
        return cvv;
    }

    public String expirydate() {
        return expirydate;
    }


    public void setfName(String fName) {
        this.fName = fName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public void setAdr(String adr) {
        this.adr = adr;
    }

    public void setCardNo(int cardNo) {
        this.cardNo = cardNo;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public void setExpirydate(String expirydate) {
        this.expirydate = expirydate;
    }

}
