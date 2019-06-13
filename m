From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 08/22] memremap: pass a struct dev_pagemap to ->kill
Date: Thu, 13 Jun 2019 13:15:14 -0700
Message-ID: <CAPcyv4gApj=5eYCVSLidDJqF2V1YZiqUht1P26mSzUOjW-ykqA@mail.gmail.com>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-9-hch@lst.de>
 <d9e24f8e-986d-e7b8-cf1d-9344ba51719e@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9e24f8e-986d-e7b8-cf1d-9344ba51719e@deltatee.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, Jun 13, 2019 at 1:12 PM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2019-06-13 3:43 a.m., Christoph Hellwig wrote:
> > Passing the actual typed structure leads to more understandable code
> > vs the actual references.
>
> Ha, ok, I originally suggested this to Dan when he introduced the
> callback[1].
>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reported-by: Logan Gunthorpe <logang@deltatee.com> :)


>
> Logan
>
> [1]
> https://lore.kernel.org/lkml/8f0cae82-130f-8a64-cfbd-fda5fd76bb79@deltatee.com/T/#u
>
