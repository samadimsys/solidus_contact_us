class Spree::ContactUs::ContactsController < Spree::StoreController

  helper "spree/products"
  def create
    puts "ContactUs => " + "create"
    @contact = Spree::ContactUs::Contact.new(params[:contact_us_contact])
    status = verify_recaptcha(:model => @post, :message => "Oh! It's error with reCAPTCHA!")
    if status && @contact.save
      if Spree::ContactUs::Config.contact_tracking_message.present?
        flash[:contact_tracking] = Spree::ContactUs::Config.contact_tracking_message
      end
      redirect_to(spree.root_path, :notice => Spree.t('contact_us.notices.success'))
    else
      render :new
    end
  end

  def new
    # puts "ContactUs => " + "new => " + params[:contact_type]
    _type_contact = :type_normal
    if params[:contact_type].present?
      _type_contact = params[:contact_type]
    end
    @contact = Spree::ContactUs::Contact.new
    @contact.contact_type = _type_contact
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

  private

  def accurate_title
    Spree.t(:contact_us_title)
  end

end
