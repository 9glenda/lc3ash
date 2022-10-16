.orig x3000
	sti r0, string
	sti r1, string
	sti r2, string
	sti r3, string
	sti r4, string
	sti r5, string
	sti r6, string
	sti r7, string
	puts
	halt
	string .stringz "hello world"
.end
