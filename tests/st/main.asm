.orig x3000
	st r0, string
	st r1, string
	st r2, string
	st r3, string
	st r4, string
	st r5, string
	st r6, string
	st r7, string
	puts
	halt
	string .stringz "hello world"
.end
