From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix copy-paste error in
 nouveau_fence_wait_uevent_handler
Date: Mon, 13 Jan 2020 10:06:13 +1000
Message-ID: <CACAvsv6EG0wvF4XCs=jisEjMDkfVUgMorgURko4uubqc3DOgOQ@mail.gmail.com>
References: <20200110063201.47560-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20200110063201.47560-1-yuehaibing@huawei.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Maarten Lankhorst <maarten.lankhorst@canonical.com>
List-Id: nouveau.vger.kernel.org

On Fri, 10 Jan 2020 at 16:51, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Like other cases, it should use rcu protected 'chan' rather
> than 'fence->channel' in nouveau_fence_wait_uevent_handler.
>
> Fixes: 0ec5f02f0e2c ("drm/nouveau: prevent stale fence->channel pointers, and protect with rcu")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Got it, thanks!

> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 9118df0..70bb6bb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -156,7 +156,7 @@ nouveau_fence_wait_uevent_handler(struct nvif_notify *notify)
>
>                 fence = list_entry(fctx->pending.next, typeof(*fence), head);
>                 chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -               if (nouveau_fence_update(fence->channel, fctx))
> +               if (nouveau_fence_update(chan, fctx))
>                         ret = NVIF_NOTIFY_DROP;
>         }
>         spin_unlock_irqrestore(&fctx->lock, flags);
> --
> 2.7.4
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
