From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v6 5/6] nouveau: use new mmu interval notifiers
Date: Thu, 16 Jan 2020 16:00:06 +0000
Message-ID: <20200116160002.GL20978@mellanox.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-6-rcampbell@nvidia.com>
 <20200114125957.GO20978@mellanox.com>
 <5845f50e-8bc0-8068-ee21-4f910beb1255@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <5845f50e-8bc0-8068-ee21-4f910beb1255@nvidia.com>
Content-Language: en-US
Content-ID: <ECF78F37AB44F842AECF3474CA80857C@eurprd05.prod.outlook.com>
Sender: owner-linux-mm@kvack.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jan 15, 2020 at 02:09:47PM -0800, Ralph Campbell wrote:

> I don't understand the lifetime/membership issue. The driver is the only =
thing
> that allocates, inserts, or removes struct mmu_interval_notifier and thus
> completely controls the lifetime.

If the returned value is on the defered list it could be freed at any
moment. The existing locks do not prevent it.

> > > +		ret =3D nouveau_svmm_interval_find(svmm, &range);
> > > +		if (ret) {
> > > +			up_read(&mm->mmap_sem);
> > > +			return ret;
> > > +		}
> > > +		range.notifier_seq =3D mmu_interval_read_begin(range.notifier);
> > >   		ret =3D hmm_range_fault(&range, 0);
> > >   		up_read(&mm->mmap_sem);
> > >   		if (ret <=3D 0) {
> >=20
> > I'm still not sure this is a better approach than what ODP does. It
> > looks very expensive on the fault path..
> >=20
> > Jason
> >=20
>=20
> ODP doesn't have this problem because users have to call ib_reg_mr()
> before any I/O can happen to the process address space.

ODP supports a single 'full VA' call at process startup, just like
these cases.

> That is when mmu_interval_notifier_insert() /
> mmu_interval_notifier_remove() can be called and the driver doesn't
> have to worry about the interval changing sizes or being removed
> while I/O is happening. =20

No, for the 'ODP full process VA' (aka implicit ODP) mode it
dynamically maintains a list of intervals. ODP chooses the align the
dynamic intervals to it's HW page table levels, and not to SW VMAs.
This is much simpler to manage and faster to fault, at the cost of
capturing more VA for invalidations which have to be probed against
the HW shadow PTEs.

> It isn't that expensive, there is an extra driver lock/unlock as
> part of the lookup and possibly a find_vma() and kmalloc(GFP_ATOMIC)
> for new intervals. Also, the deferred interval updates for munmap().
> Compared to the cost of updating PTEs in the device and GPU fault
> handling, this is minimal overhead.

Well, compared to ODP which does a single xa lookup with no lock to
find its interval, this looks very expensive and not parallel.

I think if there is merit in having ranges cover the vmas and track
changes then there is probably merit in having the core code provide
much of that logic, not the driver.

But it would be interesting to see some kind of analysis on the two
methods to decide if the complexity is worthwhile.

Jason
