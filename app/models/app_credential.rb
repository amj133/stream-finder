class AppCredential < ApplicationRecord
  belongs_to :user
  has_secure_password
end
