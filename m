From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: Allow 3D accelerators with output
	ports
Date: Mon, 29 Apr 2013 07:53:30 +1000
Message-ID: <CACAvsv4=GXtau7jTXB_3t8nM8g=sTTBB2cE3SFN6-=fGLffYEw@mail.gmail.com>
References: <1367004188-8892-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0417698540=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1367004188-8892-1-git-send-email-marex-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0417698540==
Content-Type: multipart/alternative; boundary=089e012280f27d6a4404db72ccdf

--089e012280f27d6a4404db72ccdf
Content-Type: text/plain; charset=ISO-8859-1

Hm, I expect you can probably just change the mask to 0x00ff0000, which is
what our kernel module accepts anyway.


On Sat, Apr 27, 2013 at 5:23 AM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:

> This patch let's cards with PCI class 0x30200 (3D controller) be
> operated by the nouveau driver as well. The nv Quadro NVS 450 is
> one such card, where the first GPU has PCI class 0x30000 and the
> other GPU has PCI class 0x30200. By ignoring the 1 << 9 bit in
> the PCI class mask, displays attached to the other GPU can also
> be used now.
>
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  src/nv_driver.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> NOTE: I might have sent this to the wrong ML, this is my first
>       time submitting a nouveau patch.
>
> diff --git a/src/nv_driver.c b/src/nv_driver.c
> index 2b74fc6..0dce0aa 100644
> --- a/src/nv_driver.c
> +++ b/src/nv_driver.c
> @@ -60,7 +60,7 @@ static Bool   NVUnmapMem(ScrnInfoPtr pScrn);
>
>  #define NOUVEAU_PCI_DEVICE(_vendor_id, _device_id)
>       \
>         { (_vendor_id), (_device_id), PCI_MATCH_ANY, PCI_MATCH_ANY,
>      \
> -         0x00030000, 0x00ffffff, 0 }
> +         0x00030000, 0x00fffdff, 0 }
>
>  static const struct pci_id_match nouveau_device_match[] = {
>         NOUVEAU_PCI_DEVICE(0x12d2, PCI_MATCH_ANY),
> --
> 1.7.10.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

--089e012280f27d6a4404db72ccdf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hm, I expect you can probably just change the mask to 0x00=
ff0000, which is what our kernel module accepts anyway.</div><div class=3D"=
gmail_extra"><br><br><div class=3D"gmail_quote">On Sat, Apr 27, 2013 at 5:2=
3 AM, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"mailto:marex-ynQEQJNshbs@public.gmane.org" ta=
rget=3D"_blank">marex-ynQEQJNshbs@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This patch let&#39;s cards with PCI class 0x=
30200 (3D controller) be<br>
operated by the nouveau driver as well. The nv Quadro NVS 450 is<br>
one such card, where the first GPU has PCI class 0x30000 and the<br>
other GPU has PCI class 0x30200. By ignoring the 1 &lt;&lt; 9 bit in<br>
the PCI class mask, displays attached to the other GPU can also<br>
be used now.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex-ynQEQJNshbs@public.gmane.org">marex@denx.=
de</a>&gt;<br>
Cc: Dave Airlie &lt;<a href=3D"mailto:airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">airlied-H+wXaHxf7aJhl2p70BpVqQ@public.gmane.org=
m</a>&gt;<br>
---<br>
=A0src/nv_driver.c | =A0 =A02 +-<br>
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
NOTE: I might have sent this to the wrong ML, this is my first<br>
=A0 =A0 =A0 time submitting a nouveau patch.<br>
<br>
diff --git a/src/nv_driver.c b/src/nv_driver.c<br>
index 2b74fc6..0dce0aa 100644<br>
--- a/src/nv_driver.c<br>
+++ b/src/nv_driver.c<br>
@@ -60,7 +60,7 @@ static Bool =A0 NVUnmapMem(ScrnInfoPtr pScrn);<br>
<br>
=A0#define NOUVEAU_PCI_DEVICE(_vendor_id, _device_id) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
=A0 =A0 =A0 =A0 { (_vendor_id), (_device_id), PCI_MATCH_ANY, PCI_MATCH_ANY,=
 =A0 =A0 =A0 =A0 =A0 =A0\<br>
- =A0 =A0 =A0 =A0 0x00030000, 0x00ffffff, 0 }<br>
+ =A0 =A0 =A0 =A0 0x00030000, 0x00fffdff, 0 }<br>
<br>
=A0static const struct pci_id_match nouveau_device_match[] =3D {<br>
=A0 =A0 =A0 =A0 NOUVEAU_PCI_DEVICE(0x12d2, PCI_MATCH_ANY),<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</font></span></blockquote></div><br></div>

--089e012280f27d6a4404db72ccdf--

--===============0417698540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0417698540==--
