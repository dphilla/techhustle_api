class User < ApplicationRecord
  has_many :user_contacts
  has_many :contacts, through: :user_contacts


  def self.login_from_linked_in(oauth_info)
   uid = oauth_info["id"]
   picture = oauth_info["pictureUrl"]
   title = oauth_info["positions"]["values"][0]["title"]
   org = oauth_info["positions"]["values"][0]["company"]["name"]
   summary = oauth_info["summary"]


   where(oauth_id: uid).first_or_create do |new_user|
     new_user.uid = uid
     new_user.picture_url = picture
     new_user.title = title
     new_user.organization = org
     new_user.summary = summary
   end
  end
end
