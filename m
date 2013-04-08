From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: idle all channels before
	suspending
Date: Tue, 9 Apr 2013 09:14:38 +1000
Message-ID: <CACAvsv6hY9u_8FNNwbEXYCMLRPnBivup3W_O4v8tqC3q2AAYhg@mail.gmail.com>
References: <5162B231.2060900@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0170852615=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5162B231.2060900-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0170852615==
Content-Type: multipart/alternative; boundary=047d7b471f5ad9644e04d9e1990c

--047d7b471f5ad9644e04d9e1990c
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 8, 2013 at 10:04 PM, Maarten Lankhorst <
maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:

> Seems to make suspend slightly more reliable on my system.
>
NACK.

"Seems to", and "slightly" don't make a very good argument for this.
 Likely all you've done is change the timing of certain things happening.

The PFIFO and engine (PGRAPH etc) modules already take care of idling and
unloading active channels.  If something is broken there, that's where it
needs fixing, not this hack that "maybe" "possibly" "slightly" works.

Ben.


> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [3.7+]
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index b6bdc9f..5032c31 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -464,6 +464,23 @@ nouveau_do_suspend(struct drm_device *dev)
>         NV_INFO(drm, "evicting buffers...\n");
>         ttm_bo_evict_mm(&drm->ttm.bdev, TTM_PL_VRAM);
>
> +       list_for_each_entry(cli, &drm->clients, head) {
> +               struct nouveau_abi16 *abi16 = cli->abi16;
> +               struct nouveau_abi16_chan *chan;
> +
> +               if (!abi16)
> +                       continue;
> +
> +               list_for_each_entry(chan, &abi16->channels, head)
> +                       nouveau_channel_idle(chan->chan);
> +       }
> +
> +       if (drm->channel)
> +               nouveau_channel_idle(drm->channel);
> +
> +       if (drm->cechan)
> +               nouveau_channel_idle(drm->cechan);
> +
>         if (drm->fence && nouveau_fence(drm)->suspend) {
>                 if (!nouveau_fence(drm)->suspend(drm))
>                         return -ENOMEM;
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--047d7b471f5ad9644e04d9e1990c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Apr 8, 2013 at 10:04 PM, Maarten Lankhorst <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org" target=3D=
"_blank">maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra">
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Seems to make sus=
pend slightly more reliable on my system.<br></blockquote><div style>NACK.<=
/div>
<div style><br></div><div style>&quot;Seems to&quot;, and &quot;slightly&qu=
ot; don&#39;t make a very good argument for this. =A0Likely all you&#39;ve =
done is change the timing of certain things happening.</div><div style><br>
</div><div style>The PFIFO and engine (PGRAPH etc) modules already take car=
e of idling and unloading active channels. =A0If something is broken there,=
 that&#39;s where it needs fixing, not this hack that &quot;maybe&quot; &qu=
ot;possibly&quot; &quot;slightly&quot; works.</div>
<div style><br></div><div style>Ben.</div><div style><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
Cc: <a href=3D"mailto:stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a> [3=
.7+]<br>
Signed-off-by: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@ca=
nonical.com">maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org</a>&gt;<br>
---<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouvea=
u/nouveau_drm.c<br>
index b6bdc9f..5032c31 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c<br>
@@ -464,6 +464,23 @@ nouveau_do_suspend(struct drm_device *dev)<br>
=A0 =A0 =A0 =A0 NV_INFO(drm, &quot;evicting buffers...\n&quot;);<br>
=A0 =A0 =A0 =A0 ttm_bo_evict_mm(&amp;drm-&gt;ttm.bdev, TTM_PL_VRAM);<br>
<br>
+ =A0 =A0 =A0 list_for_each_entry(cli, &amp;drm-&gt;clients, head) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_abi16 *abi16 =3D cli-&gt;abi16=
;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_abi16_chan *chan;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!abi16)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_for_each_entry(chan, &amp;abi16-&gt;chan=
nels, head)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_channel_idle(chan-&gt=
;chan);<br>
+ =A0 =A0 =A0 }<br>
+<br>
+ =A0 =A0 =A0 if (drm-&gt;channel)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_channel_idle(drm-&gt;channel);<br>
+<br>
+ =A0 =A0 =A0 if (drm-&gt;cechan)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_channel_idle(drm-&gt;cechan);<br>
+<br>
=A0 =A0 =A0 =A0 if (drm-&gt;fence &amp;&amp; nouveau_fence(drm)-&gt;suspend=
) {<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!nouveau_fence(drm)-&gt;suspend(drm))<b=
r>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">dri-devel-PD4FTy7X32lzq7FAFJ/aeQ@public.gmane.org=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</blockquote></div><br></div></div>

--047d7b471f5ad9644e04d9e1990c--

--===============0170852615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0170852615==--
