From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV43: Native resolution not available on Dell 2007FP
Date: Sat, 5 May 2012 00:26:30 +0200
Message-ID: <CAGZ4FERF0+PyWg0kQdMcxAhGhQoy6_hWWpiypPaH30kX9g4uiA@mail.gmail.com>
References: <1205041617180.1310@vega.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1205041617180.1310-UbTGIkfOi6R82hYKe6nXyg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, May 4, 2012 at 5:55 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> I have a Dell 2007FP monitor. NV43 (GeForce 6600) can not use the native
> resolution.
>
> 1600x1200 is listed under "DDC gathered Modelines" with the rest of the
> info, but then is missing from "probed modes".
>
> I have a secondary card, NV4a (GeForce 6200, PCI). It works with this
> card. This card does not show "DDC gathered modelines" at all, and
> 1600x1200 is listed under "probed modes".
>
> Does this mean the NV4a card is not using the DDC info? Is it a bug
> preventing 1600x1200 being used with the NV43, or some consequence of DDC
> info?
>
> I am using Nouveau from Git, and kernel 3.4.0-rc4. The proprietary NVidia
> driver fully works, as does another 1600x1200 monitor (Lacie).
>
> Thanks
>
> --
> Mark
>
>
>
> [ =A04676.920] (--) NOUVEAU(0): Chipset: "NVIDIA NV43"
> [ =A04676.920] (II) NOUVEAU(0): Creating default Display subsection in Sc=
reen section
> =A0 =A0 =A0 =A0"Default Screen Section" for depth/fbbpp 24/32
> [ =A04676.920] (=3D=3D) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
> [ =A04676.920] (=3D=3D) NOUVEAU(0): RGB weight 888
> [ =A04676.920] (=3D=3D) NOUVEAU(0): Default visual is TrueColor
> [ =A04676.920] (=3D=3D) NOUVEAU(0): Using HW cursor
> [ =A04676.920] (=3D=3D) NOUVEAU(0): GLX sync to VBlank disabled.
> [ =A04676.920] (=3D=3D) NOUVEAU(0): Page flipping enabled
> [ =A04676.920] (=3D=3D) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
> [ =A04676.940] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
> [ =A04676.966] (II) NOUVEAU(0): Output DVI-I-2 has no monitor section
> [ =A04677.054] (II) NOUVEAU(0): Output TV-1 has no monitor section
> [ =A04677.073] (II) NOUVEAU(0): EDID for output DVI-I-1
> [ =A04677.073] (II) NOUVEAU(0): Manufacturer: DEL =A0Model: a021 =A0Seria=
l#: 809779539
> [ =A04677.073] (II) NOUVEAU(0): Year: 2006 =A0Week: 21
> [ =A04677.073] (II) NOUVEAU(0): EDID Version: 1.3
> [ =A04677.074] (II) NOUVEAU(0): Digital Display Input
> [ =A04677.074] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41 =A0vert.:=
 31
> [ =A04677.074] (II) NOUVEAU(0): Gamma: 2.20
> [ =A04677.074] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
> [ =A04677.074] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrC=
b 4:4:4
> [ =A04677.074] (II) NOUVEAU(0): Default color space is primary color space
> [ =A04677.074] (II) NOUVEAU(0): First detailed timing is preferred mode
> [ =A04677.074] (II) NOUVEAU(0): redX: 0.640 redY: 0.330 =A0 greenX: 0.300=
 greenY: 0.600
> [ =A04677.074] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.060 =A0 whiteX: 0.3=
12 whiteY: 0.329
> [ =A04677.074] (II) NOUVEAU(0): Supported established timings:
> [ =A04677.074] (II) NOUVEAU(0): 720x400@70Hz
> [ =A04677.074] (II) NOUVEAU(0): 640x480@60Hz
> [ =A04677.074] (II) NOUVEAU(0): 640x480@75Hz
> [ =A04677.074] (II) NOUVEAU(0): 800x600@60Hz
> [ =A04677.074] (II) NOUVEAU(0): 800x600@75Hz
> [ =A04677.074] (II) NOUVEAU(0): 1024x768@60Hz
> [ =A04677.074] (II) NOUVEAU(0): 1024x768@75Hz
> [ =A04677.074] (II) NOUVEAU(0): 1280x1024@75Hz
> [ =A04677.074] (II) NOUVEAU(0): Manufacturer's mask: 0
> [ =A04677.074] (II) NOUVEAU(0): Supported standard timings:
> [ =A04677.074] (II) NOUVEAU(0): #0: hsize: 1280 =A0vsize 1024 =A0refresh:=
 60 =A0vid: 32897
> [ =A04677.074] (II) NOUVEAU(0): #1: hsize: 1600 =A0vsize 1200 =A0refresh:=
 60 =A0vid: 16553
> [ =A04677.074] (II) NOUVEAU(0): #2: hsize: 1152 =A0vsize 864 =A0refresh: =
75 =A0vid: 20337
> [ =A04677.074] (II) NOUVEAU(0): Supported detailed timing:
> [ =A04677.074] (II) NOUVEAU(0): clock: 162.0 MHz =A0 Image Size: =A0367 x=
 275 mm
> [ =A04677.074] (II) NOUVEAU(0): h_active: 1600 =A0h_sync: 1664 =A0h_sync_=
end 1856 h_blank_end 2160 h_border: 0
> [ =A04677.074] (II) NOUVEAU(0): v_active: 1200 =A0v_sync: 1201 =A0v_sync_=
end 1204 v_blanking: 1250 v_border: 0
> [ =A04677.074] (II) NOUVEAU(0): Serial No: Y992365P0DAS
> [ =A04677.074] (II) NOUVEAU(0): Monitor name: DELL 2007FP
> [ =A04677.074] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30=
 H max: 83 kHz, PixClock max 175 MHz
> [ =A04677.074] (II) NOUVEAU(0): EDID (in hex):
> [ =A04677.074] (II) NOUVEAU(0): =A0 00ffffffffffff0010ac21a053414430
> [ =A04677.074] (II) NOUVEAU(0): =A0 1510010380291f78eeee91a3544c9926
> [ =A04677.074] (II) NOUVEAU(0): =A0 0f5054a54b008180a940714f01010101
> [ =A04677.074] (II) NOUVEAU(0): =A0 010101010101483f403062b0324040c0
> [ =A04677.074] (II) NOUVEAU(0): =A0 13006f131100001e000000ff00593939
> [ =A04677.074] (II) NOUVEAU(0): =A0 3233363550304441530a000000fc0044
> [ =A04677.074] (II) NOUVEAU(0): =A0 454c4c203230303746500a20000000fd
> [ =A04677.074] (II) NOUVEAU(0): =A0 00384c1e5311000a2020202020200084
> [ =A04677.074] (II) NOUVEAU(0): EDID vendor "DEL", prod id 40993
> [ =A04677.074] (II) NOUVEAU(0): Using EDID range info for horizontal sync
> [ =A04677.074] (II) NOUVEAU(0): Using EDID range info for vertical refresh
> [ =A04677.074] (II) NOUVEAU(0): Printing DDC gathered Modelines:
> [ =A04677.074] (II) NOUVEAU(0): Modeline "1600x1200"x0.0 =A0162.00 =A0160=
0 1664 1856 2160 =A01200 1201 1204 1250 +hsync +vsync (75.0 kHz)
> [ =A04677.074] (II) NOUVEAU(0): Modeline "800x600"x0.0 =A0 40.00 =A0800 8=
40 968 1056 =A0600 601 605 628 +hsync +vsync (37.9 kHz)
> [ =A04677.074] (II) NOUVEAU(0): Modeline "640x480"x0.0 =A0 31.50 =A0640 6=
56 720 840 =A0480 481 484 500 -hsync -vsync (37.5 kHz)
> [ =A04677.074] (II) NOUVEAU(0): Modeline "640x480"x0.0 =A0 25.18 =A0640 6=
56 752 800 =A0480 490 492 525 -hsync -vsync (31.5 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "720x400"x0.0 =A0 28.32 =A0720 7=
38 846 900 =A0400 412 414 449 -hsync +vsync (31.5 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1280x1024"x0.0 =A0135.00 =A0128=
0 1296 1440 1688 =A01024 1025 1028 1066 +hsync +vsync (80.0 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1024x768"x0.0 =A0 78.75 =A01024=
 1040 1136 1312 =A0768 769 772 800 +hsync +vsync (60.0 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1024x768"x0.0 =A0 65.00 =A01024=
 1048 1184 1344 =A0768 771 777 806 -hsync -vsync (48.4 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "800x600"x0.0 =A0 49.50 =A0800 8=
16 896 1056 =A0600 601 604 625 +hsync +vsync (46.9 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1280x1024"x0.0 =A0108.00 =A0128=
0 1328 1440 1688 =A01024 1025 1028 1066 +hsync +vsync (64.0 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1152x864"x0.0 =A0108.00 =A01152=
 1216 1344 1600 =A0864 865 868 900 +hsync +vsync (67.5 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1280x1024"x75.0 =A0135.00 =A012=
80 1296 1440 1688 =A01024 1025 1028 1066 +hsync +vsync (80.0 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1280x1024"x60.0 =A0108.00 =A012=
80 1328 1440 1688 =A01024 1025 1028 1066 +hsync +vsync (64.0 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1152x864"x75.0 =A0108.00 =A0115=
2 1216 1344 1600 =A0864 865 868 900 +hsync +vsync (67.5 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1024x768"x75.1 =A0 78.80 =A0102=
4 1040 1136 1312 =A0768 769 772 800 +hsync +vsync (60.1 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "1024x768"x60.0 =A0 65.00 =A0102=
4 1048 1184 1344 =A0768 771 777 806 -hsync -vsync (48.4 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "800x600"x75.0 =A0 49.50 =A0800 =
816 896 1056 =A0600 601 604 625 +hsync +vsync (46.9 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "800x600"x60.3 =A0 40.00 =A0800 =
840 968 1056 =A0600 601 605 628 +hsync +vsync (37.9 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "640x480"x75.0 =A0 31.50 =A0640 =
656 720 840 =A0480 481 484 500 -hsync -vsync (37.5 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "640x480"x60.0 =A0 25.20 =A0640 =
656 752 800 =A0480 490 492 525 -hsync -vsync (31.5 kHz)
> [ =A04677.075] (II) NOUVEAU(0): Modeline "720x400"x70.1 =A0 28.32 =A0720 =
738 846 900 =A0400 412 414 449 -hsync +vsync (31.5 kHz)
>
>
>
>
> [ =A05962.553] (--) NOUVEAU(0): Chipset: "NVIDIA NV4a"
> [ =A05962.553] (=3D=3D) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
> [ =A05962.553] (=3D=3D) NOUVEAU(0): RGB weight 888
> [ =A05962.553] (=3D=3D) NOUVEAU(0): Default visual is TrueColor
> [ =A05962.553] (=3D=3D) NOUVEAU(0): Using HW cursor
> [ =A05962.553] (=3D=3D) NOUVEAU(0): GLX sync to VBlank disabled.
> [ =A05962.553] (=3D=3D) NOUVEAU(0): Page flipping enabled
> [ =A05962.553] (=3D=3D) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
> [ =A05962.580] (II) NOUVEAU(0): Output VGA-1 using monitor section Monito=
r2
> [ =A05962.605] (II) NOUVEAU(0): Output DVI-I-3 has no monitor section
> [ =A05962.631] (II) NOUVEAU(0): Output TV-2 has no monitor section
> [ =A05962.657] (II) NOUVEAU(0): EDID for output VGA-1
> [ =A05962.682] (II) NOUVEAU(0): EDID for output DVI-I-3
> [ =A05962.682] (II) NOUVEAU(0): Manufacturer: DEL =A0Model: a021 =A0Seria=
l#: 809779539
> [ =A05962.682] (II) NOUVEAU(0): Year: 2006 =A0Week: 21
> [ =A05962.682] (II) NOUVEAU(0): EDID Version: 1.3
> [ =A05962.682] (II) NOUVEAU(0): Digital Display Input
> [ =A05962.682] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41 =A0vert.:=
 31
> [ =A05962.682] (II) NOUVEAU(0): Gamma: 2.20
> [ =A05962.682] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
> [ =A05962.682] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrC=
b 4:4:4
> [ =A05962.682] (II) NOUVEAU(0): Default color space is primary color space
> [ =A05962.682] (II) NOUVEAU(0): First detailed timing is preferred mode
> [ =A05962.682] (II) NOUVEAU(0): redX: 0.640 redY: 0.330 =A0 greenX: 0.300=
 greenY: 0.600
> [ =A05962.682] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.060 =A0 whiteX: 0.3=
12 whiteY: 0.329
> [ =A05962.682] (II) NOUVEAU(0): Supported established timings:
> [ =A05962.682] (II) NOUVEAU(0): 720x400@70Hz
> [ =A05962.682] (II) NOUVEAU(0): 640x480@60Hz
> [ =A05962.682] (II) NOUVEAU(0): 640x480@75Hz
> [ =A05962.682] (II) NOUVEAU(0): 800x600@60Hz
> [ =A05962.682] (II) NOUVEAU(0): 800x600@75Hz
> [ =A05962.682] (II) NOUVEAU(0): 1024x768@60Hz
> [ =A05962.682] (II) NOUVEAU(0): 1024x768@75Hz
> [ =A05962.682] (II) NOUVEAU(0): 1280x1024@75Hz
> [ =A05962.682] (II) NOUVEAU(0): Manufacturer's mask: 0
> [ =A05962.682] (II) NOUVEAU(0): Supported standard timings:
> [ =A05962.682] (II) NOUVEAU(0): #0: hsize: 1280 =A0vsize 1024 =A0refresh:=
 60 =A0vid: 32897
> [ =A05962.682] (II) NOUVEAU(0): #1: hsize: 1600 =A0vsize 1200 =A0refresh:=
 60 =A0vid: 16553
> [ =A05962.682] (II) NOUVEAU(0): #2: hsize: 1152 =A0vsize 864 =A0refresh: =
75 =A0vid: 20337
> [ =A05962.682] (II) NOUVEAU(0): Supported detailed timing:
> [ =A05962.682] (II) NOUVEAU(0): clock: 162.0 MHz =A0 Image Size: =A0367 x=
 275 mm
> [ =A05962.682] (II) NOUVEAU(0): h_active: 1600 =A0h_sync: 1664 =A0h_sync_=
end 1856 h_blank_end 2160 h_border: 0
> [ =A05962.683] (II) NOUVEAU(0): v_active: 1200 =A0v_sync: 1201 =A0v_sync_=
end 1204 v_blanking: 1250 v_border: 0
> [ =A05962.683] (II) NOUVEAU(0): Serial No: Y992365P0DAS
> [ =A05962.683] (II) NOUVEAU(0): Monitor name: DELL 2007FP
> [ =A05962.683] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30=
 H max: 83 kHz, PixClock max 175 MHz
> [ =A05962.683] (II) NOUVEAU(0): EDID (in hex):
> [ =A05962.683] (II) NOUVEAU(0): =A0 00ffffffffffff0010ac21a053414430
> [ =A05962.683] (II) NOUVEAU(0): =A0 1510010380291f78eeee91a3544c9926
> [ =A05962.683] (II) NOUVEAU(0): =A0 0f5054a54b008180a940714f01010101
> [ =A05962.683] (II) NOUVEAU(0): =A0 010101010101483f403062b0324040c0
> [ =A05962.683] (II) NOUVEAU(0): =A0 13006f131100001e000000ff00593939
> [ =A05962.683] (II) NOUVEAU(0): =A0 3233363550304441530a000000fc0044
> [ =A05962.683] (II) NOUVEAU(0): =A0 454c4c203230303746500a20000000fd
> [ =A05962.683] (II) NOUVEAU(0): =A0 00384c1e5311000a2020202020200084
> [ =A05962.683] (II) NOUVEAU(0): Printing probed modes for output DVI-I-3
> [ =A05962.683] (II) NOUVEAU(0): Modeline "1600x1200"x60.0 =A0162.00 =A016=
00 1664 1856 2160 =A01200 1201 1204 1250 +hsync +vsync (75.0 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "1280x1024"x75.0 =A0135.00 =A012=
80 1296 1440 1688 =A01024 1025 1028 1066 +hsync +vsync (80.0 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "1280x1024"x60.0 =A0108.00 =A012=
80 1328 1440 1688 =A01024 1025 1028 1066 +hsync +vsync (64.0 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "1152x864"x75.0 =A0108.00 =A0115=
2 1216 1344 1600 =A0864 865 868 900 +hsync +vsync (67.5 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "1024x768"x75.1 =A0 78.80 =A0102=
4 1040 1136 1312 =A0768 769 772 800 +hsync +vsync (60.1 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "1024x768"x60.0 =A0 65.00 =A0102=
4 1048 1184 1344 =A0768 771 777 806 -hsync -vsync (48.4 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "800x600"x75.0 =A0 49.50 =A0800 =
816 896 1056 =A0600 601 604 625 +hsync +vsync (46.9 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "800x600"x60.3 =A0 40.00 =A0800 =
840 968 1056 =A0600 601 605 628 +hsync +vsync (37.9 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "640x480"x75.0 =A0 31.50 =A0640 =
656 720 840 =A0480 481 484 500 -hsync -vsync (37.5 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "640x480"x60.0 =A0 25.20 =A0640 =
656 752 800 =A0480 490 492 525 -hsync -vsync (31.5 kHz)
> [ =A05962.683] (II) NOUVEAU(0): Modeline "720x400"x70.1 =A0 28.32 =A0720 =
738 846 900 =A0400 412 414 449 -hsync +vsync (31.5 kHz)
> [ =A05962.709] (II) NOUVEAU(0): EDID for output TV-2
> [ =A05962.709] (II) NOUVEAU(0): Output VGA-1 disconnected
> [ =A05962.709] (II) NOUVEAU(0): Output DVI-I-3 connected
> [ =A05962.709] (II) NOUVEAU(0): Output TV-2 disconnected
> [ =A05962.709] (II) NOUVEAU(0): Using user preference for initial modes
> [ =A05962.709] (II) NOUVEAU(0): Output DVI-I-3 using initial mode 1600x12=
00
> [ =A05962.709] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) un=
less otherwise stated.
> [ =A05962.709] (--) NOUVEAU(0): Virtual size is 1600x1200 (pitch 0)
> [ =A05962.709] (**) NOUVEAU(0): =A0Driver mode "1600x1200": 162.0 MHz (sc=
aled from 0.0 MHz), 75.0 kHz, 60.0 Hz
> [ =A05962.709] (II) NOUVEAU(0): Modeline "1600x1200"x60.0 =A0162.00 =A016=
00 1664 1856 2160 =A01200 1201 1204 1250 +hsync +vsync (75.0 kHz)
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

Hi, the nouveau driver contains a table that list per gpu generation
the maximum bandwidth a single tmds link can sustain.

Your NV4A is newer than your NV43, it can do the full 165 MHz, instead
of the 155 MHz that the NV43 gets. Your 1600x1200 mode requires 162
MHz.

I do not know if the limits are accurate, but a reduced blanking
1600x1200 should use less bandwith, so if you somehow can get such a
mode into the system (maybe there is a kernel option to do this), but
this i do not know.

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
