# app/models/string_calculator.rb
class StringAddition
  def add(numbers)
    return 0 if numbers.empty? # returns 0

    # to handle seperate commas in input numbers
    delimiter = /[\n,]/
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1]
    end

    # sum for numbers
    numbers.split(/#{delimiter}/).map(&:to_i).reduce(0, :+)
  end
end