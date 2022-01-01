load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

# runs only once
function setup_file() {
	echo huhu > bar
}

# run tests
@test 'check for output' {
	run ./foo.sh
	assert_output 'huhu'
	assert_success
}

@test 'check for partial output' {
	run echo 'hello world'
	assert_output --partial 'world'
}

@test 'check for exit code' {
	run exit 55
	assert_failure 55
}

# clean up
# runs only once
function teardown_file() {
	rm -f bar
}
