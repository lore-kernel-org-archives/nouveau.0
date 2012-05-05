From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV43: Native resolution not available on Dell 2007FP
Date: Sat, 5 May 2012 10:08:50 +1000
Message-ID: <CACAvsv6X1PA2BFKMZaHM7x8kgrLSuk7rEx=-rjyUPQZC7xm4Hw@mail.gmail.com>
References: <1205041617180.1310@vega.localdomain>
	<CAGZ4FERF0+PyWg0kQdMcxAhGhQoy6_hWWpiypPaH30kX9g4uiA@mail.gmail.com>
	<alpine.LNX.2.01.1205050018220.30010@stax.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1462526793=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LNX.2.01.1205050018220.30010-4jfXtw+jRJ582hYKe6nXyg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1462526793==
Content-Type: multipart/alternative; boundary=20cf307f33ee78b21c04bf3ed7e1

--20cf307f33ee78b21c04bf3ed7e1
Content-Type: text/plain; charset=ISO-8859-1

On Saturday, 5 May 2012, Mark Hills wrote:

> On Sat, 5 May 2012, Maarten Maathuis wrote:
>
> > On Fri, May 4, 2012 at 5:55 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> > > I have a Dell 2007FP monitor. NV43 (GeForce 6600) can not use the
> native
> > > resolution.
> > >
> > > 1600x1200 is listed under "DDC gathered Modelines" with the rest of the
> > > info, but then is missing from "probed modes".
> > >
> > > I have a secondary card, NV4a (GeForce 6200, PCI). It works with this
> > > card. This card does not show "DDC gathered modelines" at all, and
> > > 1600x1200 is listed under "probed modes".
> > >
> > > Does this mean the NV4a card is not using the DDC info? Is it a bug
> > > preventing 1600x1200 being used with the NV43, or some consequence of
> DDC
> > > info?
> > >
> > > I am using Nouveau from Git, and kernel 3.4.0-rc4. The proprietary
> NVidia
> > > driver fully works, as does another 1600x1200 monitor (Lacie).
> > >
> > > Thanks
> > >
> > > --
> > > Mark
> > >
> > >
> > >
> > > [  4676.920] (--) NOUVEAU(0): Chipset: "NVIDIA NV43"
> > > [  4676.920] (II) NOUVEAU(0): Creating default Display subsection in
> Screen section
> > >        "Default Screen Section" for depth/fbbpp 24/32
> > > [  4676.920] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
> > > [  4676.920] (==) NOUVEAU(0): RGB weight 888
> > > [  4676.920] (==) NOUVEAU(0): Default visual is TrueColor
> > > [  4676.920] (==) NOUVEAU(0): Using HW cursor
> > > [  4676.920] (==) NOUVEAU(0): GLX sync to VBlank disabled.
> > > [  4676.920] (==) NOUVEAU(0): Page flipping enabled
> > > [  4676.920] (==) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
> > > [  4676.940] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
> > > [  4676.966] (II) NOUVEAU(0): Output DVI-I-2 has no monitor section
> > > [  4677.054] (II) NOUVEAU(0): Output TV-1 has no monitor section
> > > [  4677.073] (II) NOUVEAU(0): EDID for output DVI-I-1
> > > [  4677.073] (II) NOUVEAU(0): Manufacturer: DEL  Model: a021  Serial#:
> 809779539
> > > [  4677.073] (II) NOUVEAU(0): Year: 2006  Week: 21
> > > [  4677.073] (II) NOUVEAU(0): EDID Version: 1.3
> > > [  4677.074] (II) NOUVEAU(0): Digital Display Input
> > > [  4677.074] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41  vert.:
> 31
> > > [  4677.074] (II) NOUVEAU(0): Gamma: 2.20
> > > [  4677.074] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
> > > [  4677.074] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4
> YCrCb 4:4:4
> > > [  4677.074] (II) NOUVEAU(0): Default color space is primary color
> space
> > > [  4677.074] (II) NOUVEAU(0): First detailed timing is preferred mode
> > > [  4677.074] (II) NOUVEAU(0): redX: 0.640 redY: 0.330   greenX: 0.300
> greenY: 0.600
> > > [  4677.074] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.060   whiteX:
> 0.312 whiteY: 0.329
> > > [  4677.074] (II) NOUVEAU(0): Supported established timings:
> > > [  4677.074] (II) NOUVEAU(0): 720x400@70Hz
> > > [  4677.074] (II) NOUVEAU(0): 640x480@60Hz
> > > [  4677.074] (II) NOUVEAU(0): 640x480@75Hz
> > > [  4677.074] (II) NOUVEAU(0): 800x600@60Hz
> > > [  4677.074] (II) NOUVEAU(0): 800x600@75Hz
> > > [  4677.074] (II) NOUVEAU(0): 1024x768@60Hz
> > > [  4677.074] (II) NOUVEAU(0): 1024x768@75Hz
> > > [  4677.074] (II) NOUVEAU(0): 1280x1024@75Hz
> > > [  4677.074] (II) NOUVEAU(0): Manufacturer's mask: 0
> > > [  4677.074] (II) NOUVEAU(0): Supported standard timings:
> > > [  4677.074] (II) NOUVEAU(0): #0: hsize: 1280  vsize 1024  refresh: 60
>  vid: 32897
> > > [  4677.074] (II) NOUVEAU(0): #1: hsize: 1600  vsize 1200  refresh: 60
>  vid: 16553
> > > [  4677.074] (II) NOUVEAU(0): #2: hsize: 1152  vsize 864  refresh: 75
>  vid: 20337
> > > [  4677.074] (II) NOUVEAU(0): Supported detailed timing:
> > > [  4677.074] (II) NOUVEAU(0): clock: 162.0 MHz   Image Size:  367 x
> 275 mm
> > > [  4677.074] (II) NOUVEAU(0): h_active: 1600  h_sync: 1664  h_sync_end
> 1856 h_blank_end 2160 h_border: 0
> > > [  4677.074] (II) NOUVEAU(0): v_active: 1200  v_sync: 1201  v_sync_end
> 1204 v_blanking: [...]
> >
> > Hi, the nouveau driver contains a table that list per gpu generation
> > the maximum bandwidth a single tmds link can sustain.
> >
> > Your NV4A is newer than your NV43, it can do the full 165 MHz, instead
> > of the 155 MHz that the NV43 gets. Your 1600x1200 mode requires 162
> > MHz.
> >
> > I do not know if the limits are accurate, but a reduced blanking
> > 1600x1200 should use less bandwith, so if you somehow can get such a
> > mode into the system (maybe there is a kernel option to do this), but
> > this i do not know.
>
> Thanks, I see what you're saying. I think the relevant code looks to be
> get_tmds_link_bandwidth.
>
> But then if the mode given by the DDC is over this limit, I don't
> understand why the proprietary drivers do not have the same problem.
>
> Does it mean that the prietary driver is falling-back to one of its own
> built-in 1600x1200 modes?


I've looked at this issue previously, and IIRC the binary driver builds a
reduced blanking mode instead of what the monitor reports.



> The same NV43 with Nouveau is happy with the 1920x1200 of another Dell
> screen, and the 1600x1200 of the Lacie. These modes are:
>
> [ 13816.407] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968
> 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
> [ 13816.428] (II) NOUVEAU(1): Modeline "1600x1200"x0.0  130.89  1600 1620
> 1700 1780  1200 1201 1204 1225 +hsync +vsync (73.5 kHz)
>
> Maybe I can find time to revert the kernel and try and NVidia drivers, to
> check the Xorg.0.log file.
>
> Thanks for your help.
>
> --
> Mark

--20cf307f33ee78b21c04bf3ed7e1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Saturday, 5 May 2012, Mark Hills  wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On Sat, 5 May 2012, Maarten Maathuis wrote:<br>
<br>
&gt; On Fri, May 4, 2012 at 5:55 PM, Mark Hills &lt;<a>mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org</a>=
&gt; wrote:<br>
&gt; &gt; I have a Dell 2007FP monitor. NV43 (GeForce 6600) can not use the=
 native<br>
&gt; &gt; resolution.<br>
&gt; &gt;<br>
&gt; &gt; 1600x1200 is listed under &quot;DDC gathered Modelines&quot; with=
 the rest of the<br>
&gt; &gt; info, but then is missing from &quot;probed modes&quot;.<br>
&gt; &gt;<br>
&gt; &gt; I have a secondary card, NV4a (GeForce 6200, PCI). It works with =
this<br>
&gt; &gt; card. This card does not show &quot;DDC gathered modelines&quot; =
at all, and<br>
&gt; &gt; 1600x1200 is listed under &quot;probed modes&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Does this mean the NV4a card is not using the DDC info? Is it a b=
ug<br>
&gt; &gt; preventing 1600x1200 being used with the NV43, or some consequenc=
e of DDC<br>
&gt; &gt; info?<br>
&gt; &gt;<br>
&gt; &gt; I am using Nouveau from Git, and kernel 3.4.0-rc4. The proprietar=
y NVidia<br>
&gt; &gt; driver fully works, as does another 1600x1200 monitor (Lacie).<br=
>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Mark<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; [ =A04676.920] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NV43&quot;<=
br>
&gt; &gt; [ =A04676.920] (II) NOUVEAU(0): Creating default Display subsecti=
on in Screen section<br>
&gt; &gt; =A0 =A0 =A0 =A0&quot;Default Screen Section&quot; for depth/fbbpp=
 24/32<br>
&gt; &gt; [ =A04676.920] (=3D=3D) NOUVEAU(0): Depth 24, (--) framebuffer bp=
p 32<br>
&gt; &gt; [ =A04676.920] (=3D=3D) NOUVEAU(0): RGB weight 888<br>
&gt; &gt; [ =A04676.920] (=3D=3D) NOUVEAU(0): Default visual is TrueColor<b=
r>
&gt; &gt; [ =A04676.920] (=3D=3D) NOUVEAU(0): Using HW cursor<br>
&gt; &gt; [ =A04676.920] (=3D=3D) NOUVEAU(0): GLX sync to VBlank disabled.<=
br>
&gt; &gt; [ =A04676.920] (=3D=3D) NOUVEAU(0): Page flipping enabled<br>
&gt; &gt; [ =A04676.920] (=3D=3D) NOUVEAU(0): Swap limit set to 1 [Max allo=
wed 2]<br>
&gt; &gt; [ =A04676.940] (II) NOUVEAU(0): Output DVI-I-1 has no monitor sec=
tion<br>
&gt; &gt; [ =A04676.966] (II) NOUVEAU(0): Output DVI-I-2 has no monitor sec=
tion<br>
&gt; &gt; [ =A04677.054] (II) NOUVEAU(0): Output TV-1 has no monitor sectio=
n<br>
&gt; &gt; [ =A04677.073] (II) NOUVEAU(0): EDID for output DVI-I-1<br>
&gt; &gt; [ =A04677.073] (II) NOUVEAU(0): Manufacturer: DEL =A0Model: a021 =
=A0Serial#: 809779539<br>
&gt; &gt; [ =A04677.073] (II) NOUVEAU(0): Year: 2006 =A0Week: 21<br>
&gt; &gt; [ =A04677.073] (II) NOUVEAU(0): EDID Version: 1.3<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Digital Display Input<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41 =
=A0vert.: 31<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Gamma: 2.20<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspen=
d Off<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Supported color encodings: RGB 4:=
4:4 YCrCb 4:4:4<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Default color space is primary co=
lor space<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): First detailed timing is preferre=
d mode<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): redX: 0.640 redY: 0.330 =A0 green=
X: 0.300 greenY: 0.600<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.060 =A0 whi=
teX: 0.312 whiteY: 0.329<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Supported established timings:<br=
>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 720x400@70Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 640x480@60Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 640x480@75Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 800x600@60Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 800x600@75Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 1024x768@60Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 1024x768@75Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): 1280x1024@75Hz<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Manufacturer&#39;s mask: 0<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Supported standard timings:<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): #0: hsize: 1280 =A0vsize 1024 =A0=
refresh: 60 =A0vid: 32897<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): #1: hsize: 1600 =A0vsize 1200 =A0=
refresh: 60 =A0vid: 16553<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): #2: hsize: 1152 =A0vsize 864 =A0r=
efresh: 75 =A0vid: 20337<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): Supported detailed timing:<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): clock: 162.0 MHz =A0 Image Size: =
=A0367 x 275 mm<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): h_active: 1600 =A0h_sync: 1664 =
=A0h_sync_end 1856 h_blank_end 2160 h_border: 0<br>
&gt; &gt; [ =A04677.074] (II) NOUVEAU(0): v_active: 1200 =A0v_sync: 1201 =
=A0v_sync_end 1204 v_blanking: [...]<br>
&gt;<br>
&gt; Hi, the nouveau driver contains a table that list per gpu generation<b=
r>
&gt; the maximum bandwidth a single tmds link can sustain.<br>
&gt;<br>
&gt; Your NV4A is newer than your NV43, it can do the full 165 MHz, instead=
<br>
&gt; of the 155 MHz that the NV43 gets. Your 1600x1200 mode requires 162<br=
>
&gt; MHz.<br>
&gt;<br>
&gt; I do not know if the limits are accurate, but a reduced blanking<br>
&gt; 1600x1200 should use less bandwith, so if you somehow can get such a<b=
r>
&gt; mode into the system (maybe there is a kernel option to do this), but<=
br>
&gt; this i do not know.<br>
<br>
Thanks, I see what you&#39;re saying. I think the relevant code looks to be=
<br>
get_tmds_link_bandwidth.<br>
<br>
But then if the mode given by the DDC is over this limit, I don&#39;t<br>
understand why the proprietary drivers do not have the same problem.<br>
<br>
Does it mean that the prietary driver is falling-back to one of its own<br>
built-in 1600x1200 modes?</blockquote><span class=3D"Apple-style-span" styl=
e>=A0</span><div>I&#39;ve looked at this issue previously, and IIRC the bin=
ary driver builds a reduced blanking mode instead of what the monitor repor=
ts.<span></span></div>
<div><br></div><br><div></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The same NV43 with Nouveau is happy with the 1920x1200 of another Dell<br>
screen, and the 1600x1200 of the Lacie. These modes are:<br>
<br>
[ 13816.407] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x0.0 =A0154.00 =
=A01920 1968 2000 2080 =A01200 1203 1209 1235 +hsync -vsync (74.0 kHz)<br>
[ 13816.428] (II) NOUVEAU(1): Modeline &quot;1600x1200&quot;x0.0 =A0130.89 =
=A01600 1620 1700 1780 =A01200 1201 1204 1225 +hsync +vsync (73.5 kHz)<br>
<br>
Maybe I can find time to revert the kernel and try and NVidia drivers, to<b=
r>
check the Xorg.0.log file.<br>
<br>
Thanks for your help.<br>
<br>
--<br>
Mark</blockquote>

--20cf307f33ee78b21c04bf3ed7e1--

--===============1462526793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1462526793==--
