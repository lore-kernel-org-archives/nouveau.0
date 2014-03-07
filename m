From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: fix fence waiting logic
 in screen destroy
Date: Fri, 07 Mar 2014 14:11:01 +0000
Message-ID: <5319D375.4010308@gmail.com>
References: <1394078485-7768-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1394078485-7768-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: emil.l.velikov@gmail.com
List-Id: nouveau.vger.kernel.org

On 06/03/14 04:01, Ilia Mirkin wrote:
> nouveau_fence_wait has the expectation that an external entity is
> holding onto the fence being waited on, not that it is merely held onto
> by the current pointer. Fixes a use-after-free in nouveau_fence_wait
> when used on the screen's current fence.
> 
IMHO one should flatten all the fence handling a bit to greatly improve
readability and minimise chances of similar problems.

Also there is yet another reason why this might be a good idea -
nouveau_fence_signalled, and all it's callers.

I'll send a few patches of what I have in mind wrt "flattening", later
on today.

-Emil

> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=75279
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
> 
> Should the waiting be predicated on the current fence having been emitted? I
> removed that from nv30 (which would just go ahead and _leak_ that fence it it
> hadn't been emitted...). I figure it doesn't really matter enough to worry
> about that. The bigger reason to do it, I guess, is to make sure that all the
> fences on the list get processed. But perhaps it'd be OK to just nuke them
> without regard for such details?
> 
>  src/gallium/drivers/nouveau/nv30/nv30_screen.c | 14 ++++++++++----
>  src/gallium/drivers/nouveau/nv50/nv50_screen.c | 11 +++++++++--
>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c |  9 ++++++++-
>  3 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
> index 82f2c06..5378913 100644
> --- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
> +++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
> @@ -308,10 +308,16 @@ nv30_screen_destroy(struct pipe_screen *pscreen)
>     if (!nouveau_drm_screen_unref(&screen->base))
>        return;
>  
> -   if (screen->base.fence.current &&
> -       screen->base.fence.current->state >= NOUVEAU_FENCE_STATE_EMITTED) {
> -      nouveau_fence_wait(screen->base.fence.current);
> -      nouveau_fence_ref (NULL, &screen->base.fence.current);
> +   if (screen->base.fence.current) {
> +      struct nouveau_fence *current = NULL;
> +
> +      /* nouveau_fence_wait will create a new current fence, so wait on the
> +       * _current_ one, and remove both.
> +       */
> +      nouveau_fence_ref(screen->base.fence.current, &current);
> +      nouveau_fence_wait(current);
> +      nouveau_fence_ref(NULL, &current);
> +      nouveau_fence_ref(NULL, &screen->base.fence.current);
>     }
>  
>     nouveau_object_del(&screen->query);
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
> index ab0d63e..e8c7fe3 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
> @@ -294,8 +294,15 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
>        return;
>  
>     if (screen->base.fence.current) {
> -      nouveau_fence_wait(screen->base.fence.current);
> -      nouveau_fence_ref (NULL, &screen->base.fence.current);
> +      struct nouveau_fence *current = NULL;
> +
> +      /* nouveau_fence_wait will create a new current fence, so wait on the
> +       * _current_ one, and remove both.
> +       */
> +      nouveau_fence_ref(screen->base.fence.current, &current);
> +      nouveau_fence_wait(current);
> +      nouveau_fence_ref(NULL, &current);
> +      nouveau_fence_ref(NULL, &screen->base.fence.current);
>     }
>     if (screen->base.pushbuf)
>        screen->base.pushbuf->user_priv = NULL;
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> index 044847d..04f3088 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> @@ -340,7 +340,14 @@ nvc0_screen_destroy(struct pipe_screen *pscreen)
>        return;
>  
>     if (screen->base.fence.current) {
> -      nouveau_fence_wait(screen->base.fence.current);
> +      struct nouveau_fence *current = NULL;
> +
> +      /* nouveau_fence_wait will create a new current fence, so wait on the
> +       * _current_ one, and remove both.
> +       */
> +      nouveau_fence_ref(screen->base.fence.current, &current);
> +      nouveau_fence_wait(current);
> +      nouveau_fence_ref(NULL, &current);
>        nouveau_fence_ref(NULL, &screen->base.fence.current);
>     }
>     if (screen->base.pushbuf)
> 
