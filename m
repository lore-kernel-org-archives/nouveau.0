From: "Huang\, Ying" <ying.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 13/16] mm: support THP migration to device private memory
Date: Tue, 23 Jun 2020 10:51:23 +0800
Message-ID: <87zh8uze8k.fsf@yhuang-dev.intel.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
        <20200619215649.32297-14-rcampbell@nvidia.com>
        <F1872509-3B1F-4A8A-BFF5-E4D44E451920@nvidia.com>
        <b6eed976-c515-72d6-a7be-2296cab8f0d4@nvidia.com>
        <C7BEB563-3698-442C-A188-1B66CBE4CF63@nvidia.com>
        <a5f502f8-70cd-014b-8066-bbaeb8024a29@nvidia.com>
        <4C364E23-0716-4D59-85A1-0C293B86BC2C@nvidia.com>
        <CAHbLzkqe50+KUsRH92O4Be2PjuwAYGw9nK+d-73syxi2Xnf9-Q@mail.gmail.com>
        <CAHbLzko=BqtPhxgf7f1bKKqoQxK9XCCPdp4YdL80K_uXFfcETQ@mail.gmail.com>
        <fa056e5e-ca87-aef1-e66e-58e8ebe5403e@nvidia.com>
        <CAHbLzkrR4-s+ye1F3XDV_0q+iyZOcyMQNHTggDY3Mn_e2yOZ7g@mail.gmail.com>
        <a778dcec-045b-85c0-2dd3-ac700e4208c5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a778dcec-045b-85c0-2dd3-ac700e4208c5-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> (Ralph
        Campbell's message of "Mon, 22 Jun 2020 17:05:37 -0700")
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Yang Shi <shy828301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:

> On 6/22/20 4:54 PM, Yang Shi wrote:
>> On Mon, Jun 22, 2020 at 4:02 PM John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>> On 2020-06-22 15:33, Yang Shi wrote:
>>>> On Mon, Jun 22, 2020 at 3:30 PM Yang Shi <shy828301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> On Mon, Jun 22, 2020 at 2:53 PM Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>>> On 22 Jun 2020, at 17:31, Ralph Campbell wrote:
>>>>>>> On 6/22/20 1:10 PM, Zi Yan wrote:
>>>>>>>> On 22 Jun 2020, at 15:36, Ralph Campbell wrote:
>>>>>>>>> On 6/21/20 4:20 PM, Zi Yan wrote:
>>>>>>>>>> On 19 Jun 2020, at 17:56, Ralph Campbell wrote:
>>> ...
>>>>>> Ying(cc’d) developed the code to swapout and swapin THP in one piece: https://lore.kernel.org/linux-mm/20181207054122.27822-1-ying.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org/.
>>>>>> I am not sure whether the patchset makes into mainstream or not. It could be a good technical reference
>>>>>> for swapping in device private pages, although swapping in pages from disk and from device private
>>>>>> memory are two different scenarios.
>>>>>>
>>>>>> Since the device private memory swapin impacts core mm performance, we might want to discuss your patches
>>>>>> with more people, like the ones from Ying’s patchset, in the next version.
>>>>>
>>>>> I believe Ying will give you more insights about how THP swap works.
>>>>>
>>>>> But, IMHO device memory migration (migrate to system memory) seems
>>>>> like THP CoW more than swap.
>>>
>>>
>>> A fine point: overall, the desired behavior is "migrate", not CoW.
>>> That's important. Migrate means that you don't leave a page behind, even
>>> a read-only one. And that's exactly how device private migration is
>>> specified.
>>>
>>> We should try to avoid any erosion of clarity here. Even if somehow
>>> (really?) the underlying implementation calls this THP CoW, the actual
>>> goal is to migrate pages over to the device (and back).
>>>
>>>
>>>>>
>>>>> When migrating in:
>>>>
>>>> Sorry for my fat finger, hit sent button inadvertently, let me finish here.
>>>>
>>>> When migrating in:
>>>>
>>>>           - if THP is enabled: allocate THP, but need handle allocation
>>>> failure by falling back to base page
>>>>           - if THP is disabled: fallback to base page
>>>>
>>>
>>> OK, but *all* page entries (base and huge/large pages) need to be cleared,
>>> when migrating to device memory, unless I'm really confused here.
>>> So: not CoW.
>>
>> I realized the comment caused more confusion. I apologize for the
>> confusion. Yes, the trigger condition for swap/migration and CoW are
>> definitely different. Here I mean the fault handling part of migrating
>> into system memory.
>>
>> Swap-in just needs to handle the base page case since THP swapin is
>> not supported in upstream yet and the PMD is split in swap-out phase
>> (see shrink_page_list).
>>
>> The patch adds THP migration support to device memory, but you need to
>> handle migrate in (back to system memory) case correctly. The fault
>> handling should look like THP CoW fault handling behavior (before
>> 5.8):
>>      - if THP is enabled: allocate THP, fallback if allocation is failed
>>      - if THP is disabled: fallback to base page
>>
>> Swap fault handling doesn't look like the above. So, I said it seems
>> like more THP CoW (fault handling part only before 5.8). I hope I
>> articulate my mind.
>>
>> However, I didn't see such fallback is handled. It looks if THP
>> allocation is failed, it just returns SIGBUS; and no check about THP
>> status if I read the patches correctly. The THP might be disabled for
>> the specific vma or system wide before migrating from device memory
>> back to system memory.
>
> You are correct, the patch wasn't handling the fallback case.
> I'll add that in the next version.

For fallback, you need to split the THP in device firstly.  Because you
will migrate a base page instead a whole THP now.

Best Regards,
Huang, Ying

>>>
>>> thanks,
>>> --
>>> John Hubbard
>>> NVIDIA
