class User < ApplicationRecord
  has_one :app_credential
  has_one :google_credential
  has_many :projects

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  before_save :generate_slug

  def self.create_or_update(auth_info)
    user = User.find_by_email(auth_info[:info][:email]) || User.new
    user.email = auth_info[:info][:email]
    user.first_name = auth_info[:info][:first_name]
    user.last_name = auth_info[:info][:last_name]

    google_credential = user.google_credential || GoogleCredential.new
    google_credential.uid = auth_info[:uid]
    google_credential.token = auth_info[:credentials][:token]
    google_credential.refresh_token = auth_info[:credentials][:refresh_token] unless auth_info[:credentials][:refresh_token].nil?
    google_credential.expires_at = auth_info[:credentials][:expires_at]

    user.google_credential = google_credential
    user.save!
    user
  end

  private
    def generate_slug
      self.slug = email.split("@")[0].parameterize unless email.nil?
    end
end
