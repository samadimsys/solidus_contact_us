module SolidusContactUs
  module Generators
    class InstallGenerator < Rails::Generators::Base

      argument :file_name, :type => :string, :desc => 'rails app_path', :default => '.'
      source_root File.expand_path('../../templates', __FILE__)

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_contact_us\n"
      end

      def copy_initializer_file
        template 'solidus_contact_us.rb', "#{file_name}/config/initializers/solidus_contact_us.rb"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', "*= require spree/frontend/spree_tobe_contact_us\n", :before => /\*\//, :verbose => true
      end

      def copy_recaptcha_file
        copy_file "config/initializers/recaptcha.rb", "config/initializers/recaptcha.rb"
      end
			
    end
  end
end
