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
class Comment < ApplicationRecord

  belongs_to :article
  belongs_to :user
  has_rich_text :body
  has_many :reply_comments, dependent: :destroy
  validates :body, presence: true

end
