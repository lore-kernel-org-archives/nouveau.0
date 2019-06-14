From: Christoph Hellwig <hch@lst.de>
Subject: Re: [Nouveau] [PATCH 22/22] mm: don't select MIGRATE_VMA_HELPER
 from HMM_MIRROR
Date: Fri, 14 Jun 2019 08:48:23 +0200
Message-ID: <20190614064823.GO7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-23-hch@lst.de> <7f6c6837-93cd-3b89-63fb-7a60d906c70c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f6c6837-93cd-3b89-63fb-7a60d906c70c@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Hubbard <jhubbard@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, Jun 13, 2019 at 06:53:15PM -0700, John Hubbard wrote:
> For those who have out of tree drivers that need migrate_vma(), but are not
> Nouveau, could we pretty please allow a way to select that independently?

No.  The whole point is to not build this fairly big chunk of code in
unless we have a user in the tree.
