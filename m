From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: handle same-fb page flips
Date: Wed, 17 Oct 2012 07:51:57 +0200
Message-ID: <CA+GA0_u7dvcnB6Uir1H63WiyMcCBeg7A90Xkik0fEHzXWr1h7w@mail.gmail.com>
References: <20121005193759.GA8531@joi.lan>
	<20121017043056.GA4049@turiel.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0462248446=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121017043056.GA4049-yqdYmcOkqV0XGNroddHbYwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0462248446==
Content-Type: multipart/alternative; boundary=20cf307ac79b5715d104cc3adeaf

--20cf307ac79b5715d104cc3adeaf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

17 pa=C5=BA 2012 06:31, "Ben Skeggs" <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> napisa=C5=82(a):
>
> On Fri, Oct 05, 2012 at 09:37:59PM +0200, Marcin Slusarz wrote:
> > It's questionable use case, but weston/wayland already relies on this
behaviour,
> > and other drivers don't care about it, so it's a matter of
compatibility.
> > Without it, process invoking such page flip hangs in unkillable state,
trying
> > to reserve the same buffer twice.
> >
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_display.c | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
b/drivers/gpu/drm/nouveau/nouveau_display.c
> > index 61f370d..a52cfd3 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > @@ -530,9 +530,11 @@ nouveau_page_flip_reserve(struct nouveau_bo
*old_bo,
> >       if (ret)
> >               goto fail;
> >
> > -     ret =3D ttm_bo_reserve(&old_bo->bo, false, false, false, 0);
> > -     if (ret)
> > -             goto fail_unreserve;
> > +     if (likely(old_bo !=3D new_bo)) {
> > +             ret =3D ttm_bo_reserve(&old_bo->bo, false, false, false, =
0);
> > +             if (ret)
> > +                     goto fail_unreserve;
> > +     }
> >
> >       return 0;
> >
> > @@ -551,8 +553,10 @@ nouveau_page_flip_unreserve(struct nouveau_bo
*old_bo,
> >       nouveau_bo_fence(new_bo, fence);
> >       ttm_bo_unreserve(&new_bo->bo);
> >
> > -     nouveau_bo_fence(old_bo, fence);
> > -     ttm_bo_unreserve(&old_bo->bo);
> > +     if (likely(old_bo !=3D new_bo)) {
> > +             nouveau_bo_fence(old_bo, fence);
> > +             ttm_bo_unreserve(&old_bo->bo);
> > +     }
> >
> >       nouveau_bo_unpin(old_bo);
> >  }
> > @@ -624,6 +628,12 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc,
struct drm_framebuffer *fb,
> >       if (!drm->channel)
> >               return -ENODEV;
> >
> > +     if (unlikely(old_bo =3D=3D new_bo)) {
> > +             char name[sizeof(current->comm)];
> > +             pr_debug_ratelimited("'%s': useless page flip invoked\n",
> > +                             get_task_comm(name, current));
> > +     }
> > +
> The patch looks alright, except I think we should just drop this hunk,
> no other driver reports it either.
>
> Thoughts?

It will be easier to debug buggy clients with this code in. With multiple
wayland compositors it's possible some of them might be buggy... But I
don't feel strongly about it. You can delete this hunk when applying.

Marcin

--20cf307ac79b5715d104cc3adeaf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p><br>
17 pa=C5=BA 2012 06:31, &quot;Ben Skeggs&quot; &lt;<a href=3D"mailto:skeggs=
b@gmail.com">skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; napisa=C5=82(a):<br>
&gt;<br>
&gt; On Fri, Oct 05, 2012 at 09:37:59PM +0200, Marcin Slusarz wrote:<br>
&gt; &gt; It&#39;s questionable use case, but weston/wayland already relies=
 on this behaviour,<br>
&gt; &gt; and other drivers don&#39;t care about it, so it&#39;s a matter o=
f compatibility.<br>
&gt; &gt; Without it, process invoking such page flip hangs in unkillable s=
tate, trying<br>
&gt; &gt; to reserve the same buffer twice.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Marcin Slusarz &lt;<a href=3D"mailto:marcin.slusar=
z@gmail.com">marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0drivers/gpu/drm/nouveau/nouveau_display.c | 20 ++++++++++++=
+++-----<br>
&gt; &gt; =C2=A01 file changed, 15 insertions(+), 5 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/=
gpu/drm/nouveau/nouveau_display.c<br>
&gt; &gt; index 61f370d..a52cfd3 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/nouveau/nouveau_display.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/nouveau/nouveau_display.c<br>
&gt; &gt; @@ -530,9 +530,11 @@ nouveau_page_flip_reserve(struct nouveau_bo =
*old_bo,<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
&gt; &gt;<br>
&gt; &gt; - =C2=A0 =C2=A0 ret =3D ttm_bo_reserve(&amp;old_bo-&gt;bo, false,=
 false, false, 0);<br>
&gt; &gt; - =C2=A0 =C2=A0 if (ret)<br>
&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_unreserve;<=
br>
&gt; &gt; + =C2=A0 =C2=A0 if (likely(old_bo !=3D new_bo)) {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ttm_bo_reserv=
e(&amp;old_bo-&gt;bo, false, false, false, 0);<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goto fail_unreserve;<br>
&gt; &gt; + =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt;<br>
&gt; &gt; @@ -551,8 +553,10 @@ nouveau_page_flip_unreserve(struct nouveau_b=
o *old_bo,<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 nouveau_bo_fence(new_bo, fence);<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 ttm_bo_unreserve(&amp;new_bo-&gt;bo);<br>
&gt; &gt;<br>
&gt; &gt; - =C2=A0 =C2=A0 nouveau_bo_fence(old_bo, fence);<br>
&gt; &gt; - =C2=A0 =C2=A0 ttm_bo_unreserve(&amp;old_bo-&gt;bo);<br>
&gt; &gt; + =C2=A0 =C2=A0 if (likely(old_bo !=3D new_bo)) {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nouveau_bo_fence(old_=
bo, fence);<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ttm_bo_unreserve(&amp=
;old_bo-&gt;bo);<br>
&gt; &gt; + =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 nouveau_bo_unpin(old_bo);<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt; @@ -624,6 +628,12 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc=
, struct drm_framebuffer *fb,<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (!drm-&gt;channel)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<=
br>
&gt; &gt;<br>
&gt; &gt; + =C2=A0 =C2=A0 if (unlikely(old_bo =3D=3D new_bo)) {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char name[sizeof(curr=
ent-&gt;comm)];<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug_ratelimited(=
&quot;&#39;%s&#39;: useless page flip invoked\n&quot;,<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_task_comm(name, current));<br>
&gt; &gt; + =C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; The patch looks alright, except I think we should just drop this hunk,=
<br>
&gt; no other driver reports it either.<br>
&gt;<br>
&gt; Thoughts?</p>
<p>It will be easier to debug buggy clients with this code in. With multipl=
e wayland compositors it&#39;s possible some of them might be buggy... But =
I don&#39;t feel strongly about it. You can delete this hunk when applying.=
</p>

<p>Marcin=C2=A0 <br>
</p>

--20cf307ac79b5715d104cc3adeaf--

--===============0462248446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0462248446==--
