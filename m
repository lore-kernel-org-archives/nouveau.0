From: Alastair Bridgewater <alastair.bridgewater-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] drm: Delete "mandatory" stereographic
	modes
Date: Wed, 18 Jan 2017 16:35:13 -0500
Message-ID: <CAEcYz2R7YHbJ8bPYk5Tw6FnK2tZNmKOw_fUW3VwQg1h67Rsebg@mail.gmail.com>
References: <20170117224204.27516-1-alastair.bridgewater@gmail.com>
 <20170117224204.27516-6-alastair.bridgewater@gmail.com>
 <CAKb7UvigMUdD93eqa=3bM9VHSGztV3DWgv-8hx8ho7EmHrhtqA@mail.gmail.com>
 <20170118114554.GA6460@strange.localdomain>
 <CAKb7Uvg0wgmZG+S39XNP-r0Qny6ikDhwvyy9TAspOZQ_dEp1RQ@mail.gmail.com>
 <20170118163343.GD6460@strange.localdomain>
 <20170118164125.GE6460@strange.localdomain>
 <CAKb7UvgCpbBZ_qyUwNAFA4VnypENHEzRzT_n9+o+F6cxhFBMzA@mail.gmail.com>
 <CAKb7UviODH0YPH-EMUmO9Ssu5BrBb3GVa82SGawbQbiO5NKXAw@mail.gmail.com>
 <20170118190119.GF6460@strange.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0335057470=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170118190119.GF6460-q+Y1yDQJ1rIB9AHHLWeGtNQXobZC6xk2@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Damien Lespiau <damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0335057470==
Content-Type: multipart/alternative; boundary=001a113f91422cfe2f0546653100

--001a113f91422cfe2f0546653100
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 18, 2017 at 2:01 PM, Damien Lespiau <damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
wrote:
>
> On Wed, Jan 18, 2017 at 01:48:04PM -0500, Ilia Mirkin wrote:
> > After some more conversations with Alastair, it sounds like what's
> > actually going on is that it's just the frame-packing modes that
> > aren't working, but all the side-by-side and top-and-bottom modes from
> > the "mandatory" list work. At this point, I'm more inclined to believe
> > that there's an issue in the nouveau implementation for frame-packed
> > modes. But it could still be the TVs themselves that don't support
> > that at all.

By now, and having re-read the relevant spec extract a couple of times,
I'm convinced that the "mandatory" stereographic modes are just that, but
also that the current implementation is incorrect (if anything, too
conservative about adding modes).  In the unlikely event that a display
advertises only a 512x384x1bpp@60Hz mode (I don't even know if that's
possible in terms of an EDID, but let's take it as an example), but also
sets the 3D flag, it must support five specific 3D modes, but the current
implementation would match none.

I'm definitely willing to table changing the mandatory mode logic for the
time being, at least until the question of frame packing on my hardware
is sorted out.

> If Alastair has an intel GPU as well, an "easy" way to check if the
> frame packing modes of those TVs work would be to use the testdisplay[1]
> tool of intel-gpu-tools.

If I have an intel GPU handy, I think that it's getting disabled by the
system BIOS or something due to hardware configuration.  I have a couple
of things to try, and there might be a machine with an intel GPU that I
can borrow next week, though.

Should any intel GPU with an HDMI output work, or do I need to look for
something more specific?

I should also have access to the restore disks that came with some of my
hardware as of this weekend, so I can see what the, ah, *other* operating
system has to say about things.

> Shameless plug: http://damien.lespiau.name/2013/10/hdmi-stereo-3d-kms.html

I had found this, which led me to intel-gpu-tools, and thus testdisplay,
which is what I've been using.  It's a very nice explanation of how things
should work overall...  But it calls one question to mind: Is there userland
software other than testdisplay that does anything with stereo 3D support?

> Towards the end of the post, there are test display usage examples to go
> and test FP modes. Mind you, people have been trying to make
> intel-gpu-tools run on any DRM driver when possible, not sure how far we
> are with that though.

... Which raises the number of possibilities that we're dealing with to
three:

 1. The displays really don't support frame packing.

 2. There's something not yet right with nouveau that breaks frame packing.

 3. There's something not yet right with testdisplay that breaks frame
packing
    on nouveau (I had previously presumed that testdisplay wasn't going to
be
    a problem, but it sounds like it might be worth me digging into).

> --
> Damien
>
> [1]
http://cgit.freedesktop.org/xorg/app/intel-gpu-tools/tree/tests/testdisplay.c

-- Alastair

--001a113f91422cfe2f0546653100
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><span style=3D"font-family:monospace,monosp=
ace">On Wed, Jan 18, 2017 at 2:01 PM, Damien Lespiau &lt;<a href=3D"mailto:=
damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org">damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>&gt;<b=
r>&gt; On Wed, Jan 18, 2017 at 01:48:04PM -0500, Ilia Mirkin wrote:<br>&gt;=
 &gt; After some more conversations with Alastair, it sounds like what&#39;=
s<br>&gt; &gt; actually going on is that it&#39;s just the frame-packing mo=
des that<br>&gt; &gt; aren&#39;t working, but all the side-by-side and top-=
and-bottom modes from<br>&gt; &gt; the &quot;mandatory&quot; list work. At =
this point, I&#39;m more inclined to believe<br>&gt; &gt; that there&#39;s =
an issue in the nouveau implementation for frame-packed<br>&gt; &gt; modes.=
 But it could still be the TVs themselves that don&#39;t support<br>&gt; &g=
t; that at all.<br><br>By now, and having re-read the relevant spec extract=
 a couple of times,<br>I&#39;m convinced that the &quot;mandatory&quot; ste=
reographic modes are just that, but<br></span></div><div><span style=3D"fon=
t-family:monospace,monospace">also that the current implementation is incor=
rect (if anything, too<br></span></div><div><span style=3D"font-family:mono=
space,monospace">conservative about adding modes).=C2=A0 In the unlikely ev=
ent that a display<br></span></div><div><span style=3D"font-family:monospac=
e,monospace">advertises only a 512x384x1bpp@60Hz mode (I don&#39;t even kno=
w if that&#39;s<br>possible in terms of an EDID, but let&#39;s take it as a=
n example), but also<br>sets the 3D flag, it must support five specific 3D =
modes, but the current<br>implementation would match none.<br><br></span></=
div><div><span style=3D"font-family:monospace,monospace">I&#39;m definitely=
 willing to table changing the mandatory mode logic for the<br>time being, =
at least until the question of frame packing on my hardware<br>is sorted ou=
t.<br></span></div><div><span style=3D"font-family:monospace,monospace"><br=
>&gt; If Alastair has an intel GPU as well, an &quot;easy&quot; way to chec=
k if the<br>&gt; frame packing modes of those TVs work would be to use the =
testdisplay[1]<br>&gt; tool of intel-gpu-tools.<br><br></span></div><div><s=
pan style=3D"font-family:monospace,monospace">If I have an intel GPU handy,=
 I think that it&#39;s getting disabled by the<br></span></div><div><span s=
tyle=3D"font-family:monospace,monospace">system BIOS or something due to ha=
rdware configuration.=C2=A0 I have a couple<br></span></div><div><span styl=
e=3D"font-family:monospace,monospace">of things to try, and there might be =
a machine with an intel GPU that I<br></span></div><div><span style=3D"font=
-family:monospace,monospace">can borrow next week, though.<br></span></div>=
<div><span style=3D"font-family:monospace,monospace"><br>Should any intel G=
PU with an HDMI output work, or do I need to look for<br>something more spe=
cific?<br><br></span></div><span style=3D"font-family:monospace,monospace">=
I should also have access to the restore disks that came with some of my<br=
></span></div><span style=3D"font-family:monospace,monospace">hardware as o=
f this weekend, so I can see what the, ah, *other* operating<br></span></di=
v><span style=3D"font-family:monospace,monospace">system has to say about t=
hings.<br></span><div><div><div><span style=3D"font-family:monospace,monosp=
ace"><br>&gt; Shameless plug: <a href=3D"http://damien.lespiau.name/2013/10=
/hdmi-stereo-3d-kms.html">http://damien.lespiau.name/2013/10/hdmi-stereo-3d=
-kms.html</a><br><br>I had found this, which led me to intel-gpu-tools, and=
 thus testdisplay,<br>which is what I&#39;ve been using.=C2=A0 It&#39;s a v=
ery nice explanation of how things<br></span></div><div><span style=3D"font=
-family:monospace,monospace">should work overall...=C2=A0 But it calls one =
question to mind: Is there userland<br></span></div><div><span style=3D"fon=
t-family:monospace,monospace">software other than testdisplay that does any=
thing with stereo 3D support?<br></span></div><div><span style=3D"font-fami=
ly:monospace,monospace"><br>&gt; Towards the end of the post, there are tes=
t display usage examples to go<br>&gt; and test FP modes. Mind you, people =
have been trying to make<br>&gt; intel-gpu-tools run on any DRM driver when=
 possible, not sure how far we<br>&gt; are with that though.<br><br>... Whi=
ch raises the number of possibilities that we&#39;re dealing with to three:=
<br><br>=C2=A01. The displays really don&#39;t support frame packing.<br><b=
r>=C2=A02. There&#39;s something not yet right with nouveau that breaks fra=
me packing.<br><br>=C2=A03. There&#39;s something not yet right with testdi=
splay that breaks frame packing<br>=C2=A0=C2=A0=C2=A0 on nouveau (I had pre=
viously presumed that testdisplay wasn&#39;t going to be<br></span></div><d=
iv><span style=3D"font-family:monospace,monospace">=C2=A0=C2=A0=C2=A0 a pro=
blem, but it sounds like it might be worth me digging into).<br></span></di=
v><div><span style=3D"font-family:monospace,monospace"><br>&gt; --<br>&gt; =
Damien<br>&gt;<br>&gt; [1] <a href=3D"http://cgit.freedesktop.org/xorg/app/=
intel-gpu-tools/tree/tests/testdisplay.c">http://cgit.freedesktop.org/xorg/=
app/intel-gpu-tools/tree/tests/testdisplay.c</a><br><br></span></div><div><=
span style=3D"font-family:monospace,monospace">-- Alastair<br><br></span></=
div></div></div></div>

--001a113f91422cfe2f0546653100--

--===============0335057470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0335057470==--
