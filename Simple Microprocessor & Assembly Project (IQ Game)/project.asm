include 'emu8086.inc'

.model small
.stack 100h
.data

msg db 'Welcome to IQ test.$'

msg1 db 'Level 1:$'

msg2 db 'Q1.A red house is made of yellow bricks and a yellow house is made of blue bricks. What is a greenhouse made of?$' 
msg3 db '1.Red bricks   2.Blue bricks   3.Glass  4.Green bricks $'
msg4 db 'Q2.A farmer has 17 sheep and all but 9 are shipped away.How many does he have left? $'
msg5 db '1.8  2.17  3.9  4.26 $'
msg6 db 'Q3.You are in a footrace.You pass the person in 2nd place.What place are you in now? $' 
msg7 db '1.1st  2.2nd  3.3rd  4.I never have a place.I am so lonely.$' 
msg8 db 'Q4.What comes in next after x?$'
msg9 db '1.x  2.y  3.w  4.t $'
msg10 db 'Q5.If you rearrange the letters "CIFAIPC" you would have the name of what?$'
msg11 db '1.City  2.Ocean  3.Country  4.Road  $'

msg12 db 'Level 2:$'

msg13 db 'Q1.What is the missing number in the sequence 121,169,...,289?$'
msg14 db '1.217  2.241  3.225  4.231 $'
msg15 db 'Q2.If 2+3+4=51418,4+5+6=92230 then 1+2+3=? $'
msg16 db '1.30023  2.31102  3.31210  4.31012 $'
msg17 db 'Q3.If a computer has more than one processor then it is known as?$'
msg18 db '1.Uniprocessor  2.Multiprocessor  3.UniMultiprocessor  4.Multithreaded$'
msg19 db 'Q4.In computer 0001,0011,0111,????$'
msg20 db '1.1111  2.1110  3.1101  4.1011 $'
msg21 db 'Q5.1.Mara runs faster than Gail.  2.Lily runs faster than Mara.  3.Gail runs faster than Lily.    If the first two statements are true, the third statement is?$'
msg22 db '1.False  2.True  3.Uncertain $'

ms1 db 'To qualify your 3 answers must be right among 5 questions.$'
ms2 db 'To pass your 2 answers must be right among 5 questions.$'

ans db 'Answer:$'

cng1 db 'Congratulation.You have unlocked a new level.$'
cng2 db 'Your IQ test result is poor.$'
cng3 db 'Not bad.But you have failed.$'
cng4 db 'Good.You have passed.$'
cng5 db 'Your IQ result is too good.$'
cng6 db 'You have a brilliant future.$'
cng7 db 'You are a genius.$'

.code
main proc
    call IQ
    call easy
    call hard 
    main endp

IQ proc
    mov ah,2
    mov dl,03h
    int 21h
    mov ax,@data
    mov ds,ax
    lea dx,msg  
    mov ah,9
    int 21h
    mov ah,2
    mov dl,03h
    int 21h
    mov ah,1
    int 21h
    call clear_screen
    ret
    IQ endp  

easy proc 
    mov bh,0
    mov ax,@data
    mov ds,ax
    lea dx,msg1  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ms1  
    mov ah,9
    int 21h 
    label1:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg2  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg3  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,'3'
    je count1 
    label2:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg4  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg5  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,'2'
    je count2
    label3:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg6  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg7  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,'2'
    je count3 
    label4: 
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg8  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg9  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,'4'
    je count4
    label5:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg10  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg11  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,'2'
    je count5
    result1:
    cmp bh,3
    jl exit1
    call new
    mov ax,@data
    mov ds,ax
    lea dx,cng1  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    call clear_screen
    ret
    count1:
    add bh,1
    jmp label2
    count2:
    add bh,1
    jmp label3 
    count3:
    add bh,1
    jmp label4
    count4:
    add bh,1
    jmp label5
    count5:
    add bh,1
    jmp result1
    exit1:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,cng2  
    mov ah,9
    int 21h 
    mov ah,4ch 
    int 21h
    easy endp

hard proc
    mov ch,0  
    mov ax,@data
    mov ds,ax
    lea dx,msg12  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ms2  
    mov ah,9
    int 21h
    label11:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg13  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg14 
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov cl,al
    cmp cl,'3'
    je count11 
    label12:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg15  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg16 
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov cl,al
    cmp cl,'4'
    je count12 
    label13:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg17  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg18 
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov cl,al
    cmp cl,'2'
    je count13  
    label14:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg19  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg20 
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov cl,al
    cmp cl,'3'
    je count14   
    label15:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg21  
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,msg22 
    mov ah,9
    int 21h
    call new
    mov ax,@data
    mov ds,ax
    lea dx,ans  
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov cl,al
    cmp cl,'1'
    je count15
    result2:
    cmp ch,2
    jl exit2
    call clear_screen
    cmp ch,2
    je exit3
    cmp ch,3
    je exit4
    cmp ch,4
    je exit5
    cmp ch,5
    je exit6  
    count11:
    add ch,1
    jmp label12   
    count12:
    add ch,1
    jmp label13
    count13:
    add ch,1
    jmp label14
    count14:
    add ch,1
    jmp label15
    count15:
    add ch,1
    jmp result2
    exit2:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,cng3 
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h 
    exit3:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,cng4 
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h 
    exit4:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,cng5 
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    exit5:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,cng6
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    exit6:
    call new
    mov ax,@data
    mov ds,ax
    lea dx,cng7 
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    hard endp
    
new proc
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    ret
    new endp

DEFINE_CLEAR_SCREEN 

end main  
