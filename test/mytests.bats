load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

# colors
BOLD=$(tput bold)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

# runs before all tests and before each test
echo "$BOLD$RED** Code not wrapped in functions **$RESET" #>&3

# runs before all tests
function setup_file() {
	echo "setup_file()" >&3
	VAR_setup_file=foo
	export VAR_setup_file_export=foo

	printf "$PURPLE    %-25s%s\n" "VAR_setup_file:" "$VAR_setup_file$RESET" >&3
	printf "$BLUE    %-25s%s\n" "VAR_setup_file_export:" "$VAR_setup_file_export$RESET" >&3
	printf "$YELLOW    %-25s%s\n" "VAR_setup:" "$VAR_setup$RESET" >&3
	printf "$CYAN    %-25s%s\n" "VAR_setup_export:" "$VAR_setup_export$RESET" >&3
	echo >&3
}

# runs before each test
function setup() {
	echo "setup()" >&3

	VAR_setup=foo
	export VAR_setup_export=foo

	printf "$PURPLE    %-25s%s\n" "VAR_setup_file:" "$VAR_setup_file$RESET" >&3
	printf "$BLUE    %-25s%s\n" "VAR_setup_file_export:" "$VAR_setup_file_export$RESET" >&3
	printf "$YELLOW    %-25s%s\n" "VAR_setup:" "$VAR_setup$RESET" >&3
	printf "$CYAN    %-25s%s\n" "VAR_setup_export:" "$VAR_setup_export$RESET" >&3
	echo >&3
}

# run tests
@test 'first test' {
	echo "first test" >&3

	run ./foo.sh
	assert_output 'bar'
	assert_success

	printf "$PURPLE    %-25s%s\n" "VAR_setup_file:" "$VAR_setup_file$RESET" >&3
	printf "$BLUE    %-25s%s\n" "VAR_setup_file_export:" "$VAR_setup_file_export$RESET" >&3
	printf "$YELLOW    %-25s%s\n" "VAR_setup:" "$VAR_setup$RESET" >&3
	printf "$CYAN    %-25s%s\n" "VAR_setup_export:" "$VAR_setup_export$RESET" >&3
	echo >&3
}

# @test 'second test' {
# 	echo "second test" >&3
# 	run echo 'hello world'
# 	assert_output --partial 'world'

# 	printf "$PURPLE    %-25s%s\n" "VAR_setup_file:" "$VAR_setup_file$RESET" >&3
# 	printf "$BLUE    %-25s%s\n" "VAR_setup_file_export:" "$VAR_setup_file_export$RESET" >&3
# 	printf "$YELLOW    %-25s%s\n" "VAR_setup:" "$VAR_setup$RESET" >&3
# 	printf "$CYAN    %-25s%s\n" "VAR_setup_export:" "$VAR_setup_export$RESET" >&3
# 	echo >&3
# }

@test 'check for exit code' {
	run exit 55
	assert_failure 55
}

# runs after each test
function teardown() {
	echo "teardown()" >&3
	printf "$PURPLE    %-25s%s\n" "VAR_setup_file:" "$VAR_setup_file$RESET" >&3
	printf "$BLUE    %-25s%s\n" "VAR_setup_file_export:" "$VAR_setup_file_export$RESET" >&3
	printf "$YELLOW    %-25s%s\n" "VAR_setup:" "$VAR_setup$RESET" >&3
	printf "$CYAN    %-25s%s\n" "VAR_setup_export:" "$VAR_setup_export$RESET" >&3
	echo >&3
}

# runs after all tests are done
function teardown_file() {
	echo "teardown_file()" >&3
	printf "$PURPLE    %-25s%s\n" "VAR_setup_file:" "$VAR_setup_file$RESET" >&3
	printf "$BLUE    %-25s%s\n" "VAR_setup_file_export:" "$VAR_setup_file_export$RESET" >&3
	printf "$YELLOW    %-25s%s\n" "VAR_setup:" "$VAR_setup$RESET" >&3
	printf "$CYAN    %-25s%s\n" "VAR_setup_export:" "$VAR_setup_export$RESET" >&3
	echo >&3
}
