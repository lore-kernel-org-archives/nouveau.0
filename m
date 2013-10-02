From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68488] [NV86] Lockup and reboot on T61 with nouveau
	driver/exa
Date: Wed, 02 Oct 2013 16:11:08 +0000
Message-ID: <bug-68488-8800-RVnCAo831A@http.bugs.freedesktop.org/>
References: <bug-68488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0696576978=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0696576978==
Content-Type: multipart/alternative; boundary="1380730268.d7Cac2.27860"; charset="us-ascii"


--1380730268.d7Cac2.27860
Date: Wed, 2 Oct 2013 16:11:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68488

--- Comment #7 from Andre Klapper <a9016009-Mmb7MZpHnFY@public.gmane.org> ---
And /var/log/messages happily fills up with lots of register output such as 

[...]
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x20217000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x000567fe
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x1000f010
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: kernel rejected
pushbuf: Cannot allocate memory
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: krec 0 pushes 1
bufs 89 relocs 0
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000000
00000005 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000001
0000007d 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000002
00000007 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000003
0000000a 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000004
0000000b 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000005
00000008 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000006
00000006 00000004 00000000 00000004
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000007
00000085 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000008
00000013 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000009
0000000d 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000a
00000080 00000004 00000004 00000000
Oct  2 17:43:37 localhost kernel: [17040.182503] nouveau E[gnome-shell[1914]]
fail ttm_validate
Oct  2 17:43:37 localhost kernel: [17040.182509] nouveau E[gnome-shell[1914]]
validate vram_list
Oct  2 17:43:37 localhost kernel: [17040.182547] nouveau E[gnome-shell[1914]]
validate: -12
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000b
000000b7 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000c
000000d8 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000d
00000025 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000e
0000002a 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000f
00000047 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000010
00000383 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000011
0000001c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000012
00000026 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000013
000000c8 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000014
0000001b 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000015
00000021 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000016
00000027 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000017
0000002b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000018
00000028 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000019
0000002c 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001a
00000048 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001b
0000005a 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001c
0000002d 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001d
0000003a 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001e
0000004d 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001f
0000002f 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000020
00000032 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000021
0000003b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000022
00000039 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000023
0000003f 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000024
0000004e 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000025
00000023 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000026
00000045 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000027
0000001f 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000028
00000024 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000029
00000049 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002a
00000042 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002b
0000004b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002c
00000020 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002d
00000068 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002e
00000075 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002f
00000079 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000030
00000069 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000031
00000076 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000032
0000007a 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000033
00000077 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000034
0000007b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000035
0000006a 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000036
0000001d 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000037
00000037 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000038
0000001e 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000039
00000035 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003a
00000038 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003b
00000036 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003c
00000056 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003d
00000030 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003e
0000006c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003f
00000072 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000040
00000067 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000041
0000006d 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000042
00000073 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000043
0000006e 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000044
00000074 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000045
0000006b 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000046
00000044 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000047
00000040 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000048
0000005d 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000049
00000053 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004a
0000005b 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004b
00000064 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004c
0000005c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004d
00000065 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004e
00000059 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004f
00000033 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000050
00000057 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000051
00000034 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000052
0000004c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000053
00000058 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000054
0000006f 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000055
0000007c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000056
00000082 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000057
00000016 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000058
0000003d 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: psh 00000000
000003e628 00000477a8
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x0004721c
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x0fac6881
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x00086ff4
[...]
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00046110
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00000000
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00107b00
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00000000
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x20217000
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00056fce
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x1000f010
Oct  2 17:47:28 localhost kernel: [17271.689815] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:28 localhost kernel: [17271.859879] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007c23
[gnome-shell[1914]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:29 localhost kernel: [17272.830294] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
[...]
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost kernel: [17273.185573] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007c23
[gnome-shell[1914]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:30 localhost kernel: [17273.884499] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:31 localhost kernel: [17274.554005] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007c23
[gnome-shell[1914]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:45 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
Oct  2 17:47:45 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:45 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
[...]
Oct  2 17:48:15 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:48:15 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:48:24 localhost kernel: [17326.953986] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:48:28 localhost kernel: [17331.382475] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:48:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
Oct  2 17:48:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:48:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
[...]
Oct  2 17:52:00 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:52:00 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:52:00 localhost kernel: [17543.175447] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEX

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380730268.d7Cac2.27860
Date: Wed, 2 Oct 2013 16:11:08 +0000
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
   title="NEW --- - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488">bug 68488</a>
              from <span class="vcard"><a class="email" href="mailto:a9016009&#64;gmx.de" title="Andre Klapper &lt;a9016009&#64;gmx.de&gt;"> <span class="fn">Andre Klapper</span></a>
</span></b>
        <pre>And /var/log/messages happily fills up with lots of register output such as 

[...]
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x20217000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x000567fe
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x1000f010
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: kernel rejected
pushbuf: Cannot allocate memory
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: krec 0 pushes 1
bufs 89 relocs 0
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000000
00000005 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000001
0000007d 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000002
00000007 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000003
0000000a 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000004
0000000b 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000005
00000008 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000006
00000006 00000004 00000000 00000004
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000007
00000085 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000008
00000013 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000009
0000000d 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000a
00000080 00000004 00000004 00000000
Oct  2 17:43:37 localhost kernel: [17040.182503] nouveau E[gnome-shell[1914]]
fail ttm_validate
Oct  2 17:43:37 localhost kernel: [17040.182509] nouveau E[gnome-shell[1914]]
validate vram_list
Oct  2 17:43:37 localhost kernel: [17040.182547] nouveau E[gnome-shell[1914]]
validate: -12
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000b
000000b7 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000c
000000d8 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000d
00000025 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000e
0000002a 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000000f
00000047 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000010
00000383 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000011
0000001c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000012
00000026 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000013
000000c8 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000014
0000001b 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000015
00000021 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000016
00000027 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000017
0000002b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000018
00000028 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000019
0000002c 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001a
00000048 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001b
0000005a 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001c
0000002d 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001d
0000003a 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001e
0000004d 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000001f
0000002f 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000020
00000032 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000021
0000003b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000022
00000039 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000023
0000003f 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000024
0000004e 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000025
00000023 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000026
00000045 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000027
0000001f 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000028
00000024 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000029
00000049 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002a
00000042 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002b
0000004b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002c
00000020 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002d
00000068 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002e
00000075 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000002f
00000079 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000030
00000069 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000031
00000076 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000032
0000007a 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000033
00000077 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000034
0000007b 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000035
0000006a 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000036
0000001d 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000037
00000037 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000038
0000001e 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000039
00000035 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003a
00000038 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003b
00000036 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003c
00000056 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003d
00000030 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003e
0000006c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000003f
00000072 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000040
00000067 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000041
0000006d 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000042
00000073 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000043
0000006e 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000044
00000074 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000045
0000006b 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000046
00000044 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000047
00000040 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000048
0000005d 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000049
00000053 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004a
0000005b 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004b
00000064 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004c
0000005c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004d
00000065 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004e
00000059 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 0000004f
00000033 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000050
00000057 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000051
00000034 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000052
0000004c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000053
00000058 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000054
0000006f 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000055
0000007c 00000002 00000002 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000056
00000082 00000002 00000000 00000002
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000057
00000016 00000004 00000004 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: buf 00000058
0000003d 00000002 00000002 00000000
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: ch0: psh 00000000
000003e628 00000477a8
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x0004721c
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x0fac6881
Oct  2 17:43:37 localhost gnome-session[1648]: nouveau: #0110x00086ff4
[...]
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00046110
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00000000
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00107b00
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00000000
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x20217000
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x00056fce
Oct  2 17:47:25 localhost gnome-session[1648]: nouveau: #0110x1000f010
Oct  2 17:47:28 localhost kernel: [17271.689815] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:28 localhost kernel: [17271.859879] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007c23
[gnome-shell[1914]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:29 localhost kernel: [17272.830294] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
[...]
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:30 localhost kernel: [17273.185573] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007c23
[gnome-shell[1914]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:30 localhost kernel: [17273.884499] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:31 localhost kernel: [17274.554005] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007c23
[gnome-shell[1914]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:47:45 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
Oct  2 17:47:45 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:47:45 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
[...]
Oct  2 17:48:15 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:48:15 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:48:24 localhost kernel: [17326.953986] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:48:28 localhost kernel: [17331.382475] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEXTURE/00 reason: PT_NOT_PRESENT
Oct  2 17:48:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_editable: assertion `CLUTTER_IS_TEXT
(self)' failed
Oct  2 17:48:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:48:30 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
[...]
Oct  2 17:52:00 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_get_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:52:00 localhost gnome-session[1648]: (gnome-shell:1914):
Clutter-CRITICAL **: clutter_text_set_text: assertion `CLUTTER_IS_TEXT (self)'
failed
Oct  2 17:52:00 localhost kernel: [17543.175447] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x20ff202000 on channel 0x00007b13
[Xorg[1156]] PGRAPH/TEX</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380730268.d7Cac2.27860--

--===============0696576978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0696576978==--
