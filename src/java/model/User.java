package model;

import java.sql.Date;

/**
 *
 * @author allcr
 */
public class User {
    public int id;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String password;
    private String country;
    private String latitude;
    private String longitude;
    private Date birthdate;
    private Role role;
    private Membership membership;
    
    public User(String firstName, String lastName, String username, String email, String password, String country, Date birthdate, String latitude, String longitude, Role role, Membership membership, int id) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.country = country;
        this.birthdate = birthdate;
        this.latitude = latitude;
        this.longitude = longitude;
        this.role = role;
        this.membership = membership;
        this.id = id;
    }
    
    public User(String firstName, String lastName, String username, String email, String password, String country, Date birthdate, String latitude, String longitude, Role role, Membership membership) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.country = country;
        this.birthdate = birthdate;
        this.latitude = latitude;
        this.longitude = longitude;
        this.role = role;
        this.membership = membership;
        this.id = 0;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUserName() {
        return this.username;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    public String getCountry() {
        return this.country;
    }
    
    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
    public String getLatitude() {
        return this.latitude;
    }
    
    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    public String getLongitude() {
        return this.longitude;
    }
    
    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }
    public Date getBirthDate() {
        return this.birthdate;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    public Role getRole() {
        return this.role;
    }
    
    public void setMembership(Membership membership) {
        this.membership = membership;
    }
    public Membership getMembership() {
        return this.membership;
    }
    
    public String getName() {
        return this.firstName + " " + this.lastName;
    }
}
