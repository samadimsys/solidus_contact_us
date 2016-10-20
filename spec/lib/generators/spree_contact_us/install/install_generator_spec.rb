require 'spec_helper'
require 'generator_spec/test_case'
require 'generators/solidus_contact_us/install/install_generator'

describe SolidusContactUs::Generators::InstallGenerator do

  include GeneratorSpec::TestCase
  destination File.expand_path("../../../../../dummy", __FILE__)

  before do
    run_generator
  end

  it "creates initializer file" do
    assert_file "config/initializers/solidus_contact_us.rb"
  end

end
