From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix pre-nv50 pageflip events (v4)
Date: Tue, 15 Dec 2015 15:17:21 +0000
Message-ID: <CACvgo53PUcP43isv85p2DVO5YtgBajm7_n5Thsg1Y7zzf+zsMQ@mail.gmail.com>
References: <1447173451-27890-1-git-send-email-thierry.reding@gmail.com>
	<20151110164139.GA27962@ulmo>
	<566FF56C.8000803@gmail.com>
	<CACvgo52MEzy-VovQa0UPrMq+ZsB6pzDA++FcRw_A-=YSMC8i2A@mail.gmail.com>
	<56702B39.5040903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <56702B39.5040903@gmail.com>
Sender: stable-owner@vger.kernel.org
To: poma <pomidorabelisima@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, "# 3.13+" <stable@vger.kernel.org>, Mario Kleiner <mario.kleiner.de@gmail.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Ikey Doherty <ikey@solus-project.com>, Ben Skeggs <bskeggs@redhat.com>, russianneuromancer@ya.ru, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>
List-Id: nouveau.vger.kernel.org

On 15 December 2015 at 15:01, poma <pomidorabelisima@gmail.com> wrote:
> On 15.12.2015 12:21, Emil Velikov wrote:
>> On 15 December 2015 at 11:11, poma <pomidorabelisima@gmail.com> wrote:
>>
>>>
>>> Apparently not reached @stable (stable: 4.3.3 2015-12-15),
>>> so here's one more time.
>>>
>> It has reached 4.4-rcX and will get picked by the stable maintainer
>> (Greg?) in due time. Meanwhile you can ask your distro maintainers to
>> apply it locally until we get an official release that includes it.
>>
>> -Emil
>>
>
> It is all but unknown ;)
> https://bugzilla.redhat.com/show_bug.cgi?id=1281368
>
> Emil, the point is - if it has -not- reached stable@vger.kernel.org, how can it be applied, in the first place.
>
The same way many others do ? I'd imagine there is a tool/script which
parses through the development tree, which would explain why (many?)
people explicitly suppress git from sending an email yet things still
work. There is extra information in the documentation [1] if you're
interested.

-Emil
[1] https://www.kernel.org/doc/Documentation/stable_kernel_rules.txt
