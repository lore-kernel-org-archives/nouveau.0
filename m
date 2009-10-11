From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Add DRM_NOUVEAU_DEBUG option
Date: Sun, 11 Oct 2009 14:57:48 +0300
Message-ID: <20091011145748.47573948@daedalus.pq.iki.fi>
References: <1255037211-5992-1-git-send-email-parwok@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1255037211-5992-1-git-send-email-parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Matt Parnell <parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu,  8 Oct 2009 16:26:51 -0500
Matt Parnell <parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Sometimes we have DEBUG_FS enabled, but don't want output from
> certain modules. Most modules make this an option, so I figured
> that Nouveau needed it too.
> 
> Signed-off-by: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/Kconfig                   |   11 +++++++++++
>  drivers/gpu/drm/nouveau/Makefile          |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c |    2 --
>  drivers/gpu/drm/nouveau/nouveau_drv.c     |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h     |    2 +-
>  5 files changed, 14 insertions(+), 5 deletions(-)

Pushed, thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
