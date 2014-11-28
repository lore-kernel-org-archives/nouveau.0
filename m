From: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Subject: Re: [Mesa-dev] [RFC] tegra: Initial support
Date: Fri, 28 Nov 2014 15:54:01 +0000
Message-ID: <CAPj87rPn=-P5Cap7CBbUxOG8c=_VFEMLpmUR3QQGaahcJ+Ktcw@mail.gmail.com>
References: <1417106361-705-1-git-send-email-thierry.reding@gmail.com>
 <CAKb7UvjCYMvtwFJAzRdd_JJE956fW_F6upEK5vUeWUQHV_y07w@mail.gmail.com>
 <20141128091707.GC5978@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0613287115=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20141128091707.GC5978@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0613287115==
Content-Type: multipart/alternative; boundary=089e013d202aff759e0508ed44c0

--089e013d202aff759e0508ed44c0
Content-Type: text/plain; charset=UTF-8

Hi,

On 28 November 2014 at 09:17, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

> On Fri, Nov 28, 2014 at 12:32:43AM -0500, Ilia Mirkin wrote:> Also, can
> you explain why it's advantageous for the setup to appear as
> > though it is a single device? i.e. what's wrong with just using
> > nouveau as a render node or whatever? [The answer may be simple, but
> > I'm very unfamiliar with a lot of that stuff, and perhaps others are
> > in a similar predicament.]
>
> There are two reasons. For one, pretty much every software out there
> that runs on the "bare metal" (i.e. GBM) uses the same initialization
> sequence and it doesn't involve opening two DRM devices. So in order to
> support Tegra and other SoCs with a similar architecture, each of these
> applications would need to be patched. Now typically a lot of the
> applications would run under X or Wayland, so the number of applications
> that need patching is somewhat reduced. However, it would still mean
> that every Wayland compositor would need to be patched in order to
> support this, and each of them would use a mostly identical copy of that
> code.
>

More specifically, the gbm/EGL API works thusly:
  drm_fd = drmOpen("display_controller");
  gbm_dev = gbm_create_device(drm_fd);
  egl_dpy = eglGetPlatformDisplayEXT(EGL_PLATFORM_GBM_EXT, gbm_dev, NULL);

So in the last stage, you have to magically infer a relationship between
your display controller's device and your GPU's. On most mobile devices you
can just work this out (there's only one GPU), but it also breaks in the
multi-GPU case.

The best idea I've come up with to fix this in the long term, is to use
EGL_EXT_device_base to enumerate the GPUs and then feed the device ID you
get from that as a new attrib to eglGetPlatformDisplayEXT. It's either
that, or a new gbm_device_create_multi(display_controller_fd, gpu_fd)
entrypoint.

Of course, the first complication in all of this is that Weston doesn't
support platform_base at all anyway ...

Cheers,
Daniel

--089e013d202aff759e0508ed44c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 28 November 2014 at 09:17, Thierry Reding <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">thierry.reding@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"HOEnZb"><div class=3D"h5">On Fri, Nov 28, 2014 at 12:32:43AM -0500, Ili=
a Mirkin wrote:<span style=3D"color:rgb(34,34,34)">&gt; Also, can you expla=
in why it&#39;s advantageous for the setup to appear as</span><br></div></d=
iv><span class=3D"">
&gt; though it is a single device? i.e. what&#39;s wrong with just using<br=
>
&gt; nouveau as a render node or whatever? [The answer may be simple, but<b=
r>
&gt; I&#39;m very unfamiliar with a lot of that stuff, and perhaps others a=
re<br>
&gt; in a similar predicament.]<br>
<br>
</span>There are two reasons. For one, pretty much every software out there=
<br>
that runs on the &quot;bare metal&quot; (i.e. GBM) uses the same initializa=
tion<br>
sequence and it doesn&#39;t involve opening two DRM devices. So in order to=
<br>
support Tegra and other SoCs with a similar architecture, each of these<br>
applications would need to be patched. Now typically a lot of the<br>
applications would run under X or Wayland, so the number of applications<br=
>
that need patching is somewhat reduced. However, it would still mean<br>
that every Wayland compositor would need to be patched in order to<br>
support this, and each of them would use a mostly identical copy of that<br=
>
code.<br></blockquote><div><br></div><div>More specifically, the gbm/EGL AP=
I works thusly:</div><div>=C2=A0 drm_fd =3D drmOpen(&quot;display_controlle=
r&quot;);</div><div>=C2=A0 gbm_dev =3D gbm_create_device(drm_fd);</div><div=
>=C2=A0 egl_dpy =3D eglGetPlatformDisplayEXT(EGL_PLATFORM_GBM_EXT, gbm_dev,=
 NULL);</div><div><br></div><div>So in the last stage, you have to magicall=
y infer a relationship between your display controller&#39;s device and you=
r GPU&#39;s. On most mobile devices you can just work this out (there&#39;s=
 only one GPU), but it also breaks in the multi-GPU case.</div><div><br></d=
iv><div>The best idea I&#39;ve come up with to fix this in the long term, i=
s to use EGL_EXT_device_base to enumerate the GPUs and then feed the device=
 ID you get from that as a new attrib to eglGetPlatformDisplayEXT. It&#39;s=
 either that, or a new gbm_device_create_multi(display_controller_fd, gpu_f=
d) entrypoint.</div><div><br></div><div>Of course, the first complication i=
n all of this is that Weston doesn&#39;t support platform_base at all anywa=
y ...</div><div><br></div><div>Cheers,</div><div>Daniel</div></div></div></=
div>

--089e013d202aff759e0508ed44c0--

--===============0613287115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0613287115==--
