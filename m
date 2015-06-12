From: Andre Campos Rodovalho <andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fwd: Problem with GT218 (GeForce GT210)
Date: Fri, 12 Jun 2015 11:18:38 -0300
Message-ID: <CABLbVHNFbvmW7MvfpVLULw7w3_hjWRqTwfYoA7a-+WrOg_Wwog@mail.gmail.com>
References: <CABLbVHNMTS9SzT_Qgn+N0L4p+fFOTHA=C2-FmUaYu0f-xA6zZg@mail.gmail.com>
 <CABLbVHP9Qgzh1RB3ZGeXJWqOpGhAbV3hF3DdS58bB2dxkdAHjg@mail.gmail.com>
 <CAKb7UvjD464REqBi=vz7qS-KLeYb+TEqbB8hsb+2L1qvP5aZSQ@mail.gmail.com>
 <CABLbVHO-Cw99WeW7mchDKfV2gNEvD=LC_gSFunO1YYv_tSXdMQ@mail.gmail.com>
 <CABLbVHPevEt7SBa8UqMzNDc-A5fC69hywzuZ-_rfAx=i7ti+_g@mail.gmail.com>
 <CAKb7UvhhsC4ShMP4rhzz3_Kt1ZDGSH3SVz=AZTsAWoqwZsvRiA@mail.gmail.com>
 <CAKb7UvjbCqN6wRBWXjrUGePyC07DOYLOvg9auX1ZjXzeSpFOpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1558331326=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjbCqN6wRBWXjrUGePyC07DOYLOvg9auX1ZjXzeSpFOpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1558331326==
Content-Type: multipart/alternative; boundary=001a11360288ffa8c5051852c9bb

--001a11360288ffa8c5051852c9bb
Content-Type: text/plain; charset=UTF-8

Hi again,

I got a new dmesg log with the debug parameters, but I guess I could not
isolate VESA. I blacklisted it at /etc/modprobe.d/blacklist.conf but
comparing those logs I see no difference... Is it possible to isolate VESA
somehow without removing it?

The new logs are here, I'm posting full content because I'm not sure what
information is more relevant...
*http://webativo.com/uploads/files/debug_nouveau.zip
<http://webativo.com/uploads/files/debug_nouveau.zip>*

Cheers

2015-06-12 6:53 GMT-03:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:

> [clipped a bit so that it doesn't get held up by moderator, i've left
> the relevant dmesg bits in]
>
> On Fri, Jun 12, 2015 at 3:47 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> > Hm, well you can see the messages about failure to set plls, which is why
> > you don't see anything. The only odd thing I see is that you're using
> vesa,
> > which can definitely mess things up. Try not using that. Also try booting
> > with nouveau.debug=debug drm.debug=0xe which might provide more relevant
> > info.
> >
> > On Jun 12, 2015 8:34 AM, "Andre Campos Rodovalho"
> > <andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >> dmesg output:
> >>
> >>
> >>
> ---------------------------------------------------------------------------------------------------------
> >>
> >>
> >> [    1.018704] vesafb: mode is 640x480x32, linelength=2560, pages=0
> >> [    1.018706] vesafb: scrolling: redraw
> >> [    1.018708] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
> >> [    1.026887] vesafb: framebuffer at 0xfb000000, mapped to
> >> 0xffffc90010e80000, using 1216k, total 1216k
> >> [    1.027623] Console: switching to colour frame buffer device 80x30
> >> [    1.028274] fb0: VESA VGA frame buffer device
>
> [...]
>
> >> [    7.675761] fb: switching to nouveaufb from VESA VGA
> >> [    7.675782] Console: switching to colour dummy device 80x25
> >> [    7.676119] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x298280a2
> >> [    7.676122] nouveau  [  DEVICE][0000:01:00.0] Chipset: G98 (NV98)
> >> [    7.676123] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
> >> [    7.676213] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for
> >> image...
> >> [    7.733822] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
> >> [    7.733823] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
> >> [    7.733905] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
> >> [    7.733908] nouveau  [   VBIOS][0000:01:00.0] version 70.18.36.00.00
> >> [    7.754325] nouveau 0000:01:00.0: irq 49 for MSI/MSI-X
> >> [    7.754335] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
> >> [    7.754358] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
> >> [    7.754360] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
> >> [    7.754361] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 960 tags
> >> [    7.784065] nouveau  [  PTHERM][0000:01:00.0] FAN control: none /
> >> external
> >> [    7.784077] nouveau  [  PTHERM][0000:01:00.0] fan management:
> automatic
> >> [    7.784079] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
> >> [    7.784087] nouveau  [     CLK][0000:01:00.0] 0f: core 550 MHz shader
> >> 1375 MHz memory 266 MHz
> >> [    7.784121] nouveau  [     CLK][0000:01:00.0] --: core 566 MHz shader
> >> 1400 MHz memory 265 MHz
> >> [    7.784167] nouveau E[   PDISP][0000:01:00.0] 02:0261: func 08 lookup
> >> failed, -2
> >> [    7.784558] [TTM] Zone  kernel: Available graphics memory: 4079904
> kiB
> >> [    7.784560] [TTM] Zone   dma32: Available graphics memory: 2097152
> kiB
> >> [    7.784561] [TTM] Initializing pool allocator
> >> [    7.784567] [TTM] Initializing DMA pool allocator
> >> [    7.784584] nouveau  [     DRM] VRAM: 1024 MiB
> >> [    7.784586] nouveau  [     DRM] GART: 1048576 MiB
> >> [    7.784590] nouveau  [     DRM] TMDS table version 2.0
> >> [    7.784593] nouveau  [     DRM] DCB version 4.0
> >> [    7.784596] nouveau  [     DRM] DCB outp 00: 02000300 00000028
> >> [    7.784599] nouveau  [     DRM] DCB outp 01: 01000302 00020030
> >> [    7.784601] nouveau  [     DRM] DCB outp 02: 04011310 00000028
> >> [    7.784603] nouveau  [     DRM] DCB outp 03: 02022322 00c20090
> >> [    7.784605] nouveau  [     DRM] DCB conn 00: 00001030
> >> [    7.784608] nouveau  [     DRM] DCB conn 01: 00000100
> >> [    7.784610] nouveau  [     DRM] DCB conn 02: 00002261
> >> [    7.790697] [drm] Supports vblank timestamp caching Rev 2
> (21.10.2013).
> >> [    7.790699] [drm] Driver supports precise vblank timestamp query.
> >> [    7.799009] nouveau  [     DRM] MM: using M2MF for buffer copies
> >> [    7.869101] nouveau  [     DRM] allocated 1360x768 fb: 0x60000, bo
> >> ffff8800cadfe000
> >> [    7.869168] fbcon: nouveaufb (fb0) is primary device
> >> [    7.870010] nouveau E[ DEVINIT][0000:01:00.0] unable to compute
> >> acceptable pll values
> >> [    7.870012] nouveau E[ DEVINIT][0000:01:00.0] failed pll calculation
>

--001a11360288ffa8c5051852c9bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi again,<div><br></div><div>I got a new dmesg log with th=
e debug parameters, but I guess I could not isolate VESA. I blacklisted it =
at=C2=A0/etc/modprobe.d/blacklist.conf but comparing those logs I see no di=
fference... Is it=C2=A0possible to isolate VESA somehow without removing it=
?</div><div><br></div><div>The new logs are here, I&#39;m posting full cont=
ent because I&#39;m not sure what information is more relevant...</div><div=
><b><a href=3D"http://webativo.com/uploads/files/debug_nouveau.zip">http://=
webativo.com/uploads/files/debug_nouveau.zip</a></b><br></div><div class=3D=
"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div>Cheers</div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
>
<br><div class=3D"gmail_quote">2015-06-12 6:53 GMT-03:00 Ilia Mirkin <span =
dir=3D"ltr">&lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">i=
mirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">[clip=
ped a bit so that it doesn&#39;t get held up by moderator, i&#39;ve left<br=
>
the relevant dmesg bits in]<br>
<span class=3D""><br>
On Fri, Jun 12, 2015 at 3:47 AM, Ilia Mirkin &lt;<a href=3D"mailto:imirkin@=
alum.mit.edu">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br>
&gt; Hm, well you can see the messages about failure to set plls, which is =
why<br>
&gt; you don&#39;t see anything. The only odd thing I see is that you&#39;r=
e using vesa,<br>
&gt; which can definitely mess things up. Try not using that. Also try boot=
ing<br>
&gt; with nouveau.debug=3Ddebug drm.debug=3D0xe which might provide more re=
levant<br>
&gt; info.<br>
&gt;<br>
&gt; On Jun 12, 2015 8:34 AM, &quot;Andre Campos Rodovalho&quot;<br>
&gt; &lt;<a href=3D"mailto:andre.rodovalho-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">andre.rodovalho@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; dmesg output:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ------------------------------------------------------------------=
---------------------------------------<br>
&gt;&gt;<br>
&gt;&gt;<br>
</span><span class=3D"">&gt;&gt; [=C2=A0 =C2=A0 1.018704] vesafb: mode is 6=
40x480x32, linelength=3D2560, pages=3D0<br>
&gt;&gt; [=C2=A0 =C2=A0 1.018706] vesafb: scrolling: redraw<br>
&gt;&gt; [=C2=A0 =C2=A0 1.018708] vesafb: Truecolor: size=3D8:8:8:8, shift=
=3D24:16:8:0<br>
&gt;&gt; [=C2=A0 =C2=A0 1.026887] vesafb: framebuffer at 0xfb000000, mapped=
 to<br>
&gt;&gt; 0xffffc90010e80000, using 1216k, total 1216k<br>
&gt;&gt; [=C2=A0 =C2=A0 1.027623] Console: switching to colour frame buffer=
 device 80x30<br>
&gt;&gt; [=C2=A0 =C2=A0 1.028274] fb0: VESA VGA frame buffer device<br>
<br>
</span>[...]<br>
<span class=3D"im HOEnZb"><br>
&gt;&gt; [=C2=A0 =C2=A0 7.675761] fb: switching to nouveaufb from VESA VGA<=
br>
&gt;&gt; [=C2=A0 =C2=A0 7.675782] Console: switching to colour dummy device=
 80x25<br>
</span><span class=3D"im HOEnZb">&gt;&gt; [=C2=A0 =C2=A0 7.676119] nouveau=
=C2=A0 [=C2=A0 DEVICE][0000:01:00.0] BOOT0=C2=A0 : 0x298280a2<br>
&gt;&gt; [=C2=A0 =C2=A0 7.676122] nouveau=C2=A0 [=C2=A0 DEVICE][0000:01:00.=
0] Chipset: G98 (NV98)<br>
&gt;&gt; [=C2=A0 =C2=A0 7.676123] nouveau=C2=A0 [=C2=A0 DEVICE][0000:01:00.=
0] Family : NV50<br>
&gt;&gt; [=C2=A0 =C2=A0 7.676213] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:0=
1:00.0] checking PRAMIN for<br>
&gt;&gt; image...<br>
</span><span class=3D"im HOEnZb">&gt;&gt; [=C2=A0 =C2=A0 7.733822] nouveau=
=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:01:00.0] ... appears to be valid<br>
&gt;&gt; [=C2=A0 =C2=A0 7.733823] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:0=
1:00.0] using image from PRAMIN<br>
&gt;&gt; [=C2=A0 =C2=A0 7.733905] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:0=
1:00.0] BIT signature found<br>
&gt;&gt; [=C2=A0 =C2=A0 7.733908] nouveau=C2=A0 [=C2=A0 =C2=A0VBIOS][0000:0=
1:00.0] version 70.18.36.00.00<br>
&gt;&gt; [=C2=A0 =C2=A0 7.754325] nouveau 0000:01:00.0: irq 49 for MSI/MSI-=
X<br>
&gt;&gt; [=C2=A0 =C2=A0 7.754335] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PMC][0=
000:01:00.0] MSI interrupts enabled<br>
&gt;&gt; [=C2=A0 =C2=A0 7.754358] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PFB][0=
000:01:00.0] RAM type: DDR2<br>
&gt;&gt; [=C2=A0 =C2=A0 7.754360] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PFB][0=
000:01:00.0] RAM size: 1024 MiB<br>
&gt;&gt; [=C2=A0 =C2=A0 7.754361] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0PFB][0=
000:01:00.0]=C2=A0 =C2=A0 ZCOMP: 960 tags<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">&gt;&gt; [=C2=A0 =C2=A0 7.78=
4065] nouveau=C2=A0 [=C2=A0 PTHERM][0000:01:00.0] FAN control: none /<br>
&gt;&gt; external<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784077] nouveau=C2=A0 [=C2=A0 PTHERM][0000:01:00.=
0] fan management: automatic<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784079] nouveau=C2=A0 [=C2=A0 PTHERM][0000:01:00.=
0] internal sensor: yes<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784087] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0CLK][0=
000:01:00.0] 0f: core 550 MHz shader<br>
&gt;&gt; 1375 MHz memory 266 MHz<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784121] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0CLK][0=
000:01:00.0] --: core 566 MHz shader<br>
&gt;&gt; 1400 MHz memory 265 MHz<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784167] nouveau E[=C2=A0 =C2=A0PDISP][0000:01:00.=
0] 02:0261: func 08 lookup<br>
&gt;&gt; failed, -2<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784558] [TTM] Zone=C2=A0 kernel: Available graphi=
cs memory: 4079904 kiB<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784560] [TTM] Zone=C2=A0 =C2=A0dma32: Available g=
raphics memory: 2097152 kiB<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784561] [TTM] Initializing pool allocator<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784567] [TTM] Initializing DMA pool allocator<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784584] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] V=
RAM: 1024 MiB<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784586] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] G=
ART: 1048576 MiB<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784590] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] T=
MDS table version 2.0<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784593] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB version 4.0<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784596] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB outp 00: 02000300 00000028<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784599] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB outp 01: 01000302 00020030<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784601] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB outp 02: 04011310 00000028<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784603] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB outp 03: 02022322 00c20090<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784605] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB conn 00: 00001030<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784608] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB conn 01: 00000100<br>
&gt;&gt; [=C2=A0 =C2=A0 7.784610] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] D=
CB conn 02: 00002261<br>
&gt;&gt; [=C2=A0 =C2=A0 7.790697] [drm] Supports vblank timestamp caching R=
ev 2 (21.10.2013).<br>
&gt;&gt; [=C2=A0 =C2=A0 7.790699] [drm] Driver supports precise vblank time=
stamp query.<br>
&gt;&gt; [=C2=A0 =C2=A0 7.799009] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] M=
M: using M2MF for buffer copies<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">&gt;&gt; [=C2=A0 =C2=A0=
 7.869101] nouveau=C2=A0 [=C2=A0 =C2=A0 =C2=A0DRM] allocated 1360x768 fb: 0=
x60000, bo<br>
&gt;&gt; ffff8800cadfe000<br>
&gt;&gt; [=C2=A0 =C2=A0 7.869168] fbcon: nouveaufb (fb0) is primary device<=
br>
&gt;&gt; [=C2=A0 =C2=A0 7.870010] nouveau E[ DEVINIT][0000:01:00.0] unable =
to compute<br>
&gt;&gt; acceptable pll values<br>
&gt;&gt; [=C2=A0 =C2=A0 7.870012] nouveau E[ DEVINIT][0000:01:00.0] failed =
pll calculation<br>
</div></div></blockquote></div><br></div></div>

--001a11360288ffa8c5051852c9bb--

--===============1558331326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1558331326==--
