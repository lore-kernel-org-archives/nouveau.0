From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: Re: NV43: Native resolution not available on Dell 2007FP
Date: Sat, 5 May 2012 00:30:39 +0100 (BST)
Message-ID: <alpine.LNX.2.01.1205050018220.30010@stax.localdomain>
References: <1205041617180.1310@vega.localdomain>
	<CAGZ4FERF0+PyWg0kQdMcxAhGhQoy6_hWWpiypPaH30kX9g4uiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463793916-198553849-1336174239=:30010"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FERF0+PyWg0kQdMcxAhGhQoy6_hWWpiypPaH30kX9g4uiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463793916-198553849-1336174239=:30010
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 5 May 2012, Maarten Maathuis wrote:

> On Fri, May 4, 2012 at 5:55 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> > I have a Dell 2007FP monitor. NV43 (GeForce 6600) can not use the nativ=
e
> > resolution.
> >
> > 1600x1200 is listed under "DDC gathered Modelines" with the rest of the
> > info, but then is missing from "probed modes".
> >
> > I have a secondary card, NV4a (GeForce 6200, PCI). It works with this
> > card. This card does not show "DDC gathered modelines" at all, and
> > 1600x1200 is listed under "probed modes".
> >
> > Does this mean the NV4a card is not using the DDC info? Is it a bug
> > preventing 1600x1200 being used with the NV43, or some consequence of D=
DC
> > info?
> >
> > I am using Nouveau from Git, and kernel 3.4.0-rc4. The proprietary NVid=
ia
> > driver fully works, as does another 1600x1200 monitor (Lacie).
> >
> > Thanks
> >
> > --
> > Mark
> >
> >
> >
> > [ =A04676.920] (--) NOUVEAU(0): Chipset: "NVIDIA NV43"
> > [ =A04676.920] (II) NOUVEAU(0): Creating default Display subsection in =
Screen section
> > =A0 =A0 =A0 =A0"Default Screen Section" for depth/fbbpp 24/32
> > [ =A04676.920] (=3D=3D) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
> > [ =A04676.920] (=3D=3D) NOUVEAU(0): RGB weight 888
> > [ =A04676.920] (=3D=3D) NOUVEAU(0): Default visual is TrueColor
> > [ =A04676.920] (=3D=3D) NOUVEAU(0): Using HW cursor
> > [ =A04676.920] (=3D=3D) NOUVEAU(0): GLX sync to VBlank disabled.
> > [ =A04676.920] (=3D=3D) NOUVEAU(0): Page flipping enabled
> > [ =A04676.920] (=3D=3D) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
> > [ =A04676.940] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
> > [ =A04676.966] (II) NOUVEAU(0): Output DVI-I-2 has no monitor section
> > [ =A04677.054] (II) NOUVEAU(0): Output TV-1 has no monitor section
> > [ =A04677.073] (II) NOUVEAU(0): EDID for output DVI-I-1
> > [ =A04677.073] (II) NOUVEAU(0): Manufacturer: DEL =A0Model: a021 =A0Ser=
ial#: 809779539
> > [ =A04677.073] (II) NOUVEAU(0): Year: 2006 =A0Week: 21
> > [ =A04677.073] (II) NOUVEAU(0): EDID Version: 1.3
> > [ =A04677.074] (II) NOUVEAU(0): Digital Display Input
> > [ =A04677.074] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41 =A0vert=
=2E: 31
> > [ =A04677.074] (II) NOUVEAU(0): Gamma: 2.20
> > [ =A04677.074] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
> > [ =A04677.074] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YC=
rCb 4:4:4
> > [ =A04677.074] (II) NOUVEAU(0): Default color space is primary color sp=
ace
> > [ =A04677.074] (II) NOUVEAU(0): First detailed timing is preferred mode
> > [ =A04677.074] (II) NOUVEAU(0): redX: 0.640 redY: 0.330 =A0 greenX: 0.3=
00 greenY: 0.600
> > [ =A04677.074] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.060 =A0 whiteX: 0=
=2E312 whiteY: 0.329
> > [ =A04677.074] (II) NOUVEAU(0): Supported established timings:
> > [ =A04677.074] (II) NOUVEAU(0): 720x400@70Hz
> > [ =A04677.074] (II) NOUVEAU(0): 640x480@60Hz
> > [ =A04677.074] (II) NOUVEAU(0): 640x480@75Hz
> > [ =A04677.074] (II) NOUVEAU(0): 800x600@60Hz
> > [ =A04677.074] (II) NOUVEAU(0): 800x600@75Hz
> > [ =A04677.074] (II) NOUVEAU(0): 1024x768@60Hz
> > [ =A04677.074] (II) NOUVEAU(0): 1024x768@75Hz
> > [ =A04677.074] (II) NOUVEAU(0): 1280x1024@75Hz
> > [ =A04677.074] (II) NOUVEAU(0): Manufacturer's mask: 0
> > [ =A04677.074] (II) NOUVEAU(0): Supported standard timings:
> > [ =A04677.074] (II) NOUVEAU(0): #0: hsize: 1280 =A0vsize 1024 =A0refres=
h: 60 =A0vid: 32897
> > [ =A04677.074] (II) NOUVEAU(0): #1: hsize: 1600 =A0vsize 1200 =A0refres=
h: 60 =A0vid: 16553
> > [ =A04677.074] (II) NOUVEAU(0): #2: hsize: 1152 =A0vsize 864 =A0refresh=
: 75 =A0vid: 20337
> > [ =A04677.074] (II) NOUVEAU(0): Supported detailed timing:
> > [ =A04677.074] (II) NOUVEAU(0): clock: 162.0 MHz =A0 Image Size: =A0367=
 x 275 mm
> > [ =A04677.074] (II) NOUVEAU(0): h_active: 1600 =A0h_sync: 1664 =A0h_syn=
c_end 1856 h_blank_end 2160 h_border: 0
> > [ =A04677.074] (II) NOUVEAU(0): v_active: 1200 =A0v_sync: 1201 =A0v_syn=
c_end 1204 v_blanking: 1250 v_border: 0
> > [ =A04677.074] (II) NOUVEAU(0): Serial No: Y992365P0DAS
> > [ =A04677.074] (II) NOUVEAU(0): Monitor name: DELL 2007FP
> > [ =A04677.074] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: =
30 H max: 83 kHz, PixClock max 175 MHz
> > [ =A04677.074] (II) NOUVEAU(0): EDID (in hex):
> > [ =A04677.074] (II) NOUVEAU(0): =A0 00ffffffffffff0010ac21a053414430
> > [ =A04677.074] (II) NOUVEAU(0): =A0 1510010380291f78eeee91a3544c9926
> > [ =A04677.074] (II) NOUVEAU(0): =A0 0f5054a54b008180a940714f01010101
> > [ =A04677.074] (II) NOUVEAU(0): =A0 010101010101483f403062b0324040c0
> > [ =A04677.074] (II) NOUVEAU(0): =A0 13006f131100001e000000ff00593939
> > [ =A04677.074] (II) NOUVEAU(0): =A0 3233363550304441530a000000fc0044
> > [ =A04677.074] (II) NOUVEAU(0): =A0 454c4c203230303746500a20000000fd
> > [ =A04677.074] (II) NOUVEAU(0): =A0 00384c1e5311000a2020202020200084
> > [ =A04677.074] (II) NOUVEAU(0): EDID vendor "DEL", prod id 40993
> > [ =A04677.074] (II) NOUVEAU(0): Using EDID range info for horizontal sy=
nc
> > [ =A04677.074] (II) NOUVEAU(0): Using EDID range info for vertical refr=
esh
> > [ =A04677.074] (II) NOUVEAU(0): Printing DDC gathered Modelines:
> > [ =A04677.074] (II) NOUVEAU(0): Modeline "1600x1200"x0.0 =A0162.00 =A01=
600 1664 1856 2160 =A01200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[...]
>=20
> Hi, the nouveau driver contains a table that list per gpu generation
> the maximum bandwidth a single tmds link can sustain.
>=20
> Your NV4A is newer than your NV43, it can do the full 165 MHz, instead
> of the 155 MHz that the NV43 gets. Your 1600x1200 mode requires 162
> MHz.
>=20
> I do not know if the limits are accurate, but a reduced blanking
> 1600x1200 should use less bandwith, so if you somehow can get such a
> mode into the system (maybe there is a kernel option to do this), but
> this i do not know.

Thanks, I see what you're saying. I think the relevant code looks to be=20
get_tmds_link_bandwidth.

But then if the mode given by the DDC is over this limit, I don't=20
understand why the proprietary drivers do not have the same problem.

Does it mean that the prietary driver is falling-back to one of its own=20
built-in 1600x1200 modes?

The same NV43 with Nouveau is happy with the 1920x1200 of another Dell=20
screen, and the 1600x1200 of the Lacie. These modes are:

[ 13816.407] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2=
000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[ 13816.428] (II) NOUVEAU(1): Modeline "1600x1200"x0.0  130.89  1600 1620 1=
700 1780  1200 1201 1204 1225 +hsync +vsync (73.5 kHz)

Maybe I can find time to revert the kernel and try and NVidia drivers, to=
=20
check the Xorg.0.log file.

Thanks for your help.

--=20
Mark
---1463793916-198553849-1336174239=:30010
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

---1463793916-198553849-1336174239=:30010--
