require 'spec_helper'

describe DashboardController do
	login_user

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end