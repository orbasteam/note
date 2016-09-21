class Title < ApplicationRecord

  acts_as_list

  belongs_to :user
  has_many :contents

  default_scope -> { order(:position) }

  scope :by_user, ->(user_id)  { where(user_id: user_id) }

  validates :name, :user_id, presence: true
end
