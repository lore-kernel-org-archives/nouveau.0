From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/nouveau: add the missed kfree() for
 nouveau_bo_alloc()
Date: Wed, 15 Jul 2020 20:12:16 +0200
Message-ID: <df40519c-1850-6dfc-35bf-bdcc2eb6c117@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

> =E2=80=A6 to fix it.

I suggest to replace this wording by the tag =E2=80=9CFixes=E2=80=9D.


=E2=80=A6
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -276,8 +276,10 @@  nouveau_bo_alloc(struct nouveau_cli *cli, u64 *siz=
e, int *align, u32 flags,
>  			break;
>  	}
>
> -	if (WARN_ON(pi < 0))
> +	if (WARN_ON(pi < 0)) {
> +		kfree(nvbo);
>  		return ERR_PTR(-EINVAL);
> +	}

I propose to move such common exception handling to the end of
this function implementation so that a bit of duplicate code will be avoid=
ed.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3De9919e11e219eaa5e8041b7b1a196839=
143e9125#n481

Regards,
Markus
