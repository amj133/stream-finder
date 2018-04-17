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
      x = self.where("huc = ? AND type_of = ?", huc, type)
      binding.pry
    elsif huc
      by_huc(huc)
    elsif type
      by_type(type)
    end
    # Client.where("orders_count = ? AND locked = ?", params[:orders], false)

    # Client.where("created_at >= :start_date AND created_at <= :end_date",
    #   {start_date: params[:start_date], end_date: params[:end_date]})
  end
end
