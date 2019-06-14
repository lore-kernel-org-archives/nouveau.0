From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
Date: Fri, 14 Jun 2019 10:48:13 -0700
Message-ID: <6e412091-faf4-64b6-bcd8-95193b11a6ec@nvidia.com>
References: <20190614001121.23950-1-rcampbell@nvidia.com>
 <1fc63655-985a-0d60-523f-00a51648dc38@nvidia.com>
 <f67784db-dada-c827-f231-35549fc046dc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f67784db-dada-c827-f231-35549fc046dc@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>, Jerome Glisse <jglisse@redhat.com>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: nouveau@lists.freedesktop.org, linux-mm@kvack.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On 6/14/19 10:39 AM, Ralph Campbell wrote:
> On 6/13/19 5:49 PM, John Hubbard wrote:
>> On 6/13/19 5:11 PM, Ralph Campbell wrote:
...
>> Actually, the pre-existing code is a little concerning. Your change pres=
erves
>> the behavior, but it seems questionable to be doing a "return 0" (whethe=
r
>> via the above break, or your change) when it's in this partially allocat=
ed
>> state. It's reporting success when it only allocates part of what was re=
quested,
>> and it doesn't fill in the pages array either.
>>
>>
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mut=
ex_lock(&drm->dmem->mutex);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 continue;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0
>>
>> The above comment is about pre-existing potential problems, but your pat=
ch itself
>> looks correct, so:
>>
>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>>
>>
>> thanks,
>>
> The crash was the NULL pointer bug in Christoph's patch #10.
> I sent a separate reply for that.
>=20
> Below is the console output I got, then I made the changes just based on
> code inspection. Do you think I should include it in the change log?

Yes, I think it's good to have it in there. If you look at git log,
you'll see that it's common to include the symptoms, including the
backtrace. It helps people see if they are hitting the same problem,
for one thing.

>=20
> As for the "return 0", If you follow the call chain,
> nouveau_dmem_pages_alloc() is only ever called for one page so this
> currently "works" but I agree it is a bit of a time bomb. There are a
> number of other bugs that I can see that need fixing but I think those
> should be separate patches.
>=20

Yes of course. I called it out for the benefit of the email list, not to
say that your patch needs any changes.=20

thanks,
--=20
John Hubbard
NVIDIA
