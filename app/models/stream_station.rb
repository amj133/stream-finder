class StreamStation < ApplicationRecord

  def self.by_huc(huc)
    where(huc: huc)
  end
end
