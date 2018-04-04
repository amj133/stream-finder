class User < ApplicationRecord
  has_secure_password validations: false
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  before_create :generate_slug
  # validates :password, presence: true
  # validates_confirmation_of :password, on: :create

  def self.create_or_update(auth_info)
    user = User.find_by_uid(auth_info[:uid]) || User.new
    user.uid = auth_info[:uid]
    user.email = auth_info[:info][:email]
    user.first_name = auth_info[:info][:first_name]
    user.last_name = auth_info[:info][:last_name]
    user.token = auth_info[:credentials][:token]
    user.save!
    user
  end

  private
    def generate_slug
      self.slug = email.split("@")[0].parameterize unless email.nil?
    end
end
