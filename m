From: Nicolas Mercier <mercier.nicolas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau: kernel hang on Optimus+Intel+NVidia GeForce
	1060m
Date: Thu, 14 Sep 2017 00:13:59 +0200
Message-ID: <CAKyUnMVKNHkYa9TMf9_MFXEfLV-qx42Vg5eKh1ReT03Eo+3xJQ@mail.gmail.com>
References: <CAKyUnMW6f-EpyjZ=tocOR6Ji8MLprF71YzNsOKv-+UGtbvqH=g@mail.gmail.com>
 <cb794e03-6ca8-7e80-9277-ea780ee0bbd2@mni.thm.de>
 <CAKyUnMVeWzgptcN0CVLg4SYriY7+29wXcdaAH4Xig7tXSuXBtA@mail.gmail.com>
 <CAKyUnMW-OUpMtXoVgP0xz-LawgtewPGQEcu5P=CgYU_Bi9pqaQ@mail.gmail.com>
 <e3e5a763-4a54-0b62-2151-d3f123ab5067@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0930219062=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <e3e5a763-4a54-0b62-2151-d3f123ab5067-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0930219062==
Content-Type: multipart/alternative; boundary="001a114c7eaa0d24f10559197afb"

--001a114c7eaa0d24f10559197afb
Content-Type: text/plain; charset="UTF-8"

Thanks Tobias, I tried this but unfortunately the only effect was thta the
boot was delayed by an additional 4 seconds :(
The original timeout is at
drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
I tried to increase that timeout, but it did not seem to make a difference
either.

I think I get this error less often when I have a cable plugged in the
output of that card at boot, whereas I always get this error when I boot
without a monitor attached to the card.

On Wed, Sep 13, 2017 at 2:28 PM, Tobias Klausmann <
tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:

> Hi,
>
> the system fails to initialize your vbios using secureboot (i had a rare
> chance to on my system to witness it again), for now i traced it to
> acr_boot_falcon() in
> "linux/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c" where it
> throws -110 which is -ETIMEDOUT. You could try to increase the timeout
> and see if it helps something, similar to the following:
>
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
> b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
> index 77273b53672c..fc0cb187d80d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
> @@ -326,7 +326,7 @@ nvkm_msgqueue_post(struct nvkm_msgqueue *priv, enum
> msgqueue_msg_priority prio,
>         int ret;
>
>         if (wait_init && !wait_for_completion_timeout(&priv->init_done,
> -                                        msecs_to_jiffies(1000)))
> +                                        msecs_to_jiffies(5000)))
>                 return -ETIMEDOUT;
>
>         queue = priv->func->cmd_queue(priv, prio);
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0137c63d.c
> b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0137c63d.c
> index fec0273158f6..c2ae525a0780 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0137c63d.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0137c63d.c
> @@ -279,6 +279,7 @@ acr_boot_falcon(struct nvkm_msgqueue *priv, enum
> nvkm_secboot_falcon falcon)
>                 u32 flags;
>                 u32 falcon_id;
>         } cmd;
> +       const struct nvkm_subdev *subdev = priv->falcon->owner;
>
>         memset(&cmd, 0, sizeof(cmd));
>
> @@ -290,7 +291,8 @@ acr_boot_falcon(struct nvkm_msgqueue *priv, enum
> nvkm_secboot_falcon falcon)
>         nvkm_msgqueue_post(priv, MSGQUEUE_MSG_PRIORITY_HIGH, &cmd.hdr,
>                         acr_boot_falcon_callback, &completed, true);
>
> -       if (!wait_for_completion_timeout(&completed,
> msecs_to_jiffies(1000)))
> +       nvkm_error(subdev, "waiting for timeout in acr_boot_falcon
> (msgqueue_0137bca5)\n");
> +       if (!wait_for_completion_timeout(&completed,
> msecs_to_jiffies(5000)))
>                 return -ETIMEDOUT;
>
>         return 0;
>
>
>
> On 9/13/17 11:37 AM, Nicolas Mercier wrote:
> > I am still looking for a solution. I have hacked around in the code
> > and found out the following:
> > - Nouveau prefers using PCIE power managemet over ACPI Optimus calls.
> > I tried to force it to use Optimus ACPI calls, but there was an error
> > calling the ACPI method so it bails out and uses PCIE PM anyway.
> > - I tried to debug the PCIE pm states which internally uses ACPI to
> > turn power on/off. I could print different statuses here and there.
> > When the power is switched off, ACPI calls turn the power off then the
> > kernel successfully puts the device in state D3Cold (also turning off
> > power to the PCI Express port). When waking up, ACPI turns the power
> > on, apparently successfully (Device [PEGP] transitioned to D0). But a
> > read from the PCI bus to get the power state & other flags return
> > 65535 (~0) and the kernel fails to set the device in D0 (although ACPI
> > claims it is in D0)
> > The call to pci_raw_set_power_state (in drivers/pci/pci.c) seems to
> > fail because pci_read_config_word returns "~0" (and does not return
> > any error code)
> >
> > I have tried different things; if I use pcie_port_pm=off, the NVidia
> > card goes to state D3Hot (if I am not mistaken, its PCIE port is still
> > powered) but that did not fix it. I tried to turn on or off different
> > PCI/PCIexpress features such as hotplug, PM and so on. The only thing
> > that works is that PM is fully disabled, which equals to the device
> > not being powered off, so that would be equivalent to nouveau.runpm=0,
> > which is not helping a lot. I have tried to force pcie aspm by
> > recompiling the ACPI table, still no luck.
> >
> > I am still taking a look, but it seems like the problem comes from the
> > PCIExpress PM functions and ACPI, not directly from Nouveau
> >
> > /n
>

--001a114c7eaa0d24f10559197afb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Tobias, I tried this but unfortunately the only eff=
ect was thta the boot was delayed by an additional 4 seconds :(<div>The ori=
ginal timeout is at=C2=A0<span style=3D"color:rgb(0,0,0);font-family:&quot;=
Courier New&quot;,Courier,monospace,arial,sans-serif;font-size:14px;white-s=
pace:pre-wrap">drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueu=
e.c</span><div>I tried to increase that timeout, but it did not seem to mak=
e a difference either.</div></div><div><br></div><div>I think I get this er=
ror less often when I have a cable plugged in the output of that card at bo=
ot, whereas I always get this error when I boot without a monitor attached =
to the card.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Wed, Sep 13, 2017 at 2:28 PM, Tobias Klausmann <span dir=3D"ltr">=
&lt;<a href=3D"mailto:tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org" target=3D"_blan=
k">tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi,<br>
<br>
the system fails to initialize your vbios using secureboot (i had a rare<br=
>
chance to on my system to witness it again), for now i traced it to<br>
acr_boot_falcon() in<br>
&quot;linux/drivers/gpu/drm/<wbr>nouveau/nvkm/falcon/msgqueue_<wbr>0148cdec=
.c&quot; where it<br>
throws -110 which is -ETIMEDOUT. You could try to increase the timeout<br>
and see if it helps something, similar to the following:<br>
<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue.c<br>
b/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue.c<br>
index 77273b53672c..fc0cb187d80d 100644<br>
--- a/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue.c<br>
+++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue.c<br>
@@ -326,7 +326,7 @@ nvkm_msgqueue_post(struct nvkm_msgqueue *priv, enum<br>
msgqueue_msg_priority prio,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;<br>
=C2=A0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (wait_init &amp;&amp; !wait_f=
or_completion_timeout(&amp;<wbr>priv-&gt;init_done,<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(1000)))<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(5000)))<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -ETIMEDOUT;<br>
=C2=A0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue =3D priv-&gt;func-&gt;cmd_=
queue(priv, prio);<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue_0137c63d.<wb=
r>c<br>
b/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue_0137c63d.<wbr>c<br>
index fec0273158f6..c2ae525a0780 100644<br>
--- a/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue_0137c63d.<wbr>c<br>
+++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/falcon/msgqueue_0137c63d.<wbr>c<br>
@@ -279,6 +279,7 @@ acr_boot_falcon(struct nvkm_msgqueue *priv, enum<br>
nvkm_secboot_falcon falcon)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u32 flags;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u32 falcon_id;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } cmd;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct nvkm_subdev *subdev =3D =
priv-&gt;falcon-&gt;owner;<br>
=C2=A0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(&amp;cmd, 0, sizeof(cmd))=
;<br>
=C2=A0<br>
@@ -290,7 +291,8 @@ acr_boot_falcon(struct nvkm_msgqueue *priv, enum<br>
nvkm_secboot_falcon falcon)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvkm_msgqueue_post(priv, MSGQUEU=
E_MSG_PRIORITY_HIGH, &amp;cmd.hdr,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acr_boot_fa=
lcon_callback, &amp;completed, true);<br>
=C2=A0<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!wait_for_completion_timeout(<wbr=
>&amp;completed,<br>
msecs_to_jiffies(1000)))<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvkm_error(subdev, &quot;waiting for =
timeout in acr_boot_falcon<br>
(msgqueue_0137bca5)\n&quot;);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!wait_for_completion_timeout(<wbr=
>&amp;completed,<br>
msecs_to_jiffies(5000)))<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -ETIMEDOUT;<br>
=C2=A0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
On 9/13/17 11:37 AM, Nicolas Mercier wrote:<br>
&gt; I am still looking for a solution. I have hacked around in the code<br=
>
&gt; and found out the following:<br>
&gt; - Nouveau prefers using PCIE power managemet over ACPI Optimus calls.<=
br>
&gt; I tried to force it to use Optimus ACPI calls, but there was an error<=
br>
&gt; calling the ACPI method so it bails out and uses PCIE PM anyway.<br>
&gt; - I tried to debug the PCIE pm states which internally uses ACPI to<br=
>
&gt; turn power on/off. I could print different statuses here and there.<br=
>
&gt; When the power is switched off, ACPI calls turn the power off then the=
<br>
&gt; kernel successfully puts the device in state D3Cold (also turning off<=
br>
&gt; power to the PCI Express port). When waking up, ACPI turns the power<b=
r>
&gt; on, apparently successfully (Device [PEGP] transitioned to D0). But a<=
br>
&gt; read from the PCI bus to get the power state &amp; other flags return<=
br>
&gt; 65535 (~0) and the kernel fails to set the device in D0 (although ACPI=
<br>
&gt; claims it is in D0)<br>
&gt; The call to pci_raw_set_power_state (in drivers/pci/pci.c) seems to<br=
>
&gt; fail because pci_read_config_word returns &quot;~0&quot; (and does not=
 return<br>
&gt; any error code)<br>
&gt;<br>
&gt; I have tried different things; if I use pcie_port_pm=3Doff, the NVidia=
<br>
&gt; card goes to state D3Hot (if I am not mistaken, its PCIE port is still=
<br>
&gt; powered) but that did not fix it. I tried to turn on or off different<=
br>
&gt; PCI/PCIexpress features such as hotplug, PM and so on. The only thing<=
br>
&gt; that works is that PM is fully disabled, which equals to the device<br=
>
&gt; not being powered off, so that would be equivalent to nouveau.runpm=3D=
0,<br>
&gt; which is not helping a lot. I have tried to force pcie aspm by<br>
&gt; recompiling the ACPI table, still no luck.<br>
&gt;<br>
&gt; I am still taking a look, but it seems like the problem comes from the=
<br>
&gt; PCIExpress PM functions and ACPI, not directly from Nouveau<br>
&gt;<br>
&gt; /n<br>
</div></div></blockquote></div><br></div>

--001a114c7eaa0d24f10559197afb--

--===============0930219062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0930219062==--
