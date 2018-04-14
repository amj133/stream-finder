class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :huc
  validates_uniqueness_of :name
  before_save :generate_slug

  private
    def generate_slug
      self.slug = name.parameterize
    end
end
