class Homey < ApplicationRecord
  audited only: :status

  belongs_to :user

  enum status: { open: 0, closed: 1 }
  validates :status, presence: true

  has_many :comments, as: :commentable

end
