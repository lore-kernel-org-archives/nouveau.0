From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 5/6] nouveau: return -EBUSY when
 hmm_range_wait_until_valid fails
Date: Tue, 23 Jul 2019 15:18:49 +0000
Message-ID: <20190723151846.GM15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-6-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722094426.18563-6-hch@lst.de>
Content-Language: en-US
Content-ID: <AABBB57195659D4A90E8BFD5BD00F6C6@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 22, 2019 at 11:44:25AM +0200, Christoph Hellwig wrote:
> -EAGAIN has a magic meaning for non-blocking faults, so don't overload
> it.  Given that the caller doesn't check for specific error codes this
> change is purely cosmetic.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Agree

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
