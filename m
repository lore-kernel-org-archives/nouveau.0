From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 1/5] mm: return valid info from hmm_range_unregister
Date: Wed, 3 Jul 2019 20:40:08 +0000
Message-ID: <20190703204002.GO18688@mellanox.com>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-2-hch@lst.de> <20190703190045.GN18688@mellanox.com>
 <20190703202857.GA15690@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703202857.GA15690@lst.de>
Content-Language: en-US
Content-ID: <06E102C96309A349A6DAB9BA508DF1DD@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 03, 2019 at 10:28:57PM +0200, Christoph Hellwig wrote:
> On Wed, Jul 03, 2019 at 07:00:50PM +0000, Jason Gunthorpe wrote:
> > I don't think the API should be encouraging some shortcut here..
> >=20
> > We can't do the above pattern because the old hmm_vma API didn't allow
> > it, which is presumably a reason why it is obsolete.
> >=20
> > I'd rather see drivers move to a consistent pattern so we can then
> > easily hoist the seqcount lock scheme into some common mmu notifier
> > code, as discussed.
>=20
> So you don't like the version in amdgpu_ttm_tt_get_user_pages_done in
> linux-next either?

I looked at this for 5 mins, and I can't see the key elements of the
collision retry lock:

- Where is the retry loop?
- Where is the lock around the final test to valid prior to using
  the output of range?

For instance looking at amdgpu_gem_userptr_ioctl()..

We can't be holding a lock when we do hmm_range_wait_until_valid()
(inside amdgpu_ttm_tt_get_user_pages), otherwise it deadlocks, and
there are not other locks that would encompass the final is_valid check.

And amdgpu_gem_userptr_ioctl() looks like a syscall entry point, so
having it fail just because the lock collided (ie is_valid =3D=3D false)
can't possibly be the right thing.

I'm also unclear when the device data is updated in that sequence..

So.. I think this locking is wrong. Maybe AMD team can explain how it
should work?

Jason
