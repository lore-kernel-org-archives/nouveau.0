From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73267] Nouveau: corrupted laptop screen's EDID info
Date: Fri, 03 Jan 2014 22:47:58 +0000
Message-ID: <bug-73267-8800-bsziKJI2k7@http.bugs.freedesktop.org/>
References: <bug-73267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2050221710=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2050221710==
Content-Type: multipart/alternative; boundary="1388789278.0d222D1.1940"; charset="us-ascii"


--1388789278.0d222D1.1940
Date: Fri, 3 Jan 2014 22:47:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73267

--- Comment #2 from pjv <ezelspinguin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia, thanks for your quick reply. Before I get to that, please let me write
elaborately how I fixed things these past few hours. It may help other people
like me who need a pointer left and right.

All credits go to Andy Getz, Stuart Pook and chr[] in the duplicate bug above.
Many of these commands are as root.

Use Andy's edid-tool.c (with slight fix from Stuart), which I attach here
again, and build it:
gcc -std=gnu99 -O edid-tool.c 
mv a.out > edid-tool

Use your package manager and install:
i2c-dev for the kernel module
i2c-tools in order to get i2cdetect, i2cget, i2cset
read-edid in order to get parse-edid

Then activate the kernel module (the mistake Stuart made one time was to forget
this: with i2c-dev installed the /dev/ nodes disappear, but they come back with
loading the module):
modprobe i2c-dev

Assuming you use a modern udev system, you won't have to do anything else in
/dev/.

Read Andy's original commands:
https://bugs.freedesktop.org/show_bug.cgi?id=34554#c15. I repeat them here with
my output:

# Find the right i2c device; reading one that's not DDC will probably give
ENODEV
edid-tool /dev/i2c-0 read > edid-bad

           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 00 00 00  00 07 4f 00  06 10 bb 9c  00 00 00 00  |.... ..O. ....
....|
00000010  00 13 01 03  80 21 15 78  0a 50 c5 98  58 52 8e 27  |.... .!.x .P..
XR.'|
00000020  25 50 54 00  00 00 01 01  01 01 01 01  01 01 01 01  |%PT. .... ....
....|
00000030  01 01 01 01  01 01 7c 2e  90 a0 60 1a  1e 40 30 20  |.... ..|. ..`.
.@0 |
00000040  36 00 4b cf  10 00 00 18  00 00 00 01  00 06 10 30  |6.K. .... ....
...0|
00000050  00 00 00 00  00 00 00 00  0a 20 00 00  00 fe 00 4c  |.... .... . ..
...L|
00000060  50 31 35 34  57 45 33 2d  54 4c 42 31  00 00 00 fe  |P154 WE3- TLB1
....|
00000070  00 43 6f 6c  6f 72 20 4c  43 44 0a 20  20 20 00 dd  |.Col or L CD.   
..|
WARN at 209: Bad header: 0x0000 0000 0007 4f00
WARN at 217: Bad checksum: 0x5c

i2c-0 was the internal screen for my laptop, i2c-1 the external one. In full:

defiant Temp # edid-tool /dev/i2c-0 read > edids-all
           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 00 00 00  00 07 4f 00  06 10 bb 9c  00 00 00 00  |.... ..O. ....
....|
00000010  00 13 01 03  80 21 15 78  0a 50 c5 98  58 52 8e 27  |.... .!.x .P..
XR.'|
00000020  25 50 54 00  00 00 01 01  01 01 01 01  01 01 01 01  |%PT. .... ....
....|
00000030  01 01 01 01  01 01 7c 2e  90 a0 60 1a  1e 40 30 20  |.... ..|. ..`.
.@0 |
00000040  36 00 4b cf  10 00 00 18  00 00 00 01  00 06 10 30  |6.K. .... ....
...0|
00000050  00 00 00 00  00 00 00 00  0a 20 00 00  00 fe 00 4c  |.... .... . ..
...L|
00000060  50 31 35 34  57 45 33 2d  54 4c 42 31  00 00 00 fe  |P154 WE3- TLB1
....|
00000070  00 43 6f 6c  6f 72 20 4c  43 44 0a 20  20 20 00 dd  |.Col or L CD.   
..|
WARN at 209: Bad header: 0x0000 0000 0007 4f00
WARN at 217: Bad checksum: 0x5c
defiant Temp # edid-tool /dev/i2c-1 read > edids-all
           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 ff ff ff  ff ff ff 00  36 74 30 00  01 00 00 00  |.... .... 6t0.
....|
00000010  0a 16 01 03  80 73 41 78  0a cf 74 a3  57 4c b0 23  |.... .sAx ..t.
WL.#|
00000020  09 48 4c 21  08 00 81 80  45 40 61 40  95 00 01 01  |.HL! .... E@a@
....|
00000030  01 01 01 01  01 01 02 3a  80 18 71 38  2d 40 58 2c  |.... ...: ..q8
-@X,|
00000040  45 00 c4 8e  21 00 00 1e  66 21 50 b0  51 00 1b 30  |E... !... f!P.
Q..0|
00000050  00 70 26 44  c4 8e 21 00  00 1e 00 00  00 fc 00 4d  |.p&D ..!. ....
...M|
00000060  53 74 61 72  20 44 65 6d  6f 0a 20 20  00 00 00 fd  |Star  Dem o.  
....|
00000070  00 32 4b 1e  50 17 00 0a  20 20 20 20  20 20 01 fd  |.2K. P...       
..|
defiant Temp # edid-tool /dev/i2c-2 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-3 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-4 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-5 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-6 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-7 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-8 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error
defiant Temp # edid-tool /dev/i2c-9 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error
defiant Temp # edid-tool /dev/i2c-10 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error
defiant Temp # edid-tool /dev/i2c-11 read > edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error

# If you don't get warnings here about either the header or checksum being bad,
# you probably have some other problem.
edid-tool /dev/i2c-0 fix < edid-bad > edid-fixed

Indeed, as I predicted by some smartness and looking at my old logs, it
replaced the first half of the first line with 00 ff ... ff 00 again, which is
the correct one. The rest did not change.

parse-edid < edid-fixed
# parse-edid will read several of the display related fields out of the EDID
and
# generate an Xorg.conf Monitor section; CHECK IT TO MAKE SURE IT LOOKS SANE
# BEFORE YOU FLASH IT BACK TO YOUR MONITOR.

This printed out an xorg.conf in which I recognized the native resolution, so I
was ok with it.

edid-tool /dev/i2c-0 write < edid-fixed

defiant Temp # edid-tool /dev/i2c-0 write < edid-fixed
           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 ff ff ff  ff ff ff 00  06 10 bb 9c  00 00 00 00  |.... .... ....
....|
00000010  00 13 01 03  80 21 15 78  0a 50 c5 98  58 52 8e 27  |.... .!.x .P..
XR.'|
00000020  25 50 54 00  00 00 01 01  01 01 01 01  01 01 01 01  |%PT. .... ....
....|
00000030  01 01 01 01  01 01 7c 2e  90 a0 60 1a  1e 40 30 20  |.... ..|. ..`.
.@0 |
00000040  36 00 4b cf  10 00 00 18  00 00 00 01  00 06 10 30  |6.K. .... ....
...0|
00000050  00 00 00 00  00 00 00 00  0a 20 00 00  00 fe 00 4c  |.... .... . ..
...L|
00000060  50 31 35 34  57 45 33 2d  54 4c 42 31  00 00 00 fe  |P154 WE3- TLB1
....|
00000070  00 43 6f 6c  6f 72 20 4c  43 44 0a 20  20 20 00 dd  |.Col or L CD.   
..|
ERROR at 91: i2c_smbus_write_byte_data() failed: No such device or address



Unfortunately, this command never actually did the write. I looked at the code
intensively and could not spot a bug, unless the bug is in the i2c code. 

I had some i2c module blacklisted (god knows why), which could have been the
cause (I did not find out):
defiant dev # cd /etc/modprobe.d/
defiant modprobe.d # grep i2c *
blacklist.conf:blacklist i2c_i801


So the analysis was done, but there was no easy/working way to write for me. I
fell back to the i2c-tools and in the end did the write with i2cget manually
(slightly dangerous I would say).

i2cdetect gives:
defiant Temp # i2cdetect -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- 28 -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --  

This is all on i2c-0 (column), 0x50 (number in table) is the EDID address that
is also present in the code.

Then I read out the bytes one by one at that address, and the output one by one
matched the first half of the first line of the EDID (the next to last
parameter (e.g. 0x07) matches the column number in the formatted EDID):
i2cget -y 0 0x50 0x00 b
i2cget -y 0 0x50 0x01 b
i2cget -y 0 0x50 0x02 b
i2cget -y 0 0x50 0x03 b
i2cget -y 0 0x50 0x04 b
i2cget -y 0 0x50 0x05 b
i2cget -y 0 0x50 0x06 b
i2cget -y 0 0x50 0x07 b
i2cget -y 0 0x50 0x08 b

If I can read them, I can also write them one by one. I double-checked with one
i2cget. Here the next-to-last parameter is the value (e.g. 0xff for 'ff',
what's supposed to be in the EDID itself):
i2cset -y 0 0x50 0x00 0x00 b
i2cset -y 0 0x50 0x01 0xff b
i2cget -y 0 0x50 0x01 b
i2cset -y 0 0x50 0x02 0xff b
i2cset -y 0 0x50 0x03 0xff b
i2cset -y 0 0x50 0x04 0xff b
i2cset -y 0 0x50 0x05 0xff b
i2cset -y 0 0x50 0x06 0xff b

As soon as I sent through that last command (and thus had fixed my EDID as per
edid-tool's recommendation), my mouse cursor appeared on my internal screen.
Xorg apparently is not super-flexible, but a simple careful reboot gave me my
normal working machine back. Fixed!

In your case, these values will be different.

Not sure how permanent this is.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388789278.0d222D1.1940
Date: Fri, 3 Jan 2014 22:47:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267">bug 73267</a>
              from <span class="vcard"><a class="email" href="mailto:ezelspinguin&#64;gmail.com" title="pjv &lt;ezelspinguin&#64;gmail.com&gt;"> <span class="fn">pjv</span></a>
</span></b>
        <pre>Hi Ilia, thanks for your quick reply. Before I get to that, please let me write
elaborately how I fixed things these past few hours. It may help other people
like me who need a pointer left and right.

All credits go to Andy Getz, Stuart Pook and chr[] in the duplicate bug above.
Many of these commands are as root.

Use Andy's edid-tool.c (with slight fix from Stuart), which I attach here
again, and build it:
gcc -std=gnu99 -O edid-tool.c 
mv a.out &gt; edid-tool

Use your package manager and install:
i2c-dev for the kernel module
i2c-tools in order to get i2cdetect, i2cget, i2cset
read-edid in order to get parse-edid

Then activate the kernel module (the mistake Stuart made one time was to forget
this: with i2c-dev installed the /dev/ nodes disappear, but they come back with
loading the module):
modprobe i2c-dev

Assuming you use a modern udev system, you won't have to do anything else in
/dev/.

Read Andy's original commands:
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Nouveau seems to have corrupted my laptop screen's EDID info"
   href="show_bug.cgi?id=34554#c15">https://bugs.freedesktop.org/show_bug.cgi?id=34554#c15</a>. I repeat them here with
my output:

# Find the right i2c device; reading one that's not DDC will probably give
ENODEV
edid-tool /dev/i2c-0 read &gt; edid-bad

           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 00 00 00  00 07 4f 00  06 10 bb 9c  00 00 00 00  |.... ..O. ....
....|
00000010  00 13 01 03  80 21 15 78  0a 50 c5 98  58 52 8e 27  |.... .!.x .P..
XR.'|
00000020  25 50 54 00  00 00 01 01  01 01 01 01  01 01 01 01  |%PT. .... ....
....|
00000030  01 01 01 01  01 01 7c 2e  90 a0 60 1a  1e 40 30 20  |.... ..|. ..`.
.&#64;0 |
00000040  36 00 4b cf  10 00 00 18  00 00 00 01  00 06 10 30  |6.K. .... ....
...0|
00000050  00 00 00 00  00 00 00 00  0a 20 00 00  00 fe 00 4c  |.... .... . ..
...L|
00000060  50 31 35 34  57 45 33 2d  54 4c 42 31  00 00 00 fe  |P154 WE3- TLB1
....|
00000070  00 43 6f 6c  6f 72 20 4c  43 44 0a 20  20 20 00 dd  |.Col or L CD.   
..|
WARN at 209: Bad header: 0x0000 0000 0007 4f00
WARN at 217: Bad checksum: 0x5c

i2c-0 was the internal screen for my laptop, i2c-1 the external one. In full:

defiant Temp # edid-tool /dev/i2c-0 read &gt; edids-all
           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 00 00 00  00 07 4f 00  06 10 bb 9c  00 00 00 00  |.... ..O. ....
....|
00000010  00 13 01 03  80 21 15 78  0a 50 c5 98  58 52 8e 27  |.... .!.x .P..
XR.'|
00000020  25 50 54 00  00 00 01 01  01 01 01 01  01 01 01 01  |%PT. .... ....
....|
00000030  01 01 01 01  01 01 7c 2e  90 a0 60 1a  1e 40 30 20  |.... ..|. ..`.
.&#64;0 |
00000040  36 00 4b cf  10 00 00 18  00 00 00 01  00 06 10 30  |6.K. .... ....
...0|
00000050  00 00 00 00  00 00 00 00  0a 20 00 00  00 fe 00 4c  |.... .... . ..
...L|
00000060  50 31 35 34  57 45 33 2d  54 4c 42 31  00 00 00 fe  |P154 WE3- TLB1
....|
00000070  00 43 6f 6c  6f 72 20 4c  43 44 0a 20  20 20 00 dd  |.Col or L CD.   
..|
WARN at 209: Bad header: 0x0000 0000 0007 4f00
WARN at 217: Bad checksum: 0x5c
defiant Temp # edid-tool /dev/i2c-1 read &gt; edids-all
           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 ff ff ff  ff ff ff 00  36 74 30 00  01 00 00 00  |.... .... 6t0.
....|
00000010  0a 16 01 03  80 73 41 78  0a cf 74 a3  57 4c b0 23  |.... .sAx ..t.
WL.#|
00000020  09 48 4c 21  08 00 81 80  45 40 61 40  95 00 01 01  |.HL! .... E&#64;a&#64;
....|
00000030  01 01 01 01  01 01 02 3a  80 18 71 38  2d 40 58 2c  |.... ...: ..q8
-&#64;X,|
00000040  45 00 c4 8e  21 00 00 1e  66 21 50 b0  51 00 1b 30  |E... !... f!P.
Q..0|
00000050  00 70 26 44  c4 8e 21 00  00 1e 00 00  00 fc 00 4d  |.p&amp;D ..!. ....
...M|
00000060  53 74 61 72  20 44 65 6d  6f 0a 20 20  00 00 00 fd  |Star  Dem o.  
....|
00000070  00 32 4b 1e  50 17 00 0a  20 20 20 20  20 20 01 fd  |.2K. P...       
..|
defiant Temp # edid-tool /dev/i2c-2 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-3 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-4 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-5 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-6 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-7 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: No such device or address
defiant Temp # edid-tool /dev/i2c-8 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error
defiant Temp # edid-tool /dev/i2c-9 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error
defiant Temp # edid-tool /dev/i2c-10 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error
defiant Temp # edid-tool /dev/i2c-11 read &gt; edids-all
ERROR at 72: i2c_smbus_read_byte_data() failed: Remote I/O error

# If you don't get warnings here about either the header or checksum being bad,
# you probably have some other problem.
edid-tool /dev/i2c-0 fix &lt; edid-bad &gt; edid-fixed

Indeed, as I predicted by some smartness and looking at my old logs, it
replaced the first half of the first line with 00 ff ... ff 00 again, which is
the correct one. The rest did not change.

parse-edid &lt; edid-fixed
# parse-edid will read several of the display related fields out of the EDID
and
# generate an Xorg.conf Monitor section; CHECK IT TO MAKE SURE IT LOOKS SANE
# BEFORE YOU FLASH IT BACK TO YOUR MONITOR.

This printed out an xorg.conf in which I recognized the native resolution, so I
was ok with it.

edid-tool /dev/i2c-0 write &lt; edid-fixed

defiant Temp # edid-tool /dev/i2c-0 write &lt; edid-fixed
           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  00 ff ff ff  ff ff ff 00  06 10 bb 9c  00 00 00 00  |.... .... ....
....|
00000010  00 13 01 03  80 21 15 78  0a 50 c5 98  58 52 8e 27  |.... .!.x .P..
XR.'|
00000020  25 50 54 00  00 00 01 01  01 01 01 01  01 01 01 01  |%PT. .... ....
....|
00000030  01 01 01 01  01 01 7c 2e  90 a0 60 1a  1e 40 30 20  |.... ..|. ..`.
.&#64;0 |
00000040  36 00 4b cf  10 00 00 18  00 00 00 01  00 06 10 30  |6.K. .... ....
...0|
00000050  00 00 00 00  00 00 00 00  0a 20 00 00  00 fe 00 4c  |.... .... . ..
...L|
00000060  50 31 35 34  57 45 33 2d  54 4c 42 31  00 00 00 fe  |P154 WE3- TLB1
....|
00000070  00 43 6f 6c  6f 72 20 4c  43 44 0a 20  20 20 00 dd  |.Col or L CD.   
..|
ERROR at 91: i2c_smbus_write_byte_data() failed: No such device or address



Unfortunately, this command never actually did the write. I looked at the code
intensively and could not spot a bug, unless the bug is in the i2c code. 

I had some i2c module blacklisted (god knows why), which could have been the
cause (I did not find out):
defiant dev # cd /etc/modprobe.d/
defiant modprobe.d # grep i2c *
blacklist.conf:blacklist i2c_i801


So the analysis was done, but there was no easy/working way to write for me. I
fell back to the i2c-tools and in the end did the write with i2cget manually
(slightly dangerous I would say).

i2cdetect gives:
defiant Temp # i2cdetect -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- 28 -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --  

This is all on i2c-0 (column), 0x50 (number in table) is the EDID address that
is also present in the code.

Then I read out the bytes one by one at that address, and the output one by one
matched the first half of the first line of the EDID (the next to last
parameter (e.g. 0x07) matches the column number in the formatted EDID):
i2cget -y 0 0x50 0x00 b
i2cget -y 0 0x50 0x01 b
i2cget -y 0 0x50 0x02 b
i2cget -y 0 0x50 0x03 b
i2cget -y 0 0x50 0x04 b
i2cget -y 0 0x50 0x05 b
i2cget -y 0 0x50 0x06 b
i2cget -y 0 0x50 0x07 b
i2cget -y 0 0x50 0x08 b

If I can read them, I can also write them one by one. I double-checked with one
i2cget. Here the next-to-last parameter is the value (e.g. 0xff for 'ff',
what's supposed to be in the EDID itself):
i2cset -y 0 0x50 0x00 0x00 b
i2cset -y 0 0x50 0x01 0xff b
i2cget -y 0 0x50 0x01 b
i2cset -y 0 0x50 0x02 0xff b
i2cset -y 0 0x50 0x03 0xff b
i2cset -y 0 0x50 0x04 0xff b
i2cset -y 0 0x50 0x05 0xff b
i2cset -y 0 0x50 0x06 0xff b

As soon as I sent through that last command (and thus had fixed my EDID as per
edid-tool's recommendation), my mouse cursor appeared on my internal screen.
Xorg apparently is not super-flexible, but a simple careful reboot gave me my
normal working machine back. Fixed!

In your case, these values will be different.

Not sure how permanent this is.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388789278.0d222D1.1940--

--===============2050221710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2050221710==--
