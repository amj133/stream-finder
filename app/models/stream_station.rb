class StreamStation < ApplicationRecord

  def self.by_huc(huc)
    where(huc: huc)
  end

  def self.by_id(id)
    find_by(org_id: id)
  end
end
