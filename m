From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: turn hmm migrate_vma upside down v3
Date: Fri, 16 Aug 2019 11:45:02 +0000
Message-ID: <20190816114456.GA5412@mellanox.com>
References: <20190814075928.23766-1-hch@lst.de> <20190816065141.GA6996@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816065141.GA6996@lst.de>
Content-Language: en-US
Content-ID: <81AC2B318B8E8841A42EB8D34486FD1F@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Aug 16, 2019 at 08:51:41AM +0200, Christoph Hellwig wrote:
> Jason,
>=20
> are you going to look into picking this up?  Unfortunately there is
> a hole pile in this area still pending, including the kvmppc secure
> memory driver from Bharata that depends on the work.
>=20
> mm folks:  migrate.c is mostly a classic MM file except for the hmm
> additions.  Do you want to also look over this or just let it pass?

Yes, after you explained the functions were hmm ones, it seems OK to
go to hmm.git.

I was waiting for the dust to settle, I see Ralph tested-by, are we
good now?

Jason
