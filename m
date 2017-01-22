From: Stefano Belli <stefano9913-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GP107 chipset][PATCH] Recognise GP107 chipset (GTX
	1050/1050ti)
Date: Sun, 22 Jan 2017 18:00:09 +0100
Message-ID: <CAPO+gU+K9dXFXs6L4Wd4HK-Uv9npsfFG=+ogB0FpiTb_8BfXDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1520099560=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1520099560==
Content-Type: multipart/alternative; boundary=001a113c34e4ccb79c0546b1d079

--001a113c34e4ccb79c0546b1d079
Content-Type: text/plain; charset=UTF-8

Hello everyone, I would like to submit a simple patch to let nouveau able
to detect GTX 1050 / 1050ti cards. TESTED and WORKING on my computer with
my GPU (Gigabyte GTX 1050ti OC edition).

drivers/gpu/drm/nouveau/nvkm/engine/device/
base.c

gpu_nouveau_gp107.patch

2272a2273,2301
> static const struct nvkm_device_chip
> nv137_chipset = {
>     .name = "GP107",
>     .bar = gf100_bar_new,
>     .bios = nvkm_bios_new,
>     .bus = gf100_bus_new,
>     .devinit = gm200_devinit_new,
>     .fb = gp102_fb_new,
>     .fuse = gm107_fuse_new,
>     .gpio = gk104_gpio_new,
>     .i2c = gm200_i2c_new,
>     .ibus = gm200_ibus_new,
>     .imem = nv50_instmem_new,
>     .ltc = gp100_ltc_new,
>     .mc = gp100_mc_new,
>     .mmu = gf100_mmu_new,
>     .pci = gp100_pci_new,
>     .pmu = gp102_pmu_new,
>     .timer = gk20a_timer_new,
>     .top = gk104_top_new,
>     .ce[0] = gp102_ce_new,
>     .ce[1] = gp102_ce_new,
>     .ce[2] = gp102_ce_new,
>     .ce[3] = gp102_ce_new,
>     .disp = gp102_disp_new,
>     .dma = gf119_dma_new,
>     .fifo = gp100_fifo_new,
> };
>
2709a2739
>         case 0x137: device->chip = &nv137_chipset; break;

--001a113c34e4ccb79c0546b1d079
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello everyone, I would like to submit a simple =
patch to let nouveau able to detect GTX 1050 / 1050ti cards. TESTED and WOR=
KING on my computer with my GPU (Gigabyte GTX 1050ti OC edition).<br><br></=
div><div>drivers/gpu/drm/nouveau/nvkm/engine/device/<br></div><div>base.c<b=
r></div><div><br></div>gpu_nouveau_gp107.patch<br><br>2272a2273,2301<br>&gt=
; static const struct nvkm_device_chip<br>&gt; nv137_chipset =3D {<br>&gt; =
=C2=A0=C2=A0=C2=A0 .name =3D &quot;GP107&quot;,<br>&gt; =C2=A0=C2=A0=C2=A0 =
.bar =3D gf100_bar_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .bios =3D nvkm_bios_new,=
<br>&gt; =C2=A0=C2=A0=C2=A0 .bus =3D gf100_bus_new,<br>&gt; =C2=A0=C2=A0=C2=
=A0 .devinit =3D gm200_devinit_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .fb =3D gp10=
2_fb_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .fuse =3D gm107_fuse_new,<br>&gt; =C2=
=A0=C2=A0=C2=A0 .gpio =3D gk104_gpio_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .i2c =
=3D gm200_i2c_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .ibus =3D gm200_ibus_new,<br>=
&gt; =C2=A0=C2=A0=C2=A0 .imem =3D nv50_instmem_new,<br>&gt; =C2=A0=C2=A0=C2=
=A0 .ltc =3D gp100_ltc_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .mc =3D gp100_mc_new=
,<br>&gt; =C2=A0=C2=A0=C2=A0 .mmu =3D gf100_mmu_new,<br>&gt; =C2=A0=C2=A0=
=C2=A0 .pci =3D gp100_pci_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .pmu =3D gp102_pm=
u_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .timer =3D gk20a_timer_new,<br>&gt; =C2=
=A0=C2=A0=C2=A0 .top =3D gk104_top_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .ce[0] =
=3D gp102_ce_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .ce[1] =3D gp102_ce_new,<br>&g=
t; =C2=A0=C2=A0=C2=A0 .ce[2] =3D gp102_ce_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .=
ce[3] =3D gp102_ce_new,<br>&gt; =C2=A0=C2=A0=C2=A0 .disp =3D gp102_disp_new=
,<br>&gt; =C2=A0=C2=A0=C2=A0 .dma =3D gf119_dma_new,<br>&gt; =C2=A0=C2=A0=
=C2=A0 .fifo =3D gp100_fifo_new,<br>&gt; };<br>&gt; <br>2709a2739<br>&gt; =
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 case 0x137: device-&gt;chip =3D &amp;=
nv137_chipset; break;<br><br></div><br><div><br></div></div>

--001a113c34e4ccb79c0546b1d079--

--===============1520099560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1520099560==--
