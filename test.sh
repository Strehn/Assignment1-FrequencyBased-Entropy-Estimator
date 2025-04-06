#!/bin/bash

echo "Running tests..."
echo

# Simulate input and capture output
output=$(echo "P@ssw0rd" | ./a.out)

expected_alphabet="Approximate alphabet: 94"
expected_length="Length: 8"
expected_info="Information Content: 52.44"

# Check if the program exited with 0
if [ $? -eq 0 ] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit 1
fi

# Check for correct alphabet
if echo "$output" | grep -q "$expected_alphabet"; then
  echo "Pass: Alphabet size correct"
else
  echo "Fail: Expected alphabet size '$expected_alphabet'"
  echo "Got:"
  echo "$output"
  exit 1
fi

# Check for correct length
if echo "$output" | grep -q "$expected_length"; then
  echo "Pass: Length correct"
else
  echo "Fail: Expected length '$expected_length'"
  echo "Got:"
  echo "$output"
  exit 1
fi

# Check for correct information content (may vary slightly, use pattern match)
if echo "$output" | grep -q "$expected_info"; then
  echo "Pass: Information content correct"
else
  echo "Fail: Expected info content '$expected_info'"
  echo "Got:"
  echo "$output"
  exit 1
fi

echo
echo "All tests passed."
exit 0
