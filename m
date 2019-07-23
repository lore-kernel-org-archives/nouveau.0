From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 1/6] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault,snapshot}
Date: Tue, 23 Jul 2019 14:54:45 +0000
Message-ID: <20190723145441.GI15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-2-hch@lst.de>
 <CAFqt6zY8zWAmc-VTrZ1KxQPBCdbTxmZy_tq2-OkUi3TVrfp7Og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqt6zY8zWAmc-VTrZ1KxQPBCdbTxmZy_tq2-OkUi3TVrfp7Og@mail.gmail.com>
Content-Language: en-US
Content-ID: <84AEF1430B5CAF409CC0D62618B7407E@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Linux-MM <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 22, 2019 at 08:07:33PM +0530, Souptick Joarder wrote:
> On Mon, Jul 22, 2019 at 3:14 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > We should not have two different error codes for the same condition.  I=
n
> > addition this really complicates the code due to the special handling o=
f
> > EAGAIN that drops the mmap_sem due to the FAULT_FLAG_ALLOW_RETRY logic
> > in the core vm.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> > Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >  Documentation/vm/hmm.rst |  2 +-
> >  mm/hmm.c                 | 10 ++++------
> >  2 files changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> > index 7d90964abbb0..710ce1c701bf 100644
> > +++ b/Documentation/vm/hmm.rst
> > @@ -237,7 +237,7 @@ The usage pattern is::
> >        ret =3D hmm_range_snapshot(&range);
> >        if (ret) {
> >            up_read(&mm->mmap_sem);
> > -          if (ret =3D=3D -EAGAIN) {
> > +          if (ret =3D=3D -EBUSY) {
> >              /*
> >               * No need to check hmm_range_wait_until_valid() return va=
lue
> >               * on retry we will get proper error with hmm_range_snapsh=
ot()
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index e1eedef129cf..16b6731a34db 100644
> > +++ b/mm/hmm.c
> > @@ -946,7 +946,7 @@ EXPORT_SYMBOL(hmm_range_unregister);
> >   * @range: range
> >   * Return: -EINVAL if invalid argument, -ENOMEM out of memory, -EPERM =
invalid
> >   *          permission (for instance asking for write and range is rea=
d only),
> > - *          -EAGAIN if you need to retry, -EFAULT invalid (ie either n=
o valid
> > + *          -EBUSY if you need to retry, -EFAULT invalid (ie either no=
 valid
> >   *          vma or it is illegal to access that range), number of vali=
d pages
> >   *          in range->pfns[] (from range start address).
> >   *
> > @@ -967,7 +967,7 @@ long hmm_range_snapshot(struct hmm_range *range)
> >         do {
> >                 /* If range is no longer valid force retry. */
> >                 if (!range->valid)
> > -                       return -EAGAIN;
> > +                       return -EBUSY;
> >
> >                 vma =3D find_vma(hmm->mm, start);
> >                 if (vma =3D=3D NULL || (vma->vm_flags & device_vma))
> > @@ -1062,10 +1062,8 @@ long hmm_range_fault(struct hmm_range *range, bo=
ol block)
> >
> >         do {
> >                 /* If range is no longer valid force retry. */
> > -               if (!range->valid) {
> > -                       up_read(&hmm->mm->mmap_sem);
> > -                       return -EAGAIN;
> > -               }
> > +               if (!range->valid)
> > +                       return -EBUSY;
>=20
> Is it fine to remove  up_read(&hmm->mm->mmap_sem) ?

It seems very subtle, but under the covers this calls
handle_mm_fault() with FAULT_FLAG_ALLOW_RETRY which will cause the
mmap sem to become unlocked along the -EAGAIN return path.

I think without the commit message I wouldn't have been able to
understand that, so Christoph, could you also add the comment below
please?

Otherwise

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Frankly, I find the 'int *locked' scheme of GUP easier to understand..

diff --git a/mm/hmm.c b/mm/hmm.c
index 16b6731a34db79..54b3a4162ae949 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -301,8 +301,10 @@ static int hmm_vma_do_fault(struct mm_walk *walk, unsi=
gned long addr,
 	flags |=3D hmm_vma_walk->block ? 0 : FAULT_FLAG_ALLOW_RETRY;
 	flags |=3D write_fault ? FAULT_FLAG_WRITE : 0;
 	ret =3D handle_mm_fault(vma, addr, flags);
-	if (ret & VM_FAULT_RETRY)
+	if (ret & VM_FAULT_RETRY) {
+		/* Note, handle_mm_fault did up_read(&mm->mmap_sem)) */
 		return -EAGAIN;
+	}
 	if (ret & VM_FAULT_ERROR) {
 		*pfn =3D range->values[HMM_PFN_ERROR];
 		return -EFAULT;
