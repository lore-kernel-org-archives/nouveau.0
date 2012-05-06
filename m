From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [mesa PATCH] nv50: handle VP without inputs
Date: Sun, 06 May 2012 21:05:21 +0200
Message-ID: <4FA6CB71.9070308@student.tuwien.ac.at>
References: <20120506185308.GC4311@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120506185308.GC4311-OI9uyE9O0yo@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 06.05.2012 20:53, Marcin Slusarz wrote:
> Fixes 3 piglit tests:
> general/pos-array
> shaders/glsl-novertexdata
> shaders/glsl-vs-point-size
> and makes shaders/vp-ignore-input not trigger PGRAPH DATA_ERROR
> ---
> It's a bit ugly... If there's a way to fix it properly, I'm open to suggestions.
> ---
>  src/gallium/drivers/nv50/nv50_program.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/src/gallium/drivers/nv50/nv50_program.c b/src/gallium/drivers/nv50/nv50_program.c
> index 48e8db3..c44f537 100644
> --- a/src/gallium/drivers/nv50/nv50_program.c
> +++ b/src/gallium/drivers/nv50/nv50_program.c
> @@ -53,6 +53,13 @@ nv50_vertprog_assign_slots(struct nv50_ir_prog_info *info)
>           if (info->in[i].mask & (1 << c))
>              info->in[i].slot[c] = n++;
>     }
> +
> +   // Corner case: VP has no inputs, but we will still need to submit data to
> +   // draw it. HW will shout at us and won't draw anything if we don't enable
> +   // any input, so let's just pretend it's the first one.
> +   if (info->numInputs == 0)
> +      prog->vp.attrs[0] |= 0xf;
> +
>     prog->in_nr = info->numInputs;
>  
>     for (i = 0; i < info->numSysVals; ++i) {
Ah thank you, I've been wondering how to make the nv50 draw without any
inputs (on nvc0 it just works even if you don't enable any).

2 issues though:
- please don't use C++ style comments in here (the style guardians would
sooner or later patch this up)
- if InstanceID or VertexID are used, enabling any inputs will move them
to a different position in input space, they always come after all the
ordinary vertex attributes; see usage of the "unsigned n" in the code
directly above & below
