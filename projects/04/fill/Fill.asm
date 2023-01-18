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

@DRAW
0;JMP

(SETBLACK)
@next
A=M
M=-1
@AFTERSET
0;JMP

(SETWHITE)
@next
A=M
M=0
@AFTERSET
0;JMP

(DRAW)
@8192
D=A
@SCREEN
D=D+A
@screenend
M=D
@count
M=0
@KBD
D=M
@startkbd
M=D

(LOOP)
@SCREEN
D=A
@count
D=D+M
@next
M=D
@KBD
D=M

// check if it has changed since last value
@startkbd
D=D-M
@DRAW
D;JNE

@KBD
D=M

@SETWHITE
D;JEQ

@SETBLACK
0;JMP

(AFTERSET)

@count
M=M+1
@next
D=M
@screenend
D=D-M
@DRAW
D;JEQ
@LOOP
0;JMP

