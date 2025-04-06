# Assignment 1: Frequency-Based Entropy Estimator (20 Points)

## Overview
In this assignment, you will build a program that computes the Shannon entropy of a string based on the observed frequencies of characters. This will reinforce your understanding of entropy, probability distributions, and basic statistical analysis while giving you more practice with C programming fundamentals such as arrays, loops, and functions.

This assignment builds upon concepts from Information Theory, where entropy is a measure of the unpredictability or information content in a message. This program calculates entropy based on how often each character appears.

 

By completing this assignment, you'll:

Deepen your intuition about randomness and entropy.

Learn how to model and measure character distributions in data.

Develop C programming skills with strings and arrays.


## Program Requirements
Write a C program that:

Prompts the user to enter a string (up to 100 characters).

Counts the frequency of each character in the string.

Calculates the probability of each character.

Computes the entropy of the string using the formula above.

Displays the character frequencies and the resulting entropy value.

## Function to Implement
You must include the following function in your program:

double compute_entropy(const char *str);
Input: A null-terminated string (max length 100).

Output: The estimated entropy value (in bits).

## Example Output
Enter a string: hello world

Character Frequencies:
h: 1
e: 1
l: 3
o: 2
 : 1
w: 1
r: 1
d: 1

Entropy: 2.845 bits

## Implementation Hints
You can assume only printable ASCII characters (' ' to '~') are used.

Use an array of size 128 to count characters (int freq[128] = {0};).

Use strlen to get the input length.

Use log2 from math.h for entropy calculation.

Link with -lm if needed when compiling.

## Example:

gcc -Wall -o entropy entropy.c -lm
Submission Instructions
Push your code to the GitHub Classroom repository.

Create a folder in your repo named assignment1_entropy_estimator/.

## Include:

entropy.c with your implementation

README.md with instructions on how to compile and run your program

Ensure your code compiles and runs cleanly before the deadline.
