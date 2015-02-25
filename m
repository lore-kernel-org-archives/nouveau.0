From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] nouveau: Do not add most bo's to the
 global bo list.
Date: Wed, 25 Feb 2015 09:28:43 -0600
Message-ID: <CAEk2Stk1x86MM0x6FLFutgBGC+0ksG+VKFLoEH=z+zLGKvYyRg@mail.gmail.com>
References: <1424768511-25156-1-git-send-email-maarten.lankhorst@ubuntu.com>
 <1424768511-25156-2-git-send-email-maarten.lankhorst@ubuntu.com>
 <CACvgo53DRfa9JkweCRVB9va7oD5RoKVM9KFkXk99rQwO=vxi0g@mail.gmail.com>
 <54EDE354.6030700@ubuntu.com>
 <CAEk2Stmr7k+Tq_JH+9iuo8iz+NouhJ8tG3RaX9vJA-FHzewBAw@mail.gmail.com>
 <54EDE51B.1070000@ubuntu.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1413735511=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54EDE51B.1070000-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
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

--===============1413735511==
Content-Type: multipart/alternative; boundary=001a11c162f860a595050feb4a14

--001a11c162f860a595050feb4a14
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 25, 2015 at 9:07 AM, Maarten Lankhorst <
maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:

> Op 25-02-15 om 16:04 schreef Patrick Baggett:
> > On Wed, Feb 25, 2015 at 8:59 AM, Maarten Lankhorst <
> > maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> >> Op 25-02-15 om 15:11 schreef Emil Velikov:
> >>> On 24 February 2015 at 09:01, Maarten Lankhorst
> >>> <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:
> >>>> Only add wrapped bo's and bo's that have been exported through flink
> or
> >> dma-buf.
> >>>> This avoids a lock in the common case, and decreases traversal needed
> >> for importing
> >>>> a dma-buf or flink.
> >>>>
> >>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>>  nouveau/nouveau.c | 47
> +++++++++++++++++++++++------------------------
> >>>>  1 file changed, 23 insertions(+), 24 deletions(-)
> >>>>
> >>>> diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
> >>>> index 1c723b9..d411523 100644
> >>>> --- a/nouveau/nouveau.c
> >>>> +++ b/nouveau/nouveau.c
> >>>> @@ -349,8 +349,8 @@ nouveau_bo_del(struct nouveau_bo *bo)
> >>>>         struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
> >>>>         struct drm_gem_close req = { bo->handle };
> >>>>
> >>>> -       pthread_mutex_lock(&nvdev->lock);
> >>>> -       if (nvbo->name) {
> >>>> +       if (nvbo->head.next) {
> >>>> +               pthread_mutex_lock(&nvdev->lock);
> >>>>                 if (atomic_read(&nvbo->refcnt) == 0) {
> >>>>                         DRMLISTDEL(&nvbo->head);
> >>>>                         /*
> >>>> @@ -365,8 +365,6 @@ nouveau_bo_del(struct nouveau_bo *bo)
> >>>>                 }
> >>>>                 pthread_mutex_unlock(&nvdev->lock);
> >>>>         } else {
> >>>> -               DRMLISTDEL(&nvbo->head);
> >>>> -               pthread_mutex_unlock(&nvdev->lock);
> >>>>                 drmIoctl(bo->device->fd, DRM_IOCTL_GEM_CLOSE, &req);
> >>>>         }
> >>>>         if (bo->map)
> >>>> @@ -379,7 +377,6 @@ nouveau_bo_new(struct nouveau_device *dev,
> uint32_t
> >> flags, uint32_t align,
> >>>>                uint64_t size, union nouveau_bo_config *config,
> >>>>                struct nouveau_bo **pbo)
> >>>>  {
> >>>> -       struct nouveau_device_priv *nvdev = nouveau_device(dev);
> >>>>         struct nouveau_bo_priv *nvbo = calloc(1, sizeof(*nvbo));
> >>>>         struct nouveau_bo *bo = &nvbo->base;
> >>>>         int ret;
> >>>> @@ -397,10 +394,6 @@ nouveau_bo_new(struct nouveau_device *dev,
> >> uint32_t flags, uint32_t align,
> >>>>                 return ret;
> >>>>         }
> >>>>
> >>>> -       pthread_mutex_lock(&nvdev->lock);
> >>>> -       DRMLISTADD(&nvbo->head, &nvdev->bo_list);
> >>>> -       pthread_mutex_unlock(&nvdev->lock);
> >>>> -
> >>>>         *pbo = bo;
> >>>>         return 0;
> >>>>  }
> >>>> @@ -457,6 +450,18 @@ nouveau_bo_wrap_locked(struct nouveau_device
> *dev,
> >> uint32_t handle,
> >>>>         return -ENOMEM;
> >>>>  }
> >>>>
> >>>> +static void
> >>>> +nouveau_bo_make_global(struct nouveau_bo_priv *nvbo)
> >>>> +{
> >>>> +       if (!nvbo->head.next) {
> >>>> +               struct nouveau_device_priv *nvdev =
> >> nouveau_device(nvbo->base.device);
> >>>> +               pthread_mutex_lock(&nvdev->lock);
> >>>> +               if (!nvbo->head.next)
> > I guess the bo_make_global call is not particularly sensitive, so
> >> removing's fine with me.
> >>
> > I would be worried about the duplicated check. It seems like a "smart"
> > compiler could cache the value of "nvbo->head.next" (unless marked as
> > volatile), rendering the second if() useless. If the field is marked
> > volatile, then of course, this does not apply.
> >
> In that case I would be worried about a compiler that ignores the acquire
> semantics of pthread_mutex_lock..
>

This isn't about the acquire semantics here, because you're reading it on
both sides of the lock. The compiler need not reorder the reads at all,
merely just save the value of the first read. Unless the compiler knows
that the value can change after the lock is acquired, it can simply cache
the result. Consider the nearly identical transformation:

const int condition = (!nvbo->head.next);
if(condition){
   pthread_mutex_lock(...);
    if(condition){ //redundant, already can assert it is true
        ...

I just wouldn't risk it. The compiler probably makes this transformation
already, but even if it doesn't, it *can*, and that's a bad thing IMO.


Patrick

>
> ~Maarten
>
>

--001a11c162f860a595050feb4a14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 25, 2015 at 9:07 AM, Maarten Lankhorst <span dir=3D"ltr">&l=
t;<a href=3D"mailto:maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org" target=3D"_blank">maarten=
.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Op 25-02-15 om 16:04 schreef Patrick Baggett:<br>
<div><div class=3D"h5">&gt; On Wed, Feb 25, 2015 at 8:59 AM, Maarten Lankho=
rst &lt;<br>
&gt; <a href=3D"mailto:maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org">maarten.lankhorst@ubun=
tu.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Op 25-02-15 om 15:11 schreef Emil Velikov:<br>
&gt;&gt;&gt; On 24 February 2015 at 09:01, Maarten Lankhorst<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org">maarten.la=
nkhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; Only add wrapped bo&#39;s and bo&#39;s that have been expo=
rted through flink or<br>
&gt;&gt; dma-buf.<br>
&gt;&gt;&gt;&gt; This avoids a lock in the common case, and decreases trave=
rsal needed<br>
&gt;&gt; for importing<br>
&gt;&gt;&gt;&gt; a dma-buf or flink.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Maarten Lankhorst &lt;<a href=3D"mailto:maa=
rten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org">maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 nouveau/nouveau.c | 47 +++++++++++++++++++++++------=
------------------<br>
&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 23 insertions(+), 24 deletions(-)<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c<br>
&gt;&gt;&gt;&gt; index 1c723b9..d411523 100644<br>
&gt;&gt;&gt;&gt; --- a/nouveau/nouveau.c<br>
&gt;&gt;&gt;&gt; +++ b/nouveau/nouveau.c<br>
&gt;&gt;&gt;&gt; @@ -349,8 +349,8 @@ nouveau_bo_del(struct nouveau_bo *bo)<=
br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo_priv *n=
vbo =3D nouveau_bo(bo);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_close req =
=3D { bo-&gt;handle };<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_lock(&amp;nvdev-=
&gt;lock);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvbo-&gt;name) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvbo-&gt;head.next) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pt=
hread_mutex_lock(&amp;nvdev-&gt;lock);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (atomic_read(&amp;nvbo-&gt;refcnt) =3D=3D 0) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRMLISTDEL(&amp;nvbo-&gt;head);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;&gt;&gt; @@ -365,8 +365,6 @@ nouveau_bo_del(struct nouveau_bo *bo)<=
br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pthread_mutex_unlock(&amp;nvdev-&gt;lock);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DR=
MLISTDEL(&amp;nvbo-&gt;head);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pt=
hread_mutex_unlock(&amp;nvdev-&gt;lock);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0drmIoctl(bo-&gt;device-&gt;fd, DRM_IOCTL_GEM_CLOSE, &amp;req);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;map)<br>
&gt;&gt;&gt;&gt; @@ -379,7 +377,6 @@ nouveau_bo_new(struct nouveau_device *=
dev, uint32_t<br>
&gt;&gt; flags, uint32_t align,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uin=
t64_t size, union nouveau_bo_config *config,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str=
uct nouveau_bo **pbo)<br>
&gt;&gt;&gt;&gt;=C2=A0 {<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_device_priv *nv=
dev =3D nouveau_device(dev);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo_priv *n=
vbo =3D calloc(1, sizeof(*nvbo));<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo *bo =3D=
 &amp;nvbo-&gt;base;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;&gt;&gt; @@ -397,10 +394,6 @@ nouveau_bo_new(struct nouveau_device =
*dev,<br>
&gt;&gt; uint32_t flags, uint32_t align,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return ret;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_lock(&amp;nvdev-=
&gt;lock);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0DRMLISTADD(&amp;nvbo-&gt;head,=
 &amp;nvdev-&gt;bo_list);<br>
&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_unlock(&amp;nvde=
v-&gt;lock);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*pbo =3D bo;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;&gt; @@ -457,6 +450,18 @@ nouveau_bo_wrap_locked(struct nouveau=
_device *dev,<br>
&gt;&gt; uint32_t handle,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt;&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +static void<br>
&gt;&gt;&gt;&gt; +nouveau_bo_make_global(struct nouveau_bo_priv *nvbo)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nvbo-&gt;head.next) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct nouveau_device_priv *nvdev =3D<br>
&gt;&gt; nouveau_device(nvbo-&gt;base.device);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pt=
hread_mutex_lock(&amp;nvdev-&gt;lock);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (!nvbo-&gt;head.next)<br>
&gt; I guess the bo_make_global call is not particularly sensitive, so<br>
&gt;&gt; removing&#39;s fine with me.<br>
&gt;&gt;<br>
&gt; I would be worried about the duplicated check. It seems like a &quot;s=
mart&quot;<br>
&gt; compiler could cache the value of &quot;nvbo-&gt;head.next&quot; (unle=
ss marked as<br>
&gt; volatile), rendering the second if() useless. If the field is marked<b=
r>
&gt; volatile, then of course, this does not apply.<br>
&gt;<br>
</div></div>In that case I would be worried about a compiler that ignores t=
he acquire semantics of pthread_mutex_lock..<br></blockquote><div><br></div=
><div>This isn&#39;t about the acquire semantics here, because you&#39;re r=
eading it on both sides of the lock. The compiler need not reorder the read=
s at all, merely just save the value of the first read. Unless the compiler=
 knows that the value can change after the lock is acquired, it can simply =
cache the result. Consider the nearly identical transformation:<br><br></di=
v><div>const int condition =3D (!nvbo-&gt;head.next);<br></div><div>if(cond=
ition){<br></div><div>=C2=A0=C2=A0 pthread_mutex_lock(...);<br></div><div>=
=C2=A0=C2=A0=C2=A0 if(condition){ //redundant, already can assert it is tru=
e<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...<br></div><div><br></div=
><div>I just wouldn&#39;t risk it. The compiler probably makes this transfo=
rmation already, but even if it doesn&#39;t, it <i>can</i>, and that&#39;s =
a bad thing IMO. <br></div><div><br></div><div><br></div><div>Patrick<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
~Maarten<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c162f860a595050feb4a14--

--===============1413735511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1413735511==--
