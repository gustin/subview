require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/revolution" do
  before(:each) do
    @response = request("/revolution")
  end
end