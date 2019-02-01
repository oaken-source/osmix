/******************************************************************************
 *  OSMix - an operating system for fun and teaching                          *
 *                                                                            *
 *  Licensed under the GPLv3. See COPYING for details.                        *
 *  Copyright (C) 2019 Operating Systems & Middleware Group, HPI              *
 ******************************************************************************/

// reserve stack memory
.section .data.stack

.stack_bottom:
.space 0x1000
.stack_top:

// startup code
.section .text.start

.globl _start
_start:
  // setup the stack pointer
  ldr   sp, =.stack_top

  // save registers r0-r2
  push  {r0-r2}

  // expand bss segment; fill with zeroes
  ldr   r0, =__bss_start
  ldr   r1, =__bss_end
  mov   r2, #0

.bss_zero_loop:
  cmp   r0, r1
  beq   .bss_zero_loop_end
  str   r2, [r0]
  add   r0, r0, #4
  b     .bss_zero_loop
.bss_zero_loop_end:

  // restore registers r0-r2
  pop   {r0-r2}

  // call kernel main
  bl    main

  // spinlock when returned from kernel main
.halt:
  b     .halt
