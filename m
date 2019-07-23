From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 2/6] mm: move hmm_vma_range_done and hmm_vma_fault to
 nouveau
Date: Tue, 23 Jul 2019 14:55:10 +0000
Message-ID: <20190723145506.GJ15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-3-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722094426.18563-3-hch@lst.de>
Content-Language: en-US
Content-ID: <3FB3BADA1123924E9A7FB81AD9C8BC58@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 22, 2019 at 11:44:22AM +0200, Christoph Hellwig wrote:
> These two functions are marked as a legacy APIs to get rid of, but seem
> to suit the current nouveau flow.  Move it to the only user in
> preparation for fixing a locking bug involving caller and callee.
> All comments referring to the old API have been removed as this now
> is a driver private helper.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 45 +++++++++++++++++++++-
>  include/linux/hmm.h                   | 54 ---------------------------
>  2 files changed, 43 insertions(+), 56 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
