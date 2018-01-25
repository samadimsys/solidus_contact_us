class Spree::ContactUs::ContactMailer < Spree::BaseMailer
   def contact_email(contact)
		@contact = contact
		mail :from     => (Spree::Config.mails_from || @contact.email),
		     :reply_to => @contact.email,
		     :subject  => (SolidusContactUs.require_subject ? @contact.subject : Spree.t(:subject, :email => @contact.email)),
		     :to       => SolidusContactUs.mailer_to,
		     :bcc      => SolidusContactUs.mailer_bcc
	end
end
