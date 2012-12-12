From: Jerome Glisse <j.glisse@gmail.com>
Subject: Re: [PATCH 34/37] drm/ttm: fix fence locking in
	ttm_buffer_object_transfer
Date: Wed, 12 Dec 2012 09:48:22 -0500
Message-ID: <CAH3drwbL34+omj2S3ArOPgoYRQ3uzPEiRPFLn7YkP3cOMnPiZg@mail.gmail.com>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355317637-16742-35-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-35-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Dec 12, 2012 at 8:07 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Noticed while reviewing the fence locking in the radone pageflip
> handler.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index b9c4e51..5c8b207 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -441,7 +441,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>         fbo->vm_node = NULL;
>         atomic_set(&fbo->cpu_writers, 0);
>
> +       spin_lock(&bdev->fence_lock);
>         fbo->sync_obj = driver->sync_obj_ref(bo->sync_obj);
> +       spin_unlock(&bdev->fence_lock);
>         kref_init(&fbo->list_kref);
>         kref_init(&fbo->kref);
>         fbo->destroy = &ttm_transfered_destroy;
> --

Instead of that i would just move the call to
ttm_buffer_object_transfer to happen before releasing the fence_lock
in ttm_bo_move_accel_cleanup , something like :


set_bit(TTM_BO_PRIV_FLAG_MOVING, &bo->priv_flags);
ret = ttm_buffer_object_transfer(bo, &ghost_obj);
spin_unlock(&bdev->fence_lock);
if (tmp_obj)
  driver->sync_obj_unref(&tmp_obj);

if (ret)
   return ret;

Cheers,
Jerome
