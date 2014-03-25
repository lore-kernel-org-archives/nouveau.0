From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nouveau: safen up nouveau_device list usage
 against concurrent access
Date: Tue, 25 Mar 2014 10:33:32 -0400
Message-ID: <CAKb7UvgyaqHN2nONbs1DKXsTC7FQPx22wPf0j9oyHQ-UCkf3qA@mail.gmail.com>
References: <1394676315-25595-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1394676315-25595-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Here's a test program I just whipped up that demonstrates (some of)
the issues in the old code. This segfaults in either nouveau_bo_wrap
or nouveau_bo_new, or sometimes nouveau_bo_wrap fails to find the
handle. With the patch, it hasn't failed yet. Ben -- review please?
(Or someone else...) Admittedly it's a bit hard to trigger, but still.

Compile with:

gcc -ggdb -o test test.c -I /usr/include/libdrm -lxcb -lxcb-dri2 -ldrm
-ldrm_nouveau -pthread

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <xf86drm.h>
#include <xcb/dri2.h>
#include <nouveau.h>

#undef NDEBUG
#include <assert.h>

/* From pipe_loader_drm.c in mesa */
static void
pipe_loader_drm_x_auth(int fd)
{
   /* Try authenticate with the X server to give us access to devices that X
    * is running on. */
   xcb_connection_t *xcb_conn;
   const xcb_setup_t *xcb_setup;
   xcb_screen_iterator_t s;
   xcb_dri2_connect_cookie_t connect_cookie;
   xcb_dri2_connect_reply_t *connect;
   drm_magic_t magic;
   xcb_dri2_authenticate_cookie_t authenticate_cookie;
   xcb_dri2_authenticate_reply_t *authenticate;

   xcb_conn = xcb_connect(NULL,  NULL);

   if(!xcb_conn)
      return;

   xcb_setup = xcb_get_setup(xcb_conn);

  if (!xcb_setup)
    goto disconnect;

   s = xcb_setup_roots_iterator(xcb_setup);
   connect_cookie = xcb_dri2_connect_unchecked(xcb_conn, s.data->root,
                                               XCB_DRI2_DRIVER_TYPE_DRI);
   connect = xcb_dri2_connect_reply(xcb_conn, connect_cookie, NULL);

   if (!connect || connect->driver_name_length
                   + connect->device_name_length == 0) {

      goto disconnect;
   }

   if (drmGetMagic(fd, &magic))
      goto disconnect;

   authenticate_cookie = xcb_dri2_authenticate_unchecked(xcb_conn,
                                                         s.data->root,
                                                         magic);
   authenticate = xcb_dri2_authenticate_reply(xcb_conn,
                                              authenticate_cookie,
                                              NULL);
   free(authenticate);

disconnect:
   xcb_disconnect(xcb_conn);
}

static volatile int start = 0;

void *func(void *arg) {
  struct nouveau_device *dev = arg;
  struct nouveau_bo *bo = NULL, *bo2 = NULL;
  int i;

  while (!start);

  for (i = 0; i < 10000; i++) {
    assert(!nouveau_bo_new(dev, NOUVEAU_BO_GART, 0, 0x1000, NULL, &bo));
    assert(!nouveau_bo_wrap(dev, bo->handle, &bo2));
    nouveau_bo_ref(NULL, &bo);
    assert(!nouveau_bo_wrap(dev, bo2->handle, &bo));
    nouveau_bo_ref(NULL, &bo);
    nouveau_bo_ref(NULL, &bo2);
  }
}


int main() {
  struct nouveau_device *dev;
  int fd, i;
  pthread_t a, b, c, d;
  struct nouveau_bo *bo[50];

  fd = open("/dev/dri/card0", O_RDWR);
  assert(fd);
  pipe_loader_drm_x_auth(fd);

  assert(!nouveau_device_wrap(fd, 0, &dev));

  for (i = 0; i < 50; i++) {
    assert(!nouveau_bo_new(dev, NOUVEAU_BO_GART, 0, 0x1000, NULL, &bo[i]));
  }

  pthread_create(&a, NULL, func, dev);
  pthread_create(&b, NULL, func, dev);
  pthread_create(&c, NULL, func, dev);
  pthread_create(&d, NULL, func, dev);

  start = 1;

  pthread_join(a, NULL);
  pthread_join(b, NULL);
  pthread_join(c, NULL);
  pthread_join(d, NULL);

  for (i = 0; i < 50; i++) {
    nouveau_bo_ref(NULL, &bo[i]);
  }

  nouveau_device_del(&dev);

  return 0;
}

On Wed, Mar 12, 2014 at 10:05 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>  nouveau/nouveau.c | 29 ++++++++++++++++++++++++++++-
>  nouveau/private.h |  3 ++-
>  2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
> index ee7893b..72c31cf 100644
> --- a/nouveau/nouveau.c
> +++ b/nouveau/nouveau.c
> @@ -85,6 +85,12 @@ nouveau_device_wrap(int fd, int close, struct nouveau_device **pdev)
>
>         if (!nvdev)
>                 return -ENOMEM;
> +       ret = pthread_mutex_init(&nvdev->lock, NULL);
> +       if (ret) {
> +               free(nvdev);
> +               return ret;
> +       }
> +
>         nvdev->base.fd = fd;
>
>         ver = drmGetVersion(fd);
> @@ -161,6 +167,7 @@ nouveau_device_del(struct nouveau_device **pdev)
>                 if (nvdev->close)
>                         drmClose(nvdev->base.fd);
>                 free(nvdev->client);
> +               pthread_mutex_destroy(&nvdev->lock);
>                 free(nvdev);
>                 *pdev = NULL;
>         }
> @@ -191,6 +198,8 @@ nouveau_client_new(struct nouveau_device *dev, struct nouveau_client **pclient)
>         int id = 0, i, ret = -ENOMEM;
>         uint32_t *clients;
>
> +       pthread_mutex_lock(&nvdev->lock);
> +
>         for (i = 0; i < nvdev->nr_client; i++) {
>                 id = ffs(nvdev->client[i]) - 1;
>                 if (id >= 0)
> @@ -199,7 +208,7 @@ nouveau_client_new(struct nouveau_device *dev, struct nouveau_client **pclient)
>
>         clients = realloc(nvdev->client, sizeof(uint32_t) * (i + 1));
>         if (!clients)
> -               return ret;
> +               goto unlock;
>         nvdev->client = clients;
>         nvdev->client[i] = 0;
>         nvdev->nr_client++;
> @@ -214,6 +223,9 @@ out:
>         }
>
>         *pclient = &pcli->base;
> +
> +unlock:
> +       pthread_mutex_unlock(&nvdev->lock);
>         return ret;
>  }
>
> @@ -225,7 +237,9 @@ nouveau_client_del(struct nouveau_client **pclient)
>         if (pcli) {
>                 int id = pcli->base.id;
>                 nvdev = nouveau_device(pcli->base.device);
> +               pthread_mutex_lock(&nvdev->lock);
>                 nvdev->client[id / 32] &= ~(1 << (id % 32));
> +               pthread_mutex_unlock(&nvdev->lock);
>                 free(pcli->kref);
>                 free(pcli);
>         }
> @@ -331,9 +345,12 @@ nouveau_object_find(struct nouveau_object *obj, uint32_t pclass)
>  static void
>  nouveau_bo_del(struct nouveau_bo *bo)
>  {
> +       struct nouveau_device_priv *nvdev = nouveau_device(bo->device);
>         struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
>         struct drm_gem_close req = { bo->handle };
> +       pthread_mutex_lock(&nvdev->lock);
>         DRMLISTDEL(&nvbo->head);
> +       pthread_mutex_unlock(&nvdev->lock);
>         if (bo->map)
>                 munmap(bo->map, bo->size);
>         drmIoctl(bo->device->fd, DRM_IOCTL_GEM_CLOSE, &req);
> @@ -363,7 +380,9 @@ nouveau_bo_new(struct nouveau_device *dev, uint32_t flags, uint32_t align,
>                 return ret;
>         }
>
> +       pthread_mutex_lock(&nvdev->lock);
>         DRMLISTADD(&nvbo->head, &nvdev->bo_list);
> +       pthread_mutex_unlock(&nvdev->lock);
>
>         *pbo = bo;
>         return 0;
> @@ -378,13 +397,16 @@ nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
>         struct nouveau_bo_priv *nvbo;
>         int ret;
>
> +       pthread_mutex_lock(&nvdev->lock);
>         DRMLISTFOREACHENTRY(nvbo, &nvdev->bo_list, head) {
>                 if (nvbo->base.handle == handle) {
> +                       pthread_mutex_unlock(&nvdev->lock);
>                         *pbo = NULL;
>                         nouveau_bo_ref(&nvbo->base, pbo);
>                         return 0;
>                 }
>         }
> +       pthread_mutex_unlock(&nvdev->lock);
>
>         ret = drmCommandWriteRead(dev->fd, DRM_NOUVEAU_GEM_INFO,
>                                   &req, sizeof(req));
> @@ -396,7 +418,9 @@ nouveau_bo_wrap(struct nouveau_device *dev, uint32_t handle,
>                 atomic_set(&nvbo->refcnt, 1);
>                 nvbo->base.device = dev;
>                 abi16_bo_info(&nvbo->base, &req);
> +               pthread_mutex_lock(&nvdev->lock);
>                 DRMLISTADD(&nvbo->head, &nvdev->bo_list);
> +               pthread_mutex_unlock(&nvdev->lock);
>                 *pbo = &nvbo->base;
>                 return 0;
>         }
> @@ -413,13 +437,16 @@ nouveau_bo_name_ref(struct nouveau_device *dev, uint32_t name,
>         struct drm_gem_open req = { .name = name };
>         int ret;
>
> +       pthread_mutex_lock(&nvdev->lock);
>         DRMLISTFOREACHENTRY(nvbo, &nvdev->bo_list, head) {
>                 if (nvbo->name == name) {
> +                       pthread_mutex_unlock(&nvdev->lock);
>                         *pbo = NULL;
>                         nouveau_bo_ref(&nvbo->base, pbo);
>                         return 0;
>                 }
>         }
> +       pthread_mutex_unlock(&nvdev->lock);
>
>         ret = drmIoctl(dev->fd, DRM_IOCTL_GEM_OPEN, &req);
>         if (ret == 0) {
> diff --git a/nouveau/private.h b/nouveau/private.h
> index 60714b8..4f337ad 100644
> --- a/nouveau/private.h
> +++ b/nouveau/private.h
> @@ -3,6 +3,7 @@
>
>  #include <xf86drm.h>
>  #include <xf86atomic.h>
> +#include <pthread.h>
>  #include "nouveau_drm.h"
>
>  #include "nouveau.h"
> @@ -94,7 +95,7 @@ nouveau_bo(struct nouveau_bo *bo)
>  struct nouveau_device_priv {
>         struct nouveau_device base;
>         int close;
> -       atomic_t lock;
> +       pthread_mutex_t lock;
>         struct nouveau_list bo_list;
>         uint32_t *client;
>         int nr_client;
> --
> 1.8.3.2
>
