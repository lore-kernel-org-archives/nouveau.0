From: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
Date: Tue, 30 Jul 2019 11:51:34 -0400
Message-ID: <20190730155134.GA10366@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de>
 <20190729233044.GA7171@redhat.com>
 <20190730054633.GA28515@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730054633.GA28515@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Tue, Jul 30, 2019 at 07:46:33AM +0200, Christoph Hellwig wrote:
> On Mon, Jul 29, 2019 at 07:30:44PM -0400, Jerome Glisse wrote:
> > On Mon, Jul 29, 2019 at 05:28:43PM +0300, Christoph Hellwig wrote:
> > > The MIGRATE_PFN_WRITE is only used locally in migrate_vma_collect_pmd,
> > > where it can be replaced with a simple boolean local variable.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > NAK that flag is useful, for instance a anonymous vma might have
> > some of its page read only even if the vma has write permission.
> > 
> > It seems that the code in nouveau is wrong (probably lost that
> > in various rebase/rework) as this flag should be use to decide
> > wether to map the device memory with write permission or not.
> > 
> > I am traveling right now, i will investigate what happened to
> > nouveau code.
> 
> We can add it back when needed pretty easily.  Much of this has bitrotted
> way to fast, and the pending ppc kvmhmm code doesn't need it either.

Not using is a serious bug, i will investigate this friday.

Cheers,
Jérôme
