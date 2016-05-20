From: Marcos Souza <marcos.souza.org@gmail.com>
Subject: Re: [PATCH] gpu/nouveau/nouveau_acpi.c: Fix Type Mismatch ACPI warning
Date: Fri, 20 May 2016 02:22:57 +0000
Message-ID: <CAH0vN5+s8CGjTwW_W7Z-AC9ZMsq7GqygYtCbEkL2+9y3DhJWAw@mail.gmail.com>
References: <1463618578-5662-1-git-send-email-marcos.souza.org@gmail.com>
 <20160519094915.GA1759@Sovereign.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0985958528=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160519094915.GA1759@Sovereign.localdomain>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, bskeggs@redhat.com, lukas@wunner.de, christian.koenig@amd.com, dvhart@linux.intel.com, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0985958528==
Content-Type: multipart/alternative; boundary=001a1134effa73301005333cc5d9

--001a1134effa73301005333cc5d9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Pierre,

Em qui, 19 de mai de 2016 =C3=A0s 06:49, Pierre Moreau <pierre.morrow@free.=
fr>
escreveu:

> Hello Marcos,
>
> I sent a serie a year ago to fix some of the ACPI handling in Nouveau and
> add
> runtime pm support for laptops with an Apple GMUX (see [0], and especiall=
y
> [1]
> and [2]). I was told that a more generic work for the runtime pm was in t=
he
> work, so I let the whole serie slip away. I was thinking of resubmitting
> the
> serie without the runtime pm additions, to at least fix those warning/err=
or
> messages. I thought I had a patch to fix this issue in my serie, but goin=
g
> through it again, it looks like I did not.
> Note that even, though the spec says the 4th argument should be a package=
,
> some
> old BIOSes expect a different type, like a buffer (see the comment above
> [5]; I
> think there was also a comment about it in the spec, but I can=E2=80=99t =
find it
> anymore).
>
> I added some comments below. I=E2=80=99ll test this patch tonight, to see=
 how it
> works
> on my laptop as I think it expects a buffer as 4th argument.
>

Good, I'm learning a lot here. I'm reading all links you pasted here.


>
> Thank you!
>
> Regards,
> Pierre
>
>
> [0]: https://lists.freedesktop.org/archives/dri-devel/2015-May/083444.htm=
l
> [1]: https://lists.freedesktop.org/archives/dri-devel/2015-May/083448.htm=
l
> [2]: https://lists.freedesktop.org/archives/dri-devel/2015-May/083449.htm=
l
>
> On 09:42 PM - May 18 2016, Marcos Paulo de Souza wrote:
> > nouveau_optimus_dsm is using ACPI_TYPE_BUFFER, and this triggers
> warnings on ACPI:
> > [    7.730564] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> > [    7.730570] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (201509
> 30/nsarguments-95)
> >
> > To fix it, change ACPI_TYPE_BUFFER to ACPI_TYPE_PACKAGE, as the warning
> tells to do.
> >
> > Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
> > ---
> >
> > After booting my Asus Laptop, and after a suspend/resume too, dmesg
> shows warnings:
> > [    1.633361] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [    1.633434] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [    7.730176] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [    7.730564] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> > [    7.730570] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [   49.732059] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [   49.732424] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> > [   49.732430] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [   74.366300] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [   74.366657] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> > [   74.366663] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [  140.357789] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
> > [  140.358532] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DSM
> > [  140.358547] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument #4 typ=
e
> mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsarguments-=
95)
>
> Out of curiosity, which GPU(s) do you have in your laptop? I guess there
> is at
> least an NVIDIA one, but is it an Optimus configuration? And if so, does
> the
> unused card go automatically to sleep after a few seconds?
>

I have an Asus laptop with a NVD7 (GF117) Fermi card, and a Haswell onboard
graphic card. About the automatic sleep, I really don't don't know, I'm
just seeing these messages :)


>
> >
> > I don't know if this is the right thing to do, I just looked at
> intel_acpi.c to check how to use/check for ACPI Package.
> > The patch below silenced the "type mismatch" warnings, and some of the
> "evaluated _DSM" ones.
> >
> > If this is not the right approach, please let me know how to fix it, I
> don't have knowledge in ACPI, but I really want to help.
> >
> >  drivers/gpu/drm/nouveau/nouveau_acpi.c | 14 +-------------
> >  1 file changed, 1 insertion(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> > index cdf5227..f04aef3 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> > @@ -73,22 +73,10 @@ static const char nouveau_op_dsm_muid[] =3D {
> >
> >  static int nouveau_optimus_dsm(acpi_handle handle, int func, int arg,
> uint32_t *result)
> >  {
> > -     int i;
> >       union acpi_object *obj;
> > -     char args_buff[4];
> > -     union acpi_object argv4 =3D {
> > -             .buffer.type =3D ACPI_TYPE_BUFFER,
> > -             .buffer.length =3D 4,
> > -             .buffer.pointer =3D args_buff
> > -     };
> > -
> > -     /* ACPI is little endian, AABBCCDD becomes {DD,CC,BB,AA} */
> > -     for (i =3D 0; i < 4; i++)
> > -             args_buff[i] =3D (arg >> i * 8) & 0xFF;
> > -
> >       *result =3D 0;
> >       obj =3D acpi_evaluate_dsm_typed(handle, nouveau_op_dsm_muid,
> 0x00000100,
> > -                                   func, &argv4, ACPI_TYPE_BUFFER);
> > +                                   func, NULL, ACPI_TYPE_PACKAGE);
>
> The last parameter you give to `acpi_evaluate_dsm_typed()` is the return
> type
> you expect (see [3]), which will be a buffer if func is 0, and is
> implementation dependent otherwise (see section 9.14.1 _DSM of [4]). So y=
ou
> don=E2=80=99t want to change it to ACPI_TYPE_PACKAGE. If you look at the
> implementation
> of `acpi_evaluate_dsm()` (which is called by `acpi_evaluate_dsm_typed()`)=
,
> it
> will automatically create a package for the 4th argument, if you pass it =
a
> NULL
> pointer (see [5]).
>
> [3]:
> https://github.com/torvalds/linux/blob/46c13450624e36302547a2ac3695f2350f=
e7ffc3/include/acpi/acpi_bus.h#L69
> [4]: http://www.acpi.info/DOWNLOADS/ACPI_5_Errata%20A.pdf
> [5]:
> https://github.com/torvalds/linux/blob/46c13450624e36302547a2ac3695f2350f=
e7ffc3/drivers/acpi/utils.c#L628


Thanks for all the links. I'll read the docs and send a new version of the
patch when it makes more sense instead of just replacing random things.


>
>
> >       if (!obj) {
> >               acpi_handle_info(handle, "failed to evaluate _DSM\n");
> >               return AE_ERROR;
> > --
> > 2.5.5
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--001a1134effa73301005333cc5d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Pierre,<br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">Em qui, 19 de mai de 2016 =C3=A0s 06:49, Pierre Moreau &lt;<a href=3D"m=
ailto:pierre.morrow@free.fr">pierre.morrow@free.fr</a>&gt; escreveu:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hello Marcos,<br>
<br>
I sent a serie a year ago to fix some of the ACPI handling in Nouveau and a=
dd<br>
runtime pm support for laptops with an Apple GMUX (see [0], and especially =
[1]<br>
and [2]). I was told that a more generic work for the runtime pm was in the=
<br>
work, so I let the whole serie slip away. I was thinking of resubmitting th=
e<br>
serie without the runtime pm additions, to at least fix those warning/error=
<br>
messages. I thought I had a patch to fix this issue in my serie, but going<=
br>
through it again, it looks like I did not.<br>
Note that even, though the spec says the 4th argument should be a package, =
some<br>
old BIOSes expect a different type, like a buffer (see the comment above [5=
]; I<br>
think there was also a comment about it in the spec, but I can=E2=80=99t fi=
nd it<br>
anymore).<br>
<br>
I added some comments below. I=E2=80=99ll test this patch tonight, to see h=
ow it works<br>
on my laptop as I think it expects a buffer as 4th argument.<br></blockquot=
e><div><br></div><div>Good, I&#39;m learning a lot here. I&#39;m reading al=
l links you pasted here.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
Thank you!<br>
<br>
Regards,<br>
Pierre<br>
<br>
<br>
[0]: <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2015-May/0=
83444.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/dri-devel/2015-May/083444.html</a><br>
[1]: <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2015-May/0=
83448.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/dri-devel/2015-May/083448.html</a><br>
[2]: <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2015-May/0=
83449.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/archives/dri-devel/2015-May/083449.html</a><br>
<br>
On 09:42 PM - May 18 2016, Marcos Paulo de Souza wrote:<br>
&gt; nouveau_optimus_dsm is using ACPI_TYPE_BUFFER, and this triggers warni=
ngs on ACPI:<br>
&gt; [=C2=A0 =C2=A0 7.730564] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluat=
e _DSM<br>
&gt; [=C2=A0 =C2=A0 7.730570] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (201509=C2=
=A0 =C2=A0 30/nsarguments-95)<br>
&gt;<br>
&gt; To fix it, change ACPI_TYPE_BUFFER to ACPI_TYPE_PACKAGE, as the warnin=
g tells to do.<br>
&gt;<br>
&gt; Signed-off-by: Marcos Paulo de Souza &lt;<a href=3D"mailto:marcos.souz=
a.org@gmail.com" target=3D"_blank">marcos.souza.org@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; After booting my Asus Laptop, and after a suspend/resume too, dmesg sh=
ows warnings:<br>
&gt; [=C2=A0 =C2=A0 1.633361] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 =C2=A0 1.633434] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 =C2=A0 7.730176] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 =C2=A0 7.730564] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluat=
e _DSM<br>
&gt; [=C2=A0 =C2=A0 7.730570] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 =C2=A049.732059] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 =C2=A049.732424] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluat=
e _DSM<br>
&gt; [=C2=A0 =C2=A049.732430] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 =C2=A074.366300] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 =C2=A074.366657] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluat=
e _DSM<br>
&gt; [=C2=A0 =C2=A074.366663] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argu=
ment #4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/n=
sarguments-95)<br>
&gt; [=C2=A0 140.357789] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument =
#4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsargu=
ments-95)<br>
&gt; [=C2=A0 140.358532] ACPI: \_SB_.PCI0.RP05.PEGP: failed to evaluate _DS=
M<br>
&gt; [=C2=A0 140.358547] ACPI Warning: \_SB_.PCI0.RP05.PEGP._DSM: Argument =
#4 type mismatch - Found [Buffer], ACPI requires [Package] (20150930/nsargu=
ments-95)<br>
<br>
Out of curiosity, which GPU(s) do you have in your laptop? I guess there is=
 at<br>
least an NVIDIA one, but is it an Optimus configuration? And if so, does th=
e<br>
unused card go automatically to sleep after a few seconds?<br></blockquote>=
<div><br></div><div>I have an Asus laptop with a=C2=A0<span style=3D"font-f=
amily:&#39;times new roman&#39;;font-size:16.16px;line-height:normal;backgr=
ound-color:rgb(242,242,242)">NVD7 (GF117) Fermi card, and a Haswell onboard=
 graphic card. About the automatic sleep, I really don&#39;t don&#39;t know=
, I&#39;m just seeing these messages :)</span></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
&gt;<br>
&gt; I don&#39;t know if this is the right thing to do, I just looked at in=
tel_acpi.c to check how to use/check for ACPI Package.<br>
&gt; The patch below silenced the &quot;type mismatch&quot; warnings, and s=
ome of the &quot;evaluated _DSM&quot; ones.<br>
&gt;<br>
&gt; If this is not the right approach, please let me know how to fix it, I=
 don&#39;t have knowledge in ACPI, but I really want to help.<br>
&gt;<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nouveau_acpi.c | 14 +-------------<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 13 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/=
nouveau/nouveau_acpi.c<br>
&gt; index cdf5227..f04aef3 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c<br>
&gt; @@ -73,22 +73,10 @@ static const char nouveau_op_dsm_muid[] =3D {<br>
&gt;<br>
&gt;=C2=A0 static int nouveau_optimus_dsm(acpi_handle handle, int func, int=
 arg, uint32_t *result)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0union acpi_object *obj;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char args_buff[4];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0union acpi_object argv4 =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.buffer.type =3D ACPI=
_TYPE_BUFFER,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.buffer.length =3D 4,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.buffer.pointer =3D a=
rgs_buff<br>
&gt; -=C2=A0 =C2=A0 =C2=A0};<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* ACPI is little endian, AABBCCDD becomes {DD,CC=
,BB,AA} */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args_buff[i] =3D (arg=
 &gt;&gt; i * 8) &amp; 0xFF;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D acpi_evaluate_dsm_typed(handle, nouv=
eau_op_dsm_muid, 0x00000100,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func, &amp;argv4, A=
CPI_TYPE_BUFFER);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func, NULL, ACPI_TY=
PE_PACKAGE);<br>
<br>
The last parameter you give to `acpi_evaluate_dsm_typed()` is the return ty=
pe<br>
you expect (see [3]), which will be a buffer if func is 0, and is<br>
implementation dependent otherwise (see section 9.14.1 _DSM of [4]). So you=
<br>
don=E2=80=99t want to change it to ACPI_TYPE_PACKAGE. If you look at the im=
plementation<br>
of `acpi_evaluate_dsm()` (which is called by `acpi_evaluate_dsm_typed()`), =
it<br>
will automatically create a package for the 4th argument, if you pass it a =
NULL<br>
pointer (see [5]).<br>
<br>
[3]: <a href=3D"https://github.com/torvalds/linux/blob/46c13450624e36302547=
a2ac3695f2350fe7ffc3/include/acpi/acpi_bus.h#L69" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/torvalds/linux/blob/46c13450624e36302547a2ac=
3695f2350fe7ffc3/include/acpi/acpi_bus.h#L69</a><br>
[4]: <a href=3D"http://www.acpi.info/DOWNLOADS/ACPI_5_Errata%20A.pdf" rel=
=3D"noreferrer" target=3D"_blank">http://www.acpi.info/DOWNLOADS/ACPI_5_Err=
ata%20A.pdf</a><br>
[5]: <a href=3D"https://github.com/torvalds/linux/blob/46c13450624e36302547=
a2ac3695f2350fe7ffc3/drivers/acpi/utils.c#L628" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/torvalds/linux/blob/46c13450624e36302547a2ac=
3695f2350fe7ffc3/drivers/acpi/utils.c#L628</a></blockquote><div><br></div><=
div>Thanks for all the links. I&#39;ll read the docs and send a new version=
 of the patch when it makes more sense instead of just replacing random thi=
ngs.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_handle_info=
(handle, &quot;failed to evaluate _DSM\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return AE_ERROR;=
<br>
&gt; --<br>
&gt; 2.5.5<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div></div>

--001a1134effa73301005333cc5d9--

--===============0985958528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0985958528==--
