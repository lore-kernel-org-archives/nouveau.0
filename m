From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
Date: Mon, 11 May 2020 10:52:57 -0300
Message-ID: <20200511135257.GT19158@mellanox.com>
References: <20200508144017.3501418-1-arnd@arndb.de>
 <20200508144017.3501418-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200508144017.3501418-2-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Skeggs <bskeggs@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, John Hubbard <jhubbard@nvidia.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, May 08, 2020 at 04:40:09PM +0200, Arnd Bergmann wrote:
> CONFIG_DEVICE_PRIVATE cannot be selected in configurations
> without ZONE_DEVICE:
> 
> WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
>   Depends on [n]: ZONE_DEVICE [=n]
>   Selected by [y]:
>   - DRM_NOUVEAU_SVM [=y] && HAS_IOMEM [=y] && DRM_NOUVEAU [=y] && MMU [=y] && STAGING [=y]
> kernel/resource.c:1653:28: error: use of undeclared identifier 'PA_SECTION_SHIFT'
>         size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
>                                   ^
> kernel/resource.c:1654:48: error: use of undeclared identifier 'MAX_PHYSMEM_BITS'
> 
> Add a dependency for Nouveau to avoid broken randconfig builds.
> 
> Fixes: d2c63df2242e ("mm/hmm: make CONFIG_DEVICE_PRIVATE into a
> select")

I've reverted the patch this fixes, it seems more trouble than it is
worth.

Thanks,
Jason
