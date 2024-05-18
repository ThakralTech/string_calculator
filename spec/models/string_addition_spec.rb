# spec/models/string_addition_spec.rb
require 'rails_helper'
require_relative '../../app/models/string_addition'


RSpec.describe StringAddition, type: :model do

	describe "add calculation method #method_name" do
		let (:calculator) {StringAddition.new}

		# return 0 case
		it 'will returnd 0 for an empty numbers or and empty string' do
			expect(calculator.add('')).to eq(0)
		end

		# return sum for single number
		it 'will return the single number if input is only single number' do
      expect(calculator.add('1')).to eq(1)
    end

    # return sum for two numbers
    it 'calculates the sum of two numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end

    # return sum for unknown numbers
    it 'calculates the sum of an unknown amount of numbers' do
      expect(calculator.add('1,2,3,4')).to eq(10)
    end

    # return sum for numbers with new lines
    it 'handles new lines between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    # return sum for numbers with different delimeters
    it 'supports different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    # exception case for negative numbers
    it 'raises an exception for negative numbers' do
      expect { calculator.add('1,-2') }.to raise_error('negatives not allowed: -2')
    end

    # exception for multiple nagetive numbers
    it 'raises an exception for multiple negative numbers' do
      expect { calculator.add('1,-2,-3') }.to raise_error('negatives not allowed: -2, -3')
    end

    # numbers which is larger then 1000
    it 'ignores numbers larger than 1000' do
      expect(calculator.add('2,1001')).to eq(2)
    end
	end
end