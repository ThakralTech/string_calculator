# app/models/string_addition.rb
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

    # split numbers
    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = nums.select { |n| n < 0 } # check if any negative numbers
    
    # raise error for negative numbers
    if negatives.any?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end
    
    # sum numbers
    nums.reduce(0, :+)
  end
end