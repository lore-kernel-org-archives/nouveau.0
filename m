From: Audio Phile <da_audiophile-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: gnome-shell crashes with nouveau and my new 450 GTS
Date: Fri, 5 Aug 2011 15:04:12 -0700 (PDT)
Message-ID: <1312581852.20145.YahooMailNeo@web36603.mail.mud.yahoo.com>
Reply-To: Audio Phile <da_audiophile-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Trying to use nouveau w/ gnome-shell and a new 450 GTS on Arch Linux.=A0 Fi=
rstly, =

gnome-shell enters fallback mode upon login.=A0 Secondly, whenever I try =

to open a shell or a program such as firefox, gnome fallback mode =

crashes me back to gdm.=A0 I'm not sure what to post log-wise, but here is =
a start.=A0 Thanks in advance for any advice!


Xorg.0.log is here: http://pastebin.com/m4Mk6VJy
$ dmesg | grep nouv
[    5.593900] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IR=
Q 16
[    5.593905] nouveau 0000:01:00.0: setting latency timer to 64
[    5.595084] [drm] nouveau 0000:01:00.0: Detected an NVc0 generation card=
 (0x0c3200a1)
[    5.595090] fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing =
generic driver
[    5.599268] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image fr=
om PRAMIN
[    5.655781] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    5.655783] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    5.655785] [drm] nouveau 0000:01:00.0: Bios version 70.06.13.00
[    5.655786] [drm] nouveau 0000:01:00.0: Pointer to BIT loadval table inv=
alid
[    5.655791] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    5.655793] [drm] nouveau 0000:01:00.0: Found Display Configuration Bloc=
k version 4.0
[    5.655795] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 02000300 000000=
00
[    5.655796] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01000302 000200=
30
[    5.655798] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 08011382 000200=
30
[    5.655799] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 04022310 000200=
30
[    5.655800] [drm] nouveau 0000:01:00.0: Raw DCB entry 4: 02033362 000200=
10
[    5.655802] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5=
 16 4
[    5.655804] [drm] nouveau 0000:01:00.0:   0: 0x00001030: type 0x30 idx 0=
 tag 0x07
[    5.655806] [drm] nouveau 0000:01:00.0:   1: 0x00010131: type 0x31 idx 1=
 tag 0x51
[    5.655808] [drm] nouveau 0000:01:00.0:   2: 0x00000200: type 0x00 idx 2=
 tag 0xff
[    5.655809] [drm] nouveau 0000:01:00.0:   3: 0x00002361: type 0x61 idx 3=
 tag 0x08
[    5.655812] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at of=
fset 0x6804
[    5.685944] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at of=
fset 0x6EF8
[    5.698694] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at of=
fset 0x80EC
[    5.698696] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at of=
fset 0x80F6
[    5.698746] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at of=
fset 0x82CB
[    5.698747] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offs=
et 0x8330
[    5.718755] [drm] nouveau 0000:01:00.0: 0x8330: Condition still not met =
after 20ms, skipping following opcodes
[    5.718762] [drm] nouveau 0000:01:00.0: voltage table 0x40 unknown
[    5.737503] [drm] nouveau 0000:01:00.0: 3 available performance level(s)
[    5.737506] [drm] nouveau 0000:01:00.0: 0: memory 135MHz core 50MHz shad=
er 101MHz timing 2
[    5.737508] [drm] nouveau 0000:01:00.0: 1: memory 324MHz core 405MHz sha=
der 810MHz voltage 10mV timing 1
[    5.737511] [drm] nouveau 0000:01:00.0: 3: memory 2000MHz core 930MHz sh=
ader 1860MHz voltage 20mV timing 3
[    5.737584] [drm] nouveau 0000:01:00.0: Detected 1024MiB VRAM
[    5.739691] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    5.741676] [drm] nouveau 0000:01:00.0: failed to load fuc409c
[    6.007900] [drm] nouveau 0000:01:00.0: allocated 1920x1080 fb: 0x802000=
0, bo ffff880220d17800
[    6.007939] fbcon: nouveaufb (fb0) is primary device
[    6.053430] fb0: nouveaufb frame buffer device
[    6.053435] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 o=
n minor 0

Xorg.0.log is here: http://pastebin.com/m4Mk6VJy
