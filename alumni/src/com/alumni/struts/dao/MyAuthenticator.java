package com.alumni.struts.dao;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;





public class MyAuthenticator extends Authenticator {
String username=null;
String password=null;
public MyAuthenticator(String username, String password) {

	this.username = username;
	this.password = password;
}
public MyAuthenticator() {
	
}
protected PasswordAuthentication getPasswordAuthentication(){   
	System.out .print(username);
	System.out.print(password);
    return new PasswordAuthentication(username, password);   
} 

}
