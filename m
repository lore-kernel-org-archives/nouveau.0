From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/nouveau: fix signedness in
	nouveau_gpuobj_new()
Date: Mon, 7 Sep 2009 23:19:28 +0300
Message-ID: <20090907231928.76bbe432@daedalus.pq.iki.fi>
References: <1252260963-5163-1-git-send-email-pq@iki.fi>
	<1252260963-5163-2-git-send-email-pq@iki.fi>
	<1252260963-5163-3-git-send-email-pq@iki.fi>
	<1252260963-5163-4-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1252260963-5163-4-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun,  6 Sep 2009 21:16:03 +0300
Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:

> The size parameter is usually unsigned, but here it was signed. Change
> 'int' to 'uint32_t' and propagate the signedness fixes to all callers.
> 
> Fixes the sparse warning: nouveau_object.c:254:61: warning: incorrect
> type in argument 3 (different signedness).
> 
> Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h    |    4 ++--
>  drivers/gpu/drm/nouveau/nouveau_object.c |   14 ++++++++------
>  drivers/gpu/drm/nouveau/nv50_graph.c     |    6 ++++--
>  3 files changed, 14 insertions(+), 10 deletions(-)

This patch series is pushed.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
