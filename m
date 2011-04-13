From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Associate memtimings with
 performance levels on cards <= nv98
Date: Wed, 13 Apr 2011 09:37:35 +0200
Message-ID: <4DA552BF.4050402@free.fr>
References: <1302680143-26517-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1302680143-26517-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le 13/04/2011 09:35, Martin Peres a =E9crit :
> Signed-off-by: Martin Peres<martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drv.h  |   26 ++++++++++++++------------
>   drivers/gpu/drm/nouveau/nouveau_mem.c  |    3 ++-
>   drivers/gpu/drm/nouveau/nouveau_perf.c |   25 +++++++++++++++++++++++++
>   drivers/gpu/drm/nouveau/nouveau_pm.c   |   14 +++++++++-----
>   4 files changed, 50 insertions(+), 18 deletions(-)
Updated to apply cleanly on master.

Also, I prefixed the commit name with "drm/nouveau: ".
