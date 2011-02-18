require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Requesting" do
  describe "/" do
    it "should display 'blue'" do
      get "/"
      last_response.should be_ok
      r = last_response.body
      r.should == "blue"
    end
  end

  describe "/ssltest" do
    it "should work" do
      get "/ssltest"
      last_response.should be_ok
      r = last_response.body
      r.should == "If you can read this, SSL works!"
    end
  end

  describe "/pemtest" do
    it "should work" do
      get "/pemtest"
      last_response.should be_ok
      r = last_response.body
      r.should =~ /sha1WithRSAEncryption/
    end
  end

end
