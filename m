From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH] drm/nouveau: Fix DEVICE_PRIVATE dependencies
Date: Thu, 30 May 2019 15:49:27 +0000
Message-ID: <20190530154923.GJ13461@mellanox.com>
References: <20190417142632.12992-1-yuehaibing@huawei.com>
 <583de550-d816-f619-d402-688c87c86fe3@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <583de550-d816-f619-d402-688c87c86fe3@huawei.com>
Content-Language: en-US
Content-ID: <56987BA9B86175409FE65B63660189BB@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuehaibing <yuehaibing@huawei.com>
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "jglisse@redhat.com" <jglisse@redhat.com>, "rcampbell@nvidia.com" <rcampbell@nvidia.com>, Leon Romanovsky <leonro@mellanox.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
List-Id: nouveau.vger.kernel.org


On Thu, May 30, 2019 at 11:31:12PM +0800, Yuehaibing wrote:
> Hi all,
>=20
> Friendly ping:
>=20
> Who can take this?
>=20
> On 2019/4/17 22:26, Yue Haibing wrote:
> > From: YueHaibing <yuehaibing@huawei.com>
> >=20
> > During randconfig builds, I occasionally run into an invalid configurat=
ion
> >=20
> > WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
> >   Depends on [n]: ARCH_HAS_HMM_DEVICE [=3Dn] && ZONE_DEVICE [=3Dn]
> >   Selected by [y]:
> >   - DRM_NOUVEAU_SVM [=3Dy] && HAS_IOMEM [=3Dy] && ARCH_HAS_HMM [=3Dy] &=
& DRM_NOUVEAU [=3Dy] && STAGING [=3Dy]
> >=20
> > mm/memory.o: In function `do_swap_page':
> > memory.c:(.text+0x2754): undefined reference to `device_private_entry_f=
ault'
> >=20
> > commit 5da25090ab04 ("mm/hmm: kconfig split HMM address space mirroring=
 from device memory")
> > split CONFIG_DEVICE_PRIVATE dependencies from
> > ARCH_HAS_HMM to ARCH_HAS_HMM_DEVICE and ZONE_DEVICE,
> > so enable DRM_NOUVEAU_SVM will trigger this warning,
> > cause building failed.
> >=20
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Fixes: 5da25090ab04 ("mm/hmm: kconfig split HMM address space mirroring=
 from device memory")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >  drivers/gpu/drm/nouveau/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/=
Kconfig
> > index 00cd9ab..99e30c1 100644
> > +++ b/drivers/gpu/drm/nouveau/Kconfig
> > @@ -74,7 +74,8 @@ config DRM_NOUVEAU_BACKLIGHT
> > =20
> >  config DRM_NOUVEAU_SVM
> >  	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
> > -	depends on ARCH_HAS_HMM
> > +	depends on ARCH_HAS_HMM_DEVICE
> > +	depends on ZONE_DEVICE
> >  	depends on DRM_NOUVEAU
> >  	depends on STAGING
> >  	select HMM_MIRROR
> >=20

I'm expecting to take a patch like this into the new hmm git tree once
Jerome sends his Final Solution for the kconfig problems.

Maybe it is this patch, Jerome??

Regards,
Jason=20
