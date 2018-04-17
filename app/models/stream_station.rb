class StreamStation < ApplicationRecord

  def self.by_huc(huc)
    where(huc: huc)
  end

  def self.by_id(id)
    find_by(org_id: id)
  end

  def self.by_type(type)
    where(type_of: type)
  end

  def self.map_search(search_params)
    huc = search_params["huc"]
    type = search_params["siteType"]
    if huc && type
      where("huc = ? AND type_of = ?", huc, type)
    elsif huc
      by_huc(huc)
    elsif type
      by_type(type)
    end
  end
end
