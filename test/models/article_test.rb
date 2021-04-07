# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  title        :string
#  text         :text
#  is_published :boolean
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  banner       :string
#
require "test_helper"

class ArticleTest < ActiveSupport::TestCase

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
  end

  test "valid draft article" do
    assert @draft_article.valid?
  end

  test "should not save article without title" do
    article = Article.new
    article.is_published = false
    article.user = @user_with_username
    assert_not article.valid?
  end

  test "should not save an article with a title.length < 5" do
    article = Article.new
    article.title = "qwer"
    article.is_published = false
    article.user = @user_with_username
    assert_not article.valid?
  end

  test "valid published article" do
    assert @published_article.valid?
  end

  test "should not publish an article without an username" do
    article = Article.new
    article.title = "qwerty"
    article.text = "qwertyuiop"
    article.is_published = true
    article.user = @user
    assert_not article.valid?
  end

  test "should not publish an article without text" do
    article = Article.new
    article.title = "qwerty"
    article.is_published = true
    article.user = @user_with_username
    assert_not article.valid?
  end

  test "should not publish an article without title" do
    article = Article.new
    article.text = "qwertyuiop"
    article.is_published = true
    article.user = @user_with_username
    assert_not article.valid?
  end

  test "should not publish an article without title and text" do
    article = Article.new
    article.id = 1
    article.is_published = true
    article.user = @user_with_username
    assert_not article.valid?
  end

end
