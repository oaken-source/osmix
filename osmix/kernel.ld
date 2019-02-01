/******************************************************************************
 *  OSMix - an operating system for fun and teaching                          *
 *                                                                            *
 *  Licensed under the GPLv3. See COPYING for details.                        *
 *  Copyright (C) 2019 Operating Systems & Middleware Group, HPI              *
 ******************************************************************************/

ENTRY(_start)

SECTIONS
{
	__start = .;

	__text_start = .;
	.text :
	{
		KEEP(*(.text.start))
		*(.text)
	}
	. = ALIGN (CONSTANT (MAXPAGESIZE));
	__text_end = .;

	__rodata_start = .;
	.rodata :
	{
		*(.rodata)
	}
	. = ALIGN (CONSTANT (MAXPAGESIZE));
	__rodata_end = .;

	__data_start = .;
	.data :
	{
		KEEP(*(.data.stack))
		*(.data)
	}
	. = ALIGN (CONSTANT (MAXPAGESIZE));
	__data_end = .;

	__bss_start = .;
	.bss :
	{
		*(.bss)
	}
	. = ALIGN (CONSTANT (MAXPAGESIZE));
	__bss_end = .;

	__end = .;
}
