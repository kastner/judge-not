require File.dirname(__FILE__) + '/../test_helper'

class JudgeTest < ActiveSupport::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :judges

  def test_should_create_judge
    assert_difference 'Judge.count' do
      judge = create_judge
      assert !judge.new_record?, "#{judge.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_username
    assert_no_difference 'Judge.count' do
      u = create_judge(:username => nil)
      assert u.errors.on(:username)
    end
  end

  def test_should_require_password
    assert_no_difference 'Judge.count' do
      u = create_judge(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference 'Judge.count' do
      u = create_judge(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference 'Judge.count' do
      u = create_judge(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    judges(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal judges(:quentin), Judge.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    judges(:quentin).update_attributes(:username => 'quentin2')
    assert_equal judges(:quentin), Judge.authenticate('quentin2', 'monkey')
  end

  def test_should_authenticate_judge
    assert_equal judges(:quentin), Judge.authenticate('quentin', 'monkey')
  end

  def test_should_set_remember_token
    judges(:quentin).remember_me
    assert_not_nil judges(:quentin).remember_token
    assert_not_nil judges(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    judges(:quentin).remember_me
    assert_not_nil judges(:quentin).remember_token
    judges(:quentin).forget_me
    assert_nil judges(:quentin).remember_token
  end

  def test_should_remember_me_for_one_week
    before = 1.week.from_now.utc
    judges(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil judges(:quentin).remember_token
    assert_not_nil judges(:quentin).remember_token_expires_at
    assert judges(:quentin).remember_token_expires_at.between?(before, after)
  end

  def test_should_remember_me_until_one_week
    time = 1.week.from_now.utc
    judges(:quentin).remember_me_until time
    assert_not_nil judges(:quentin).remember_token
    assert_not_nil judges(:quentin).remember_token_expires_at
    assert_equal judges(:quentin).remember_token_expires_at, time
  end

  def test_should_remember_me_default_two_weeks
    before = 2.weeks.from_now.utc
    judges(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil judges(:quentin).remember_token
    assert_not_nil judges(:quentin).remember_token_expires_at
    assert judges(:quentin).remember_token_expires_at.between?(before, after)
  end

  describe "A judge with an existing ballot" do
    before do
      @judge = judges(:quentin)
    end
    
    it "should not create a ballot if one exists" do
      assert_no_difference 'Ballot.count' do
        @judge.ballot_for_round(rounds(:round_zero))
      end
    end
    
    it "should return the ballot if it's already there" do
      @judge.ballots.should include(@judge.ballot_for_round(rounds(:round_zero)))
    end

    it "should create a ballot if they don't have one supplied round" do
      assert_difference 'Ballot.count' do
        @judge.ballot_for_round(rounds(:round_one))
      end
    end    
  end
  
  
  describe "The Judges" do
    # before do
    #   # clear out existing
    #   Judge.destroy_all
    #   create_judge
    #   create_judge({:username => "bob", :email => "bob2@2.com"})
    # end

    # DOESN'T WORK. :(
    # it "should have an admin user" do
    #   Judge.find(:all, :conditions => {:admin => true}).size.should be(1)
    # end
  end
  
protected
  def create_judge(options = {})
    record = Judge.new({ :username => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
    record.save
    record
  end
end
