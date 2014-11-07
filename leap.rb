class Leap
  attr_accessor :start_year, :end_year
  def initialize(start_year, end_year)
    @start_year = start_year
    @end_year = end_year
    determine_leap
  end

  def determine_leap
    years = (start_year..end_year).to_a
    result = []

    years.each do |year|
      if (year % 4 == 0)
        if (year % 100 != 0 || (year % 400 == 0))
          result << year
        end
      end
    end
    puts result
  end

end

Leap.new(1900, 2000)
