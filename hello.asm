			.ORIG x3000

			LEA R0, CMD
			PUTS
			HALT
	
CMD .STRINGZ "hello world"
			.END
