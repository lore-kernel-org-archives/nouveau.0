From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
Date: Tue, 22 Oct 2019 11:40:38 +0200
Message-ID: <b523c3a1-75a7-d94a-6cc6-58e8a1ad73cd@web.de>
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191021211449.9104-1-navid.emamdoost@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Thierry Reding <treding@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size=
, int *align, u32 flags,
>  			break;
>  	}
>
> -	if (WARN_ON(pi < 0))
> +	if (WARN_ON(pi < 0)) {
> +		kfree(nvbo);
>  		return ERR_PTR(-EINVAL);
> +	}
>
>  	/* Disable compression if suitable settings couldn't be found. */
>  	if (nvbo->comp && !vmm->page[pi].comp) {

This addition looks correct.
But I would prefer to move such exception handling code to the end of
this function implementation so that duplicate source code will be reduced=
.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3D7d194c2100ad2a6dded545887d027549=
48ca5241#n450

Regards,
Markus
