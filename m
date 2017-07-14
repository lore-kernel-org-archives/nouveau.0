From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: Re: [Nouveau] [regression drm/noveau] suspend to ram -> BOOM:
 exception RIP: drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 17:19:02 +0200
Message-ID: <31d327dd-bc3d-cb80-45a9-6a8eb9eb2a9d@mni.thm.de>
References: <1499794333.5315.8.camel@gmx.de>
 <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de> <1500039693.5763.15.camel@gmx.de>
 <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
 <CAEXux-b=u88Bu6JN3xbP+=Fwq2rPRXTXdNWJpBu+pSdsNYwQRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEXux-b=u88Bu6JN3xbP+=Fwq2rPRXTXdNWJpBu+pSdsNYwQRQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <karolherbst@gmail.com>
Cc: Mike Galbraith <efault@gmx.de>, Ilia Mirkin <imirkin@alum.mit.edu>, Peter Zijlstra <peterz@infradead.org>, David Airlie <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

The conversion is a nice catch, but i'd like to have a bit more context, 
see below!

With a better description:

Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>


On 7/14/17 5:10 PM, Karol Herbst wrote:
> Yeah, we shouldn't let the machine die. Are there more WARN_ON_ONCE
> usage we could convert to WARN_ONCE?
>
> Reviewed-By: Karol Herbst <karolherbst@gmail.com>
>
> On Fri, Jul 14, 2017 at 5:05 PM, Tobias Klausmann
> <tobias.johannes.klausmann@mni.thm.de> wrote:
>> On 7/14/17 3:41 PM, Mike Galbraith wrote:
>>> On Fri, 2017-07-14 at 15:36 +0200, Mike Galbraith wrote:
>>>>    All DRM did was to slip a
>>>> WARN_ON_ONCE() that nouveau triggers into a kernel module where such
>>>> things no longer warn, they blow the box out of the water.
>>> BTW, turn that irksome WARN_ON_ONCE() in drivers/gpu/drm/drm_vblank.c
>>> into a WARN_ONCE(), and all is peachy, you get the warning, box lives.
>>>
>>> ---
>>>    drivers/gpu/drm/drm_vblank.c |    3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> --- a/drivers/gpu/drm/drm_vblank.c
>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>> @@ -605,7 +605,8 @@ bool drm_calc_vbltimestamp_from_scanoutp
>>>           */
>>>          if (mode->crtc_clock == 0) {
>>>                  DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n",
>>> pipe);
>>> -               WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
>>> +               WARN_ONCE(drm_drv_uses_atomic_modeset(dev), "%s: report
>>> me.\n",

"report me" seems a bit odd, maybe just uninitialized mode?


>>> +                         dev->driver->name);
>>>                  return false;
>>>          }
>>
>>
>> Hey,
>>
>> confirmed this helps saving the box, but we still have to find the root
>> cause! Backtrace with the above fix applied (and the one which came in with
>> the latest drm-fixes merge)!
>>
>>
>> [1] https://hastebin.com/uyoqifijed.http
>>
>> Thanks,
>>
>> Tobias
>> Reviewed-By: Karol Herbst <karolherbst@gmail.com>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
