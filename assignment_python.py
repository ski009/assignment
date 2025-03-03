import unittest

def processing_string_to_add(input):
    # Debug: print input
    print(f"input: {input}")

    # Step 1: Extract delimiter from the first line
    delimiter_line = input.split("\n")[0]
    delimiter = delimiter_line[2:]  # Skip "//" at the beginning
    print(f"delimiter: {delimiter}")

    # Step 2: Extract numbers from the remaining string, starting from the second line
    numbers_string = "".join(input.split("\n")[1:])  # Join all lines after the first one
    print(f"numbers_string: {numbers_string}")

    # Step 3: Split the numbers based on the delimiter
    numbers = list(map(int, numbers_string.split(delimiter)))
    print(f"numbers: {numbers}")

    # Step 4: Check for negative numbers and raise an exception if any are found
    negatives = [n for n in numbers if n < 0]
    if negatives:
        raise ValueError(f"Negative numbers are not allowed: {', '.join(map(str, negatives))}")

    # Step 5: Return the sum of the numbers
    return sum(numbers)

