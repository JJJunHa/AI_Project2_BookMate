/*
 * package com.human.springboot.FindIdController;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.mail.MailException; import
 * org.springframework.mail.SimpleMailMessage; import
 * org.springframework.mail.javamail.JavaMailSender; import
 * org.springframework.stereotype.Service;
 * 
 * @Service public class EmailService {
 * 
 * private final JavaMailSender javaMailSender;
 * 
 * @Autowired public EmailService(JavaMailSender javaMailSender) {
 * this.javaMailSender = javaMailSender; }
 * 
 * public void sendEmail(String recipient, String subject, String content)
 * throws MailException { SimpleMailMessage message = new SimpleMailMessage();
 * message.setTo(recipient); message.setSubject(subject);
 * message.setText(content);
 * 
 * javaMailSender.send(message); } }
 */