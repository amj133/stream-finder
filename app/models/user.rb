class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  before_create do
    self.slug = name.parameterize
  end
end
