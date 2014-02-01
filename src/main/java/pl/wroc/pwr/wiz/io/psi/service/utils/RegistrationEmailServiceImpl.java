package pl.wroc.pwr.wiz.io.psi.service.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class RegistrationEmailServiceImpl implements RegistrationEmailService {

  @Autowired
  private MailSender mailTemplate;

  private static final Logger LOGGER = LoggerFactory.getLogger(RegistrationEmailServiceImpl.class);

  @Autowired
  private SimpleMailMessage templateMessage;

  public void sendMessage(String mailTo, Long registrationId) {
    LOGGER.info("Preparing registration email id {} to {}", registrationId, mailTo);
    SimpleMailMessage mailMessage = new org.springframework.mail.SimpleMailMessage(templateMessage);
    mailMessage.setTo(mailTo);
    try {
      mailMessage.setText(createRegistrationEmailMessage(registrationId));
      mailTemplate.send(mailMessage);
      LOGGER.info("Sent successfully email id {} to {}", registrationId, mailTo);
    } catch (UnknownHostException e) {
      LOGGER.error("Failed to create a registration for ID: {}", registrationId);
    }
  }

  private String createRegistrationEmailMessage(Long registrationId) throws UnknownHostException {
    StringBuilder message = new StringBuilder();
    message
        .append("Hello!\n\nWelcome to eSothebys! This email was sent to you because someone used this email in registration process. If it is a mistake, please ignore.");
    message.append("\nTo complete registration click following link: ");
    // TODO: amend host address !
    message.append(InetAddress.getLocalHost().toString());
    message.append("/eSothebys/registration/");
    message.append(registrationId);
    message.append("\n\nEnjoy!\nAdministration eSothebys");
    return message.toString();
  }
}
