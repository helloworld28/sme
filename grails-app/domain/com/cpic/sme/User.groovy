package com.cpic.sme

class User {
	
	String userName;
	String email;
	String password;
	String role;
	Date dateCreated;
	Date lastUpdated;
    static constraints = {
		userName blank:false,unique:true
		password blank:false
    }
}
