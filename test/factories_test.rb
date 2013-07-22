require 'test_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      FactoryGirl.build(factory_name).valid?.must_equal true
    end
  end
end