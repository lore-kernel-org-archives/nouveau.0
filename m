From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/nouveau/nv50: reclock memory using
 PMS on nv50
Date: Sat, 07 May 2011 10:48:15 +0300
Message-ID: <1304754495.20640.3.camel@maxim-laptop>
References: <1304015622-5910-1-git-send-email-martin.peres@free.fr>
	<1304122633-21621-1-git-send-email-martin.peres@free.fr>
	<1304122633-21621-3-git-send-email-martin.peres@free.fr>
	<op.vu22spl57cbmmg@emo>  <4DC4A56B.4080008@ensi-bourges.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-0U7OGdi9ZPXuYbwsdl9Z"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4DC4A56B.4080008-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--=-0U7OGdi9ZPXuYbwsdl9Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just my 0.2 cent, here are PMS scripts executed by the blob (270.41.06)
with slightly better formatting (script attached)
This is trace from bare Xorg start on my NV86.


-- 
Best regards,
        Maxim Levitsky

Visit my blog: http://maximlevitsky.wordpress.com
Warning: Above blog contains rants.

--=-0U7OGdi9ZPXuYbwsdl9Z
Content-Disposition: attachment; filename="pms_scripts.txt"
Content-Type: text/plain; name="pms_scripts.txt"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

script1:

00000000: e2 17 01 10 00     data 0x100117
00000005: e0 0c a8 61 00     addr 0x61a80c
0000000a: 00                 ???
0000000b: 40 0c a8           addr 0x61a80c
0000000e: 05                 ??? [unknown: 05]
0000000f: e2 00 00 00 00     data 0
00000014: 40 0c a8           addr 0x61a80c
00000017: 7f                 exit


script2:

00000000: e2 a7 00 10 00     data 0x1000a7
00000005: e0 0c a0 61 00     addr 0x61a00c
0000000a: 00                 ???
0000000b: 40 0c a0           addr 0x61a00c
0000000e: 05                 ??? [unknown: 05]
0000000f: e2 00 00 00 00     data 0
00000014: 40 0c a0           addr 0x61a00c
00000017: 7f                 exit


script3:

00000000: e2 00 33 00 00     data 0x3300
00000005: e0 00 12 61 00     addr 0x611200
0000000a: 42 01 00           data 0x1
0000000d: e0 04 25 00 00     addr 0x2504
00000012: 07                 ??? [unknown: 07]
00000013: b0                 ??? [unknown: b0]
00000014: 5f 00 01           unk5f [unknown: 00 00 01]
00000017: e0 d4 02 10 00     addr 0x1002d4
0000001c: 40 d0 02           addr 0x1002d0
0000001f: 40 d0 02           addr 0x1002d0
00000022: 42 00 00           data 0
00000025: 40 10 02           addr 0x100210
00000028: 42 01 00           data 0x1
0000002b: 40 dc 02           addr 0x1002dc
0000002e: 42 05 25           data 0x2505
00000031: e0 0c 40 00 00     addr 0x400c
00000036: e2 00 e4 59 80     data 0x8059e400
0000003b: 40 08 40           addr 0x4008
0000003e: 0d                 ??? [unknown: 0d]
0000003f: 0a                 ??? [unknown: 0a]
00000040: 40 08 40           addr 0x4008
00000043: e2 00 00 00 00     data 0
00000048: e0 dc 02 10 00     addr 0x1002dc
0000004d: e2 00 00 00 80     data 0x80000000
00000052: 40 10 02           addr 0x100210
00000055: 07                 ??? [unknown: 07]
00000056: e2 62 0a 00 00     data 0xa62
0000005b: 40 c0 02           addr 0x1002c0
0000005e: e2 04 09 01 0c     data 0xc010904
00000063: 40 24 02           addr 0x100224
00000066: e2 18 2a 12 06     data 0x6122a18
0000006b: 40 20 02           addr 0x100220
0000006e: e2 62 0b 00 00     data 0xb62
00000073: 40 c0 02           addr 0x1002c0
00000076: 42 62 0a           data 0xa62
00000079: 40 c0 02           addr 0x1002c0
0000007c: 0b                 ??? [unknown: 0b]
0000007d: d0                 ??? [unknown: d0]
0000007e: 5f 00 00           unk5f
00000081: 42 30 33           data 0x3330
00000084: e0 00 12 61 00     addr 0x611200
00000089: 7f                 exit
0000008a: 7f                 exit
0000008b: 7f                 exit


script4:
------------little bug here------

00000000: 0a                 ??? [unknown: 0a]
00000001: 7f                 exit
00000002: e2 00 33 00 00     data 0x3300
00000007: e0 00 12 61 00     addr 0x611200
0000000c: 42 01 00           data 0x1
0000000f: e0 04 25 00 00     addr 0x2504
00000014: 07                 ??? [unknown: 07]
00000015: b0                 ??? [unknown: b0]
00000016: 5f 00 01           unk5f [unknown: 00 00 01]
00000019: e0 d4 02 10 00     addr 0x1002d4
0000001e: 40 d0 02           addr 0x1002d0
00000021: 40 d0 02           addr 0x1002d0
00000024: 42 00 00           data 0
00000027: 40 10 02           addr 0x100210
0000002a: 42 01 00           data 0x1
0000002d: 40 dc 02           addr 0x1002dc
00000030: 42 05 25           data 0x2505
00000033: e0 0c 40 00 00     addr 0x400c
00000038: e2 00 e4 59 80     data 0x8059e400
0000003d: 40 08 40           addr 0x4008
00000040: 0d                 ??? [unknown: 0d]
00000041: 0a                 ??? [unknown: 0a]
00000042: 40 08 40           addr 0x4008
00000045: e2 00 00 00 00     data 0
0000004a: e0 dc 02 10 00     addr 0x1002dc
0000004f: e2 00 00 00 80     data 0x80000000
00000054: 40 10 02           addr 0x100210
00000057: 07                 ??? [unknown: 07]
00000058: e2 62 0a 00 00     data 0xa62
0000005d: 40 c0 02           addr 0x1002c0
00000060: e2 04 09 01 0c     data 0xc010904
00000065: 40 24 02           addr 0x100224
00000068: e2 18 2a 12 06     data 0x6122a18
0000006d: 40 20 02           addr 0x100220
00000070: e2 62 0b 00 00     data 0xb62
00000075: 40 c0 02           addr 0x1002c0
00000078: 42 62 0a           data 0xa62
0000007b: 40 c0 02           addr 0x1002c0
0000007e: 0b                 ??? [unknown: 0b]
0000007f: d0                 ??? [unknown: d0]
00000080: 5f 00 00           unk5f
00000083: 42 30 33           data 0x3330
00000086: e0 00 12 61 00     addr 0x611200
0000008b: 7f                 exit



script5:

00000000: 0a                 ??? [unknown: 0a]
00000001: 00                 ???
00000002: e2 00 ?? ?? ??     data 0 [incomplete]


script6:

00000000: e2 00 33 00 00     data 0x3300
00000005: e0 00 12 61 00     addr 0x611200
0000000a: 07                 ??? [unknown: 07]
0000000b: b0                 ??? [unknown: b0]
0000000c: 5f 00 01           unk5f [unknown: 00 00 01]
0000000f: e2 83 db f0 2e     data 0x2ef0db83
00000014: e0 40 c0 00 00     addr 0xc040
00000019: e2 00 00 00 80     data 0x80000000
0000001e: 40 20 40           addr 0x4020
00000021: e2 83 db f0 2e     data 0x2ef0db83
00000026: 40 40 c0           addr 0xc040
00000029: e2 00 00 09 a0     data 0xa0090000
0000002e: 40 28 40           addr 0x4028
00000031: e2 02 10 00 00     data 0x1002
00000036: 40 2c 40           addr 0x402c
00000039: 0e                 ??? [unknown: 0e]
0000003a: e2 a3 db e0 2e     data 0x2ee0dba3
0000003f: 40 40 c0           addr 0xc040
00000042: e2 10 00 00 00     data 0x10
00000047: 40 4c c0           addr 0xc04c
0000004a: e2 a3 db e0 2e     data 0x2ee0dba3
0000004f: 40 40 c0           addr 0xc040
00000052: d0                 ??? [unknown: d0]
00000053: 5f 00 00           unk5f
00000056: e2 30 33 00 00     data 0x3330
0000005b: e0 00 12 61 00     addr 0x611200
00000060: 7f                 exit
00000061: 7f                 exit
00000062: 7f                 exit
00000063: 7f                 exit


script7:

00000000: 5f 01 00           unk5f [unknown: 00 01 00]
00000003: 5f 01 01           unk5f [unknown: 00 01 01]
00000006: b0                 ??? [unknown: b0]
00000007: 5f 00 01           unk5f [unknown: 00 00 01]
0000000a: e2 83 db f0 2e     data 0x2ef0db83
0000000f: e0 40 c0 00 00     addr 0xc040
00000014: e2 00 00 00 80     data 0x80000000
00000019: 40 20 40           addr 0x4020
0000001c: e2 83 db f0 2e     data 0x2ef0db83
00000021: 40 40 c0           addr 0xc040
00000024: e2 00 00 09 a0     data 0xa0090000
00000029: 40 28 40           addr 0x4028
0000002c: e2 02 0b 00 00     data 0xb02
00000031: 40 2c 40           addr 0x402c
00000034: 0e                 ??? [unknown: 0e]
00000035: e2 a3 db e0 2e     data 0x2ee0dba3
0000003a: 40 40 c0           addr 0xc040
0000003d: e2 10 00 00 00     data 0x10
00000042: 40 4c c0           addr 0xc04c
00000045: e2 a3 db e0 2e     data 0x2ee0dba3
0000004a: 40 40 c0           addr 0xc040
0000004d: d0                 ??? [unknown: d0]
0000004e: 5f 00 00           unk5f
00000051: 7f                 exit
00000052: 7f                 exit
00000053: 7f                 exit


script8:

00000000: 5f 01 01           unk5f [unknown: 00 01 01]
00000003: 5f 01 00           unk5f [unknown: 00 01 00]
00000006: e2 a3 db e0 2a     data 0x2ae0dba3
0000000b: e0 40 c0 00 00     addr 0xc040
00000010: 7f                 exit
00000011: 7f                 exit
00000012: 7f                 exit
00000013: 7f                 exit


script9:


00000000: 5f 01 01           unk5f [unknown: 00 01 01]
00000003: 5f 01 00           unk5f [unknown: 00 01 00]
00000006: e2 01 00 00 00     data 0x1
0000000b: e0 04 25 00 00     addr 0x2504
00000010: 06                 ??? [unknown: 06]
00000011: b0                 ??? [unknown: b0]
00000012: 5f 00 01           unk5f [unknown: 00 00 01]
00000015: e0 d4 02 10 00     addr 0x1002d4
0000001a: 40 d0 02           addr 0x1002d0
0000001d: 40 d0 02           addr 0x1002d0
00000020: 42 00 00           data 0
00000023: 40 10 02           addr 0x100210
00000026: 42 01 00           data 0x1
00000029: 40 dc 02           addr 0x1002dc
0000002c: e2 00 e6 02 80     data 0x8002e600
00000031: e0 08 40 00 00     addr 0x4008
00000036: e2 00 e2 18 80     data 0x8018e200
0000003b: 40 08 40           addr 0x4008
0000003e: e2 00 00 00 00     data 0
00000043: e0 dc 02 10 00     addr 0x1002dc
00000048: e2 00 00 00 80     data 0x80000000
0000004d: 40 10 02           addr 0x100210
00000050: 07                 ??? [unknown: 07]
00000051: e2 62 06 00 00     data 0x662
00000056: 40 c0 02           addr 0x1002c0
00000059: e2 04 0a 01 0a     data 0xa010a04
0000005e: 40 24 02           addr 0x100224
00000061: e2 0f 23 11 07     data 0x711230f
00000066: 40 20 02           addr 0x100220
00000069: e2 77 21 02 00     data 0x22177
0000006e: 40 1c 07           addr 0x10071c
00000071: e2 00 00 00 00     data 0
00000076: 40 3c 05           addr 0x10053c
00000079: 42 62 07           data 0x762
0000007c: 40 c0 02           addr 0x1002c0
0000007f: 42 62 06           data 0x662
00000082: 40 c0 02           addr 0x1002c0
00000085: 0b                 ??? [unknown: 0b]
00000086: d0                 ??? [unknown: d0]
00000087: 5f 00 00           unk5f
0000008a: 7f                 exit
0000008b: 7f                 exit


script10:

00000000: 5f 01 00           unk5f [unknown: 00 01 00]
00000003: 5f 01 01           unk5f [unknown: 00 01 01]
00000006: b0                 ??? [unknown: b0]
00000007: 5f 00 01           unk5f [unknown: 00 00 01]
0000000a: e2 83 db f0 2a     data 0x2af0db83
0000000f: e0 40 c0 00 00     addr 0xc040
00000014: e2 00 00 01 80     data 0x80010000
00000019: 40 20 40           addr 0x4020
0000001c: e2 83 db f0 2a     data 0x2af0db83
00000021: 40 40 c0           addr 0xc040
00000024: e2 00 00 12 a0     data 0xa0120000
00000029: 40 28 40           addr 0x4028
0000002c: e2 04 1b 00 00     data 0x1b04
00000031: 40 2c 40           addr 0x402c
00000034: 0e                 ??? [unknown: 0e]
00000035: e2 a3 db e0 2a     data 0x2ae0dba3
0000003a: 40 40 c0           addr 0xc040
0000003d: e2 10 00 00 00     data 0x10
00000042: 40 4c c0           addr 0xc04c
00000045: e2 a3 db e0 2a     data 0x2ae0dba3
0000004a: 40 40 c0           addr 0xc040
0000004d: d0                 ??? [unknown: d0]
0000004e: 5f 00 00           unk5f
00000051: 7f                 exit
00000052: 7f                 exit
00000053: 7f                 exit


script11:

00000000: 5f 01 01           unk5f [unknown: 00 01 01]
00000003: 5f 01 00           unk5f [unknown: 00 01 00]
00000006: e2 a3 db e0 2e     data 0x2ee0dba3
0000000b: e0 40 c0 00 00     addr 0xc040
00000010: 7f                 exit
00000011: 7f                 exit
00000012: 7f                 exit
00000013: 7f                 exit







--=-0U7OGdi9ZPXuYbwsdl9Z
Content-Disposition: attachment; filename="pms_translated.txt"
Content-Type: text/plain; name="pms_translated.txt"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

executing PMS script 1

0x61a80c = 0x100117
00                 
0x61a80c = 0x100117
05                 
0x61a80c = 0x0
exit


executing PMS script 2

0x61a00c = 0x1000a7
00                 
0x61a00c = 0x1000a7
05                 
0x61a00c = 0x0
exit


executing PMS script 3

0x611200 = 0x3300
0x2504 = 0x1
07                 
b0                 
5f 00 01           
0x1002d4 = 0x1
0x1002d0 = 0x1
0x1002d0 = 0x1
0x100210 = 0x0
0x1002dc = 0x1
0x400c = 0x2505
0x4008 = 0x8059e400
0d                 
0a                 
0x4008 = 0x8059e400
0x1002dc = 0x0
0x100210 = 0x80000000
07                 
0x1002c0 = 0xa62
0x100224 = 0xc010904
0x100220 = 0x6122a18
0x1002c0 = 0xb62
0x1002c0 = 0xa62
0b                 
d0                 
5f 00 00           
0x611200 = 0x3330
exit
exit
exit


executing PMS script 4
------------little bug here------

0a                 
exit
0x611200 = 0x3300
0x2504 = 0x1
07                 
b0                 
5f 00 01           
0x1002d4 = 0x1
0x1002d0 = 0x1
0x1002d0 = 0x1
0x100210 = 0x0
0x1002dc = 0x1
0x400c = 0x2505
0x4008 = 0x8059e400
0d                 
0a                 
0x4008 = 0x8059e400
0x1002dc = 0x0
0x100210 = 0x80000000
07                 
0x1002c0 = 0xa62
0x100224 = 0xc010904
0x100220 = 0x6122a18
0x1002c0 = 0xb62
0x1002c0 = 0xa62
0b                 
d0                 
5f 00 00           
0x611200 = 0x3330
exit



executing PMS script 5

0a                 
00                 


executing PMS script 6

0x611200 = 0x3300
07                 
b0                 
5f 00 01           
0xc040 = 0x2ef0db83
0x4020 = 0x80000000
0xc040 = 0x2ef0db83
0x4028 = 0xa0090000
0x402c = 0x1002
0e                 
0xc040 = 0x2ee0dba3
0xc04c = 0x10
0xc040 = 0x2ee0dba3
d0                 
5f 00 00           
0x611200 = 0x3330
exit
exit
exit
exit


executing PMS script 7

5f 01 00           
5f 01 01           
b0                 
5f 00 01           
0xc040 = 0x2ef0db83
0x4020 = 0x80000000
0xc040 = 0x2ef0db83
0x4028 = 0xa0090000
0x402c = 0xb02
0e                 
0xc040 = 0x2ee0dba3
0xc04c = 0x10
0xc040 = 0x2ee0dba3
d0                 
5f 00 00           
exit
exit
exit


executing PMS script 8

5f 01 01           
5f 01 00           
0xc040 = 0x2ae0dba3
exit
exit
exit
exit


executing PMS script 9


5f 01 01           
5f 01 00           
0x2504 = 0x1
06                 
b0                 
5f 00 01           
0x1002d4 = 0x1
0x1002d0 = 0x1
0x1002d0 = 0x1
0x100210 = 0x0
0x1002dc = 0x1
0x4008 = 0x8002e600
0x4008 = 0x8018e200
0x1002dc = 0x0
0x100210 = 0x80000000
07                 
0x1002c0 = 0x662
0x100224 = 0xa010a04
0x100220 = 0x711230f
0x10071c = 0x22177
0x10053c = 0x0
0x1002c0 = 0x762
0x1002c0 = 0x662
0b                 
d0                 
5f 00 00           
exit
exit


executing PMS script 10

5f 01 00           
5f 01 01           
b0                 
5f 00 01           
0xc040 = 0x2af0db83
0x4020 = 0x80010000
0xc040 = 0x2af0db83
0x4028 = 0xa0120000
0x402c = 0x1b04
0e                 
0xc040 = 0x2ae0dba3
0xc04c = 0x10
0xc040 = 0x2ae0dba3
d0                 
5f 00 00           
exit
exit
exit


executing PMS script 11

5f 01 01           
5f 01 00           
0xc040 = 0x2ee0dba3
exit
exit
exit
exit







--=-0U7OGdi9ZPXuYbwsdl9Z
Content-Disposition: attachment; filename="pms_exec.py"
Content-Type: text/x-python; name="pms_exec.py"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

#! /usr/bin/env python

import fileinput
import re
import os
import sys

command_pattern = re.compile(".*(data|addr|exit) ?(0x.*|[0-9]*|)?")
unknown_pattern = re.compile("[0-9|a-f]:\ *(.*)(\?\?\?|unk5f)")

for line in fileinput.input():

    script_number = 0

    #start of new script
    if "script" in line:
           script_number = int(line.split("script")[1][:-2])
           print "executing PMS script %d" % script_number

           address = 0xFFFFFFFF
           value= 0xFFFFFFFF
           continue


    match = command_pattern.search(line)
    if match:
        if match.groups()[0] == "data":
                value = int(match.groups()[1], 0)
        elif match.groups()[0] == "addr":
                address = int(match.groups()[1], 0)
                print "0x%x = 0x%x" % (address, value)
        elif match.groups()[0] == "exit":
                print "exit"

        continue



    match = unknown_pattern.search(line)
    if match:
            print match.groups()[0]
            continue

    sys.stdout.write(line)
    continue


"""
            answer = raw_input("do you want to: %s :" % execstring)

            if answer == "no":
                continue

            print "executing %s" % execstring            

            os.system(execstring)
"""


--=-0U7OGdi9ZPXuYbwsdl9Z
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-0U7OGdi9ZPXuYbwsdl9Z--
