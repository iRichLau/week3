class Leap
  attr_accessor :start_year, :end_year

  def initialize(start_year, end_year)
    @start_year = start_year
    @end_year = end_year
  end

  def leap_years
    years = *start_year..end_year

    years.select do |year|
      if (year % 4 == 0)
        year if (year % 100 != 0 || (year % 400 == 0))
      end
    end
  end

end

puts Leap.new(1900, 2000).leap_years
