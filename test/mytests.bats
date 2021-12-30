# prepare
function setup() {
	load 'test_helper/bats-support/load'
	load 'test_helper/bats-assert/load'
	echo huhu > bar
}

# run tests
@test 'check for output' {
	run ./foo.sh
	assert_output 'huhu'
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
function teardown() {
	rm -f bar
}
