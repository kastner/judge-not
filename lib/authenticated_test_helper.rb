module AuthenticatedTestHelper
  # Sets the current judge in the session from the judge fixtures.
  def login_as(judge)
    @request.session[:judge_id] = judge ? judges(judge).id : nil
  end

  def authorize_as(judge)
    @request.env["HTTP_AUTHORIZATION"] = judge ? ActionController::HttpAuthentication::Basic.encode_credentials(judges(judge).login, 'monkey') : nil
  end
  
end
