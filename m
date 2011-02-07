From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] exa: Flush (S)IFC to the frontbuffer
	immediately.
Date: Mon, 7 Feb 2011 19:38:53 +0100
Message-ID: <AANLkTimKDBdbJ8Hb-LBi82gC21jPSYmm3OudbqbQFtQO@mail.gmail.com>
References: <1297103867-5718-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1297103867-5718-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The reason for NV50+ is obvious, but i'm not sure NV04-NV4X should be
included for consistency or not.

On Mon, Feb 7, 2011 at 7:37 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> - NV50+: This avoids high latency while typing with core fonts for exampl=
e.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0src/nv04_exa.c | =A0 =A04 ++++
> =A0src/nv50_exa.c | =A0 =A04 ++++
> =A0src/nvc0_exa.c | =A0 =A04 ++++
> =A03 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/src/nv04_exa.c b/src/nv04_exa.c
> index 267c7b5..2603bd4 100644
> --- a/src/nv04_exa.c
> +++ b/src/nv04_exa.c
> @@ -340,6 +340,7 @@ NV04EXAUploadIFC(ScrnInfoPtr pScrn, const char *src, =
int src_pitch,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PixmapPtr pDst, int x, int y, int w, int =
h, int cpp)
> =A0{
> =A0 =A0 =A0 =A0NVPtr pNv =3D NVPTR(pScrn);
> + =A0 =A0 =A0 ScreenPtr pScreen =3D pDst->drawable.pScreen;
> =A0 =A0 =A0 =A0struct nouveau_channel *chan =3D pNv->chan;
> =A0 =A0 =A0 =A0struct nouveau_grobj *clip =3D pNv->NvClipRectangle;
> =A0 =A0 =A0 =A0struct nouveau_grobj *ifc =3D pNv->NvImageFromCpu;
> @@ -413,6 +414,9 @@ NV04EXAUploadIFC(ScrnInfoPtr pScrn, const char *src, =
int src_pitch,
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0chan->flush_notify =3D NULL;
> +
> + =A0 =A0 =A0 if (pDst =3D=3D pScreen->GetScreenPixmap(pScreen))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FIRE_RING(chan);
> =A0 =A0 =A0 =A0return TRUE;
> =A0}
>
> diff --git a/src/nv50_exa.c b/src/nv50_exa.c
> index e8ff5aa..85baa68 100644
> --- a/src/nv50_exa.c
> +++ b/src/nv50_exa.c
> @@ -372,6 +372,7 @@ NV50EXAUploadSIFC(const char *src, int src_pitch,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PixmapPtr pdpix, int x, int y, int w, =
int h, int cpp)
> =A0{
> =A0 =A0 =A0 =A0NV50EXA_LOCALS(pdpix);
> + =A0 =A0 =A0 ScreenPtr pScreen =3D pdpix->drawable.pScreen;
> =A0 =A0 =A0 =A0int line_dwords =3D (w * cpp + 3) / 4;
> =A0 =A0 =A0 =A0uint32_t sifc_fmt;
>
> @@ -428,6 +429,9 @@ NV50EXAUploadSIFC(const char *src, int src_pitch,
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0chan->flush_notify =3D NULL;
> +
> + =A0 =A0 =A0 if (pdpix =3D=3D pScreen->GetScreenPixmap(pScreen))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FIRE_RING(chan);
> =A0 =A0 =A0 =A0return TRUE;
> =A0}
>
> diff --git a/src/nvc0_exa.c b/src/nvc0_exa.c
> index 45647ce..85cb5d2 100644
> --- a/src/nvc0_exa.c
> +++ b/src/nvc0_exa.c
> @@ -550,6 +550,7 @@ NVC0EXAUploadSIFC(const char *src, int src_pitch,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PixmapPtr pdpix, int x, int y, int w, =
int h, int cpp)
> =A0{
> =A0 =A0 =A0 =A0NVC0EXA_LOCALS(pdpix);
> + =A0 =A0 =A0 ScreenPtr pScreen =3D pdpix->drawable.pScreen;
> =A0 =A0 =A0 =A0int line_dwords =3D (w * cpp + 3) / 4;
> =A0 =A0 =A0 =A0uint32_t sifc_fmt;
>
> @@ -608,6 +609,9 @@ NVC0EXAUploadSIFC(const char *src, int src_pitch,
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0chan->flush_notify =3D NULL;
> +
> + =A0 =A0 =A0 if (pdpix =3D=3D pScreen->GetScreenPixmap(pScreen))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 FIRE_RING(chan);
> =A0 =A0 =A0 =A0return TRUE;
> =A0}
>
> --
> 1.7.4.rc3
>
>



-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
