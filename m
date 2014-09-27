From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [RFC PATCH 1/7] android: Support creating sync fence from drm
 fences
Date: Sat, 27 Sep 2014 09:00:46 +0200
Message-ID: <5426609E.6010100@canonical.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <1411725612-10455-2-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411725612-10455-2-git-send-email-lpeltonen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lauri Peltonen <lpeltonen@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Colin Cross <ccross@android.com>, Dave Airlie <airlied@redhat.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

Hey,

On 26-09-14 12:00, Lauri Peltonen wrote:
> Modify sync_fence_create to accept an array of 'struct fence' objects.
> This will allow drm drivers to create sync_fence objects and pass sync
> fd's between user space with minimal modifications, without ever creating
> sync_timeline or sync_pt objects, and without implementing the
> sync_timeline_ops interface.
> 
> Modify the sync driver debug code to not assume that every 'struct fence'
> (that is associated with a 'struct sync_fence') is embedded within a
> 'struct sync_pt'.
> 
> Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
> ---
>  drivers/staging/android/sw_sync.c    |  3 ++-
>  drivers/staging/android/sync.c       | 34 ++++++++++++++++++---------------
>  drivers/staging/android/sync.h       | 11 ++++++-----
>  drivers/staging/android/sync_debug.c | 37 +++++++++++++++++-------------------
>  4 files changed, 44 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/staging/android/sw_sync.c b/drivers/staging/android/sw_sync.c
> index a76db3f..6949812 100644
> --- a/drivers/staging/android/sw_sync.c
> +++ b/drivers/staging/android/sw_sync.c
> @@ -184,7 +184,8 @@ static long sw_sync_ioctl_create_fence(struct sw_sync_timeline *obj,
>  	}
>  
>  	data.name[sizeof(data.name) - 1] = '\0';
> -	fence = sync_fence_create(data.name, pt);
> +	fence = sync_fence_create(data.name,
> +				  (struct fence *[]){ &pt->base }, 1);
>  	if (fence == NULL) {
>  		sync_pt_free(pt);
>  		err = -ENOMEM;
> diff --git a/drivers/staging/android/sync.c b/drivers/staging/android/sync.c
> index e7b2e02..1d0d968 100644
> --- a/drivers/staging/android/sync.c
> +++ b/drivers/staging/android/sync.c
> @@ -187,28 +187,32 @@ static void fence_check_cb_func(struct fence *f, struct fence_cb *cb)
>  		wake_up_all(&fence->wq);
>  }
>  
> -/* TODO: implement a create which takes more that one sync_pt */
> -struct sync_fence *sync_fence_create(const char *name, struct sync_pt *pt)
> +struct sync_fence *sync_fence_create(const char *name,
> +				     struct fence **fences, int num_fences)
>  {
> -	struct sync_fence *fence;
> +	struct sync_fence *sync_fence;
> +	int size = offsetof(struct sync_fence, cbs[num_fences]);
> +	int i;
>  
> -	fence = sync_fence_alloc(offsetof(struct sync_fence, cbs[1]), name);
> -	if (fence == NULL)
> +	sync_fence = sync_fence_alloc(size, name);
> +	if (sync_fence == NULL)
>  		return NULL;
>  
> -	fence->num_fences = 1;
> -	atomic_set(&fence->status, 1);
> +	sync_fence->num_fences = num_fences;
> +	atomic_set(&sync_fence->status, 0);
>  
> -	fence_get(&pt->base);
> -	fence->cbs[0].sync_pt = &pt->base;
> -	fence->cbs[0].fence = fence;
> -	if (fence_add_callback(&pt->base, &fence->cbs[0].cb,
> -			       fence_check_cb_func))
> -		atomic_dec(&fence->status);
> +	for (i = 0; i < num_fences; i++) {
> +		struct fence *f = fences[i];
> +		struct sync_fence_cb *cb = &sync_fence->cbs[i];
>  
> -	sync_fence_debug_add(fence);
> +		cb->sync_pt = fence_get(f);
> +		cb->fence = sync_fence;
> +		if (!fence_add_callback(f, &cb->cb, fence_check_cb_func))
> +			atomic_inc(&sync_fence->status);
> +	}
> +	sync_fence_debug_add(sync_fence);
>  
> -	return fence;
> +	return sync_fence;
>  }
>  EXPORT_SYMBOL(sync_fence_create);
sync_fence_merge currently depends on the list of fences to be sorted to remove duplicates efficiently.
Feeding it a unsorted list will probably result in hard to debug bugs. :-)

> diff --git a/drivers/staging/android/sync.h b/drivers/staging/android/sync.h
> index 66b0f43..b8ad72c 100644
> --- a/drivers/staging/android/sync.h
> +++ b/drivers/staging/android/sync.h
> @@ -246,13 +246,14 @@ void sync_pt_free(struct sync_pt *pt);
>  
>  /**
>   * sync_fence_create() - creates a sync fence
> - * @name:	name of fence to create
> - * @pt:		sync_pt to add to the fence
> + * @name:	name of the sync fence to create
> + * @fences:	fences to add to the sync fence
> + * @num_fences:	the number of fences in the @fences array
>   *
> - * Creates a fence containg @pt.  Once this is called, the fence takes
> - * ownership of @pt.
> + * Creates a sync fence from an array of drm fences. Takes refs to @fences.
>   */
> -struct sync_fence *sync_fence_create(const char *name, struct sync_pt *pt);
> +struct sync_fence *sync_fence_create(const char *name,
> +				     struct fence **fences, int num_fences);
>  
>  /*
>   * API for sync_fence consumers
> diff --git a/drivers/staging/android/sync_debug.c b/drivers/staging/android/sync_debug.c
> index 257fc91..2d8873e 100644
> --- a/drivers/staging/android/sync_debug.c
> +++ b/drivers/staging/android/sync_debug.c
> @@ -81,33 +81,33 @@ static const char *sync_status_str(int status)
>  	return "error";
>  }
>  
> -static void sync_print_pt(struct seq_file *s, struct sync_pt *pt, bool fence)
> +static void sync_print_pt(struct seq_file *s, struct fence *pt, bool fence)
>  {
>  	int status = 1;
> -	struct sync_timeline *parent = sync_pt_parent(pt);
>  
> -	if (fence_is_signaled_locked(&pt->base))
> -		status = pt->base.status;
> +	if (fence_is_signaled_locked(pt))
> +		status = pt->status;
>  
> -	seq_printf(s, "  %s%spt %s",
> -		   fence ? parent->name : "",
> -		   fence ? "_" : "",
> -		   sync_status_str(status));
> +	if (fence)
> +		seq_printf(s, "  %d_pt %s", pt->context,
> +			   sync_status_str(status));
> +	else
> +		seq_printf(s, "  pt %s", sync_status_str(status));
>  
>  	if (status <= 0) {
> -		struct timeval tv = ktime_to_timeval(pt->base.timestamp);
> +		struct timeval tv = ktime_to_timeval(pt->timestamp);
>  
>  		seq_printf(s, "@%ld.%06ld", tv.tv_sec, tv.tv_usec);
>  	}
>  
> -	if (parent->ops->timeline_value_str &&
> -	    parent->ops->pt_value_str) {
> +	if (pt->ops->timeline_value_str &&
> +	    pt->ops->fence_value_str) {
>  		char value[64];
>  
> -		parent->ops->pt_value_str(pt, value, sizeof(value));
> +		pt->ops->fence_value_str(pt, value, sizeof(value));
>  		seq_printf(s, ": %s", value);
>  		if (fence) {
> -			parent->ops->timeline_value_str(parent, value,
> +			pt->ops->timeline_value_str(pt, value,
>  						    sizeof(value));
>  			seq_printf(s, " / %s", value);
>  		}
> @@ -121,7 +121,8 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>  	struct list_head *pos;
>  	unsigned long flags;
>  
> -	seq_printf(s, "%s %s", obj->name, obj->ops->driver_name);
> +	seq_printf(s, "%d %s %s", obj->context, obj->name,
> +		   obj->ops->driver_name);
>  
>  	if (obj->ops->timeline_value_str) {
>  		char value[64];
> @@ -136,7 +137,7 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>  	list_for_each(pos, &obj->child_list_head) {
>  		struct sync_pt *pt =
>  			container_of(pos, struct sync_pt, child_list);
> -		sync_print_pt(s, pt, false);
> +		sync_print_pt(s, &pt->base, false);
>  	}
>  	spin_unlock_irqrestore(&obj->child_list_lock, flags);
>  }
> @@ -151,11 +152,7 @@ static void sync_print_fence(struct seq_file *s, struct sync_fence *fence)
>  		   sync_status_str(atomic_read(&fence->status)));
>  
>  	for (i = 0; i < fence->num_fences; ++i) {
> -		struct sync_pt *pt =
> -			container_of(fence->cbs[i].sync_pt,
> -				     struct sync_pt, base);
> -
> -		sync_print_pt(s, pt, true);
> +		sync_print_pt(s, fence->cbs[i].sync_pt, true);
>  	}
>  
>  	spin_lock_irqsave(&fence->wq.lock, flags);
> 
