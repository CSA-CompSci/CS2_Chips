// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@sum
M=0 //storing 0 in sum
@R1
D=M
@count
M=D //make value from R1 equal count

(LOOP)
@count
D=M
@END
D;JEQ //if count is zero go to end
@R0
D=M //store second number into R0
@sum
M=M+D //combine M (R1) and D (R0).. put into sum
@count
M=M-1
@LOOP //go back to loop
0;JMP

(END)
@sum
D=M //take sum and store
@R2
M=D //store sum into R2
