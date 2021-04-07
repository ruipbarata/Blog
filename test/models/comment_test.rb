# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  article_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password
    )

    @user_with_username = User.new(
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password,
      username: Faker::Internet.unique.username
    )

    @draft_article = Article.new(
      title: Faker::Lorem.unique.sentence,
      is_published: false,
      user: @user
    )

    @published_article = Article.new(
      title: Faker::Lorem.unique.sentence,
      text: Faker::Lorem.paragraphs(number: 2),
      is_published: true,
      user: @user_with_username
    )

    @good_comment = Comment.new(
      body: Faker::Lorem.unique.sentence,
      article: @published_article,
      user: @user_with_username
    )
  end

  test "valid comment" do
    assert @good_comment.valid?
  end

  test "should hava a body" do
    comment = Comment.new
    comment.article = @published_article
    comment.user = @user_with_username
    assert_not comment.valid?
  end

  test "should belongs to an article" do
    comment = Comment.new
    comment.body = Faker::Lorem.unique.sentence,
                   comment.user = @user_with_username
    assert_not comment.valid?
  end

  test "should belongs to a user" do
    comment = Comment.new
    comment.body = Faker::Lorem.unique.sentence,
                   comment.article = @published_article
    assert_not comment.valid?
  end

end
