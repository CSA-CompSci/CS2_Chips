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
M=D //count the number of bytes and save into the memory

(LOOP)
@index //start at 0
M=0 //screen is white

(INNER)
@KBD //determines if keyboard is pressed
D=M
@WHITE //if it is not pressed go to white
D;JEQ

(BLACK)
@index
D=M
@SCREEN
A=A+D //finds address
M=-1 //turn screen black
@END //go to end
0;JMP

(WHITE)
@index
D=M
@SCREEN
A=A+D //find address
M=0 //turn screen white, go straight to end

(END)
@index
MD=M+1
@count
D=D-M //shift the bytes
@LOOP //if it reaches the end of the screen, go to loop
D;JEQ
@INNER //otherwise go back to inner
0;JMP
