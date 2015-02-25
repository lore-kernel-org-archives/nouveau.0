From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] nouveau: Do not add most bo's to the
 global bo list.
Date: Wed, 25 Feb 2015 09:04:23 -0600
Message-ID: <CAEk2Stmr7k+Tq_JH+9iuo8iz+NouhJ8tG3RaX9vJA-FHzewBAw@mail.gmail.com>
References: <1424768511-25156-1-git-send-email-maarten.lankhorst@ubuntu.com>
 <1424768511-25156-2-git-send-email-maarten.lankhorst@ubuntu.com>
 <CACvgo53DRfa9JkweCRVB9va7oD5RoKVM9KFkXk99rQwO=vxi0g@mail.gmail.com>
 <54EDE354.6030700@ubuntu.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1981664430=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54EDE354.6030700-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1981664430==
Content-Type: multipart/alternative; boundary=001a113506b86916ac050feaf39f

--001a113506b86916ac050feaf39f
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 25, 2015 at 8:59 AM, Maarten Lankhorst <
maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:

> Op 25-02-15 om 15:11 schreef Emil Velikov:
> > On 24 February 2015 at 09:01, Maarten Lankhorst
> > <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:
> >> Only add wrapped bo's and bo's that have been exported through flink or
> dma-buf.
> >> This avoids a lock in the common case, and decreases traversal needed
> for importing
> >> a dma-buf or flink.
> >>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  nouveau/nouveau.c | 47 +++++++++++++++++++++++------------------------
> >>  1 file changed, 23 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
> >> index 1c723b9..d411523 100644
> >> --- a/nouveau/nouveau.c
> >> +++ b/nouveau/nouveau.c
> >> @@ -349,8 +349,8 @@ nouveau_bo_del(struct nouveau_bo *bo)
> >>         struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
> >>         struct drm_gem_close req = { bo->handle };
> >>
> >> -       pthread_mutex_lock(&nvdev->lock);
> >> -       if (nvbo->name) {
> >> +       if (nvbo->head.next) {
> >> +               pthread_mutex_lock(&nvdev->lock);
> >>                 if (atomic_read(&nvbo->refcnt) == 0) {
> >>                         DRMLISTDEL(&nvbo->head);
> >>                         /*
> >> @@ -365,8 +365,6 @@ nouveau_bo_del(struct nouveau_bo *bo)
> >>                 }
> >>                 pthread_mutex_unlock(&nvdev->lock);
> >>         } else {
> >> -               DRMLISTDEL(&nvbo->head);
> >> -               pthread_mutex_unlock(&nvdev->lock);
> >>                 drmIoctl(bo->device->fd, DRM_IOCTL_GEM_CLOSE, &req);
> >>         }
> >>         if (bo->map)
> >> @@ -379,7 +377,6 @@ nouveau_bo_new(struct nouveau_device *dev, uint32_t
> flags, uint32_t align,
> >>                uint64_t size, union nouveau_bo_config *config,
> >>                struct nouveau_bo **pbo)
> >>  {
> >> -       struct nouveau_device_priv *nvdev = nouveau_device(dev);
> >>         struct nouveau_bo_priv *nvbo = calloc(1, sizeof(*nvbo));
> >>         struct nouveau_bo *bo = &nvbo->base;
> >>         int ret;
> >> @@ -397,10 +394,6 @@ nouveau_bo_new(struct nouveau_device *dev,
> uint32_t flags, uint32_t align,
> >>                 return ret;
> >>         }
> >>
> >> -       pthread_mutex_lock(&nvdev->lock);
> >> -       DRMLISTADD(&nvbo->head, &nvdev->bo_list);
> >> -       pthread_mutex_unlock(&nvdev->lock);
> >> -
> >>         *pbo = bo;
> >>         return 0;
> >>  }
> >> @@ -457,6 +450,18 @@ nouveau_bo_wrap_locked(struct nouveau_device *dev,
> uint32_t handle,
> >>         return -ENOMEM;
> >>  }
> >>
> >> +static void
> >> +nouveau_bo_make_global(struct nouveau_bo_priv *nvbo)
> >> +{
> >> +       if (!nvbo->head.next) {
> >> +               struct nouveau_device_priv *nvdev =
> nouveau_device(nvbo->base.device);
> >> +               pthread_mutex_lock(&nvdev->lock);
> >> +               if (!nvbo->head.next)
>
I guess the bo_make_global call is not particularly sensitive, so
> removing's fine with me.
>
I would be worried about the duplicated check. It seems like a "smart"
compiler could cache the value of "nvbo->head.next" (unless marked as
volatile), rendering the second if() useless. If the field is marked
volatile, then of course, this does not apply.

-Patrick

>
> ~Maarten
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a113506b86916ac050feaf39f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 25, 2015 at 8:59 AM, Maarten Lankhorst <span dir=3D"ltr">&l=
t;<a href=3D"mailto:maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org" target=3D"_blank">maarten=
.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Op 25-02-15 om 15:11 schreef Emil Velikov:<br>
&gt; On 24 February 2015 at 09:01, Maarten Lankhorst<br>
&gt; &lt;<a href=3D"mailto:maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org">maarten.lankhorst@=
ubuntu.com</a>&gt; wrote:<br>
&gt;&gt; Only add wrapped bo&#39;s and bo&#39;s that have been exported thr=
ough flink or dma-buf.<br>
&gt;&gt; This avoids a lock in the common case, and decreases traversal nee=
ded for importing<br>
&gt;&gt; a dma-buf or flink.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lan=
khorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org">maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 nouveau/nouveau.c | 47 +++++++++++++++++++++++--------------=
----------<br>
&gt;&gt;=C2=A0 1 file changed, 23 insertions(+), 24 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c<br>
&gt;&gt; index 1c723b9..d411523 100644<br>
&gt;&gt; --- a/nouveau/nouveau.c<br>
&gt;&gt; +++ b/nouveau/nouveau.c<br>
&gt;&gt; @@ -349,8 +349,8 @@ nouveau_bo_del(struct nouveau_bo *bo)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo_priv *nvbo =3D =
nouveau_bo(bo);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_close req =3D { bo=
-&gt;handle };<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_lock(&amp;nvdev-&gt;lock=
);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvbo-&gt;name) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvbo-&gt;head.next) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mu=
tex_lock(&amp;nvdev-&gt;lock);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (a=
tomic_read(&amp;nvbo-&gt;refcnt) =3D=3D 0) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DRMLISTDEL(&amp;nvbo-&gt;head);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; @@ -365,8 +365,6 @@ nouveau_bo_del(struct nouveau_bo *bo)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthre=
ad_mutex_unlock(&amp;nvdev-&gt;lock);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRMLISTDEL=
(&amp;nvbo-&gt;head);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mu=
tex_unlock(&amp;nvdev-&gt;lock);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drmIo=
ctl(bo-&gt;device-&gt;fd, DRM_IOCTL_GEM_CLOSE, &amp;req);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;map)<br>
&gt;&gt; @@ -379,7 +377,6 @@ nouveau_bo_new(struct nouveau_device *dev, uin=
t32_t flags, uint32_t align,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t si=
ze, union nouveau_bo_config *config,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouv=
eau_bo **pbo)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_device_priv *nvdev =3D =
nouveau_device(dev);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo_priv *nvbo =3D =
calloc(1, sizeof(*nvbo));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo *bo =3D &amp;nv=
bo-&gt;base;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt; @@ -397,10 +394,6 @@ nouveau_bo_new(struct nouveau_device *dev, ui=
nt32_t flags, uint32_t align,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n ret;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_lock(&amp;nvdev-&gt;lock=
);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0DRMLISTADD(&amp;nvbo-&gt;head, &amp;nv=
dev-&gt;bo_list);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_unlock(&amp;nvdev-&gt;lo=
ck);<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*pbo =3D bo;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt; @@ -457,6 +450,18 @@ nouveau_bo_wrap_locked(struct nouveau_device =
*dev, uint32_t handle,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +static void<br>
&gt;&gt; +nouveau_bo_make_global(struct nouveau_bo_priv *nvbo)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nvbo-&gt;head.next) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nou=
veau_device_priv *nvdev =3D nouveau_device(nvbo-&gt;base.device);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mu=
tex_lock(&amp;nvdev-&gt;lock);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nvbo-=
&gt;head.next)<br></blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
I guess the bo_make_global call is not particularly sensitive, so removing&=
#39;s fine with me.<br></blockquote><div>I would be worried about the dupli=
cated check. It seems like a &quot;smart&quot; compiler could cache the val=
ue of &quot;nvbo-&gt;head.next&quot; (unless marked as volatile), rendering=
 the second if() useless. If the field is marked volatile, then of course, =
this does not apply.<br><br></div><div>-Patrick<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
~Maarten<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</blockquote></div><br></div></div>

--001a113506b86916ac050feaf39f--

--===============1981664430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1981664430==--
