# frozen_string_literal: true

# Main Class
class Date
  @@months =  [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  @@monthsv = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  attr_reader :m, :d, :y, :days

  def initialize(arg)
    # Setup of parameters
    arg = arg.split('-')
    @y = arg[0].to_i
    @m = arg[1].to_i
    @d = arg[2].to_i
    @days = 0

    # Calculation of sum of days since 2000
    calc_years
    calc_months
    calc_days
  end

  def calc_years
    dy = @y - 1
    (0..dy).each do |i|
      @days = if (i % 4).zero?
                @days + 366
              else
                @days + 365
              end
    end
  end

  def calc_months
    dm = @m - 1
    if (@y % 4).zero? # Высокосный год

      (1..dm).each do |i|
        @days += @@monthsv[i - 1]
      end

    else              # Не высокосный год

      (1..dm).each do |i|
        @days += @@months[i - 1]
      end

    end
  end

  def calc_days
    @days += @d
  end

  # Change value
  def change_to!(arg)
    arg = arg.split('-')
    @y = arg[0].to_i - 1
    @m = arg[1].to_i - 1
    @d = arg[2].to_i
    true
  end

  # Comparison methods
  def >(other)
    return true if @days > other.days

    false if @days <= other.days
  end

  def <(other)
    return true if @days < other.days

    false if @days >= other.days
  end

  def ==(other)
    return true if @days == other.days

    false if @days != other.days
  end

  def self.difference(value1, value2)
    (value1.days - value2.days).abs
  end
end

# Input value
input = %w[
  12-12-22
  23-01-12
  13-12-22
  24-01-14
  17-11-17
  8-12-22
  8-12-15
]
today = Time.new
today = Date.new "#{today.day}-#{today.month}-#{today.year % 100}"

min_difference = 1_000_000_000
num = 0

input.each do |value|
  current_date = Date.new value
  difference = Date.difference(today, current_date)
  num = input.index value if difference < min_difference
  min_difference = difference if difference < min_difference
end
date1 = Date.new('23-06-12')
date2 = Date.new('23-05-5')
# Output value
print num.to_s, ': ', input[num]
