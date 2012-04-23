From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/nv50: let applications hanging on vm
 flush to be killed
Date: Mon, 23 Apr 2012 19:09:57 +0200
Message-ID: <4F958CE5.50904@free.fr>
References: <1335133112-8008-4-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335133112-8008-4-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le 23/04/2012 00:18, Marcin Slusarz a =E9crit :
> Signed-off-by: Marcin Slusarz<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/gpu/drm/nouveau/nv50_graph.c |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouve=
au/nv50_graph.c
> index 6899547..a61853f 100644
> --- a/drivers/gpu/drm/nouveau/nv50_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv50_graph.c
> @@ -435,6 +435,11 @@ nv84_graph_tlb_flush(struct drm_device *dev, int eng=
ine)
>   			if ((tmp&  7) =3D=3D 1)
>   				idle =3D false;
>   		}
> +
> +		if (fatal_signal_pending(current)) {
> +			ret =3D -ERESTARTSYS;
> +			break;
> +		}
>   	} while (!idle&&  !(timeout =3D ptimer->read(dev) - start>  2000000000=
));
>
>   	if (timeout) {
Good, but who should send the kill signal in the first place?

Shouldn't nouveau drm terminate the process(es) associated with the =

channel that generated the lockup ?

Can you provide more info on how the lockup recovery works?

Thanks in advance,
Martin
