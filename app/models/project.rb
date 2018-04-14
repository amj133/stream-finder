class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :huc
  validates_uniqueness_of :name
end
