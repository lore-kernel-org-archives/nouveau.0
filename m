From: =?utf-8?q?K=C4=81rlis_Repsons?= <k@11.lv>
Subject: Re: 2 cards in, but work only separately
Date: Sun, 1 Aug 2010 08:59:28 +0000
Message-ID: <201008010859.40932.k@11.lv>
References: <201007312208.33260.k@11.lv>
	<20100801114104.43f1b5e4@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1558392146=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100801114104.43f1b5e4-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1558392146==
Content-Type: multipart/signed;
  boundary="nextPart2313994.YQQulfyc3r";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2313994.YQQulfyc3r
Content-Type: multipart/mixed;
  boundary="Boundary-01=_wdTVMXUnnY6AJjO"
Content-Transfer-Encoding: 7bit


--Boundary-01=_wdTVMXUnnY6AJjO
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 01 August 2010 08:41:04 Pekka Paalanen wrote:
> On Sat, 31 Jul 2010 22:08:23 +0000
>=20
> K=C4=81rlis Repsons <k@11.lv> wrote:
> > Hi list,
> > my thanks to developers of nouveau first: I wonder how you put it
> > together this far, where there's quite enough to appreciate!
> >=20
> > This question I have: strangely I can get each of 2 cards to work
> > separately for a dualseat PC by toggling on/off fbcon=3Dmap: kernel
> > option (compiled with CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY)
> > -- by doing so I can have each card initialized and start it's
> > Xorg, all welll, but can't have both cards initialized (and thus
> > used) -- why?
> >=20
> > In very short, this is what my dmesg says:
> > [drm] Initialized drm 1.1.0 20060810
> > nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> > [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
> > minor 0 nouveau 0000:04:00.0: enabling device (0000 -> 0002)
> > nouveau 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> > nouveau 0000:04:00.0: PCI INT A disabled
> > nouveau: probe of 0000:04:00.0 failed with error -12
>=20
> Is this really a continuous section of the kernel log, no
> lines removed from between?
No, I removed! See all in attach!

> What versions of the Nouveau components and the kernel you have?
> What cards do you have?
Linux 2.6.34-gentoo-r2 (no DRM or nouveau driver in);

nouveau-drm 20100520 from portage (gives me ch7006.ko drm_kms_helper.ko drm=
=2Eko=20
nouveau.ko ttm.ko);

GeForce 7300GS, GeForce 6200LE!

--Boundary-01=_wdTVMXUnnY6AJjO
Content-Type: text/plain;
  charset="UTF-8";
  name="cardcrash.all"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="cardcrash.all"

...
[drm] Initialized drm 1.1.0 20060810
rtc_cmos 00:03: RTC can wake from S4
rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x046f00a3)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 05.72.22.43
[drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02011310 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 01011312 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0c080
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
[drm] nouveau 0000:01:00.0:   0: 0x00000000: type 0x00 idx 0 tag 0xff
[drm] nouveau 0000:01:00.0:   1: 0x00002130: type 0x30 idx 1 tag 0x08
[drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xE0F0
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xE41F
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xE9BD
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEB38
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xED91
[drm] nouveau 0000:01:00.0: Detected 256MiB VRAM
[TTM] Zone  kernel: Available graphics memory: 4093048 kiB.
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB.
[drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
mtrr: type mismatch for c0000000,10000000 old: write-back new: write-combining
[drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:01:00.0: Initial CRTC_OWNER is 0
[drm] nouveau 0000:01:00.0: Saving VGA fonts
[drm] nouveau 0000:01:00.0: Detected a VGA connector
[drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[drm] nouveau 0000:01:00.0: Detected a TV connector
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 1)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 3)
[drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x49000, bo ffff88023ed4d000
fbcon: nouveaufb (fb0) is primary device
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output A
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using output A
[drm] nouveau 0000:01:00.0: 0xD4A0: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1 using output A
Console: switching to colour frame buffer device 160x64
fb0: nouveaufb frame buffer device
registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
nouveau 0000:04:00.0: enabling device (0000 -> 0002)
nouveau 0000:04:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:04:00.0: setting latency timer to 64
[drm] nouveau 0000:04:00.0: Detected an NV40 generation card (0x044300b2)
[drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:04:00.0: ... appears to be valid
[drm] nouveau 0000:04:00.0: BIT BIOS found
[drm] nouveau 0000:04:00.0: Bios version 05.44.02.67
[drm] nouveau 0000:04:00.0: BIT table 'd' not found
[drm] nouveau 0000:04:00.0: Found Display Configuration Block version 3.0
[drm] nouveau 0000:04:00.0: Raw DCB entry 0: 01000300 00000028
[drm] nouveau 0000:04:00.0: Raw DCB entry 1: 02011310 00000028
[drm] nouveau 0000:04:00.0: Raw DCB entry 2: 01011312 00000000
[drm] nouveau 0000:04:00.0: Raw DCB entry 3: 020223f1 0080c020
[drm] nouveau 0000:04:00.0: DCB connector table: VHER 0x30 5 7 2
[drm] nouveau 0000:04:00.0:   0: 0x00000000: type 0x00 idx 0 tag 0xff
[drm] nouveau 0000:04:00.0:   1: 0x00001130: type 0x30 idx 1 tag 0x07
[drm] nouveau 0000:04:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xDCEA
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xE04F
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xE589
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xE6DE
[drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xE888
[drm] nouveau 0000:04:00.0: Detected 0MiB VRAM
nouveau 0000:04:00.0: PCI INT A disabled
nouveau: probe of 0000:04:00.0 failed with error -12
...

--Boundary-01=_wdTVMXUnnY6AJjO--

--nextPart2313994.YQQulfyc3r
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAkxVN3wACgkQHuSu329e3GEygQCgvSOK1rdOVErGzFSBgEVXjTv7
0oQAn0ogFZC3ih1j117mhBE4seTybw/U
=euMH
-----END PGP SIGNATURE-----

--nextPart2313994.YQQulfyc3r--

--===============1558392146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1558392146==--
