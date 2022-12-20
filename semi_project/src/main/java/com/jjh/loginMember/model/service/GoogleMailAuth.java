package com.jjh.loginMember.model.service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleMailAuth extends Authenticator {
	 PasswordAuthentication pa;
	    
	    public GoogleMailAuth() {
	        String mail_id = "kjjk0371@gmail.com";
	        String mail_pw = "lokxeblmgockoims";
	        
	        pa = new PasswordAuthentication(mail_id, mail_pw);
	    }
	    
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }

}
