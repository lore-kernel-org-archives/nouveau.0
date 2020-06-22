From: John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 13/16] mm: support THP migration to device private memory
Date: Mon, 22 Jun 2020 16:01:50 -0700
Message-ID: <fa056e5e-ca87-aef1-e66e-58e8ebe5403e@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-14-rcampbell@nvidia.com>
 <F1872509-3B1F-4A8A-BFF5-E4D44E451920@nvidia.com>
 <b6eed976-c515-72d6-a7be-2296cab8f0d4@nvidia.com>
 <C7BEB563-3698-442C-A188-1B66CBE4CF63@nvidia.com>
 <a5f502f8-70cd-014b-8066-bbaeb8024a29@nvidia.com>
 <4C364E23-0716-4D59-85A1-0C293B86BC2C@nvidia.com>
 <CAHbLzkqe50+KUsRH92O4Be2PjuwAYGw9nK+d-73syxi2Xnf9-Q@mail.gmail.com>
 <CAHbLzko=BqtPhxgf7f1bKKqoQxK9XCCPdp4YdL80K_uXFfcETQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHbLzko=BqtPhxgf7f1bKKqoQxK9XCCPdp4YdL80K_uXFfcETQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yang Shi <shy828301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Huang, Ying" <ying.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 2020-06-22 15:33, Yang Shi wrote:
> On Mon, Jun 22, 2020 at 3:30 PM Yang Shi <shy828301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Jun 22, 2020 at 2:53 PM Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On 22 Jun 2020, at 17:31, Ralph Campbell wrote:
>>>> On 6/22/20 1:10 PM, Zi Yan wrote:
>>>>> On 22 Jun 2020, at 15:36, Ralph Campbell wrote:
>>>>>> On 6/21/20 4:20 PM, Zi Yan wrote:
>>>>>>> On 19 Jun 2020, at 17:56, Ralph Campbell wrote:
...
>>> Ying(cc=E2=80=99d) developed the code to swapout and swapin THP in one =
piece: https://lore.kernel.org/linux-mm/20181207054122.27822-1-ying.huang@i=
ntel.com/.
>>> I am not sure whether the patchset makes into mainstream or not. It cou=
ld be a good technical reference
>>> for swapping in device private pages, although swapping in pages from d=
isk and from device private
>>> memory are two different scenarios.
>>>
>>> Since the device private memory swapin impacts core mm performance, we =
might want to discuss your patches
>>> with more people, like the ones from Ying=E2=80=99s patchset, in the ne=
xt version.
>>
>> I believe Ying will give you more insights about how THP swap works.
>>
>> But, IMHO device memory migration (migrate to system memory) seems
>> like THP CoW more than swap.


A fine point: overall, the desired behavior is "migrate", not CoW.
That's important. Migrate means that you don't leave a page behind, even
a read-only one. And that's exactly how device private migration is
specified.

We should try to avoid any erosion of clarity here. Even if somehow
(really?) the underlying implementation calls this THP CoW, the actual
goal is to migrate pages over to the device (and back).


>>
>> When migrating in:
>=20
> Sorry for my fat finger, hit sent button inadvertently, let me finish her=
e.
>=20
> When migrating in:
>=20
>          - if THP is enabled: allocate THP, but need handle allocation
> failure by falling back to base page
>          - if THP is disabled: fallback to base page
>=20

OK, but *all* page entries (base and huge/large pages) need to be cleared,
when migrating to device memory, unless I'm really confused here.
So: not CoW.

thanks,
--=20
John Hubbard
NVIDIA
