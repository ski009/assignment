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

class TestSuperDuperMethod < Test::Unit::TestCase
    def test_valid_input_with_custom_delimiter
        input_sting = "//;\n1;2;3;5\n"
        result = processing_string_to_add(input_sting)
        assert_equal(11, result, "The sum of the numbers should be 11")
    end

    def test_input_with_negative_number
        input_sting = "//;\n1;2;3;-4;5\n"
        assert_raises(RuntimeError, "Negative numbers are not allowed: -4") do
            processing_string_to_add(input_sting)
        end
    end

    def test_empty_input
        input_sting = "//;\n\n"
        result = processing_string_to_add(input_sting)
        assert_equal(0, result, "The sum of an empty input_sting should be 0")
    end

    def test_custom_delimiter_with_multiple_numbers
        input_sting = "//|\n10|20|30|40|50\n"
        result = processing_string_to_add(input_sting)
        assert_equal(150, result, "The sum of the numbers should be 150")
    end
end

    # Run the tests
if __FILE__ == $0
    Test::Unit::AutoRunner.run
end