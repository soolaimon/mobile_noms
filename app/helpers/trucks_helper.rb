module TrucksHelper
 # Ruby logic. Yeah!
  def self.times
    times = []
    [*7..11].each {|i| times << "#{i}:00 am" << "#{i}:30 am"}

    times << "12:00 pm" << "12:30 pm"

    [*1..11].each {|i| times << "#{i}:00 pm" << "#{i}:30 pm"}

    times << "12:00 am" << "12:30 am"

    [*1..6].each {|i| times << "#{i}:00 am" << "#{i}:30 am"}

    times << 'Closed'

    times
  end

end
