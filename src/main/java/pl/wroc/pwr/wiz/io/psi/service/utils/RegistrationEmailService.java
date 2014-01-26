package pl.wroc.pwr.wiz.io.psi.service.utils;

public interface RegistrationEmailService {
	
	void sendMessage(String mailTo, Long registrationId);
}
