.orig x3000
	lea r0, string
	puts
	halt
	testlabel .stringz "test"
	string .stringz "hello world"
.end
