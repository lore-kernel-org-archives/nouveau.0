From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Sun, 12 Oct 2014 11:51:36 +0000
Message-ID: <bug-82835-8800-DzDT2PYj8p@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1935267581=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1935267581==
Content-Type: multipart/alternative; boundary="1413114696.8BA1fdd2.3647"; charset="UTF-8"


--1413114696.8BA1fdd2.3647
Date: Sun, 12 Oct 2014 11:51:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

ppine-KK0ffGbhmjU@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #14 from ppine-KK0ffGbhmjU@public.gmane.org ---
(In reply to Andrew Randrianasulu from comment #10)
> Created attachment 105647 [details]
> dmesg again, after some system use (but ends up with usual hang with mplayer)

Same problem here when trying to use vdpau on a G92 card:

[   97.501981] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT -
Address 0020406c40
[   97.501991] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00500010, e20: 00001100, e24: 00030000
[   97.502006] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - RT_FAULT -
Address 0020405000
[   97.502010] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00340000, e20: 00001100, e24: 00030000
[   97.502024] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - RT_FAULT -
Address 0020405040
[   97.502028] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - e0c:
00000000, e18: 00000000, e1c: 00340010, e20: 00001100, e24: 00030000
[   97.502041] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - RT_FAULT -
Address 0020405080
[   97.502045] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - e0c:
00000000, e18: 00000000, e1c: 00340020, e20: 00001100, e24: 00030000
[   97.502058] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - RT_FAULT -
Address 00204050c0
[   97.502062] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - e0c:
00000000, e18: 00000000, e1c: 00340030, e20: 00001100, e24: 00030000
[   97.502075] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - RT_FAULT -
Address 0020405c40
[   97.502079] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - e0c:
00000000, e18: 00000000, e1c: 00400010, e20: 00001100, e24: 00030000
[   97.502093] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - RT_FAULT -
Address 0020405c80
[   97.502097] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - e0c:
00000000, e18: 00000000, e1c: 00400020, e20: 00001100, e24: 00030000
[   97.502111] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - RT_FAULT -
Address 0020406c00
[   97.502115] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - e0c:
00000000, e18: 00000000, e1c: 00500000, e20: 00001100, e24: 00030000
[   97.502120] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f764000
mplayer[4940]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
[   97.502135] nouveau E[     PFB][0000:01:00.0] trapped write at 0x0020405c40
on channel 0x0001f764 [mplayer[4940]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
[   97.524623] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT -
Address 00204f6f40
[   97.524633] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 0f530018, e20: 00001100, e24: 00030000
[   97.524643] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - RT_FAULT -
Address 002040dc40
[   97.524649] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00800010, e20: 00001100, e24: 00030000
[   97.524658] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - RT_FAULT -
Address 002040c000
[   97.524663] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - e0c:
00000000, e18: 00000000, e1c: 00640000, e20: 00001100, e24: 00030000
[   97.524673] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - RT_FAULT -
Address 002040c040
[   97.524677] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - e0c:
00000000, e18: 00000000, e1c: 00640010, e20: 00001100, e24: 00030000
[   97.524691] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - RT_FAULT -
Address 002040c080
[   97.524696] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - e0c:
00000000, e18: 00000000, e1c: 00640020, e20: 00001100, e24: 00030000
[   97.524709] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - RT_FAULT -
Address 002040c0c0
[   97.524715] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - e0c:
00000000, e18: 00000000, e1c: 00640030, e20: 00001100, e24: 00030000
[   97.524726] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - RT_FAULT -
Address 002040cc40
[   97.524730] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - e0c:
00000000, e18: 00000000, e1c: 00700010, e20: 00001100, e24: 00030000
[   97.524742] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - RT_FAULT -
Address 002040cc80
[   97.524746] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - e0c:
00000000, e18: 00000000, e1c: 00700020, e20: 00001100, e24: 00030000
[   97.524751] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f764000
mplayer[4940]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
[   97.524764] nouveau E[     PFB][0000:01:00.0] trapped write at 0x002040c0c0
on channel 0x0001f764 [mplayer[4940]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
[   97.547931] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT -
Address 00411a0080
[   97.547940] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 0ba00020, e20: 00001100, e24: 00030000
[   97.547947] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - RT_FAULT -
Address 00411a00c0
[   97.547951] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 0ba00030, e20: 00001100, e24: 00030000
[   97.547957] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - RT_FAULT -
Address 00411a1040
[   97.547961] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - e0c:
00000000, e18: 00000000, e1c: 0bb00010, e20: 00001100, e24: 00030000
[   97.547967] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - RT_FAULT -
Address 00411a1080
[   97.547971] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - e0c:
00000000, e18: 00000000, e1c: 0bb00020, e20: 00001100, e24: 00030000
[   97.547977] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - RT_FAULT -
Address 00411a10c0
[   97.547981] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - e0c:
00000000, e18: 00000000, e1c: 0bb00030, e20: 00001100, e24: 00030000
[   97.547987] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - RT_FAULT -
Address 00411a2040
[   97.547990] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - e0c:
00000000, e18: 00000000, e1c: 0bc00010, e20: 00001100, e24: 00030000
[   97.547997] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - RT_FAULT -
Address 00411a0000
[   97.548000] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - e0c:
00000000, e18: 00000000, e1c: 0ba00000, e20: 00001100, e24: 00030000
[   97.548007] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - RT_FAULT -
Address 00411a0040
[   97.548010] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - e0c:
00000000, e18: 00000000, e1c: 0ba00010, e20: 00001100, e24: 00030000
[   97.548014] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f764000
mplayer[4940]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
[   97.548023] nouveau E[     PFB][0000:01:00.0] trapped write at 0x00411a00c0
on channel 0x0001f764 [mplayer[4940]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
[   98.012191] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.014850] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.017503] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.019831] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.022160] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.024484] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.027134] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.029456] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.032105] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.034430] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.036757] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.039407] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.042056] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.044706] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.047028] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.049349] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.051676] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.053997] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.056647] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.059296] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.061946] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.063939] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.065933] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.068587] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.071237] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.073559] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.076208] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.078530] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.080851] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.083173] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.085531] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.088181] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.090175] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.092169] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.094490] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.096812] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.099461] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.102116] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.104765] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.107415] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.109737] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.112387] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.114709] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.117358] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.119684] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.122009] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.124335] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.126657] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.128979] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.131300] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.133622] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.136278] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.138271] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.140593] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.142915] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.145564] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.148214] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.150863] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.153518] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.155839] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.157833] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.160483] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.162804] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.165454] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.168104] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.170758] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.173408] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.176057] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.178379] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.180373] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.183022] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.185677] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.187999] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.190323] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.192645] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.195294] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.197616] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.199937] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.202264] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.204914] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.207563] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.210213] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.212534] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.214856] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.216849] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.218848] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.221499] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.223497] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.226150] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.228800] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.231450] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.233772] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.236100] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.238422] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.240744] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.243066] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.245716] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.248037] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.250031] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.252686] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.255007] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.257329] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.259979] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.262628] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.265278] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.267602] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.269928] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.272578] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.274900] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.277222] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.279543] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.281865] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.284515] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.285197] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[  117.790892] nouveau E[mplayer[4940]] failed to idle channel 0xcccc0002
[mplayer[4940]]
[  132.790675] nouveau E[mplayer[4940]] failed to idle channel 0xcccc0002
[mplayer[4940]]
[  134.790691] nouveau E[   PFIFO][0000:01:00.0] channel 7 [mplayer[4940]]
unload timeout
[  134.790791] nouveau E[     PFB][0000:01:00.0] trapped write at 0x0020312074
on channel 0x0001f6cd [unknown] PFIFO/PFIFO_READ/SEMAPHORE reason:
PAGE_NOT_PRESENT
[  134.800392] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0000000000
on channel 0x0001f6cd [unknown] PVP/PVP/0f reason: DMAOBJ_LIMIT
[  165.117942] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  240.385122] nouveau E[Xorg.bin[1541]] failed to idle channel 0xcccc0001
[Xorg.bin[1541]]

Then the complete box just freezes up after a while.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413114696.8BA1fdd2.3647
Date: Sun, 12 Oct 2014 11:51:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ppine&#64;gmx.com" title="ppine&#64;gmx.com">ppine&#64;gmx.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:ppine&#64;gmx.com" title="ppine&#64;gmx.com">ppine&#64;gmx.com</a>
</span></b>
        <pre>(In reply to Andrew Randrianasulu from <a href="show_bug.cgi?id=82835#c10">comment #10</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=105647" name="attach_105647" title="dmesg again, after some system use (but ends up with usual hang with mplayer)">attachment 105647</a> <a href="attachment.cgi?id=105647&amp;action=edit" title="dmesg again, after some system use (but ends up with usual hang with mplayer)">[details]</a></span>
&gt; dmesg again, after some system use (but ends up with usual hang with mplayer)</span >

Same problem here when trying to use vdpau on a G92 card:

[   97.501981] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT -
Address 0020406c40
[   97.501991] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00500010, e20: 00001100, e24: 00030000
[   97.502006] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - RT_FAULT -
Address 0020405000
[   97.502010] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00340000, e20: 00001100, e24: 00030000
[   97.502024] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - RT_FAULT -
Address 0020405040
[   97.502028] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - e0c:
00000000, e18: 00000000, e1c: 00340010, e20: 00001100, e24: 00030000
[   97.502041] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - RT_FAULT -
Address 0020405080
[   97.502045] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - e0c:
00000000, e18: 00000000, e1c: 00340020, e20: 00001100, e24: 00030000
[   97.502058] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - RT_FAULT -
Address 00204050c0
[   97.502062] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - e0c:
00000000, e18: 00000000, e1c: 00340030, e20: 00001100, e24: 00030000
[   97.502075] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - RT_FAULT -
Address 0020405c40
[   97.502079] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - e0c:
00000000, e18: 00000000, e1c: 00400010, e20: 00001100, e24: 00030000
[   97.502093] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - RT_FAULT -
Address 0020405c80
[   97.502097] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - e0c:
00000000, e18: 00000000, e1c: 00400020, e20: 00001100, e24: 00030000
[   97.502111] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - RT_FAULT -
Address 0020406c00
[   97.502115] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - e0c:
00000000, e18: 00000000, e1c: 00500000, e20: 00001100, e24: 00030000
[   97.502120] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f764000
mplayer[4940]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
[   97.502135] nouveau E[     PFB][0000:01:00.0] trapped write at 0x0020405c40
on channel 0x0001f764 [mplayer[4940]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
[   97.524623] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT -
Address 00204f6f40
[   97.524633] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 0f530018, e20: 00001100, e24: 00030000
[   97.524643] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - RT_FAULT -
Address 002040dc40
[   97.524649] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00800010, e20: 00001100, e24: 00030000
[   97.524658] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - RT_FAULT -
Address 002040c000
[   97.524663] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - e0c:
00000000, e18: 00000000, e1c: 00640000, e20: 00001100, e24: 00030000
[   97.524673] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - RT_FAULT -
Address 002040c040
[   97.524677] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - e0c:
00000000, e18: 00000000, e1c: 00640010, e20: 00001100, e24: 00030000
[   97.524691] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - RT_FAULT -
Address 002040c080
[   97.524696] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - e0c:
00000000, e18: 00000000, e1c: 00640020, e20: 00001100, e24: 00030000
[   97.524709] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - RT_FAULT -
Address 002040c0c0
[   97.524715] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - e0c:
00000000, e18: 00000000, e1c: 00640030, e20: 00001100, e24: 00030000
[   97.524726] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - RT_FAULT -
Address 002040cc40
[   97.524730] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - e0c:
00000000, e18: 00000000, e1c: 00700010, e20: 00001100, e24: 00030000
[   97.524742] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - RT_FAULT -
Address 002040cc80
[   97.524746] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - e0c:
00000000, e18: 00000000, e1c: 00700020, e20: 00001100, e24: 00030000
[   97.524751] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f764000
mplayer[4940]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
[   97.524764] nouveau E[     PFB][0000:01:00.0] trapped write at 0x002040c0c0
on channel 0x0001f764 [mplayer[4940]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
[   97.547931] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - RT_FAULT -
Address 00411a0080
[   97.547940] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 0ba00020, e20: 00001100, e24: 00030000
[   97.547947] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - RT_FAULT -
Address 00411a00c0
[   97.547951] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 0ba00030, e20: 00001100, e24: 00030000
[   97.547957] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - RT_FAULT -
Address 00411a1040
[   97.547961] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 2 - e0c:
00000000, e18: 00000000, e1c: 0bb00010, e20: 00001100, e24: 00030000
[   97.547967] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - RT_FAULT -
Address 00411a1080
[   97.547971] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 3 - e0c:
00000000, e18: 00000000, e1c: 0bb00020, e20: 00001100, e24: 00030000
[   97.547977] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - RT_FAULT -
Address 00411a10c0
[   97.547981] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 4 - e0c:
00000000, e18: 00000000, e1c: 0bb00030, e20: 00001100, e24: 00030000
[   97.547987] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - RT_FAULT -
Address 00411a2040
[   97.547990] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 5 - e0c:
00000000, e18: 00000000, e1c: 0bc00010, e20: 00001100, e24: 00030000
[   97.547997] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - RT_FAULT -
Address 00411a0000
[   97.548000] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 6 - e0c:
00000000, e18: 00000000, e1c: 0ba00000, e20: 00001100, e24: 00030000
[   97.548007] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - RT_FAULT -
Address 00411a0040
[   97.548010] nouveau E[  PGRAPH][0000:01:00.0] TRAP_PROP - TP 7 - e0c:
00000000, e18: 00000000, e1c: 0ba00010, e20: 00001100, e24: 00030000
[   97.548014] nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x001f764000
mplayer[4940]] subc 3 class 0x8297 mthd 0x1b0c data 0x1000f010
[   97.548023] nouveau E[     PFB][0000:01:00.0] trapped write at 0x00411a00c0
on channel 0x0001f764 [mplayer[4940]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
[   98.012191] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.014850] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.017503] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.019831] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.022160] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.024484] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.027134] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.029456] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.032105] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.034430] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.036757] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.039407] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.042056] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.044706] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.047028] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.049349] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.051676] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.053997] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.056647] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.059296] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.061946] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.063939] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.065933] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.068587] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.071237] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.073559] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.076208] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.078530] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.080851] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.083173] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.085531] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.088181] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.090175] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.092169] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.094490] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.096812] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.099461] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.102116] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.104765] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.107415] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.109737] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.112387] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.114709] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.117358] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.119684] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.122009] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.124335] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.126657] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.128979] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.131300] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.133622] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.136278] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.138271] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.140593] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.142915] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.145564] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.148214] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.150863] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.153518] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.155839] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.157833] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.160483] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.162804] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.165454] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.168104] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.170758] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.173408] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.176057] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.178379] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.180373] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.183022] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.185677] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.187999] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.190323] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.192645] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.195294] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.197616] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.199937] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.202264] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.204914] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.207563] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.210213] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.212534] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.214856] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.216849] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.218848] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.221499] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.223497] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.226150] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.228800] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.231450] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.233772] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.236100] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.238422] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.240744] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.243066] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.245716] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.248037] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.250031] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.252686] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[   98.255007] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.257329] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.259979] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.262628] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.265278] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.267602] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.269928] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fc28
[   98.272578] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.274900] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.277222] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.279543] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.281865] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.284515] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x00fd0c
[   98.285197] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000004 FAULT
at 0x00fd0c
[  117.790892] nouveau E[mplayer[4940]] failed to idle channel 0xcccc0002
[mplayer[4940]]
[  132.790675] nouveau E[mplayer[4940]] failed to idle channel 0xcccc0002
[mplayer[4940]]
[  134.790691] nouveau E[   PFIFO][0000:01:00.0] channel 7 [mplayer[4940]]
unload timeout
[  134.790791] nouveau E[     PFB][0000:01:00.0] trapped write at 0x0020312074
on channel 0x0001f6cd [unknown] PFIFO/PFIFO_READ/SEMAPHORE reason:
PAGE_NOT_PRESENT
[  134.800392] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0000000000
on channel 0x0001f6cd [unknown] PVP/PVP/0f reason: DMAOBJ_LIMIT
[  165.117942] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  240.385122] nouveau E[Xorg.bin[1541]] failed to idle channel 0xcccc0001
[Xorg.bin[1541]]

Then the complete box just freezes up after a while.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413114696.8BA1fdd2.3647--

--===============1935267581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1935267581==--
