From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
	Panic with fbset
Date: Thu, 09 Dec 2010 16:38:07 +0100
Message-ID: <8762v3ards.fsf@riseup.net>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101205133804.5430594f@daedalus.pq.iki.fi>
	<20101206011231.GC4122@localhost2.local>
	<20101208093458.GA11429@localhost2.local>
	<20101208122300.GA4480@localhost2.local>
	<20101209004202.GA4477@localhost2.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614327552=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101209004202.GA4477-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org> (Roger's message of
	"Wed, 8 Dec 2010 15:42:02 -0900")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1614327552==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> I think I've found the problem.
>
> # echo "option nouveau noagp=1" >> /etc/modprobe.d/nouveau.conf
>
> So far, it looks like things have stopped freezing.
>
>
> Another tip for people trouble shooting freezes with nouveau:
>
> # echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
>
> With this, the nouveau module isn't loaded during initial boot, giving the user
> the option to login remotely to perform a "# tail -f /var/log/syslog" to
> hopefully catch an output that might make it through before a hard freeze.
>
>
> Attaching current syslog of the loaded nouveau driver without AGP enabled:
>
> Dec 08 15:29:13 [kernel] [drm] Initialized drm 1.1.0 20060810
> Dec 08 15:29:13 [kernel] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x04b200b1)
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: ... appears to be valid
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: BIT BIOS found
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Bios version 05.73.22.51
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: BIT table 'd' not found
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 03000302 00000000
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 00000028
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0c080
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0:   0: 0x00002030: type 0x30 idx 0 tag 0x08
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xCDAD
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xD457
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xDB8B
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xDD0F
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xDF1B
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
> Dec 08 15:29:13 [kernel] [TTM] Zone  kernel: Available graphics memory: 446486 kiB.
> Dec 08 15:29:13 [kernel] [TTM] Zone highmem: Available graphics memory: 516058 kiB.
> Dec 08 15:29:13 [kernel] [TTM] Initializing pool allocator.
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Saving VGA fonts
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Allocating FIFO number 0
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1)
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 3)
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x48000, bo f675aa00
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: 0xC210: Parsing digital output script table
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 1)
> Dec 08 15:29:13 [kernel] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 0 using output A
> Dec 08 15:29:13 [kernel] Console: switching to colour frame buffer device 160x64
> Dec 08 15:29:13 [kernel] fb0: nouveaufb frame buffer device
> Dec 08 15:29:13 [kernel] drm: registered panic notifier
> Dec 08 15:29:13 [kernel] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
>
>
> The slight difference I see aside from no AGP, is 64 MiB looks to be reserved for GART from the usual 4 MiB AGP.  Probably nothing.  Still working to get kdump working here.  Again, nothing via KGDB on serial console.

Do you get the same kind of AGP problems with the other nvidia cards you
said you had access to? Have you tried to set a saner AGP aperture size
(e.g. 64MB) in your BIOS settings? Does it make any difference?

The output from "lspci -vvv" (executed as root before having loaded the
nouveau kernel module) and *full* kernel logs are likely to be useful
too.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0A998ACgkQg5k4nX1Sv1v/RwD+KtKG7sxWctQfgcnuE2+KJQBu
A1BIrgY0/Bu1IQPF/YEBAKC+cIhPuRFwwjftmJAYprPR0L+DKD7vPkTa1NxVT01u
=3ASo
-----END PGP SIGNATURE-----
--==-=-=--

--===============1614327552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1614327552==--
