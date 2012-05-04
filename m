From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: NV43: Native resolution not available on Dell 2007FP
Date: Fri, 4 May 2012 16:55:24 +0100 (BST)
Message-ID: <1205041617180.1310@vega.localdomain>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463793404-989030221-1336145338=:1310"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-ID: <1205041650250.1310-UbTGIkfOi6R82hYKe6nXyg@public.gmane.org>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463793404-989030221-1336145338=:1310
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <1205041632082.1310-UbTGIkfOi6R82hYKe6nXyg@public.gmane.org>

I have a Dell 2007FP monitor. NV43 (GeForce 6600) can not use the native 
resolution.

1600x1200 is listed under "DDC gathered Modelines" with the rest of the 
info, but then is missing from "probed modes".

I have a secondary card, NV4a (GeForce 6200, PCI). It works with this 
card. This card does not show "DDC gathered modelines" at all, and 
1600x1200 is listed under "probed modes".

Does this mean the NV4a card is not using the DDC info? Is it a bug 
preventing 1600x1200 being used with the NV43, or some consequence of DDC 
info?

I am using Nouveau from Git, and kernel 3.4.0-rc4. The proprietary NVidia 
driver fully works, as does another 1600x1200 monitor (Lacie).

Thanks

-- 
Mark



[  4676.920] (--) NOUVEAU(0): Chipset: "NVIDIA NV43"
[  4676.920] (II) NOUVEAU(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[  4676.920] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[  4676.920] (==) NOUVEAU(0): RGB weight 888
[  4676.920] (==) NOUVEAU(0): Default visual is TrueColor
[  4676.920] (==) NOUVEAU(0): Using HW cursor
[  4676.920] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[  4676.920] (==) NOUVEAU(0): Page flipping enabled
[  4676.920] (==) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[  4676.940] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[  4676.966] (II) NOUVEAU(0): Output DVI-I-2 has no monitor section
[  4677.054] (II) NOUVEAU(0): Output TV-1 has no monitor section
[  4677.073] (II) NOUVEAU(0): EDID for output DVI-I-1
[  4677.073] (II) NOUVEAU(0): Manufacturer: DEL  Model: a021  Serial#: 809779539
[  4677.073] (II) NOUVEAU(0): Year: 2006  Week: 21
[  4677.073] (II) NOUVEAU(0): EDID Version: 1.3
[  4677.074] (II) NOUVEAU(0): Digital Display Input
[  4677.074] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41  vert.: 31
[  4677.074] (II) NOUVEAU(0): Gamma: 2.20
[  4677.074] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[  4677.074] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[  4677.074] (II) NOUVEAU(0): Default color space is primary color space
[  4677.074] (II) NOUVEAU(0): First detailed timing is preferred mode
[  4677.074] (II) NOUVEAU(0): redX: 0.640 redY: 0.330   greenX: 0.300 greenY: 0.600
[  4677.074] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.060   whiteX: 0.312 whiteY: 0.329
[  4677.074] (II) NOUVEAU(0): Supported established timings:
[  4677.074] (II) NOUVEAU(0): 720x400@70Hz
[  4677.074] (II) NOUVEAU(0): 640x480@60Hz
[  4677.074] (II) NOUVEAU(0): 640x480@75Hz
[  4677.074] (II) NOUVEAU(0): 800x600@60Hz
[  4677.074] (II) NOUVEAU(0): 800x600@75Hz
[  4677.074] (II) NOUVEAU(0): 1024x768@60Hz
[  4677.074] (II) NOUVEAU(0): 1024x768@75Hz
[  4677.074] (II) NOUVEAU(0): 1280x1024@75Hz
[  4677.074] (II) NOUVEAU(0): Manufacturer's mask: 0
[  4677.074] (II) NOUVEAU(0): Supported standard timings:
[  4677.074] (II) NOUVEAU(0): #0: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[  4677.074] (II) NOUVEAU(0): #1: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[  4677.074] (II) NOUVEAU(0): #2: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[  4677.074] (II) NOUVEAU(0): Supported detailed timing:
[  4677.074] (II) NOUVEAU(0): clock: 162.0 MHz   Image Size:  367 x 275 mm
[  4677.074] (II) NOUVEAU(0): h_active: 1600  h_sync: 1664  h_sync_end 1856 h_blank_end 2160 h_border: 0
[  4677.074] (II) NOUVEAU(0): v_active: 1200  v_sync: 1201  v_sync_end 1204 v_blanking: 1250 v_border: 0
[  4677.074] (II) NOUVEAU(0): Serial No: Y992365P0DAS
[  4677.074] (II) NOUVEAU(0): Monitor name: DELL 2007FP
[  4677.074] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 83 kHz, PixClock max 175 MHz
[  4677.074] (II) NOUVEAU(0): EDID (in hex):
[  4677.074] (II) NOUVEAU(0): 	00ffffffffffff0010ac21a053414430
[  4677.074] (II) NOUVEAU(0): 	1510010380291f78eeee91a3544c9926
[  4677.074] (II) NOUVEAU(0): 	0f5054a54b008180a940714f01010101
[  4677.074] (II) NOUVEAU(0): 	010101010101483f403062b0324040c0
[  4677.074] (II) NOUVEAU(0): 	13006f131100001e000000ff00593939
[  4677.074] (II) NOUVEAU(0): 	3233363550304441530a000000fc0044
[  4677.074] (II) NOUVEAU(0): 	454c4c203230303746500a20000000fd
[  4677.074] (II) NOUVEAU(0): 	00384c1e5311000a2020202020200084
[  4677.074] (II) NOUVEAU(0): EDID vendor "DEL", prod id 40993
[  4677.074] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[  4677.074] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[  4677.074] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[  4677.074] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[  4677.074] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[  4677.074] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[  4677.074] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[  4677.075] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[  4677.075] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[  4677.075] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)




[  5962.553] (--) NOUVEAU(0): Chipset: "NVIDIA NV4a"
[  5962.553] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[  5962.553] (==) NOUVEAU(0): RGB weight 888
[  5962.553] (==) NOUVEAU(0): Default visual is TrueColor
[  5962.553] (==) NOUVEAU(0): Using HW cursor
[  5962.553] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[  5962.553] (==) NOUVEAU(0): Page flipping enabled
[  5962.553] (==) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[  5962.580] (II) NOUVEAU(0): Output VGA-1 using monitor section Monitor2
[  5962.605] (II) NOUVEAU(0): Output DVI-I-3 has no monitor section
[  5962.631] (II) NOUVEAU(0): Output TV-2 has no monitor section
[  5962.657] (II) NOUVEAU(0): EDID for output VGA-1
[  5962.682] (II) NOUVEAU(0): EDID for output DVI-I-3
[  5962.682] (II) NOUVEAU(0): Manufacturer: DEL  Model: a021  Serial#: 809779539
[  5962.682] (II) NOUVEAU(0): Year: 2006  Week: 21
[  5962.682] (II) NOUVEAU(0): EDID Version: 1.3
[  5962.682] (II) NOUVEAU(0): Digital Display Input
[  5962.682] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41  vert.: 31
[  5962.682] (II) NOUVEAU(0): Gamma: 2.20
[  5962.682] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[  5962.682] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[  5962.682] (II) NOUVEAU(0): Default color space is primary color space
[  5962.682] (II) NOUVEAU(0): First detailed timing is preferred mode
[  5962.682] (II) NOUVEAU(0): redX: 0.640 redY: 0.330   greenX: 0.300 greenY: 0.600
[  5962.682] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.060   whiteX: 0.312 whiteY: 0.329
[  5962.682] (II) NOUVEAU(0): Supported established timings:
[  5962.682] (II) NOUVEAU(0): 720x400@70Hz
[  5962.682] (II) NOUVEAU(0): 640x480@60Hz
[  5962.682] (II) NOUVEAU(0): 640x480@75Hz
[  5962.682] (II) NOUVEAU(0): 800x600@60Hz
[  5962.682] (II) NOUVEAU(0): 800x600@75Hz
[  5962.682] (II) NOUVEAU(0): 1024x768@60Hz
[  5962.682] (II) NOUVEAU(0): 1024x768@75Hz
[  5962.682] (II) NOUVEAU(0): 1280x1024@75Hz
[  5962.682] (II) NOUVEAU(0): Manufacturer's mask: 0
[  5962.682] (II) NOUVEAU(0): Supported standard timings:
[  5962.682] (II) NOUVEAU(0): #0: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[  5962.682] (II) NOUVEAU(0): #1: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[  5962.682] (II) NOUVEAU(0): #2: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[  5962.682] (II) NOUVEAU(0): Supported detailed timing:
[  5962.682] (II) NOUVEAU(0): clock: 162.0 MHz   Image Size:  367 x 275 mm
[  5962.682] (II) NOUVEAU(0): h_active: 1600  h_sync: 1664  h_sync_end 1856 h_blank_end 2160 h_border: 0
[  5962.683] (II) NOUVEAU(0): v_active: 1200  v_sync: 1201  v_sync_end 1204 v_blanking: 1250 v_border: 0
[  5962.683] (II) NOUVEAU(0): Serial No: Y992365P0DAS
[  5962.683] (II) NOUVEAU(0): Monitor name: DELL 2007FP
[  5962.683] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 83 kHz, PixClock max 175 MHz
[  5962.683] (II) NOUVEAU(0): EDID (in hex):
[  5962.683] (II) NOUVEAU(0): 	00ffffffffffff0010ac21a053414430
[  5962.683] (II) NOUVEAU(0): 	1510010380291f78eeee91a3544c9926
[  5962.683] (II) NOUVEAU(0): 	0f5054a54b008180a940714f01010101
[  5962.683] (II) NOUVEAU(0): 	010101010101483f403062b0324040c0
[  5962.683] (II) NOUVEAU(0): 	13006f131100001e000000ff00593939
[  5962.683] (II) NOUVEAU(0): 	3233363550304441530a000000fc0044
[  5962.683] (II) NOUVEAU(0): 	454c4c203230303746500a20000000fd
[  5962.683] (II) NOUVEAU(0): 	00384c1e5311000a2020202020200084
[  5962.683] (II) NOUVEAU(0): Printing probed modes for output DVI-I-3
[  5962.683] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[  5962.683] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[  5962.709] (II) NOUVEAU(0): EDID for output TV-2
[  5962.709] (II) NOUVEAU(0): Output VGA-1 disconnected
[  5962.709] (II) NOUVEAU(0): Output DVI-I-3 connected
[  5962.709] (II) NOUVEAU(0): Output TV-2 disconnected
[  5962.709] (II) NOUVEAU(0): Using user preference for initial modes
[  5962.709] (II) NOUVEAU(0): Output DVI-I-3 using initial mode 1600x1200
[  5962.709] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[  5962.709] (--) NOUVEAU(0): Virtual size is 1600x1200 (pitch 0)
[  5962.709] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz
[  5962.709] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
---1463793404-989030221-1336145338=:1310
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=prop
Content-Transfer-Encoding: BASE64
Content-ID: <1205041628580.1310-UbTGIkfOi6R82hYKe6nXyg@public.gmane.org>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=prop

U2NyZWVuIDA6IG1pbmltdW0gMzIwIHggMjAwLCBjdXJyZW50IDExNTIgeCA4
NjQsIG1heGltdW0gNDA5NiB4IDQwOTYNCkRWSS1JLTEgY29ubmVjdGVkIDEx
NTJ4ODY0KzArMCAobm9ybWFsIGxlZnQgaW52ZXJ0ZWQgcmlnaHQgeCBheGlz
IHkgYXhpcykgMzY3bW0geCAyNzVtbQ0KCUVESUQ6DQoJCTAwZmZmZmZmZmZm
ZmZmMDAxMGFjMjFhMDUzNDE0NDMwDQoJCTE1MTAwMTAzODAyOTFmNzhlZWVl
OTFhMzU0NGM5OTI2DQoJCTBmNTA1NGE1NGIwMDgxODBhOTQwNzE0ZjAxMDEw
MTAxDQoJCTAxMDEwMTAxMDEwMTQ4M2Y0MDMwNjJiMDMyNDA0MGMwDQoJCTEz
MDA2ZjEzMTEwMDAwMWUwMDAwMDBmZjAwNTkzOTM5DQoJCTMyMzMzNjM1NTAz
MDQ0NDE1MzBhMDAwMDAwZmMwMDQ0DQoJCTQ1NGM0YzIwMzIzMDMwMzc0NjUw
MGEyMDAwMDAwMGZkDQoJCTAwMzg0YzFlNTMxMTAwMGEyMDIwMjAyMDIwMjAw
MDg0DQoJZGl0aGVyaW5nIG1vZGU6CWF1dG8NCgkJc3VwcG9ydGVkOiBhdXRv
ICAgICAgICAgb2ZmICAgICAgICAgIG9uICAgICAgICAgIA0KCXNjYWxpbmcg
bW9kZToJRnVsbA0KCQlzdXBwb3J0ZWQ6IE5vbmUgICAgICAgICBGdWxsICAg
ICAgICAgQ2VudGVyICAgICAgIEZ1bGwgYXNwZWN0IA0KCXN1YmNvbm5lY3Rv
cjoJRFZJLUQNCgkJc3VwcG9ydGVkOiBVbmtub3duICAgICAgRFZJLUQgICAg
ICAgIERWSS1BICAgICAgIA0KICAgMTI4MHgxMDI0ICAgICAgNzUuMCAgICAg
NjAuMCAgDQogICAxMTUyeDg2NCAgICAgICA3NS4wKiANCiAgIDEwMjR4NzY4
ICAgICAgIDc1LjEgICAgIDYwLjAgIA0KICAgODAweDYwMCAgICAgICAgNzUu
MCAgICAgNjAuMyAgDQogICA2NDB4NDgwICAgICAgICA3NS4wICAgICA2MC4w
ICANCiAgIDcyMHg0MDAgICAgICAgIDcwLjEgIA0KRFZJLUktMiBkaXNjb25u
ZWN0ZWQgKG5vcm1hbCBsZWZ0IGludmVydGVkIHJpZ2h0IHggYXhpcyB5IGF4
aXMpDQoJZGl0aGVyaW5nIG1vZGU6CWF1dG8NCgkJc3VwcG9ydGVkOiBhdXRv
ICAgICAgICAgb2ZmICAgICAgICAgIG9uICAgICAgICAgIA0KCXNjYWxpbmcg
bW9kZToJRnVsbA0KCQlzdXBwb3J0ZWQ6IE5vbmUgICAgICAgICBGdWxsICAg
ICAgICAgQ2VudGVyICAgICAgIEZ1bGwgYXNwZWN0IA0KCXN1YmNvbm5lY3Rv
cjoJRFZJLUQNCgkJc3VwcG9ydGVkOiBVbmtub3duICAgICAgRFZJLUQgICAg
ICAgIERWSS1BICAgICAgIA0KVFYtMSBkaXNjb25uZWN0ZWQgKG5vcm1hbCBs
ZWZ0IGludmVydGVkIHJpZ2h0IHggYXhpcyB5IGF4aXMpDQoJb3ZlcnNjYW46
IDUwICgweDAwMDAwMDMyKQlyYW5nZTogICgwLDEwMCkNCglodWU6IDAgKDB4
MDAwMDAwMDApCXJhbmdlOiAgKDAsMTAwKQ0KCXNhdHVyYXRpb246IDUwICgw
eDAwMDAwMDMyKQlyYW5nZTogICgwLDEwMCkNCglmbGlja2VyIHJlZHVjdGlv
bjogNTAgKDB4MDAwMDAwMzIpCXJhbmdlOiAgKDAsMTAwKQ0KCW1vZGU6CVBB
TA0KCQlzdXBwb3J0ZWQ6IFBBTCAgICAgICAgICBQQUwtTSAgICAgICAgUEFM
LU4gICAgICAgIFBBTC1OYyAgICAgIA0KCQkgICAgICAgICAgIE5UU0MtTSAg
ICAgICBOVFNDLUogICAgICAgaGQ0ODBpICAgICAgIGhkNDgwcCAgICAgIA0K
CQkgICAgICAgICAgIGhkNTc2aSAgICAgICBoZDU3NnAgICAgICAgaGQ3MjBw
ICAgICAgIGhkMTA4MGkgICAgIA0KCXN1YmNvbm5lY3RvcjoJVW5rbm93bg0K
CQlzdXBwb3J0ZWQ6IFVua25vd24gICAgICBDb21wb3NpdGUgICAgU1ZJREVP
ICAgICAgIENvbXBvbmVudCAgIA0KCQkgICAgICAgICAgIFNDQVJUICAgICAg
IA0KCXNlbGVjdCBzdWJjb25uZWN0b3I6CUF1dG9tYXRpYw0KCQlzdXBwb3J0
ZWQ6IEF1dG9tYXRpYyAgICBDb21wb3NpdGUgICAgU1ZJREVPICAgICAgIENv
bXBvbmVudCAgIA0KCQkgICAgICAgICAgIFNDQVJUICAgICAgIA0K

---1463793404-989030221-1336145338=:1310
Content-Type: APPLICATION/OCTET-STREAM; NAME=Xorg.0.log.gz
Content-Transfer-Encoding: BASE64
Content-ID: <1205041628581.1310-UbTGIkfOi6R82hYKe6nXyg@public.gmane.org>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=Xorg.0.log.gz

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
8sUN2ZK/uIzYohh0Y7YADhhs+QCkv7epzm8AAA==

---1463793404-989030221-1336145338=:1310
Content-Type: APPLICATION/OCTET-STREAM; NAME=Xorg.0.log-working-NV4a.gz
Content-Transfer-Encoding: BASE64
Content-ID: <1205041649550.1310-UbTGIkfOi6R82hYKe6nXyg@public.gmane.org>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=Xorg.0.log-working-NV4a.gz

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
Bj63HtE7X1kyK456gDj/NwAXMQvq1FkAAA==

---1463793404-989030221-1336145338=:1310
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

---1463793404-989030221-1336145338=:1310--
