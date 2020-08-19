From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
Date: Wed, 19 Aug 2020 15:07:04 +0100
Message-ID: <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Doc Mailing List <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-nvme-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev@vg
List-Id: nouveau.vger.kernel.org

On 2020-08-19 13:49, Tomasz Figa wrote:
> On Wed, Aug 19, 2020 at 1:51 PM Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>> Hi Tomasz,
>>
>> On 2020-08-19 12:16, Tomasz Figa wrote:
>>> Hi Christoph,
>>>
>>> On Wed, Aug 19, 2020 at 8:56 AM Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
>>>>
>>>> The V4L2-FLAG-MEMORY-NON-CONSISTENT flag is entirely unused,
>>>
>>> Could you explain what makes you think it's unused? It's a feature of
>>> the UAPI generally supported by the videobuf2 framework and relied on
>>> by Chromium OS to get any kind of reasonable performance when
>>> accessing V4L2 buffers in the userspace.
>>>
>>>> and causes
>>>> weird gymanstics with the DMA_ATTR_NON_CONSISTENT flag, which is
>>>> unimplemented except on PARISC and some MIPS configs, and about to be
>>>> removed.
>>>
>>> It is implemented by the generic DMA mapping layer [1], which is used
>>> by a number of architectures including ARM64 and supposed to be used
>>> by new architectures going forward.
>>
>> AFAICS all that V4L2_FLAG_MEMORY_NON_CONSISTENT does is end up
>> controling whether DMA_ATTR_NON_CONSISTENT is added to vb2_queue::dma_attrs.
>>
>> Please can you point to where DMA_ATTR_NON_CONSISTENT does anything at
>> all on arm64?
>>
> 
> With the default config it doesn't, but with
> CONFIG_DMA_NONCOHERENT_CACHE_SYNC enabled it makes dma_pgprot() keep
> the pgprot value as is, without enforcing coherence attributes.

How active are the PA-RISC and MIPS ports of Chromium OS?

Hacking CONFIG_DMA_NONCOHERENT_CACHE_SYNC into an architecture that 
doesn't provide dma_cache_sync() is wrong, since at worst it may break 
other drivers. If downstream is wildly misusing an API then so be it, 
but it's hardly a strong basis for an upstream argument.

>> Also, I posit that videobuf2 is not actually relying on
>> DMA_ATTR_NON_CONSISTENT anyway, since it's clearly not using it properly:
>>
>> "By using this API, you are guaranteeing to the platform
>> that you have all the correct and necessary sync points for this memory
>> in the driver should it choose to return non-consistent memory."
>>
>> $ git grep dma_cache_sync drivers/media
>> $
> 
> AFAIK dma_cache_sync() isn't the only way to perform the cache
> synchronization. The earlier patch series that I reviewed relied on
> dma_get_sgtable() and then dma_sync_sg_*() (which existed in the
> vb2-dc since forever [1]). However, it looks like with the final code
> the sgtable isn't acquired and the synchronization isn't happening, so
> you have a point.

Using the streaming sync calls on coherent allocations has also always 
been wrong per the API, regardless of the bodies of code that have 
happened to get away with it for so long.

> FWIW, I asked back in time what the plan is for non-coherent
> allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> dma_sync_*() was supposed to be the right thing to go with. [2] The
> same thread also explains why dma_alloc_pages() isn't suitable for the
> users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.

AFAICS even back then Christoph was implying getting rid of 
NON_CONSISTENT and *replacing* it with something streaming-API-based - 
i.e. this series - not encouraging mixing the existing APIs. It doesn't 
seem impossible to implement a remapping version of this new 
dma_alloc_pages() for IOMMU-backed ops if it's really warranted 
(although at that point it seems like "non-coherent" vb2-dc starts to 
have significant conceptual overlap with vb2-sg).

Robin.
