From: Rick Kerkhof <rick.2889@gmail.com>
Subject: Re: [PATCH] drm/nouveau/acpi: fix check for power resources support
Date: Sat, 29 Oct 2016 22:45:41 +0000
Message-ID: <CANni8hcK0XrrC+eNNXUvt5m=nsUZbLFAS_CNL59aoE023uJR2Q@mail.gmail.com>
References: <20161028234003.21152-1-peter@lekensteyn.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1542982499=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161028234003.21152-1-peter@lekensteyn.nl>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Wu <peter@lekensteyn.nl>, Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, Mika Westerberg <mika.westerberg@linux.intel.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============1542982499==
Content-Type: multipart/alternative; boundary=089e012278cca27683054008bca0

--089e012278cca27683054008bca0
Content-Type: text/plain; charset=UTF-8

Op za 29 okt. 2016 om 01:40 schreef Peter Wu <peter@lekensteyn.nl>:

> Check whether the kernel really supports power resources for a device,
> otherwise the power might not be removed when the device is runtime
> suspended (DSM should still work in these cases where PR does not).
>
> Link: https://bugs.freedesktop.org/show_bug.cgi?id=98398
> Fixes: 692a17dcc292 ("drm/nouveau/acpi: fix lockup with PCIe runtime PM")
> Signed-off-by: Peter Wu <peter@lekensteyn.nl>
> ---
> Hi,
>
> Maybe Cc: stable (4.8+)?
>
> Compile-tested only. Rick, can you test if this patch fixes the problem
> for you?
>
> This check was actually in the original patch, but it was changed:
> https://lists.freedesktop.org/archives/nouveau/2016-May/025125.html
> Re-adding the check as suggested by Mika.
>
> Kind regards,
> Peter
> ---
>  drivers/gpu/drm/nouveau/nouveau_acpi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> index dc57b62..193573d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -240,7 +240,8 @@ static bool nouveau_pr3_present(struct pci_dev *pdev)
>         if (!parent_adev)
>                 return false;
>
> -       return acpi_has_method(parent_adev->handle, "_PR3");
> +       return parent_adev->power.flags.power_resources &&
> +               acpi_has_method(parent_adev->handle, "_PR3");
>  }
>
>  static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle
> *dhandle_out,
> --
> 2.10.1
>
> Hi Peter,

This patch indeed does fix the issue for me, thank you.

Kind regards,
Rick

Tested-by: Rick Kerkhof <rick.2889@gmail.com>

--089e012278cca27683054008bca0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">Op za =
29 okt. 2016 om 01:40 schreef Peter Wu &lt;<a href=3D"mailto:peter@lekenste=
yn.nl">peter@lekensteyn.nl</a>&gt;:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Check whether the kernel really supports power resources for a device,<br =
class=3D"gmail_msg">
otherwise the power might not be removed when the device is runtime<br clas=
s=3D"gmail_msg">
suspended (DSM should still work in these cases where PR does not).<br clas=
s=3D"gmail_msg">
<br class=3D"gmail_msg">
Link: <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398" rel=
=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://bugs.freedesk=
top.org/show_bug.cgi?id=3D98398</a><br class=3D"gmail_msg">
Fixes: 692a17dcc292 (&quot;drm/nouveau/acpi: fix lockup with PCIe runtime P=
M&quot;)<br class=3D"gmail_msg">
Signed-off-by: Peter Wu &lt;<a href=3D"mailto:peter@lekensteyn.nl" class=3D=
"gmail_msg" target=3D"_blank">peter@lekensteyn.nl</a>&gt;<br class=3D"gmail=
_msg">
---<br class=3D"gmail_msg">
Hi,<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Maybe Cc: stable (4.8+)?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Compile-tested only. Rick, can you test if this patch fixes the problem for=
 you?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
This check was actually in the original patch, but it was changed:<br class=
=3D"gmail_msg">
<a href=3D"https://lists.freedesktop.org/archives/nouveau/2016-May/025125.h=
tml" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">https://lists=
.freedesktop.org/archives/nouveau/2016-May/025125.html</a><br class=3D"gmai=
l_msg">
Re-adding the check as suggested by Mika.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Kind regards,<br class=3D"gmail_msg">
Peter<br class=3D"gmail_msg">
---<br class=3D"gmail_msg">
=C2=A0drivers/gpu/drm/nouveau/nouveau_acpi.c | 3 ++-<br class=3D"gmail_msg"=
>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br class=3D"gmail_msg"=
>
<br class=3D"gmail_msg">
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouve=
au/nouveau_acpi.c<br class=3D"gmail_msg">
index dc57b62..193573d 100644<br class=3D"gmail_msg">
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c<br class=3D"gmail_msg">
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c<br class=3D"gmail_msg">
@@ -240,7 +240,8 @@ static bool nouveau_pr3_present(struct pci_dev *pdev)<b=
r class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!parent_adev)<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br cl=
ass=3D"gmail_msg">
<br class=3D"gmail_msg">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return acpi_has_method(parent_adev-&gt;handle, =
&quot;_PR3&quot;);<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return parent_adev-&gt;power.flags.power_resour=
ces &amp;&amp;<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_has_method(par=
ent_adev-&gt;handle, &quot;_PR3&quot;);<br class=3D"gmail_msg">
=C2=A0}<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *=
dhandle_out,<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
2.10.1<br class=3D"gmail_msg">
<br class=3D"gmail_msg"></blockquote><div>Hi Peter,</div><div><br></div><di=
v>This patch indeed does fix the issue for me, thank you.</div><div><br></d=
iv><div>Kind regards,</div><div>Rick</div><div><br></div><div>Tested-by: Ri=
ck Kerkhof &lt;<a href=3D"mailto:rick.2889@gmail.com">rick.2889@gmail.com</=
a>&gt;</div></div></div>

--089e012278cca27683054008bca0--

--===============1542982499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1542982499==--
