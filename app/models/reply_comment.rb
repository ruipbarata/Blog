# == Schema Information
#
# Table name: reply_comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :bigint           not null
#  comment_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ReplyComment < ApplicationRecord

  belongs_to :user
  belongs_to :comment

  has_rich_text :body
  validates :body, presence: true

end
