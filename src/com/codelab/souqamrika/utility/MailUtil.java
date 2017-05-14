package com.codelab.souqamrika.utility;

import java.util.Properties;
import java.util.ResourceBundle;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	
	static ResourceBundle mailbundle = ResourceBundle.getBundle("config/Mail");

	public void sendMail(String mailTo, String subject, String mailBody){
		
		if(mailTo==null || ("").equals(mailTo) || subject==null || ("").equals(subject) || mailBody==null || ("").equals(mailBody)){
			throw new IllegalArgumentException();
		}
		
		final String username = mailbundle.getString("mail.username");
		final String password = mailbundle.getString("mail.password");
		final String mailFrom = mailbundle.getString("mail.from");
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", mailbundle.getString("mail.host"));
		props.put("mail.smtp.port", mailbundle.getString("mail.port"));

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mailFrom));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(mailTo));
			message.setSubject(subject);
			message.setContent(mailBody, "text/html; charset=utf-8");
			Transport.send(message);
			
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
