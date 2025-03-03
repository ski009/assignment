import unittest

def processing_string_to_add(input): 
    delimiter_line = input.split("\n")[0]
    delimiter = delimiter_line[2:] 
    print(f"delimiter: {delimiter}")

    numbers_string = "".join(input.split("\n")[1:])  
    print(f"numbers_string: {numbers_string}")

    numbers = list(map(int, numbers_string.split(delimiter)))

    negatives = [n for n in numbers if n < 0]
    if negatives:
        raise ValueError(f"Negative numbers are not allowed: {', '.join(map(str, negatives))}")


    return sum(numbers)

# Test case class
class TestProcessingStringToAdd(unittest.TestCase):
    def test_valid_input_with_custom_delimiter(self):
        input_data = "//;\n1;2;3;5\n"
        result = processing_string_to_add(input_data)
        self.assertEqual(result, 11, "The sum of the numbers should be 11")

    def test_input_with_negative_number(self):
        input_data = "//;\n1;2;3;-4;5\n"
        with self.assertRaises(ValueError) as context:
            processing_string_to_add(input_data)
        self.assertEqual(str(context.exception), "Negative numbers are not allowed: -4")

    def test_custom_delimiter_with_multiple_numbers(self):
        input_data = "//|\n10|20|30|40|50\n"
        result = processing_string_to_add(input_data)
        self.assertEqual(result, 150, "The sum of the numbers should be 150")

# Run the tests
if __name__ == '__main__':
    unittest.main()