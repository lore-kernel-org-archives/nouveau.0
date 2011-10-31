From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: serialize access to debugs_nodes.list
Date: Mon, 31 Oct 2011 09:06:57 +0100
Message-ID: <20111031080656.GD2920@phenom.ffwll.local>
References: <20111030220401.GA3628@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20111030220401.GA3628@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Oct 30, 2011 at 11:04:48PM +0100, Marcin Slusarz wrote:
> Nouveau, when configured with debugfs, creates debugfs files for every
> channel, so structure holding list of files needs to be protected from
> simultaneous changes by multiple threads.
> 
> Without this patch it's possible to hit kernel oops in
> drm_debugfs_remove_files just by running a couple of xterms with
> looped glxinfo.
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c |    5 +++++
>  include/drm/drmP.h            |    1 +
>  2 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 9d2668a..1144fbe 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -120,7 +120,9 @@ int drm_debugfs_create_files(struct drm_info_list *files, int count,
>  		tmp->minor = minor;
>  		tmp->dent = ent;
>  		tmp->info_ent = &files[i];
> +		mutex_lock(&minor->debugfs_nodes.mutex);
>  		list_add(&(tmp->list), &(minor->debugfs_nodes.list));
> +		mutex_unlock(&minor->debugfs_nodes.mutex);
>  	}
>  	return 0;
>  
> @@ -149,6 +151,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  	int ret;
>  
>  	INIT_LIST_HEAD(&minor->debugfs_nodes.list);
> +	mutex_init(&minor->debugfs_nodes.mutex);
>  	sprintf(name, "%d", minor_id);
>  	minor->debugfs_root = debugfs_create_dir(name, root);
>  	if (!minor->debugfs_root) {
> @@ -194,6 +197,7 @@ int drm_debugfs_remove_files(struct drm_info_list *files, int count,
>  	struct drm_info_node *tmp;
>  	int i;
>  
> +	mutex_lock(&minor->debugfs_nodes.mutex);
>  	for (i = 0; i < count; i++) {
>  		list_for_each_safe(pos, q, &minor->debugfs_nodes.list) {
>  			tmp = list_entry(pos, struct drm_info_node, list);
> @@ -204,6 +208,7 @@ int drm_debugfs_remove_files(struct drm_info_list *files, int count,
>  			}
>  		}
>  	}
> +	mutex_unlock(&minor->debugfs_nodes.mutex);
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_debugfs_remove_files);
> diff --git a/include/drm/drmP.h b/include/drm/drmP.h
> index 9b7c2bb..c70c943 100644
> --- a/include/drm/drmP.h
> +++ b/include/drm/drmP.h
> @@ -970,6 +970,7 @@ struct drm_info_list {
>   * debugfs node structure. This structure represents a debugfs file.
>   */
>  struct drm_info_node {
> +	struct mutex mutex;
>  	struct list_head list;
>  	struct drm_minor *minor;
>  	struct drm_info_list *info_ent;

This is just ugly, you're adding a mutex to every drm_info_node, but only
use the one embedded into the minor. On a quick grep we're only ever using
the list in there, so I suggest to
- replace minor->debugfs_node.list with minor->debugfs_list and kill
  ->debugfs_node
- add the mutex as minor->debugfs_lock
That way it's clear what's going on.

Also, you've forgotten to add the locking to i915/i915_debugfs.c

Yours, Daniel
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
