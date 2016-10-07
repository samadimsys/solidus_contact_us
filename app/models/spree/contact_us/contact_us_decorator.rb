Spree::ContactUs::Contact.class_eval do

  attr_accessor :email, :message, :name, :subject, :phone

  def initialize(attributes = {})
    [:email, :message, :name, :subject, :phone].each do |attribute|
      self.send("#{attribute}=", attributes[attribute]) if attributes and attributes.has_key?(attribute)
    end
  end

end