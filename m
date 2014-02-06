From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] nouveau/video: make sure that firmware is
 present when checking caps
Date: Thu, 06 Feb 2014 14:14:07 +0000
Message-ID: <52F398AF.6080506@gmail.com>
References: <1391576540-1337-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1391576540-1337-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
Cc: "10.0 10.1" <mesa-stable@lists.freedesktop.org>, emil.l.velikov@gmail.com
List-Id: nouveau.vger.kernel.org

On 05/02/14 05:02, Ilia Mirkin wrote:
> Apparently some players are ill-prepared for us claiming that a decoder
> exists only to have creating it fail, and express this poor preparation
> with crashes (e.g. flash). Check that firmware is there to increase the
> chances of there being a high correlation between reported capabilities
> and ability to create a decoder.
> 
Not the most elegant implementation, but it just works(tm). Tested on my
rusty nv96 (vp2).

Tested-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: 10.0 10.1 <mesa-stable@lists.freedesktop.org>
> ---
> 
> I tested this on a VP3 card. Would be nice if someone could give the (somewhat
> different) vp2 logic a shot. Emil perhaps? If no one confirms after a while
> I'll go swap cards in my computer.
> 
>  src/gallium/drivers/nouveau/nouveau_screen.h    |  5 ++
>  src/gallium/drivers/nouveau/nouveau_vp3_video.c | 54 +++++++++++++++++++-
>  src/gallium/drivers/nouveau/nv50/nv84_video.c   | 68 ++++++++++++++++++++++++-
>  3 files changed, 123 insertions(+), 4 deletions(-)
> 
> diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
> index 7f15d10..51e24fa 100644
> --- a/src/gallium/drivers/nouveau/nouveau_screen.h
> +++ b/src/gallium/drivers/nouveau/nouveau_screen.h
> @@ -49,6 +49,11 @@ struct nouveau_screen {
>  
>  	boolean hint_buf_keep_sysmem_copy;
>  
> +	struct {
> +		unsigned profiles_checked;
> +		unsigned profiles_present;
> +	} firmware_info;
> +
>  #ifdef NOUVEAU_ENABLE_DRIVER_STATISTICS
>     union {
>        uint64_t v[29];
> diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video.c b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
> index ff00b37..660a3d0 100644
> --- a/src/gallium/drivers/nouveau/nouveau_vp3_video.c
> +++ b/src/gallium/drivers/nouveau/nouveau_vp3_video.c
> @@ -21,6 +21,7 @@
>   */
>  
>  #include <sys/mman.h>
> +#include <sys/stat.h>
>  #include <stdio.h>
>  #include <fcntl.h>
>  
> @@ -350,6 +351,53 @@ nouveau_vp3_load_firmware(struct nouveau_vp3_decoder *dec,
>     return 0;
>  }
>  
> +static int
> +firmware_present(struct pipe_screen *pscreen, enum pipe_video_profile profile)
> +{
> +   struct nouveau_screen *screen = nouveau_screen(pscreen);
> +   int chipset = screen->device->chipset;
> +   int vp3 = chipset < 0xa3 || chipset == 0xaa || chipset == 0xac;
> +   int vp5 = chipset >= 0xd0;
> +   int ret;
> +
> +   /* For all chipsets, try to create a BSP objects. Assume that if firmware
> +    * is present for it, firmware is also present for VP/PPP */
> +   if (!(screen->firmware_info.profiles_checked & 1)) {
> +      struct nouveau_object *bsp = NULL;
> +      int oclass;
> +      if (chipset < 0xc0)
> +         oclass = 0x85b1;
> +      else if (vp5)
> +         oclass = 0x95b1;
> +      else
> +         oclass = 0x90b1;
> +      nouveau_object_new(screen->channel, 0, oclass, NULL, 0, &bsp);
> +      if (bsp)
> +         screen->firmware_info.profiles_present |= 1;
> +      nouveau_object_del(&bsp);
> +      screen->firmware_info.profiles_checked |= 1;
> +   }
> +
> +   if (!(screen->firmware_info.profiles_present & 1))
> +      return 0;
> +
> +   /* For vp3/vp4 chipsets, make sure that the relevant firmware is present */
> +   if (!vp5 && !(screen->firmware_info.profiles_checked & (1 << profile))) {
> +      char path[PATH_MAX];
> +      struct stat s;
> +      if (vp3)
> +         vp3_getpath(profile, path);
> +      else
> +         vp4_getpath(profile, path);
> +      ret = stat(path, &s);
> +      if (!ret && s.st_size > 1000)
> +         screen->firmware_info.profiles_present |= (1 << profile);
> +      screen->firmware_info.profiles_checked |= (1 << profile);
> +   }
> +
> +   return vp5 || (screen->firmware_info.profiles_present & (1 << profile));
> +}
> +
>  int
>  nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
>                                     enum pipe_video_profile profile,
> @@ -363,8 +411,10 @@ nouveau_vp3_screen_get_video_param(struct pipe_screen *pscreen,
>     switch (param) {
>     case PIPE_VIDEO_CAP_SUPPORTED:
>        /* VP3 does not support MPEG4, VP4+ do. */
> -      return profile >= PIPE_VIDEO_PROFILE_MPEG1 && (
> -            !vp3 || codec != PIPE_VIDEO_FORMAT_MPEG4);
> +      return entrypoint == PIPE_VIDEO_ENTRYPOINT_BITSTREAM &&
> +         profile >= PIPE_VIDEO_PROFILE_MPEG1 &&
> +         (!vp3 || codec != PIPE_VIDEO_FORMAT_MPEG4) &&
> +         firmware_present(pscreen, profile);
>     case PIPE_VIDEO_CAP_NPOT_TEXTURES:
>        return 1;
>     case PIPE_VIDEO_CAP_MAX_WIDTH:
> diff --git a/src/gallium/drivers/nouveau/nv50/nv84_video.c b/src/gallium/drivers/nouveau/nv50/nv84_video.c
> index 3fee6d9..a39f572 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv84_video.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv84_video.c
> @@ -741,16 +741,80 @@ error:
>     return NULL;
>  }
>  
> +#define FIRMWARE_BSP_KERN  0x01
> +#define FIRMWARE_VP_KERN   0x02
> +#define FIRMWARE_BSP_H264  0x04
> +#define FIRMWARE_VP_MPEG2  0x08
> +#define FIRMWARE_VP_H264_1 0x10
> +#define FIRMWARE_VP_H264_2 0x20
> +#define FIRMWARE_PRESENT(val, fw) (val & FIRMWARE_ ## fw)
> +
> +static int
> +firmware_present(struct pipe_screen *pscreen, enum pipe_video_format codec)
> +{
> +   struct nouveau_screen *screen = nouveau_screen(pscreen);
> +   struct nouveau_object *obj = NULL;
> +   struct stat s;
> +   int checked = screen->firmware_info.profiles_checked;
> +   int present, ret;
> +
> +   if (!FIRMWARE_PRESENT(checked, VP_KERN)) {
> +      nouveau_object_new(screen->channel, 0, 0x7476, NULL, 0, &obj);
> +      if (obj)
> +         screen->firmware_info.profiles_present |= FIRMWARE_VP_KERN;
> +      nouveau_object_del(&obj);
> +      screen->firmware_info.profiles_checked |= FIRMWARE_VP_KERN;
> +   }
> +
> +   if (codec == PIPE_VIDEO_FORMAT_MPEG4_AVC) {
> +      if (!FIRMWARE_PRESENT(checked, BSP_KERN)) {
> +         nouveau_object_new(screen->channel, 0, 0x74b0, NULL, 0, &obj);
> +         if (obj)
> +            screen->firmware_info.profiles_present |= FIRMWARE_BSP_KERN;
> +         nouveau_object_del(&obj);
> +         screen->firmware_info.profiles_checked |= FIRMWARE_BSP_KERN;
> +      }
> +
> +      if (!FIRMWARE_PRESENT(checked, VP_H264_1)) {
> +         ret = stat("/lib/firmware/nouveau/nv84_vp-h264-1", &s);
> +         if (!ret && s.st_size > 1000)
> +            screen->firmware_info.profiles_present |= FIRMWARE_VP_H264_1;
> +         screen->firmware_info.profiles_checked |= FIRMWARE_VP_H264_1;
> +      }
> +
> +      /* should probably check the others, but assume that 1 means all */
> +
> +      present = screen->firmware_info.profiles_present;
> +      return FIRMWARE_PRESENT(present, VP_KERN) &&
> +         FIRMWARE_PRESENT(present, BSP_KERN) &&
> +         FIRMWARE_PRESENT(present, VP_H264_1);
> +   } else {
> +      if (!FIRMWARE_PRESENT(checked, VP_MPEG2)) {
> +         ret = stat("/lib/firmware/nouveau/nv84_vp-mpeg12", &s);
> +         if (!ret && s.st_size > 1000)
> +            screen->firmware_info.profiles_present |= FIRMWARE_VP_MPEG2;
> +         screen->firmware_info.profiles_checked |= FIRMWARE_VP_MPEG2;
> +      }
> +      present = screen->firmware_info.profiles_present;
> +      return FIRMWARE_PRESENT(present, VP_KERN) &&
> +         FIRMWARE_PRESENT(present, VP_MPEG2);
> +   }
> +}
> +
>  int
>  nv84_screen_get_video_param(struct pipe_screen *pscreen,
>                              enum pipe_video_profile profile,
>                              enum pipe_video_entrypoint entrypoint,
>                              enum pipe_video_cap param)
>  {
> +   enum pipe_video_format codec;
> +
>     switch (param) {
>     case PIPE_VIDEO_CAP_SUPPORTED:
> -      return u_reduce_video_profile(profile) == PIPE_VIDEO_FORMAT_MPEG4_AVC ||
> -         u_reduce_video_profile(profile) == PIPE_VIDEO_FORMAT_MPEG12;
> +      codec = u_reduce_video_profile(profile);
> +      return (codec == PIPE_VIDEO_FORMAT_MPEG4_AVC ||
> +              codec == PIPE_VIDEO_FORMAT_MPEG12) &&
> +         firmware_present(pscreen, codec);
>     case PIPE_VIDEO_CAP_NPOT_TEXTURES:
>        return 1;
>     case PIPE_VIDEO_CAP_MAX_WIDTH:
> 
