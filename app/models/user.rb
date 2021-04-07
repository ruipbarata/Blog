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

class User < ApplicationRecord

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reply_comments, dependent: :destroy
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :confirmable

  validates :encrypted_password, :email, presence: true
  validates :username,  length: { in: 3..10 },
                        format: { with: /\A[a-zA-Z]+\z/ },
                        uniqueness: true,
                        if: -> { username.present? }
  before_validation :ensure_avatar_has_a_value

  private

    def ensure_avatar_has_a_value
      return if avatar.present?

      avatar.attach(
        io: File.open(
          Rails.root.join("app", "assets", "images", "fallback", "default-avatar.png")
        ),
        filename: "default-avatar.png",
        content_type: "image/png"
      )
    end

end
