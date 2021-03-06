# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: {message: "Password cannot be blank"}
    validates :session_token, presence: true, uniqueness: true

    

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        # SecureRandom::UrlSafeBase64
        self.session_token = User.generate_session_token
        self.save!
        return self.session_token
    end

    def password=(pass)
        @password = pass
        self.password_digest = BCrypt::Password.create(pass)
    end

    def is_password?(pass) 
        self.password_digest == BCrypt::Password.create(pass)
    end

    def self.find_by_credentials(user, pass)
        user = User.find_by(user_name: user)
        if user && is_password?(pass)
            return user
        else
            return nil
        end
    end
end
