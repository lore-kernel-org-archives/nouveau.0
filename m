From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
Date: Tue, 17 Mar 2020 08:56:49 -0300
Message-ID: <20200317115649.GP20941@ziepe.ca>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
 <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
 <20200316184935.GA25322@lst.de>
 <20200316200929.GB20010@ziepe.ca>
 <6de7ee97-45c7-b814-4dab-64e311dd86ce@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6de7ee97-45c7-b814-4dab-64e311dd86ce@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 01:24:09PM -0700, Ralph Campbell wrote:

> The reason for it being backwards is that "normally" a device doesn't want
> the device private page to be faulted back to system memory, it wants to
> get the device private struct page so it can update its page table to point
> to the memory already in the device.

The "backwards" is you set the flag on input and never get it on
output, clear the flag in input and maybe get it on output.

Compare with valid or write which don't work that way.

> Also, a device like Nvidia's GPUs may have an alternate path for copying
> one GPU's memory to another (nvlink) without going through system memory
> so getting a device private struct page/PFN from hmm_range_fault() that isn't
> "owned" by the faulting GPU is useful.
> I agree that the current code isn't well tested or thought out for multiple devices
> (rdma, NVMe drives, GPUs, etc.) but it also ties in with peer-to-peer access via PCIe.

I think the series here is a big improvement. The GPU driver can set
owners that match the hidden cluster interconnect.

Jason
