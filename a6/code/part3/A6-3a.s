.pos 0x0
                 ld   $sb, r5 # stack
                 inca r5      # allocate space for return
                 gpc  $6, r6
                 j    0x300
                 halt
.pos 0x100
                 .long 0x00001000
.pos 0x200
                 ld   0x0(r5), r0 # r0 = a
                 ld   0x4(r5), r1 # r1 = b
                 ld   $0x100, r2 # r2 = 0x100
                 ld   0x0(r2), r2 # r2 = *0x100
                 ld   (r2, r1, 4), r3 # r3 = *0x100[b]
                 add  r3, r0					# r0 = a + *0x100[b]
                 st   r0, (r2, r1, 4) # *0x100[b] += a
                 j    0x0(r6)         # return

.pos 0x300
                 ld   $0xfffffff4, r0 # allocate space on stack
                 add  r0, r5 # staaaaaack
                 st   r6, 0x8(r5)  # store return pointer in stack
                 ld   $0x1, r0 # r0 = 1
                 st   r0, 0x0(r5) # store 1 into local val a
                 ld   $0x2, r0 # r0 = 2
                 st   r0, 0x4(r5) # store 2 into local val b
                 ld   $0xfffffff8, r0 # allocate 8 bytes for callee
                 add  r0, r5          # ...
                 ld   $0x3, r0       # r0 = 3
                 st   r0, 0x0(r5)     # arg0 = 3
                 ld   $0x4, r0
                 st   r0, 0x4(r5)     # arg1 = 4
                 gpc  $6, r6				  # save return
                 j    0x200						# call 0x200
                 ld   $0x8, r0        # deallocate 8 bytes for callee
                 add  r0, r5          # ..
                 ld   0x0(r5), r1     # load  a
                 ld   0x4(r5), r2     # load b
                 ld   $0xfffffff8, r0 # alloc 8 bytes for calling func
                 add  r0, r5          # ...
                 st   r1, 0x0(r5)     # arg0 = a
                 st   r2, 0x4(r5)     # arg1 = b
                 gpc  $6, r6
                 j    0x200           # call 0x200
                 ld   $0x8, r0
                 add  r0, r5
                 ld   0x8(r5), r6
                 ld   $0xc, r0
                 add  r0, r5
                 j    0x0(r6)
.pos 0x1000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
	.long 0x00000000
.pos 0x8000
# These are here so you can see (some of) the stack contents.
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
sb: .long 0
