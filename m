From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Date: Tue, 25 Jun 2019 09:29:15 +0200
Message-ID: <20190625072915.GD30350@lst.de>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-19-hch@lst.de> <20190620192648.GI12083@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190620192648.GI12083@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Hocko <mhocko@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, Jun 20, 2019 at 09:26:48PM +0200, Michal Hocko wrote:
> On Thu 13-06-19 11:43:21, Christoph Hellwig wrote:
> > The code hasn't been used since it was added to the tree, and doesn't
> > appear to actually be usable.  Mark it as BROKEN until either a user
> > comes along or we finally give up on it.
> 
> I would go even further and simply remove all the DEVICE_PUBLIC code.

I looked into that as I now got the feedback twice.  It would
create a conflict with another tree cleaning things up around the
is_device_private defintion, but otherwise I'd be glad to just remove
it.

Jason, as this goes through your tree, do you mind the additional
conflict?
