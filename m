From: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH 1/2] drm/radeon: disable AGP by default
Date: Wed, 13 May 2020 13:55:15 +0200
Message-ID: <CA+7wUszB45OzgyTUM-04QZKAVbRU6aMnPmLzupPAU5Ej_XnwGw@mail.gmail.com>
References: <20200513110313.12979-1-christian.koenig@amd.com> <20200513110313.12979-2-christian.koenig@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-powerpc=debian-powerpc=m.gmane-mx.org@lists.debian.org>
In-Reply-To: <20200513110313.12979-2-christian.koenig@amd.com>
Resent-Message-ID: <tF_r0sKr9lN.A.gVG.9A-ueB@bendel>
List-URL: <https://lists.debian.org/debian-powerpc/>
List-Post: <mailto:debian-powerpc@lists.debian.org>
List-Help: <mailto:debian-powerpc-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-powerpc-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-powerpc-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CA+7wUszB45OzgyTUM-04QZKAVbRU6aMnPmLzupPAU5Ej_XnwGw@mail.gmail.com
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, PowerPC List Debian <debian-powerpc@lists.debian.org>, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, May 13, 2020 at 1:21 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Always use the PCI GART instead.

Reviewed-by: Mathieu Malaterre <malat@debian.org>

> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/radeon_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index bbb0883e8ce6..a71f13116d6b 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -171,12 +171,7 @@ int radeon_no_wb;
>  int radeon_modeset =3D -1;
>  int radeon_dynclks =3D -1;
>  int radeon_r4xx_atom =3D 0;
> -#ifdef __powerpc__
> -/* Default to PCI on PowerPC (fdo #95017) */
>  int radeon_agpmode =3D -1;
> -#else
> -int radeon_agpmode =3D 0;
> -#endif
>  int radeon_vram_limit =3D 0;
>  int radeon_gart_size =3D -1; /* auto */
>  int radeon_benchmarking =3D 0;
> --
> 2.17.1
>


--=20
Mathieu
