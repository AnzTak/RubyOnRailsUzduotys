class User < ActiveRecord::Base
  has_many :rezervuotis
  has_one :user_contact
  validates :name, presence: true
end