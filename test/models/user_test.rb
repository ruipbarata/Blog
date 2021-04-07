# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  email                :string           default(""), not null
#  encrypted_password   :string           default(""), not null
#  remember_created_at  :datetime
#  confirmation_token   :string
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  username             :string
#  avatar               :string
#  unconfirmed_email    :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: Faker::Internet.unique.email, password: Faker::Internet.password)
    @user_with_username = User.new(email: Faker::Internet.unique.email, password: Faker::Internet.password)
  end

  test "valid user without name" do
    assert @user.valid?
  end

  test "valid user with name" do
    @user.username = "user"
    assert @user.valid?
  end

  test "valid user with blank username" do
    @user.username = "    "
    assert @user.valid?
  end

  test "invalid username length" do
    @user.username = "ab"
    assert_not @user.valid?, "Username must have 3 characters"
  end

  test "invalid username format with only numbers" do
    @user.username = "1234"
    assert_not @user.valid?, "Username must only contain characters"
  end

  test "invalid username format with characters and numbers" do
    @user.username = "abc1234"
    assert_not @user.valid?, "Username must only contain characters"
  end

  # test 'invalid username: uniqueness' do
  #   byebug
  #   @user.username = Faker::Internet.unique.username
  #   @user_with_username.username = @user.username
  #   assert_not user_with_username.valid?
  # end

end
