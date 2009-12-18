From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [PATCH] nouveau: don't emit reloc markers for bo's
 that	are mapped
Date: Fri, 18 Dec 2009 10:57:59 +0100
Message-ID: <4B2B5227.7040906@student.tuwien.ac.at>
References: <1261098373-27809-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261098373-27809-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Maarten Maathuis schrieb:
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/nouveau_stateobj.h |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
> index 9aee9e4..6c40f64 100644
> --- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
> +++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
> @@ -163,6 +163,15 @@ so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
>  	for (i = 0; i < so->cur_reloc; i++) {
>  		struct nouveau_stateobj_reloc *r = &so->reloc[i];
>  
> +		/* This is probably a vbo which has caused a pushbuf flush
> +		 * before mapping. Don't try to reloc it again, it will cause
don't you mean un-mapping here ?
> +		 * problems, because important stuff is skipped.
> +		 */
> +		if (r->bo->map) {
> +			pb->remaining += 2;
> +			continue;
> +		}
> +
Should that be able to happen ?
I mean, the state tracker probably should have unmapped the VBOs again
before making us to use them for drawing (or doesn't it ?), and if *we*
mapped the VBO because we're using the VERTEX_DATA immediate mode, there
should be no relocation in any of the state objects we emit relocation
markers for.

Btw. in case of an error in the immediate path (i.e. if the vertex
element is invalid) I forgot to unmap the vbufs again, and there
might be double unmap in in nv50_map_vbufs because I didn't check if
map was NULL there.
>  		if ((ret = nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo,
>  					   r->packet, 0,
>  					   (r->flags & (NOUVEAU_BO_VRAM |

Christoph
(sorry, forgot to CC to the list in first send)
