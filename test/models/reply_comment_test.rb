# == Schema Information
#
# Table name: reply_comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  comment_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ReplyCommentTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password,
      username: Faker::Internet.unique.username[1..10]
    )

    @article = Article.new(
      title: Faker::Lorem.unique.sentence,
      text: Faker::Lorem.paragraphs(number: 2),
      is_published: true,
      user: @user_with_username
    )

    @comment = Comment.new(
      body: Faker::Lorem.unique.sentence,
      article: @published_article,
      user: @user_with_username
    )

    @reply = ReplyComment.new(
      body: Faker::Lorem.unique.sentence,
      comment: @comment,
      user: @user
    )
  end

  test "valid reply" do
    assert @reply.valid?
  end

  test "should hava a body" do
    reply = ReplyComment.new
    reply.comment = @comment
    reply.user = @user
    assert_not reply.valid?
  end

  test "should belongs to a comment" do
    reply = ReplyComment.new
    reply.body = Faker::Lorem.unique.sentence,
                 reply.user = @user
    assert_not reply.valid?
  end

  test "should belongs to a user" do
    reply = ReplyComment.new
    reply.body = Faker::Lorem.unique.sentence,
                 reply.comment = @comment
    assert_not reply.valid?
  end

end
