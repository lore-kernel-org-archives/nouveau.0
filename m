From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH] nv50: enable MPEG-4 for NVA3+
	(VP4.0)
Date: Sat, 7 Dec 2013 11:09:54 -0500
Message-ID: <CAKb7UviogOGD1XnwpsKyG0H=RKRW+5j1vn85zmOhb45VUiHHHg@mail.gmail.com>
References: <1386391387-26182-1-git-send-email-imirkin@alum.mit.edu>
	<1386421882-25352-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1386421882-25352-1-git-send-email-martin.peres@free.fr>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Martin Peres <martin.peres@free.fr>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, Martin Peres <martin.peres@labri.fr>, "10.0" <mesa-stable@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Sat, Dec 7, 2013 at 8:11 AM, Martin Peres <martin.peres@free.fr> wrote:
> From: Martin Peres <martin.peres@labri.fr>
>
> This patch is a follow-up from Ilia Mirkin's enable H.264 patch which
> solves the problem that prevented MPEG-4 videos to play correctly.
>
> Tested on an nva3.

I might reword this as

"""
VP3/VP4 now work on all the codecs they are supposed to, remove old restriction.

Tested on NVA3
"""

Or something like that...

> Signed-off-by: Martin Peres <martin.peres@labri.fr>
> Tested-by: Martin Peres <martin.peres@labri.fr>
> Cc: "10.0" <mesa-stable@lists.freedesktop.org>
> ---
>  src/gallium/drivers/nouveau/nouveau_vp3_video.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
> index 2f4196c..0843b78 100644
> --- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
> +++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
> @@ -362,11 +362,6 @@ nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
>     enum pipe_video_format codec = u_reduce_video_profile(profile);
>     switch (param) {
>     case PIPE_VIDEO_CAP_SUPPORTED:
> -      /* For now, mpeg4 doesn't work on pre-nvc0. */
> -      if (chipset < 0xc0)
> -         return codec == PIPE_VIDEO_FORMAT_MPEG12 ||
> -            codec == PIPE_VIDEO_FORMAT_VC1 ||
> -            codec == PIPE_VIDEO_FORMAT_MPEG4_AVC;
>        /* In the general case, this should work, once the pre-nvc0 problems are
>         * resolved. */

Update this comment to reflect reality. Or just remove it.

With that change,

Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>

Or I can fold this into my h264 change if you don't want to send a v2,
up to you.

>        return profile >= PIPE_VIDEO_PROFILE_MPEG1 && (
> --
> 1.8.4.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
