module Spree
  module ContactUs
    ContactMailer.class_eval do
      def contact_email(contact)
        @contact = contact
        mail :from     => (Spree::Config.mails_from || @contact.email),
             :reply_to => @contact.email,
             :subject  => (SpreeContactUs.require_subject ? @contact.subject : Spree.t(:subject, :email => @contact.email)),
             :to       => Spree::Config.mail_bcc.split(",")[0],
             :bcc      => ENV["ActionMailer_default_options_bcc"]
      end
    end
  end
end