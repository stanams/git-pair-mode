#!/bin/bash

# Test script for git-pair functionality
# Run with: ./test-git-pair.sh

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Setup test environment
setup() {
    echo "Setting up test environment..."
    # Create a temporary directory for testing
    TEST_DIR=$(mktemp -d)
    cd "$TEST_DIR" || exit 1
    git init
    
    # Copy the hook file to the test directory
    mkdir -p hooks
    cp "$(dirname "$0")/../hooks/prepare-commit-msg" hooks/
    chmod +x hooks/prepare-commit-msg
    
    # Install the hook
    mkdir -p .git/hooks
    cp hooks/prepare-commit-msg .git/hooks/
    chmod +x .git/hooks/prepare-commit-msg
    
    echo "Test setup complete in $TEST_DIR"
}

# Cleanup test environment
cleanup() {
    echo "Cleaning up test environment..."
    cd - > /dev/null
    rm -rf "$TEST_DIR"
    echo "Cleanup complete"
}

# Run a test and check its result
run_test() {
    local test_name=$1
    local command=$2
    local expected_status=$3
    local input=$4  # Optional input for interactive prompts
    
    echo -n "Running test: $test_name... "
    
    # Run the command and capture its output and status
    if [ -n "$input" ]; then
        # If input is provided, use it for interactive prompts
        output=$(echo "$input" | $command 2>&1)
    else
        # Otherwise run normally
        output=$($command 2>&1)
    fi
    status=$?
    
    # Check if the test passed
    if [ $status -eq $expected_status ]; then
        echo -e "${GREEN}✓ PASSED${NC}"
        return 0
    else
        echo -e "${RED}✗ FAILED${NC}"
        echo "Command: $command"
        echo "Expected status: $expected_status"
        echo "Actual status: $status"
        echo "Output: $output"
        return 1
    fi
}

# Test cases
test_github_username_verification() {
    echo "Testing GitHub username verification..."
    
    # Test with a valid username (replace with a known valid GitHub username)
    run_test "Valid GitHub username" "git pair --with stanams" 0
    
    # Test with an invalid username
    run_test "Invalid GitHub username" "git pair --with thisusernamedoesnotexist123456789" 1
}

test_pair_mode_commands() {
    echo "Testing pair mode commands..."
    
    # Test enabling pair mode
    run_test "Enable pair mode" "git pair --with stanams" 0
    
    # Test status when pair mode is on
    run_test "Status when pair mode is on" "git pair status" 0
    
    # Test disabling pair mode
    run_test "Disable pair mode" "git pair --off" 0
    
    # Test status when pair mode is off (send 'n' to decline activation)
    run_test "Status when pair mode is off" "git pair status" 0 "n"
}

test_commit_commands() {
    echo "Testing commit commands..."
    
    # Enable pair mode first
    git pair --with stanams > /dev/null
    
    # Create a test file
    echo "test" > test.txt
    git add test.txt
    
    # Test regular commit
    run_test "Regular commit" "git commit -m test-commit" 0
    
    # Test pair-commit
    echo "test2" > test2.txt
    git add test2.txt
    run_test "Pair commit" "git pair-commit -m test-pair-commit" 0
    
    # Disable pair mode
    git pair --off > /dev/null
}

test_statistics() {
    echo "Testing statistics..."
    
    # Enable pair mode
    git pair --with stanams > /dev/null
    
    # Test stats command
    run_test "Show stats" "git pair stats" 0
    
    # Test stats with period
    run_test "Show weekly stats" "git pair stats week" 0
    run_test "Show monthly stats" "git pair stats month" 0
    
    # Test invalid period
    run_test "Invalid stats period" "git pair stats invalid" 1
    
    # Disable pair mode
    git pair --off > /dev/null
}

# Main test execution
main() {
    echo "Starting git-pair tests..."
    
    setup
    
    # Run test suites
    test_github_username_verification
    test_pair_mode_commands
    test_commit_commands
    test_statistics
    
    cleanup
    
    echo "All tests completed!"
}

# Run the tests
main 