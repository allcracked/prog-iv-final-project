/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author joseavilez
 */
public class Membership {
    public int membershipId;
    public int roleId;
    public String membershipName;
    public String membershipDescription;
    public int membershipPrice;
    
    public Membership(int membershipId, int roleId, String membershipDescription, String membershipName, int membershipPrice) {
        this.membershipId = membershipId;
        this.roleId = roleId;
        this.membershipName = membershipName;
        this.membershipDescription = membershipDescription;
        this.membershipPrice = membershipPrice;
    }
}
