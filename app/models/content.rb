class Content < ApplicationRecord

  belongs_to :title
  belongs_to :user

  validates :title_id, :content, :user_id, presence: true

end
