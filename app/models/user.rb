class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates_confirmation_of :password, on: :create
  validates :name, :email, presence: true, uniqueness: true
  before_create :generate_slug

  private
    def generate_slug
      self.slug = name.parameterize unless name.nil? # only for testing validations
    end
end
