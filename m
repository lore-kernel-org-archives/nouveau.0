From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] nvc0: maxwell has a new video engine,
 don't return a decoder object
Date: Mon, 19 May 2014 11:06:50 +1000
Message-ID: <CACAvsv5s+-ygyHg24KJb3RoqDP8t01QZo17L5ewTo65KxNs7NQ@mail.gmail.com>
References: <1400422577-9426-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1400422577-9426-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Mon, May 19, 2014 at 12:16 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  src/gallium/drivers/nouveau/nvc0/nvc0_video.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_video.c b/src/gallium/drivers/nouveau/nvc0/nvc0_video.c
> index 5871f59..c9ab13a 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_video.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_video.c
> @@ -77,6 +77,9 @@ nvc0_create_decoder(struct pipe_context *context,
>     if (getenv("XVMC_VL"))
>         return vl_create_decoder(context, templ);
>
> +   if (screen->device->chipset >= 0x110)
> +      return NULL;
Is that really necessary?  It'll already fail because it tries to
create kepler's classes.

> +
>     if (templ->entrypoint != PIPE_VIDEO_ENTRYPOINT_BITSTREAM) {
>        debug_printf("%x\n", templ->entrypoint);
>        return NULL;
> --
> 1.8.5.5
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
