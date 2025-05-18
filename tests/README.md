# Git Pair Mode Tests

This directory contains test scripts for the Git Pair Mode tool.

## Running Tests

To run the tests:

1. Make sure you're in the project root directory
2. Make the test script executable:
   ```bash
   chmod +x tests/test-git-pair.sh
   ```
3. Run the tests:
   ```bash
   ./tests/test-git-pair.sh
   ```

## Test Structure

The test suite includes:

- `test-git-pair.sh`: Main test script that verifies core functionality
  - GitHub username verification
  - Pair mode commands (enable/disable/status)
  - Commit commands (regular and pair-commit)
  - Statistics functionality

## Adding New Tests

To add new tests:

1. Add a new test function in `test-git-pair.sh`
2. Use the `run_test` helper function:
   ```bash
   run_test "Test name" "command to run" expected_exit_code
   ```
3. Add your test function to the `main()` function

## Test Environment

The test script:

- Creates a temporary Git repository for testing
- Cleans up after itself
- Provides clear pass/fail output
- Shows detailed error information for failed tests

## Notes

- Tests use a temporary directory to avoid affecting your actual Git repositories
- Some tests require internet access for GitHub username verification
- The test script uses color output for better readability
