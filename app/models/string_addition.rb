# app/models/string_calculator.rb
class StringAddition
  def add(numbers)
    return 0 if numbers.empty? # returns 0

    # sum for numbers
    numbers.split(/[\n,]/).map(&:to_i).reduce(0, :+)
  end
end