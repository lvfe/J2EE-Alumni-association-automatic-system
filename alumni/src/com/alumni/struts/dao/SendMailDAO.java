package com.alumni.struts.dao;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import com.alumni.struts.form.SendMailForm;

public class SendMailDAO {

	public int sendMail(SendMailForm s) {
		int ret = 0;
		String from = s.getAddresser();
		//String from="39604760@qq.com";
	String to = s.getAddressee();
	System.out.println("·to" + to);
		//String to="39604760@qq.com";
		String subject = s.getTitle();
		System.out.println("·subject" + subject);
		String content = s.getContent();
		System.out.println("·content" + content);
		String password = s.getPwd();
		System.out.println("·password" + s.getPwd());
		String path = s.getAdjunct();
		System.out.println("·path" + path);
		String toArr[]=to.split(",");
		try {
			String mailserver ="smtp."+to.substring(toArr[0].indexOf('@')+1,toArr[0].length());	
			System.out.println("·mailserver" + mailserver);
			//String mailserver ="smtp.qq.com";
			Properties prop = new Properties();
			prop.put("mail.smtp.host", mailserver);
			prop.put("mail.smtp.auth", "true");
			MyAuthenticator authen = null;
			authen = new MyAuthenticator(from,password);
			Session sess = Session.getDefaultInstance(prop,authen);
			sess.setDebug(true);
			MimeMessage message = new MimeMessage(sess);
			message.setFrom(new InternetAddress(from));	
			
			InternetAddress[] to_mail=new InternetAddress[toArr.length];
			for(int i=0;i<toArr.length;i++){
				to_mail[i]=new InternetAddress(toArr[i]);
			}
		    message.setRecipients(Message.RecipientType.TO,to_mail);
			message.setSubject(subject);
			Multipart mul = new MimeMultipart();
			BodyPart mdp = new MimeBodyPart(); 
			mdp.setContent(content, "text/html;charset=utf-8");
			mul.addBodyPart(mdp); 
			if(!path.equals("") && path!=null){	
				
				mdp = new MimeBodyPart(); 
				//String adjunctname = new String(path.getBytes("utf-8"), "ISO-8859-1"); 		
				path = (System.getProperty("java.io.tmpdir") + "/" + path).replace(
						"\\", "/");
				System.out.println("·path" + path);
				FileDataSource fds = new FileDataSource(path);
				DataHandler handler = new DataHandler(fds);
				mdp.setFileName(MimeUtility.encodeText(path,"utf-8",null));
				mdp.setDataHandler(handler);
				mul.addBodyPart(mdp);
			}
			message.setContent(mul); 
			message.saveChanges();
			Transport transport = sess.getTransport("smtp");
			transport.connect(mailserver, from, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			ret = 1;
		} catch (Exception e) {
			System.out.println("信息是" + e.getMessage());
			ret = 0;
		}
		return ret;
	}

}
