From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/mxm: fix null deref on load
Date: Sun, 19 Jan 2014 19:06:04 -0800
Message-ID: <CA+55aFzcB_74U+x06yh4FoiDgKtarbzyMqFpuFTfHNJnX66VpQ@mail.gmail.com>
References: <1390145432-545-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1390145432-545-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andreas Reis <andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, DRI <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ok, I applied this, even though I hate the timing.

I also suspect that that whole commit 61b365a50 ("drm/nouveau:
populate master subdev pointer only when fully constructed") is just
completely buggered and the wrong thing to do. It also caused another
nasty change (fdd239ac99a0 "drm/nouveau: fix null ptr dereferences on
some boards") because it wasn't just the mxm data that was missing.

Whatever. It is what it is.

              Linus


On Sun, Jan 19, 2014 at 7:30 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Since commit 61b365a50 (drm/nouveau: populate master subdev pointer only
> when fully constructed), the nouveau_mxm(bios) call will return NULL,
> since it's still being called from the constructor. Instead, pass the
> mxm pointer via the unused data field.
>
> See https://bugs.freedesktop.org/show_bug.cgi?id=73791
>
> Reported-by: Andreas Reis <andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Andreas Reis <andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>
> 3.13 release time is approaching, so I'm expanding the To list, as this is a
> crashing bug for potentially a lot of people (not sure how common the MXM
> stuff is) and it'd be silly not to include the fix because someone along the
> chain wasn't around. Hope I'm not stepping on any toes by sending to the full
> upstream path...
>
>  drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c
> index af129c2..0bd3774 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c
> @@ -100,7 +100,7 @@ mxm_match_dcb(struct nouveau_mxm *mxm, u8 *data, void *info)
>  static int
>  mxm_dcb_sanitise_entry(struct nouveau_bios *bios, void *data, int idx, u16 pdcb)
>  {
> -       struct nouveau_mxm *mxm = nouveau_mxm(bios);
> +       struct nouveau_mxm *mxm = data;
>         struct context ctx = { .outp = (u32 *)(bios->data + pdcb) };
>         u8 type, i2cidx, link, ver, len;
>         u8 *conn;
> @@ -199,7 +199,7 @@ mxm_dcb_sanitise(struct nouveau_mxm *mxm)
>                 return;
>         }
>
> -       dcb_outp_foreach(bios, NULL, mxm_dcb_sanitise_entry);
> +       dcb_outp_foreach(bios, mxm, mxm_dcb_sanitise_entry);
>         mxms_foreach(mxm, 0x01, mxm_show_unmatched, NULL);
>  }
>
> --
> 1.8.3.2
>
