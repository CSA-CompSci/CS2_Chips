// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@8192 //total amount of bytes
D=A
@count
M=D

@index //start at 0
M=0

(WHITESTART)
@index
D=M
@SCREEN
A=A+D //find address
M=0 //fill screen white, go straight to end
@index
M=M+1
@index
D=M
@count
D=D-M
@INNER //reach end of screen, go to inner
D;JEQ
@WHITESTART //keep filling with white
0;JMP

(INNER)
@256 //set number of rows
D=A
@check
M=D
@index //start at 0
M=0
@KBD //check keyboard
D=M
@WHITESTART //if it is not pressed go to whitestart
D;JEQ

(BLACK)
@index
D=M
@SCREEN
A=A+D //finds address
M=-1 //fill 64bits black
A=A+1
M=-1
A=A+1
M=-1
A=A+1
M=-1
@index
M=M+1 //64bits black
M=M+1
M=M+1
M=M+1 
M=M+1 //skips 64bits
M=M+1
M=M+1
M=M+1
@check
M=M-1
D=M
@LOOP
D;JEQ
@BLACK
0;JMP

(LOOP)
@256
D=A
@check
M=D

(WHITE)
@index
D=M
@SCREEN
A=A+D //find address
M=0 //fill 64bits white
A=A+1
M=0
A=A+1
M=0
A=A+1
M=0
@index
M=M+1
M=M+1
M=M+1
M=M+1
@index
D=M
@SCREEN
A=A+D //finds address
M=-1 //fills 64bits black
A=A+1
M=-1
A=A+1
M=-1
A=A+1
M=-1
@index
M=M+1
M=M+1
M=M+1
M=M+1
@check
M=M-1
D=M
@END //go to end if 0
D;JEQ
@WHITE //otherwise go to white
0;JMP

(END)
@256 //reset rows
D=A
@check
M=D
@index
D=M
@count
D=D-M //checks location on screen
@INNER //if it reaches the end of the screen, go to inner
D;JEQ
@BLACK //otherwise go to black
0;JMP