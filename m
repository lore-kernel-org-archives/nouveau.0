From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau [vanilla 2.6.33] + GeForce FX 5200 = blank
	screen
Date: Mon, 8 Mar 2010 22:12:57 +0100
Message-ID: <6d4bc9fc1003081312r753698bfr55619e887530932a@mail.gmail.com>
References: <alpine.LFD.2.00.1002281835050.32108@nev.ubzr>
	<alpine.LFD.2.00.1003090001530.934@nev.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1003090001530.934-S8uwY1LfNzQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "Lev A. Melnikovsky" <melnikovsky-JGs/UdohzUI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 8, 2010 at 10:06 PM, Lev A. Melnikovsky <melnikovsky-JGs/UdohzUI@public.gmane.org> w=
rote:
> ...please, could someone investigate this? I'd be glad to provide more
> info or test patches or whatever...
>
> =A0On Sun, 28 Feb 2010 at 6:50pm, Lev A. Melnikovsky wrote:
>
> LAM> Hi there,
> LAM>
> LAM> I have just decided to try this new driver stuff (used 2.6.27 earlie=
r and a
> LAM> proprietary nvidia driver) but the monitor (Samsung 214T) becomes bl=
ack and
> LAM> the power LED starts flashing (standby) after loading nouveau module=
 (from
> LAM> a fresh 2.6.33). For now I am trying framebuffer only. The monitor is
> LAM> connected with a single link DVI cable.
> LAM>
> LAM> lspci -nn
> LAM> 03:00.0 VGA compatible controller [0300]: nVidia Corporation NV34 [G=
eForce
> LAM> FX 5200] [10de:0322] (rev a1)
> LAM>
> LAM> dmesg| grep drm
> LAM> [drm] Initialized drm 1.1.0 20060810
> LAM> [drm] nouveau 0000:03:00.0: failed to evaluate _DSM: 5
> LAM> [drm] nouveau 0000:03:00.0: Detected an NV30 generation card (0x0342=
00b1)
> LAM> [drm] nouveau 0000:03:00.0: Attempting to load BIOS image from PROM
> LAM> [drm] nouveau 0000:03:00.0: ... appears to be valid
> LAM> [drm] nouveau 0000:03:00.0: BMP BIOS found
> LAM> [drm] nouveau 0000:03:00.0: BMP version 5.39
> LAM> [drm] nouveau 0000:03:00.0: Bios version 04.34.20.27
> LAM> [drm] nouveau 0000:03:00.0: Found Display Configuration Block versio=
n 2.2
> LAM> [drm] nouveau 0000:03:00.0: Raw DCB entry 0: 01000300 000088b8
> LAM> [drm] nouveau 0000:03:00.0: Raw DCB entry 1: 02010310 000088b8
> LAM> [drm] nouveau 0000:03:00.0: Raw DCB entry 2: 01010312 00000000
> LAM> [drm] nouveau 0000:03:00.0: Raw DCB entry 3: 02020321 00000003
> LAM> [drm] nouveau 0000:03:00.0: Loading NV17 power sequencing microcode
> LAM> [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 0 at offset 0xE=
5D9
> LAM> [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 1 at offset 0xE=
7EA
> LAM> [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 2 at offset 0xE=
930
> LAM> [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 3 at offset 0xE=
AB6
> LAM> [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 4 at offset 0xE=
AD3
> LAM> [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 5 at offset 0xE=
AF0
> LAM> [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 6 at offset 0xE=
C74
> LAM> [drm] nouveau 0000:03:00.0: 128 MiB VRAM
> LAM> [drm] nouveau 0000:03:00.0: 128 MiB GART (aperture)
> LAM> [drm] nouveau 0000:03:00.0: Allocating FIFO number 0
> LAM> [drm] nouveau 0000:03:00.0: nouveau_channel_alloc: initialised FIFO 0
> LAM> [drm] nouveau 0000:03:00.0: Initial CRTC_OWNER is 0
> LAM> [drm] nouveau 0000:03:00.0: Saving VGA fonts
> LAM> [drm] nouveau 0000:03:00.0: Detected a VGA connector
> LAM> [drm] nouveau 0000:03:00.0: Detected a DVI-I connector
> LAM> [drm] nouveau 0000:03:00.0: Detected a TV connector
> LAM> [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on vga encoder (outp=
ut 0)
> LAM> [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on vga encoder (outp=
ut 1)
> LAM> [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on tmds encoder (out=
put 2)
> LAM> [drm] nouveau 0000:03:00.0: Setting dpms mode 3 on TV encoder (outpu=
t 3)
> LAM> [drm] nouveau 0000:03:00.0: allocated 1600x1200 fb: 0x49000, bo f697=
1400
> LAM> [drm] nouveau 0000:03:00.0: Output DVI-I-1 is running on CRTC 0 usin=
g output A
> LAM> [drm] nouveau 0000:03:00.0: 0xDBBA: Parsing digital output script ta=
ble
> LAM> [drm] nouveau 0000:03:00.0: Setting dpms mode 0 on tmds encoder (out=
put 2)
> LAM> [drm] nouveau 0000:03:00.0: Output DVI-I-1 is running on CRTC 0 usin=
g output A
> LAM> [drm] Initialized nouveau 0.0.15 20090420 for 0000:03:00.0 on minor 0
> LAM>
> LAM> I would appreciate any help. Please let me know if additional inform=
ation
> LAM> (should I set debugging flags?) is required.
> LAM>
> LAM> Thanks
> LAM> -L
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

The first thing to check is if the monitor works when connected as vga, not=
 dvi.
