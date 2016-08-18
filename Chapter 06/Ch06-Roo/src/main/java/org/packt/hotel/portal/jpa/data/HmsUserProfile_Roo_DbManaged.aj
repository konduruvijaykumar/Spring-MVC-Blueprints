// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.packt.hotel.portal.jpa.data;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import org.packt.hotel.portal.jpa.data.HmsLogin;
import org.packt.hotel.portal.jpa.data.HmsRoomBooking;
import org.packt.hotel.portal.jpa.data.HmsUserProfile;

privileged aspect HmsUserProfile_Roo_DbManaged {
    
    @OneToOne
    @JoinColumn(name = "id", nullable = false, insertable = false, updatable = false)
    private HmsLogin HmsUserProfile.hmsLogin;
    
    @OneToMany(mappedBy = "profileId")
    private Set<HmsRoomBooking> HmsUserProfile.hmsRoomBookings;
    
    @Column(name = "firstName", length = 45)
    @NotNull
    private String HmsUserProfile.firstName;
    
    @Column(name = "lastName", length = 45)
    @NotNull
    private String HmsUserProfile.lastName;
    
    @Column(name = "address", length = 45)
    @NotNull
    private String HmsUserProfile.address;
    
    @Column(name = "mobile", length = 45)
    @NotNull
    private String HmsUserProfile.mobile;
    
    @Column(name = "email", length = 45)
    @NotNull
    private String HmsUserProfile.email;
    
    public HmsLogin HmsUserProfile.getHmsLogin() {
        return hmsLogin;
    }
    
    public void HmsUserProfile.setHmsLogin(HmsLogin hmsLogin) {
        this.hmsLogin = hmsLogin;
    }
    
    public Set<HmsRoomBooking> HmsUserProfile.getHmsRoomBookings() {
        return hmsRoomBookings;
    }
    
    public void HmsUserProfile.setHmsRoomBookings(Set<HmsRoomBooking> hmsRoomBookings) {
        this.hmsRoomBookings = hmsRoomBookings;
    }
    
    public String HmsUserProfile.getFirstName() {
        return firstName;
    }
    
    public void HmsUserProfile.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String HmsUserProfile.getLastName() {
        return lastName;
    }
    
    public void HmsUserProfile.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String HmsUserProfile.getAddress() {
        return address;
    }
    
    public void HmsUserProfile.setAddress(String address) {
        this.address = address;
    }
    
    public String HmsUserProfile.getMobile() {
        return mobile;
    }
    
    public void HmsUserProfile.setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    public String HmsUserProfile.getEmail() {
        return email;
    }
    
    public void HmsUserProfile.setEmail(String email) {
        this.email = email;
    }
    
}