class User < ApplicationRecord
  has_many :user_contacts
  has_many :contacts, through: :user_contacts

end
