From: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Subject: Re: [PATCH 1/3] drivers/nouveau/kms/nv50-: Reject format
 modifiers for cursor planes
Date: Tue, 19 Jan 2021 10:18:27 +0000
Message-ID: <HfzDFy00Jir8FH_WqWz7EmLYojZvbfaoSAhmjdxfTSVxhBBpUYgpdApQFXXM2Uv3yzq0ySUYLCq2izrT5d9_gxna2IN9U8zHme2dvo7LlKs=@emersion.fr>
References: <20210119015415.2511028-1-lyude@redhat.com>
Reply-To: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210119015415.2511028-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Nirmoy Das <nirmoy.aiemd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tuesday, January 19th, 2021 at 2:54 AM, Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Nvidia hardware doesn't actually support using tiling formats with the
> cursor plane, only linear is allowed. In the future, we should write a
> testcase for this.
>
> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp")
> Cc: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.8+
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Together with [1], this patch allows me to run unpatched modifier-aware
user-space successfully, without a cursor visual glitch. drm_info
correctly reports the new modifier list, and wlroots logs confirm that
a flavor of NVIDIA_BLOCK_LINEAR_2D is used for the primary buffers and
LINEAR is used for cursor buffers.

Code looks good to me as well.

Reviewed-by: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>

[1]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
