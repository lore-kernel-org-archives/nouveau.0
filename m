From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 08/25] memremap: move dev_pagemap callbacks into a
 separate structure
Date: Mon, 17 Jun 2019 10:51:35 -0700
Message-ID: <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
References: <20190617122733.22432-1-hch@lst.de> <20190617122733.22432-9-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617122733.22432-9-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Linux MM <linux-mm@kvack.org>, nouveau@lists.freedesktop.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>
List-Id: nouveau.vger.kernel.org

On Mon, Jun 17, 2019 at 5:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The dev_pagemap is a growing too many callbacks.  Move them into a
> separate ops structure so that they are not duplicated for multiple
> instances, and an attacker can't easily overwrite them.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>  drivers/dax/device.c              | 11 ++++++----
>  drivers/dax/pmem/core.c           |  2 +-
>  drivers/nvdimm/pmem.c             | 19 +++++++++-------
>  drivers/pci/p2pdma.c              |  9 +++++---
>  include/linux/memremap.h          | 36 +++++++++++++++++--------------
>  kernel/memremap.c                 | 18 ++++++++--------
>  mm/hmm.c                          | 10 ++++++---
>  tools/testing/nvdimm/test/iomap.c |  9 ++++----
>  8 files changed, 65 insertions(+), 49 deletions(-)
>
[..]
> diff --git a/tools/testing/nvdimm/test/iomap.c b/tools/testing/nvdimm/tes=
t/iomap.c
> index 219dd0a1cb08..a667d974155e 100644
> --- a/tools/testing/nvdimm/test/iomap.c
> +++ b/tools/testing/nvdimm/test/iomap.c
> @@ -106,11 +106,10 @@ EXPORT_SYMBOL(__wrap_devm_memremap);
>
>  static void nfit_test_kill(void *_pgmap)
>  {
> -       struct dev_pagemap *pgmap =3D _pgmap;

Whoops, needed to keep this line to avoid:

tools/testing/nvdimm/test/iomap.c:109:11: error: =E2=80=98pgmap=E2=80=99 un=
declared
(first use in this function); did you mean =E2=80=98_pgmap=E2=80=99?
