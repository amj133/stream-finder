class Project < ApplicationRecord
  belongs_to :user
  has_many :favorite_station_projects, dependent: :destroy
  has_many :favorite_stations, through: :favorite_station_projects

  has_many :stream_station_projects
  has_many :stream_stations, through: :stream_station_projects


  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:user], :message => "Desired name has already been taken"
  validates :huc, presence: true, format: { with: /\A\d{8}\z/, message: "HUC must be exactly 8 digits long"}
  before_save :generate_slug

  def to_param
    slug
  end

  private
    def generate_slug
      self.slug = name.parameterize unless name.nil?
    end
end
