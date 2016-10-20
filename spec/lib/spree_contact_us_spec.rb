require 'spec_helper'

describe SpreeContactUs do

  after do
    # Reset to defaults.
    SolidusContactUs.mailer_from     = nil
    SolidusContactUs.mailer_to       = 'contact@please-change-me.com'
    SolidusContactUs.require_name    = false
    SolidusContactUs.require_subject = false
  end

  it "should be valid" do
    SolidusContactUs.should be_a(Module)
  end

  describe 'setup block' do
    it 'should yield self' do
      SolidusContactUs.setup do |config|
        SolidusContactUs.should eql(config)
      end
    end
  end

  describe 'mailer_from' do
    it 'should be configurable' do
      SolidusContactUs.mailer_from = "contact@please-change-me.com"
      SolidusContactUs.mailer_from.should eql("contact@please-change-me.com")
    end
  end

  describe 'mailer_to' do
    it 'should be configurable' do
      SolidusContactUs.mailer_to = "contact@changed-me.com"
      SolidusContactUs.mailer_to.should eql("contact@changed-me.com")
    end
  end

  describe 'require_name' do
    it 'should be configurable' do
      SolidusContactUs.require_name = true
      SolidusContactUs.require_name.should eql(true)
    end
  end

  describe 'require_subject' do
    it 'should be configurable' do
      SolidusContactUs.require_subject = true
      SolidusContactUs.require_subject.should eql(true)
    end
  end

end
