package loop.mail.service;

public interface IEmailSenderService {

	void sendEmail(String toEmail, String subject, String body);

}