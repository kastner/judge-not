require File.dirname(__FILE__) + '/../test_helper'
require 'judges_controller'

# Re-raise errors caught by the controller.
class JudgesController; def rescue_action(e) raise e end; end

class JudgesControllerTest < ActionController::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :judges

  def test_should_allow_signup
    assert_difference 'Judge.count' do
      create_judge
      assert_response :redirect
    end
  end

  def test_should_require_username_on_signup
    assert_no_difference 'Judge.count' do
      create_judge(:username => nil)
      assert assigns(:judge).errors.on(:username)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference 'Judge.count' do
      create_judge(:password => nil)
      assert assigns(:judge).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'Judge.count' do
      create_judge(:password_confirmation => nil)
      assert assigns(:judge).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'Judge.count' do
      create_judge(:email => nil)
      assert assigns(:judge).errors.on(:email)
      assert_response :success
    end
  end

  protected
    def create_judge(options = {})
      post :create, :judge => { :username => 'quire', :email => 'quire@example.com',
        :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
    end
end
