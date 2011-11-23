From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau on Linux/sparc64 -- almost!
Date: Tue, 22 Nov 2011 19:10:16 -0600
Message-ID: <4ECC47F8.6020802@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070507090008060904040302"
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------070507090008060904040302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

First off, I'd like to say many thanks to the nouveau developers!

I've got a Sun Ultra 10 running Debian 6 (testing branch) with an 
onboard ATI card and a PCI GeForceMX 4000. So far X works fine on the 
ATI card, but I noticed that the DRM driver for the GF4 has a few 
unaligned accesses in it (see log). I can actually start X using that 
card, but all I get is a black screen -- though the cursor works and I 
can move it around! It seems like it is very close to working. 
Unfortunately, I can't seem kill X in a way that preserves the graphical 
output of either the gfx chip.

Any ideas where to begin hacking at this problem? Any suggestions or 
known issues on RISC systems? I have an x86 box running Debian 6 with a 
Geforce4 MX (AGP) as well, so hopefully I can test fixes that will work 
on both x86 and sparc64.





--------------070507090008060904040302
Content-Type: text/plain;
 name="gf_mx4000_sparc64.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="gf_mx4000_sparc64.txt"

[   37.446345] [drm] nouveau 0000:02:01.0: Detected an NV10 generation card (0x018500c1)
[   37.587964] [drm] nouveau 0000:02:01.0: Attempting to load BIOS image from PRAMIN
[   37.587989] [drm] nouveau 0000:02:01.0: ... BIOS signature not found
[   37.588004] [drm] nouveau 0000:02:01.0: Attempting to load BIOS image from PROM
[   37.889522] [drm] nouveau 0000:02:01.0: ... appears to be valid
[   37.891198] [drm] nouveau 0000:02:01.0: BMP BIOS found
[   37.891214] [drm] nouveau 0000:02:01.0: BMP version 5.40
[   37.891233] [drm] nouveau 0000:02:01.0: Bios version 04.18.20.42
[   37.891494] Kernel unaligned access at TPC[102148ac] nouveau_bios_init+0x89c/0x29c0 [nouveau]
[   37.891667] Kernel unaligned access at TPC[102148f0] nouveau_bios_init+0x8e0/0x29c0 [nouveau]
[   37.891833] Kernel unaligned access at TPC[1020a434] parse_script_table_pointers+0x4/0xec [nouveau]
[   37.891999] Kernel unaligned access at TPC[1020a458] parse_script_table_pointers+0x28/0xec [nouveau]
[   37.892187] Kernel unaligned access at TPC[1020a478] parse_script_table_pointers+0x48/0xec [nouveau]
[   37.892235] [drm] nouveau 0000:02:01.0: Found Display Configuration Block version 2.2
[   37.892270] [drm] nouveau 0000:02:01.0: Raw DCB entry 0: 01000300 00009c40
[   37.892297] [drm] nouveau 0000:02:01.0: Raw DCB entry 1: 02020321 00000b03
[   37.892402] [drm] nouveau 0000:02:01.0: Adaptor not initialised, running VBIOS init tables.
[   37.893811] [drm] nouveau 0000:02:01.0: Loading NV17 power sequencing microcode
[   37.893851] [drm] nouveau 0000:02:01.0: Parsing VBIOS init table 0 at offset 0xED14
[   37.896089] [drm] nouveau 0000:02:01.0: Parsing VBIOS init table 1 at offset 0xF20C
[   37.896223] [drm] nouveau 0000:02:01.0: Parsing VBIOS init table 2 at offset 0xEE96
[   37.911418] [drm] nouveau 0000:02:01.0: Parsing VBIOS init table 3 at offset 0xF57F
[   37.911457] [drm] nouveau 0000:02:01.0: Parsing VBIOS init table 4 at offset 0xF59C
[   37.911496] [drm] nouveau 0000:02:01.0: Parsing VBIOS init table 5 at offset 0xF081
[   37.914632] [drm] nouveau 0000:02:01.0: Parsing VBIOS init table 6 at offset 0xF1A7
[   38.264844] [drm] nouveau 0000:02:01.0: 0 available performance level(s)
[   38.264900] [drm] nouveau 0000:02:01.0: c: memory 405MHz core 274MHz
[   38.273131] [drm] nouveau 0000:02:01.0: Detected 128MiB VRAM
[   38.275216] [drm] nouveau 0000:02:01.0: 64 MiB GART (aperture)
[   38.275477] [drm] nouveau 0000:02:01.0: Saving VGA fonts
[   38.351180] [drm] nouveau 0000:02:01.0: Setting dpms mode 3 on vga encoder (output 0)
[   38.351206] [drm] nouveau 0000:02:01.0: Setting dpms mode 3 on TV encoder (output 1)
[   38.540092] [drm] nouveau 0000:02:01.0: allocated 1024x768 fb: 0x4a000, bo fffff8003f1f0c00
[   38.540412] fb1: nouveaufb frame buffer device
[   38.540465] [drm] Initialized nouveau 0.0.16 20090420 for 0000:02:01.0 on minor 0

--------------070507090008060904040302
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------070507090008060904040302--
