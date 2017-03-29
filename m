From: Alastair Bridgewater <alastair.bridgewater-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/10] Enable HDMI Stereoscopy
Date: Wed, 29 Mar 2017 10:24:05 -0400
Message-ID: <CAEcYz2Qb74b27efw=s+ZSSO4SEQQ2_mVKXz4D3za1GkVh_AHgg@mail.gmail.com>
References: <20170117224204.27516-1-alastair.bridgewater@gmail.com>
 <20170327215807.8461-1-alastair.bridgewater@gmail.com>
 <20170329120247.GX30290@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1835504049=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170329120247.GX30290-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1835504049==
Content-Type: multipart/alternative; boundary=94eb2c115180304250054bdf5415

--94eb2c115180304250054bdf5415
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 8:02 AM, Ville Syrj=C3=A4l=C3=A4 <
ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>
> On Mon, Mar 27, 2017 at 05:57:57PM -0400, Alastair Bridgewater wrote:
> > And the tenth patch enables stereo mode support...  on HDMI and DPort
> > connectors on nv50+ hardware.  HDMI connectors because obvious.  DPort
> > connectors because of DPort to HDMI adaptors.
>
> Do you mean DP++ or actual protocol converters? DP++ is just HDMI with
> a some electrical tweaks, but IIRC proper DP defines 3D stereo quite
> differently than HDMI. I'm not sure if we should be able to push HDMI
> style 3D through DP->HDMI/DP++ adaptors. The specs are unfortunately
> very vague when it comes to such devices.

DP++. Good point about the protocol converters, though I don't recall
seeing any way to distinguish between a DP and a DP++ connector in
nouveau, nor do I know if nVidia actually made any boards with DP that
isn't DP++. I guess I have some digging to do in that direction. Thank
you.

> > eDP connectors because
> > it shouldn't do any harm, and someone might have been maniac enough to
> > set up an eDP port to point to something with an HDMI 3D setup.  And
> > nv50+ hardware only because while I'm not aware of any pre-nv50 cards
> > that have HDMI outputs, there could be a setup out there like the PS3
> > that uses an external HDMI encoder on pre-nv50 hardware, at which
> > point none of the mode timing or InfoFrame support is in place for it.

-- Alastair Bridgewater

--94eb2c115180304250054bdf5415
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Mar 29, 2017 at 8:02 AM, Ville Syrj=C3=A4l=C3=A4 &=
lt;<a href=3D"mailto:ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org">ville.syrjala-VuQAYsv1561eoWH0uzbU5w@public.gmane.org=
el.com</a>&gt; wrote:<br>&gt;<br>&gt; On Mon, Mar 27, 2017 at 05:57:57PM -0=
400, Alastair Bridgewater wrote:<br>&gt; &gt; And the tenth patch enables s=
tereo mode support... =C2=A0on HDMI and DPort<br>&gt; &gt; connectors on nv=
50+ hardware.=C2=A0 HDMI connectors because obvious.=C2=A0 DPort<br>&gt; &g=
t; connectors because of DPort to HDMI adaptors.<br>&gt;<br>&gt; Do you mea=
n DP++ or actual protocol converters? DP++ is just HDMI with<br>&gt; a some=
 electrical tweaks, but IIRC proper DP defines 3D stereo quite<br>&gt; diff=
erently than HDMI. I&#39;m not sure if we should be able to push HDMI<br>&g=
t; style 3D through DP-&gt;HDMI/DP++ adaptors. The specs are unfortunately<=
br>&gt; very vague when it comes to such devices.<br><br>DP++. Good point a=
bout the protocol converters, though I don&#39;t recall<br>seeing any way t=
o distinguish between a DP and a DP++ connector in<br>nouveau, nor do I kno=
w if nVidia actually made any boards with DP that<br>isn&#39;t DP++. I gues=
s I have some digging to do in that direction. Thank<br>you.<br><br>&gt; &g=
t; eDP connectors because<br>&gt; &gt; it shouldn&#39;t do any harm, and so=
meone might have been maniac enough to<br>&gt; &gt; set up an eDP port to p=
oint to something with an HDMI 3D setup.=C2=A0 And<br>&gt; &gt; nv50+ hardw=
are only because while I&#39;m not aware of any pre-nv50 cards<br>&gt; &gt;=
 that have HDMI outputs, there could be a setup out there like the PS3<br>&=
gt; &gt; that uses an external HDMI encoder on pre-nv50 hardware, at which<=
br>&gt; &gt; point none of the mode timing or InfoFrame support is in place=
 for it.<br><br>-- Alastair Bridgewater</div>

--94eb2c115180304250054bdf5415--

--===============1835504049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1835504049==--
