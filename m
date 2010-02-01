From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] drm/nv50: make the pgraph irq handler
	loop like the pre-nv50 version
Date: Mon, 1 Feb 2010 23:26:56 +0100
Message-ID: <6d4bc9fc1002011426n6910667bn7d13837caad275d6@mail.gmail.com>
References: <1265049275-7680-1-git-send-email-madman2003@gmail.com>
	<1265049275-7680-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265049275-7680-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I'm wondering if the write to 0x400824 should be outside the loop,
since it's a flag blocking a ctxprog from continuing.
Anyone know why this one wasn't looping but the pre-nv50 one is?

On Mon, Feb 1, 2010 at 7:34 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_irq.c | =A0140 ++++++++++++++++++-----=
----------
> =A01 files changed, 76 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouv=
eau/nouveau_irq.c
> index baa9b3e..475d0f2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_irq.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
> @@ -580,83 +580,95 @@ nouveau_pgraph_irq_handler(struct drm_device *dev)
> =A0static void
> =A0nv50_pgraph_irq_handler(struct drm_device *dev)
> =A0{
> - =A0 =A0 =A0 uint32_t status, nsource;
> + =A0 =A0 =A0 uint32_t status;
>
> - =A0 =A0 =A0 status =3D nv_rd32(dev, NV03_PGRAPH_INTR);
> - =A0 =A0 =A0 nsource =3D nv_rd32(dev, NV03_PGRAPH_NSOURCE);
> + =A0 =A0 =A0 while ((status =3D nv_rd32(dev, NV03_PGRAPH_INTR))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint32_t nsource =3D nv_rd32(dev, NV03_PGRA=
PH_NSOURCE);
>
> - =A0 =A0 =A0 if (status & 0x00000001) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_notify(dev, nsource);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00000001;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000001);
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status & 0x00000001) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_notify(=
dev, nsource);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00000001;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_IN=
TR, 0x00000001);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (status & 0x00000010) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_error(dev, nsource |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 NV03_PGRAPH_NSOURCE_ILLEGAL_MTHD);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status & 0x00000010) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_error(d=
ev, nsource |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 NV03_PGRAPH_NSOURCE_ILLEGAL_MTHD);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00000010;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000010);
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00000010;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_IN=
TR, 0x00000010);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (status & 0x00001000) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x400500, 0x00000000);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_INTR, NV_PGRAPH_IN=
TR_CONTEXT_SWITCH);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV40_PGRAPH_INTR_EN, nv_rd32(d=
ev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV40_PGRAPH_INTR_EN) & ~NV_=
PGRAPH_INTR_CONTEXT_SWITCH);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x400500, 0x00010001);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status & 0x00001000) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x400500, 0x00=
000000);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_IN=
TR, NV_PGRAPH_INTR_CONTEXT_SWITCH);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV40_PGRAPH_IN=
TR_EN, nv_rd32(dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV40_PGRAPH=
_INTR_EN) & ~NV_PGRAPH_INTR_CONTEXT_SWITCH);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x400500, 0x00=
010001);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv50_graph_context_switch(dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv50_graph_context_switch(d=
ev);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~NV_PGRAPH_INTR_CONTEXT_SWITCH;
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~NV_PGRAPH_INTR=
_CONTEXT_SWITCH;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (status & 0x00100000) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_error(dev, nsource |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 NV03_PGRAPH_NSOURCE_DATA_ERROR);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status & 0x00100000) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_error(d=
ev, nsource |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 NV03_PGRAPH_NSOURCE_DATA_ERROR);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00100000;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_INTR, 0x00100000);
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00100000;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_IN=
TR, 0x00100000);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (status & 0x00200000) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int r;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_error(dev, nsource |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 NV03_PGRAPH_NSOURCE_PROTECTION_ERROR);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "magic set 1:\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x408900; r <=3D 0x408910; r +=
=3D 4)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "\t0x%08x: 0x=
%08x\n", r, nv_rd32(dev, r));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x408900, nv_rd32(dev, 0x40890=
4) | 0xc0000000);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x408e08; r <=3D 0x408e24; r +=
=3D 4)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "\t0x%08x: 0x=
%08x\n", r, nv_rd32(dev, r));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x408e08, nv_rd32(dev, 0x408e0=
8) | 0xc0000000);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "magic set 2:\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x409900; r <=3D 0x409910; r +=
=3D 4)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "\t0x%08x: 0x=
%08x\n", r, nv_rd32(dev, r));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x409900, nv_rd32(dev, 0x40990=
4) | 0xc0000000);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x409e08; r <=3D 0x409e24; r +=
=3D 4)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "\t0x%08x: 0x=
%08x\n", r, nv_rd32(dev, r));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x409e08, nv_rd32(dev, 0x409e0=
8) | 0xc0000000);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00200000;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_NSOURCE, nsource);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_INTR, 0x00200000);
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status & 0x00200000) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int r;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pgraph_intr_error(d=
ev, nsource |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 NV03_PGRAPH_NSOURCE_PROTECTION_ERROR);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "magic set 1:=
\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x408900; r <=3D=
 0x408910; r +=3D 4)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(de=
v, "\t0x%08x: 0x%08x\n", r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 nv_rd32(dev, r));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x408900,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_rd32(dev=
, 0x408904) | 0xc0000000);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x408e08; r <=3D=
 0x408e24; r +=3D 4)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(de=
v, "\t0x%08x: 0x%08x\n", r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_rd32(dev, r));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x408e08,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_rd32(dev=
, 0x408e08) | 0xc0000000);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "magic set 2:=
\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x409900; r <=3D=
 0x409910; r +=3D 4)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(de=
v, "\t0x%08x: 0x%08x\n", r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 nv_rd32(dev, r));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x409900,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_rd32(dev=
, 0x409904) | 0xc0000000);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (r =3D 0x409e08; r <=3D=
 0x409e24; r +=3D 4)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(de=
v, "\t0x%08x: 0x%08x\n", r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 nv_rd32(dev, r));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x409e08,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_rd32(dev=
, 0x409e08) | 0xc0000000);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~0x00200000;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_NS=
OURCE, nsource);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_IN=
TR, 0x00200000);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 if (status) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_INFO(dev, "Unhandled PGRAPH_INTR - 0x%08=
x\n", status);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_INTR, status);
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_INFO(dev, "Unhandled PGR=
APH_INTR - 0x%08x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, NV03_PGRAPH_IN=
TR, status);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 const int isb =3D (1 << 16) | (1 << 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const int isb =3D (1 << 16)=
 | (1 << 0);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((nv_rd32(dev, 0x400500) & isb) !=3D isb)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x400500, nv_r=
d32(dev, 0x400500) | isb);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x400824, nv_rd32(dev, 0x40082=
4) & ~(1 << 31));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((nv_rd32(dev, 0x400500)=
 & isb) !=3D isb)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev=
, 0x400500,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 nv_rd32(dev, 0x400500) | isb);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wr32(dev, 0x400824,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_rd32(dev=
, 0x400824) & ~(1 << 31));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0nv_wr32(dev, NV03_PMC_INTR_0, NV_PMC_INTR_0_PGRAPH_PENDING=
);
> --
> 1.6.6.1
>
>
