From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Selecting supported chipsets in the driver?
Date: Wed, 31 Jul 2013 11:42:35 -0400
Message-ID: <51F9306B.1020602@free.fr>
References: <CAMjv+TQLp4dCfa0FHmfUOYZR3H_RMwiev=59Ocr3WN=drky=YQ@mail.gmail.com>
	<51F83EA7.8050704@gmail.com>
	<CAKb7UvgNmvcuUD4T0+0MdK_Drk3vp9CgLGGtANJC_up04otvvA@mail.gmail.com>
	<51F922E7.1050100@free.fr>
	<CAKb7UvhyvHXN5dXdfp_By6K3fdr_17S87ptgLP-EHLpw_G=V6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhyvHXN5dXdfp_By6K3fdr_17S87ptgLP-EHLpw_G=V6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 31/07/2013 11:03, Ilia Mirkin wrote:
> On Wed, Jul 31, 2013 at 10:44 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
>> On 30/07/2013 18:43, Ilia Mirkin wrote:
>>> On Tue, Jul 30, 2013 at 6:31 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> wrote:
>>>> On 30/07/13 21:39, Christ-Jan Wijtmans wrote:
>>>>> Hi, my apologies if this is the wrong place to post this.
>>>>> I had the desire to turn on or off support for certain chipsets.
>>>>> Because i felt like the nouveau drivers are (relatively) quite large and
>>>>> depends on some kernel code that would only be used for certain
>>>>> chipsets.
>>>>> I will take some time this week to see how this is coded and if its
>>>>> possible but i just wanted a head sup opinion on you guys before i start
>>>>> wasting my time.
>>>>>
>>>> I'm not entirely sure if you're talking about the kernel module, ddx
>>>> (xf86-video-nouveau) or mesa.
>>>>
>>>> In either case, all three should be relatively easy to do, as normally
>>>> the generation specific code is divided. Not too sure if it's worth the
>>>> effort though
>>>>
>>>> * kernel module - 1.7 MiB, ~400KiB gzip
>>>> * ddx - ~200KiB
>>>> * mesa - 6.3 MiB (nouveau/gallium only)
>>>>
>>>> As you can see the sizes are not that big, and I'm not sure if the
>>>> maintainers would be up-to the idea
>>>>
>>>> Not a maintainer myself so take the last statement if a healthy pinch of
>>>> salt :)
>>> I'm not a maintainer either, but to provide an opposing opinion, I
>>> strongly support the notion of being able to select card generations
>>> to build support for. 1.7M of kernel code is huge. I don't even think
>>> it'd be that hard (at least for the kernel module and mesa, and I
>>> think there's a lot less value in doing it for the DDX). I think it
>>> might be as easy as some Makefile changes + a couple of ifdefs in the
>>> init code to do Y/N selects. Making it so that the additional
>>> functionality can be loaded on demand (i.e. Y/M/N) may be much
>>> trickier, to the point of it not being worth it for the additional
>>> complexity.
>>>
>>>     -ilia
>>
>> In mesa, it is possible to build the driver you want (nouveau_vieux, nv30,
>> nv50 or nvc0) so the feature is already there.
> Really? How do you compile only nv50? (Hint: you can't. nv30/nv50/nvc0
> are all linked together in the nouveau driver, no way to split them
> out, largely because of the nouveau_drm_screen_create function.)
Hmm, as I need to specify which driver I want in configure, I thought
they were separated. My bad
>
>> There is no point for the ddx.
>>
>> As for drm, I sure would use this feature as this would cut down compilation
>> time a lot when doing out of the tree builds. With the core arch, in theory,
>> it shouldn't be that hard if you want plan on using old cards only. However,
>> if you plan on doing the opposite (drop old cards support), it is harder
>> as newer cards still use code written for the old ones. If you like,
>> you can draw a dependency map quite easily by looking into the device
>> directory that will contain all the dependencies for every chipset.
>>
>> One more thing, maintaining these dependencies will be done poorly and
>> eat development time. So I'm not in huge favour of this unless you
>> introduce a system that only compiles code for chipsets up to a certain
>> point (which is useless IMO).
>>
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
