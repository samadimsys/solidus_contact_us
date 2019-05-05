module Spree
  module ContactUs
    class Contact
      # enum contact_type: [:contact_normal, :contact_business, :contact_corporate]
      include ActiveModel::Conversion
      include ActiveModel::Validations

      attr_accessor :email, :message, :name, :subject, :phone, :contact_type, :company_name, :web_site, :billing_address, :shipping_address, :interested_products, :reason

      EMAIL_REGEX = /\A
        [^\s@]+ # non-at-sign characters, at least one
          @     # at-sign
        [^\s.@] # non-at-sign and non-period character
        [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
         \.     # period
        [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
        [^\s.@] # non-at-sign and non-period character
      \z/x

      validates :email,   :format => { :with => EMAIL_REGEX },
                          :presence => true
      validates :message, :presence => true
      validates :name,    :presence => {:if => Proc.new{SolidusContactUs.require_name}}
      validates :subject, :presence => {:if => Proc.new{SolidusContactUs.require_subject}}

      def initialize(attributes = {})
        [:email, :message, :name, :subject, :phone, :contact_type, :company_name, :web_site, :billing_address, :shipping_address, :interested_products, :reason].each do |attribute|
          self.send("#{attribute}=", attributes[attribute]) if attributes and attributes.has_key?(attribute)
        end
      end

      def save
        if self.valid?
          Spree::ContactUs::ContactMailer.contact_email(self).deliver
          return true
        end
        return false
      end

      def persisted?
        false
      end

    end
  end
end