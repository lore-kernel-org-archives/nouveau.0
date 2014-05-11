From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] nv50,
	nvc0: fix blit 3d path for 1d array textures
Date: Mon, 12 May 2014 09:21:30 +1000
Message-ID: <CACAvsv4Ozm_uCPEszuAxtnZiC6PVPUnCZA7Z5urvNPti0E6cRg@mail.gmail.com>
References: <1399758786-29022-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1399758786-29022-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "10.2" <mesa-stable@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Sun, May 11, 2014 at 7:53 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> Need to adjust coordinates since the shader receives the array index as
> depth in z, but the TEX instruction expects it to be the second
> coordinate for a 1D array texture. This fixes fbo-generatemipmap-array.
>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: "10.2" <mesa-stable@lists.freedesktop.org>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  src/gallium/drivers/nouveau/nv50/nv50_surface.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> index 8addefe..23613d8 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> @@ -698,6 +698,12 @@ nv50_blitter_make_fp(struct pipe_context *pipe,
>     tc = ureg_DECL_fs_input(
>        ureg, TGSI_SEMANTIC_GENERIC, 0, TGSI_INTERPOLATE_LINEAR);
>
> +   if (ptarg == PIPE_TEXTURE_1D_ARRAY) {
> +      /* Adjust coordinates. Depth is in z, but TEX expects it to be in y. */
> +      tc = ureg_swizzle(tc, TGSI_SWIZZLE_X, TGSI_SWIZZLE_Z,
> +                        TGSI_SWIZZLE_Z, TGSI_SWIZZLE_Z);
> +   }
> +
>     data = ureg_DECL_temporary(ureg);
>
>     if (tex_s) {
> --
> 1.8.5.5
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
