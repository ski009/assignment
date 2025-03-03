 require 'test/unit'

 def processing_string_to_add(input_sting)
    # Step 1: Extract delimiter from the first line
    delimiter_string = input_sting.split("\n").first
    delimiter = delimiter_string[2..-1]

    # Extract numbers from the remaining string, starting from the second line
    numbers_string = input_sting.split("\n")[1..].join

    # Split the numbers based on the delimiter
    numbers = numbers_string.split(delimiter).map(&:to_i)

    # Check for negative numbers and raise an exception if any are found
    negatives = numbers.select { |n| n < 0 }
    if negatives.any?
        raise "Negative numbers are not allowed: #{negatives.join(', ')}"
    end

    # Return the sum of the numbers
    numbers.sum
end

