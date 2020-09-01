From: Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VAAPI on GeForce GT 620M
Date: Tue, 1 Sep 2020 10:58:04 -0700
Message-ID: <CAHWPjbXftMYRUm3QgmoLWKpiyPm88G=F3nbv5Q0vs1Rz_PLVBA@mail.gmail.com>
References: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
 <CAKb7Uvh4cdg0=dGJqQVXx_p4O2c5BJbG3JRnjznwjsMQwc505Q@mail.gmail.com>
 <CAKiGokGj8pfm1tmH0aN7de5FVvrszAA93_e9-Zq05oqw46GnRg@mail.gmail.com>
 <CAKb7UvhE8i9E7XxxwrpQX1rSvLHk63tFt7dyv_0XAAxu4O5=iA@mail.gmail.com>
 <CAKiGokFrYM6Cpw9DkYg_ntcvYi4f=2ezJ0ULS7CK0cGucARxsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1887747163=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKiGokFrYM6Cpw9DkYg_ntcvYi4f=2ezJ0ULS7CK0cGucARxsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1887747163==
Content-Type: multipart/alternative; boundary="0000000000006ceec105ae4443db"

--0000000000006ceec105ae4443db
Content-Type: text/plain; charset="UTF-8"

Hi,

Try:  DRI_PRIME=1 LIBVA_DRIVER_NAME=nouveau vainfo --display drm --device
/dev/dri/renderD129

Also try with and without the --device option, the important one is
--display drm

Cheers
Julien

On Tue, Sep 1, 2020 at 10:49 AM Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>
>
> On Tue, 1 Sep 2020 at 18:59, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>
>> On Tue, Sep 1, 2020 at 9:10 AM Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> wrote:
>> > Any suggestions on how to trace the config issues? Do I have to debug
>> the va_openDriver() function?
>>
>> My guess, without reading any code, is that DRI_PRIME isn't doing what
>> you want it to, and the nouveau driver is being handed an intel
>> device. This does not work well. Fixing this will require tracing
>> through the va winsys code which to figure out how it invokes the
>> loader.
>>
>>
>> https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111
>>
>> For the DRM/rendernodes "platform", it will just take whatever fd it
>> is given. vainfo appears to give it a fixed device:
>>
>>
>> https://github.com/intel/libva-utils/blob/master/common/va_display_drm.c#L39
>>
>> However it looks like you can pass in --device /dev/dri/renderD129 or
>> whatever the right one is, which should pass in the right render node,
>> as seen here:
>>
>> https://github.com/intel/libva-utils/blob/master/common/va_display.c#L80
>>
>> Note that I've never tried this, just did a few google searches to
>> find this stuff.
>>
>>
> Brilliant googling. get_drm_device_name() does seem to do a crude argparse
> of "--device"
>
> So I ran
>
> $ DRI_PRIME=1 LIBVA_DRIVER_NAME=nouveau vainfo --device /dev/dri/renderD128
>
> *vainfo: unrecognized option '--device'*Show information from VA-API
> driver
> Usage: vainfo --help
>         --help print this message
>
> Usage: vainfo [options]
> Display options:
>         --display display | help         Show information for the
> specified display, or the available display list
>
> *        --device device                  Set device name, only available
> under drm display*
>
>
> What does this mean?
>
>  Note that I also ran
>
>
> $ nm -Dn -o /usr/lib/x86_64-linux-gnu/libva*|grep get_drm_device_name
>
> Didn't get anything...
>
> Cheers,
>>
>>   -ilia
>>
>
>
> --
> Analabha Roy
> Assistant Professor
> Department of Physics
> <http://www.buruniv.ac.in/academics/department/physics>
> The University of Burdwan <http://www.buruniv.ac.in/>
> Golapbag Campus, Barddhaman 713104
> West Bengal, India
> Emails: daneel-0v3tJM2ovI83uPMLIKxrzw@public.gmane.org, aroy-ZqCQOGSO5P5obvhnwckLr5/QNRX+jHPU@public.gmane.org, hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Webpage: http://www.ph.utexas.edu/~daneel/
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--0000000000006ceec105ae4443db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Try:=C2=A0 DRI_PRIME=3D1 LIBVA_DRIV=
ER_NAME=3Dnouveau vainfo=C2=A0<span style=3D"color:rgb(36,41,46);font-famil=
y:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,san=
s-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:=
14px">--display drm --device /dev/dri/renderD129</span></div><div><span sty=
le=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">Also try with and without the --dev=
ice option, the important one is --display drm</span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">Cheers</span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">Julien</span></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 1, 2=
020 at 10:49 AM Analabha Roy &lt;<a href=3D"mailto:hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
target=3D"_blank">hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 1 Sep 2020 at 18:59, Ilia Mirkin &lt;<a href=3D"mailto:imirkin@a=
lum.mit.edu" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Sep 1, 2020 at 9=
:10 AM Analabha Roy &lt;<a href=3D"mailto:hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D=
"_blank">hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt; Any suggestions on how to trace the config issues? Do I have to debug =
the va_openDriver() function?<br>
<br>
My guess, without reading any code, is that DRI_PRIME isn&#39;t doing what<=
br>
you want it to, and the nouveau driver is being handed an intel<br>
device. This does not work well. Fixing this will require tracing<br>
through the va winsys code which to figure out how it invokes the<br>
loader.<br>
<br>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/frontend=
s/va/context.c#n111" rel=3D"noreferrer" target=3D"_blank">https://cgit.free=
desktop.org/mesa/mesa/tree/src/gallium/frontends/va/context.c#n111</a><br>
<br>
For the DRM/rendernodes &quot;platform&quot;, it will just take whatever fd=
 it<br>
is given. vainfo appears to give it a fixed device:<br>
<br>
<a href=3D"https://github.com/intel/libva-utils/blob/master/common/va_displ=
ay_drm.c#L39" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel=
/libva-utils/blob/master/common/va_display_drm.c#L39</a><br>
<br>
However it looks like you can pass in --device /dev/dri/renderD129 or<br>
whatever the right one is, which should pass in the right render node,<br>
as seen here:<br>
<br>
<a href=3D"https://github.com/intel/libva-utils/blob/master/common/va_displ=
ay.c#L80" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel/lib=
va-utils/blob/master/common/va_display.c#L80</a><br>
<br>
Note that I&#39;ve never tried this, just did a few google searches to<br>
find this stuff.<br>
<br></blockquote><div><br></div><div>Brilliant googling.=C2=A0get_drm_devic=
e_name() does seem to do a crude argparse of &quot;--device&quot;</div><div=
><br></div><div>So I ran</div><div><br></div><div>$ DRI_PRIME=3D1 LIBVA_DRI=
VER_NAME=3Dnouveau vainfo --device /dev/dri/renderD128<br><b><u>vainfo: unr=
ecognized option &#39;--device&#39;<br></u></b>Show information from VA-API=
 driver<br>Usage: vainfo --help<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --help print=
 this message<br><br>Usage: vainfo [options]<br>Display options:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 --display display | help =C2=A0 =C2=A0 =C2=A0 =C2=A0 S=
how information for the specified display, or the available display list <b=
r><b><u>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --device device =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Set device name, only available un=
der drm display<br></u></b></div><div><br></div><div><br></div><div>What do=
es this mean?</div><div><br></div><div>=C2=A0Note that I also ran</div><div=
><br></div><div><br></div><div>$ nm -Dn -o /usr/lib/x86_64-linux-gnu/libva*=
|grep get_drm_device_name</div><div><br></div><div>Didn&#39;t get anything.=
..</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
=C2=A0 -ilia<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Analabha Roy<br></div><div>Ass=
istant Professor</div><div><a href=3D"http://www.buruniv.ac.in/academics/de=
partment/physics" target=3D"_blank">Department of Physics</a></div><div><a =
href=3D"http://www.buruniv.ac.in/" target=3D"_blank">The University of Burd=
wan</a></div><div>Golapbag Campus, Barddhaman 713104</div><div>West Bengal,=
 India</div><div>Emails: <a href=3D"mailto:daneel-0v3tJM2ovI83uPMLIKxrzw@public.gmane.org" target=3D"_bl=
ank">daneel-0v3tJM2ovI83uPMLIKxrzw@public.gmane.org</a>, <a href=3D"mailto:aroy-ZqCQOGSO5P5obvhnwckLr5/QNRX+jHPU@public.gmane.org" targ=
et=3D"_blank">aroy-ZqCQOGSO5P5obvhnwckLr5/QNRX+jHPU@public.gmane.org</a>, <a href=3D"mailto:hariseldon99@g=
mail.com" target=3D"_blank">hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a><br><div><font face=
=3D"tahoma, sans-serif">Webpage: <a href=3D"http://www.ph.utexas.edu/~danee=
l/" target=3D"_blank">http://www.ph.utexas.edu/~daneel/</a></font></div></d=
iv></div></div></div></div></div>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</blockquote></div>

--0000000000006ceec105ae4443db--

--===============1887747163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1887747163==--
