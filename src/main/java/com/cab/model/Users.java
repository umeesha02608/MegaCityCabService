package com.cab.model;

public class Users {
    private int id;
    private String registrationId;
    private String name;
    private String address;
    private String nic;
    private String username;
    private String password;
    private String role;

    public Users() {}

    public Users(String registrationId, String name, String address, String nic, String username, String password, String role) {
        this.setRegistrationId(registrationId);
        this.setName(name);
        this.setAddress(address);
        this.setNic(nic);
        this.setUsername(username);
        this.setPassword(password);
        this.setRole(role);
    }

	public int getId() {return id;}
    public void setId(int id) {this.id = id;}

	public String getRegistrationId() {return registrationId;}
	public void setRegistrationId(String registrationId) {this.registrationId = registrationId;}

	public String getName() {return name;}
	public void setName(String name) {this.name = name;}

	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}

	public String getNic() {return nic;}
	public void setNic(String nic) {this.nic = nic;}

	public String getUsername() {return username;}
	public void setUsername(String username) {this.username = username;}

	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}

	public String getRole() {return role;}
	public void setRole(String role) {this.role = role;}
	

}
