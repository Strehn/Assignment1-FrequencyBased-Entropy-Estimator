#!/bin/bash

echo "Running tests..."
echo

pass_count=0
fail_count=0

run_test() {
  input="$1"
  expected_alpha="$2"
  expected_length="$3"
  expected_info="$4"

  echo "Test input: '$input'"
  output=$(echo "$input" | ./password_strength)

  status=$?

  if [ $status -ne 0 ]; then
    echo "❌ Fail: Program did not exit zero"
    ((fail_count++))
    echo
    return
  fi

  if echo "$output" | grep -q "Approximate alphabet: $expected_alpha"; then
    echo "✅ Pass: Alphabet = $expected_alpha"
  else
    echo "❌ Fail: Expected alphabet $expected_alpha"
    ((fail_count++))
    echo "$output"
    echo
    return
  fi

  if echo "$output" | grep -q "Length: $expected_length"; then
    echo "✅ Pass: Length = $expected_length"
  else
    echo "❌ Fail: Expected length $expected_length"
    ((fail_count++))
    echo "$output"
    echo
    return
  fi

  if echo "$output" | grep -q "Information Content: $expected_info"; then
    echo "✅ Pass: Information content = $expected_info"
  else
    echo "❌ Fail: Expected info content $expected_info"
    ((fail_count++))
    echo "$output"
    echo
    return
  fi

  ((pass_count++))
  echo
}

# Test cases: input, alphabet size, length, info content
run_test "password"     26 8  "37.60"
run_test "Password"     52 8  "45.60"
run_test "P@ssword"     84 8  "51.14"
run_test "P@ssw0rd"     94 8  "52.44"
run_test "1234567890"   10 10 "33.22"
run_test "A1b2C3d4"     62 8  "47.61"
run_test "!!@#$$%^"     32 8  "40.00"

echo "Tests passed: $pass_count"
echo "Tests failed: $fail_count"

if [ $fail_count -eq 0 ]; then
  echo "🎉 All tests passed!"
  exit 0
else
  echo "❌ Some tests failed."
  exit 1
fi
