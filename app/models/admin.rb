class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    e_admin = EligibleAdmin.find_by(email: email)
    if e_admin == nil
      return nil
    end
    return nil unless email =~ /@tamu.edu\z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
