#!/bin/bash

echo "Running tests..."
echo

pass_count=0
fail_count=0

run_test() {
  input="$1"
  expected_entropy="$2"

  echo "Test input: '$input'"
  output=$(echo "$input" | ./entropy)

  # Extract the computed entropy from the output
  computed_entropy=$(echo "$output" | grep -oP 'Entropy: \K[0-9.]+')

  status=$?

  if [ $status -ne 0 ]; then
    echo "❌ Fail: Program did not exit zero"
    ((fail_count++))
    echo
    return
  fi

  # Compare the computed entropy with the expected entropy (allowing for rounding)
  tolerance="0.01"  # Define tolerance for floating-point comparison
  diff=$(echo "$computed_entropy - $expected_entropy" | bc)
  abs_diff=$(echo "$diff" | awk '{if ($1 < 0) print -$1; else print $1}')

  if (( $(echo "$abs_diff < $tolerance" | bc -l) )); then
    echo "✅ Pass: Expected entropy = $expected_entropy, Computed entropy = $computed_entropy"
    ((pass_count++))
  else
    echo "❌ Fail: Expected entropy = $expected_entropy, Computed entropy = $computed_entropy"
    ((fail_count++))
    echo
  fi
  echo
}

# Updated test cases with corrected expected entropy values
run_test "hello world" 2.845
run_test "password" 2.750
run_test "12345" 2.322
run_test "P@ssw0rd!" 2.948
run_test "aabbcc" 1.585
run_test "!!!@@@" 1.000

echo "Tests passed: $pass_count"
echo "Tests failed: $fail_count"

if [ $fail_count -eq 0 ]; then
  echo "🎉 All tests passed!"
  exit 0
else
  echo "❌ Some tests failed."
  exit 1
fi
