From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] subdev: add a pfuse subdev
Date: Mon, 25 Aug 2014 00:35:03 +0100
Message-ID: <53FA76A7.4090803@gmail.com>
References: <1408914911-5022-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408914911-5022-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 24/08/14 22:15, Martin Peres wrote:
> We will use this subdev to disable temperature reading on cards that did not
> get a sensor calibration in the factory.
> 
> Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  configure.ac                   |  1 +
>  drm/Kbuild                     |  4 ++
>  drm/core/include/subdev/fuse.h |  1 +
>  drm/core/subdev/fuse/base.c    |  1 +
>  drm/core/subdev/fuse/g80.c     |  1 +
>  drm/core/subdev/fuse/gf100.c   |  1 +
>  drm/core/subdev/fuse/gm107.c   |  1 +
>  drm/core/subdev/fuse/priv.h    |  1 +
>  nvkm/engine/device/gm100.c     |  2 +
>  nvkm/engine/device/nv50.c      | 15 ++++++++
>  nvkm/engine/device/nvc0.c      | 10 +++++
>  nvkm/engine/device/nve0.c      |  8 ++++
>  nvkm/include/core/device.h     |  1 +
>  nvkm/include/subdev/fuse.h     | 30 +++++++++++++++
>  nvkm/subdev/Makefile.am        |  3 +-
>  nvkm/subdev/fuse/Makefile.am   |  8 ++++
>  nvkm/subdev/fuse/base.c        | 62 +++++++++++++++++++++++++++++++
>  nvkm/subdev/fuse/g80.c         | 81 +++++++++++++++++++++++++++++++++++++++++
>  nvkm/subdev/fuse/gf100.c       | 83 ++++++++++++++++++++++++++++++++++++++++++
>  nvkm/subdev/fuse/gm107.c       | 66 +++++++++++++++++++++++++++++++++
>  nvkm/subdev/fuse/priv.h        |  9 +++++
>  21 files changed, 388 insertions(+), 1 deletion(-)
>  create mode 120000 drm/core/include/subdev/fuse.h
>  create mode 120000 drm/core/subdev/fuse/base.c
>  create mode 120000 drm/core/subdev/fuse/g80.c
>  create mode 120000 drm/core/subdev/fuse/gf100.c
>  create mode 120000 drm/core/subdev/fuse/gm107.c
>  create mode 120000 drm/core/subdev/fuse/priv.h
>  create mode 100644 nvkm/include/subdev/fuse.h
>  create mode 100644 nvkm/subdev/fuse/Makefile.am
>  create mode 100644 nvkm/subdev/fuse/base.c
>  create mode 100644 nvkm/subdev/fuse/g80.c
>  create mode 100644 nvkm/subdev/fuse/gf100.c
>  create mode 100644 nvkm/subdev/fuse/gm107.c
>  create mode 100644 nvkm/subdev/fuse/priv.h
> 
[snip]
> diff --git a/nvkm/subdev/fuse/base.c b/nvkm/subdev/fuse/base.c
> new file mode 100644
> index 0000000..d249f2b
> --- /dev/null
> +++ b/nvkm/subdev/fuse/base.c
> @@ -0,0 +1,62 @@
> +/*
> + * Copyright 2014 Martin Peres
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Martin Peres
> + */
> +
> +#include <subdev/fuse.h>
> +
> +int
> +_nouveau_fuse_init(struct nouveau_object *object)
> +{
> +	struct nouveau_fuse *fuse = (void *)object;
> +	int ret;
> +
> +	ret = nouveau_subdev_init(&fuse->base);
> +	if (ret)
> +		return ret;
> +
If you want you can drop the check the extra variable.

> +	return 0;
> +}
> +
> +void
> +_nouveau_fuse_dtor(struct nouveau_object *object)
> +{
> +	struct nouveau_fuse *fuse = (void *)object;
> +	nouveau_subdev_destroy(&fuse->base);
> +}
> +
> +int
> +nouveau_fuse_create_(struct nouveau_object *parent,
> +		     struct nouveau_object *engine,
> +		     struct nouveau_oclass *oclass, int length, void **pobject)
> +{
> +	struct nouveau_fuse *fuse;
> +	int ret;
> +
> +	ret = nouveau_subdev_create_(parent, engine, oclass, 0, "FUSE",
> +				     "fuse", length, pobject);
                                                     ^^^^^^^
I think you want to use &fuse                        here ?

> +	fuse = *pobject;
Swap the assignment order and move it past the conditional ?

> +	if (ret)
> +		return ret;
> +

+ *pobject = fuse;

And perhaps return 0, to make it obvious and consistent with the second case
below.

> +	return ret;
> +}
[snip]
> diff --git a/nvkm/subdev/fuse/gm107.c b/nvkm/subdev/fuse/gm107.c
> new file mode 100644
> index 0000000..4ade700
> --- /dev/null
> +++ b/nvkm/subdev/fuse/gm107.c
> @@ -0,0 +1,66 @@
[snip]
> +static int
> +gm107_fuse_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
> +	       struct nouveau_oclass *oclass, void *data, u32 size,
> +	       struct nouveau_object **pobject)
> +{
> +	struct gm107_fuse_priv *priv;
> +	int ret;
> +
> +	ret = nouveau_fuse_create(parent, engine, oclass, &priv);
> +	*pobject = nv_object(priv);
Believe the above assignment should go after the check ?

Nice job :)
-Emil

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
