class FrequentLocation < ActiveRecord::Base

  belongs_to :truck

  def address
    "#{street_address} #{street_address2} #{city}, #{state} #{zip}".titleize
  end

end
