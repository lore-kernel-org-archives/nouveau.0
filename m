From: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/8] Secure Boot refactoring
Date: Tue, 11 Oct 2016 08:57:56 +0200
Message-ID: <CAEXux-bmd-wKceqgZTP0P=Vj2uva1MqJ=xhPEPrh_BswAOtH5g@mail.gmail.com>
References: <20161011064553.10616-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1358299788=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20161011064553.10616-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1358299788==
Content-Type: multipart/alternative; boundary=001a1143840e78d67b053e916564

--001a1143840e78d67b053e916564
Content-Type: text/plain; charset=UTF-8

Is it just me or is the 5th patch lost?

Am Dienstag, 11. Oktober 2016 schrieb Alexandre Courbot :

> Hi everyone,
>
> Apologies for the big patchset. This is a rework of the secure boot code
> that
> moves the building of the blob into its own set of source files (and own
> hooks),
> making the code more flexible and (hopefully) easier to understand as well.
>
> This rework is needed to support more signed firmware for existing and new
> chips. Since the firmwares in question are not available yet I cannot send
> the
> code for them yet, but hopefully the gain in clarity will be enough to
> merge
> this series ahead of the rest.
>
> Patch 1 is just to make nv*_printk() more tolerent of my use of const
> pointers.
> Patch 2 lays the foundation of a small common falcon library that could
> avoid
> duplicated code in various parts of the driver. Right now only secure boot
> makes
> use of it (patch 3), but there are many potential users (GR, PMU, etc). I
> will
> test users and send further patches making use of it.
>
> Patch 4 renames a hook to something better describing its actual use.
>
> Patch 5 is where the big refactoring occurs. It looks scary, but is really
> just
> moving code (and introducing the nvkm_acr structures).
>
> Patch 6, 7 and 8 remove a few HS hooks that turn out to be unneeded, and
> add
> support for LS hooks.
>
> The end result can be observed by looking at acr_v1_gm20b.c: all the
> specifics
> of GM20B's firmware are handled in a single file, with no data structures
> shared
> with acr_v1.c. The gm20b_acr_v1_ls_func variable also describes clearly
> what
> LS firmwares are to be loaded and how.
>
> Alexandre Courbot (8):
>   core: constify nv*_printk macros
>   core: add falcon library
>   secboot: use falcon library's IMEM/DMEM loading functions
>   secboot: rename init() hook to oneinit()
>   secboot: move ACR building logic into own source files
>   secboot: remove fixup_hs_desc hook
>   secboot: add low-secure firmware hooks
>   secboot: generate HS BL descriptor in hook
>
>  drm/nouveau/include/nvkm/core/client.h         |    4 +-
>  drm/nouveau/include/nvkm/core/device.h         |    2 +-
>  drm/nouveau/include/nvkm/core/falcon.h         |   50 +
>  drm/nouveau/include/nvkm/core/subdev.h         |    2 +-
>  drm/nouveau/include/nvkm/subdev/secboot.h      |   33 +-
>  drm/nouveau/nvkm/core/Kbuild                   |    1 +
>  drm/nouveau/nvkm/core/falcon.c                 |   62 ++
>  drm/nouveau/nvkm/engine/gr/gf100.c             |   16 +-
>  drm/nouveau/nvkm/engine/gr/gm200.c             |    6 +-
>  drm/nouveau/nvkm/subdev/secboot/Kbuild         |    2 +
>  drm/nouveau/nvkm/subdev/secboot/acr.h          |   67 ++
>  drm/nouveau/nvkm/subdev/secboot/acr_v1.c       | 1193
> ++++++++++++++++++++
>  drm/nouveau/nvkm/subdev/secboot/acr_v1.h       |  346 ++++++
>  drm/nouveau/nvkm/subdev/secboot/acr_v1_gm20b.c |  135 +++
>  drm/nouveau/nvkm/subdev/secboot/base.c         |  113 +-
>  drm/nouveau/nvkm/subdev/secboot/gm200.c        | 1386
> +-----------------------
>  drm/nouveau/nvkm/subdev/secboot/gm200.h        |   43 +
>  drm/nouveau/nvkm/subdev/secboot/gm20b.c        |  141 +--
>  drm/nouveau/nvkm/subdev/secboot/priv.h         |  208 +---
>  19 files changed, 2072 insertions(+), 1738 deletions(-)
>  create mode 100644 drm/nouveau/include/nvkm/core/falcon.h
>  create mode 100644 drm/nouveau/nvkm/core/falcon.c
>  create mode 100644 drm/nouveau/nvkm/subdev/secboot/acr.h
>  create mode 100644 drm/nouveau/nvkm/subdev/secboot/acr_v1.c
>  create mode 100644 drm/nouveau/nvkm/subdev/secboot/acr_v1.h
>  create mode 100644 drm/nouveau/nvkm/subdev/secboot/acr_v1_gm20b.c
>  create mode 100644 drm/nouveau/nvkm/subdev/secboot/gm200.h
>
> --
> 2.10.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <javascript:;>
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a1143840e78d67b053e916564
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Is it just me or is the 5th patch lost?<br><br>Am Dienstag, 11. Oktober 201=
6 schrieb Alexandre Courbot :<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi everyone=
,<br>
<br>
Apologies for the big patchset. This is a rework of the secure boot code th=
at<br>
moves the building of the blob into its own set of source files (and own ho=
oks),<br>
making the code more flexible and (hopefully) easier to understand as well.=
<br>
<br>
This rework is needed to support more signed firmware for existing and new<=
br>
chips. Since the firmwares in question are not available yet I cannot send =
the<br>
code for them yet, but hopefully the gain in clarity will be enough to merg=
e<br>
this series ahead of the rest.<br>
<br>
Patch 1 is just to make nv*_printk() more tolerent of my use of const point=
ers.<br>
Patch 2 lays the foundation of a small common falcon library that could avo=
id<br>
duplicated code in various parts of the driver. Right now only secure boot =
makes<br>
use of it (patch 3), but there are many potential users (GR, PMU, etc). I w=
ill<br>
test users and send further patches making use of it.<br>
<br>
Patch 4 renames a hook to something better describing its actual use.<br>
<br>
Patch 5 is where the big refactoring occurs. It looks scary, but is really =
just<br>
moving code (and introducing the nvkm_acr structures).<br>
<br>
Patch 6, 7 and 8 remove a few HS hooks that turn out to be unneeded, and ad=
d<br>
support for LS hooks.<br>
<br>
The end result can be observed by looking at acr_v1_gm20b.c: all the specif=
ics<br>
of GM20B&#39;s firmware are handled in a single file, with no data structur=
es shared<br>
with acr_v1.c. The gm20b_acr_v1_ls_func variable also describes clearly wha=
t<br>
LS firmwares are to be loaded and how.<br>
<br>
Alexandre Courbot (8):<br>
=C2=A0 core: constify nv*_printk macros<br>
=C2=A0 core: add falcon library<br>
=C2=A0 secboot: use falcon library&#39;s IMEM/DMEM loading functions<br>
=C2=A0 secboot: rename init() hook to oneinit()<br>
=C2=A0 secboot: move ACR building logic into own source files<br>
=C2=A0 secboot: remove fixup_hs_desc hook<br>
=C2=A0 secboot: add low-secure firmware hooks<br>
=C2=A0 secboot: generate HS BL descriptor in hook<br>
<br>
=C2=A0drm/nouveau/include/nvkm/core/<wbr>client.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0drm/nouveau/include/nvkm/core/<wbr>device.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0drm/nouveau/include/nvkm/core/<wbr>falcon.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A050 +<br>
=C2=A0drm/nouveau/include/nvkm/core/<wbr>subdev.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0drm/nouveau/include/nvkm/<wbr>subdev/secboot.h=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A033 +-<br>
=C2=A0drm/nouveau/nvkm/core/Kbuild=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0drm/nouveau/nvkm/core/falcon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A062 ++<br>
=C2=A0drm/nouveau/nvkm/engine/gr/<wbr>gf100.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A016 +-<br>
=C2=A0drm/nouveau/nvkm/engine/gr/<wbr>gm200.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +-<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/Kbuild=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/acr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A067 ++<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/acr_v1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1193 ++++++++++++++++++++<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/acr_v1.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 346 ++++++<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/acr_v1_gm20b.c |=C2=A0 135 +++<b=
r>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/base.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 113 +-<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/gm200.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1386 +-----------------------<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/gm200.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A043 +<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/gm20b.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 141 +--<br>
=C2=A0drm/nouveau/nvkm/subdev/<wbr>secboot/priv.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 208 +---<br>
=C2=A019 files changed, 2072 insertions(+), 1738 deletions(-)<br>
=C2=A0create mode 100644 drm/nouveau/include/nvkm/core/<wbr>falcon.h<br>
=C2=A0create mode 100644 drm/nouveau/nvkm/core/falcon.c<br>
=C2=A0create mode 100644 drm/nouveau/nvkm/subdev/<wbr>secboot/acr.h<br>
=C2=A0create mode 100644 drm/nouveau/nvkm/subdev/<wbr>secboot/acr_v1.c<br>
=C2=A0create mode 100644 drm/nouveau/nvkm/subdev/<wbr>secboot/acr_v1.h<br>
=C2=A0create mode 100644 drm/nouveau/nvkm/subdev/<wbr>secboot/acr_v1_gm20b.=
c<br>
=C2=A0create mode 100644 drm/nouveau/nvkm/subdev/<wbr>secboot/gm200.h<br>
<br>
--<br>
2.10.0<br>
<br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Nouveau@=
lists.freedesktop.org&#39;)">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" target=
=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/listinfo/nouveau</a>=
<br>
</blockquote>

--001a1143840e78d67b053e916564--

--===============1358299788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1358299788==--
