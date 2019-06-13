From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Date: Thu, 13 Jun 2019 12:53:02 -0700
Message-ID: <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190613194430.GY22062@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190613194430.GY22062-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: "linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 6/13/19 12:44 PM, Jason Gunthorpe wrote:
> On Thu, Jun 13, 2019 at 11:43:21AM +0200, Christoph Hellwig wrote:
>> The code hasn't been used since it was added to the tree, and doesn't
>> appear to actually be usable.  Mark it as BROKEN until either a user
>> comes along or we finally give up on it.
>>
>> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
>>   mm/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 0d2ba7e1f43e..406fa45e9ecc 100644
>> +++ b/mm/Kconfig
>> @@ -721,6 +721,7 @@ config DEVICE_PRIVATE
>>   config DEVICE_PUBLIC
>>   	bool "Addressable device memory (like GPU memory)"
>>   	depends on ARCH_HAS_HMM
>> +	depends on BROKEN
>>   	select HMM
>>   	select DEV_PAGEMAP_OPS
> 
> This seems a bit harsh, we do have another kconfig that selects this
> one today:
> 
> config DRM_NOUVEAU_SVM
>          bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
>          depends on ARCH_HAS_HMM
>          depends on DRM_NOUVEAU
>          depends on STAGING
>          select HMM_MIRROR
>          select DEVICE_PRIVATE
>          default n
>          help
>            Say Y here if you want to enable experimental support for
>            Shared Virtual Memory (SVM).
> 
> Maybe it should be depends on STAGING not broken?
> 
> or maybe nouveau_svm doesn't actually need DEVICE_PRIVATE?
> 
> Jason

I think you are confusing DEVICE_PRIVATE for DEVICE_PUBLIC.
DRM_NOUVEAU_SVM does use DEVICE_PRIVATE but not DEVICE_PUBLIC.
