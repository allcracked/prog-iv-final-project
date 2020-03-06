package model;

import model.User;
/**
 *
 * @author allcr
 */
public class Company {
    public int id;
    private String name;
    private String mission;
    private String vision;
    private String objectives;
    private String policies;
    private String orgChartLink;
    private String phone;
    private String mainEmail;
    private String address;
    private String mapLocation;
    
    public User[] users;
    
    void Company(String name, String mission, String vision, String objectives, String policies, String orgChartLink, String phone, String mainEmail, String address, String mapLocation) {
        this.name = name;
        this.mission = mission;
        this.vision = vision;
        this.objectives = objectives;
        this.policies = policies;
        this.orgChartLink = orgChartLink;
        this.phone = phone;
        this.mainEmail = mainEmail;
        this.address = address;
        this.mapLocation = mapLocation;
        this.id = 0;
    }
    void Company(String name, String mission, String vision, String objectives, String policies, String orgChartLink, String phone, String mainEmail, String address, String mapLocation, int id) {
        this.name = name;
        this.mission = mission;
        this.vision = vision;
        this.objectives = objectives;
        this.policies = policies;
        this.orgChartLink = orgChartLink;
        this.phone = phone;
        this.mainEmail = mainEmail;
        this.address = address;
        this.mapLocation = mapLocation;
        this.id = id;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return this.name;
    }
    
    public void setMission(String mission) {
        this.mission = mission;
    }
    public String getMission() {
        return this.mission;
    }
    
    public void setVision(String vision) {
        this.vision = vision;
    }
    public String getVision() {
        return this.vision;
    }
    
    public void setObjectives(String objectives) {
        this.objectives = objectives;
    }
    public String getObjectives() {
        return this.objectives;
    }
    
    public void setPolicies(String policies) {
        this.policies = policies;
    }
    public String getPolicies() {
        return this.policies;
    }
    
    public void setOrgChartLink(String orgChartLink) {
        this.orgChartLink = orgChartLink;
    }
    public String getOrgChartLink() {
        return this.orgChartLink;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getPhone() {
        return this.phone;
    }
    
    public void setMainEmail(String mainEmail) {
        this.mainEmail = mainEmail;
    }
    public String getMainEmail() {
        return this.mainEmail;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setMapLocation(String mapLocation) {
        this.mapLocation = mapLocation;
    }
    public String getMapLocation() {
        return this.mapLocation;
    }
}
