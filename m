From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] Documentation: nouveau: Introduce some nouveau
 documentation
Date: Thu, 24 Sep 2020 21:07:52 +0100
Message-ID: <c394e36c-3453-492a-1236-eb234356dd2d@spliet.org>
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
 <20200923203918.GA37078@xps13>
 <CACO55ttM+wmbcYz6h5qeEb9_Ta=JcnRzURFYu3-9GJPMHzdFeg@mail.gmail.com>
 <c04d84e2-9091-a22c-c3e4-e43e4ee72057@spliet.org>
 <CACO55tvM557nS=5u-QVtihZnXY5gnO0=VO9UQymmgitZ-_EDEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tvM557nS=5u-QVtihZnXY5gnO0=VO9UQymmgitZ-_EDEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org



Op 24-09-2020 om 16:21 schreef Karol Herbst:
> On Thu, Sep 24, 2020 at 3:06 PM Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org> wrote:
>>
>>
>> Op 23-09-2020 om 22:36 schreef Karol Herbst:
>>> On Wed, Sep 23, 2020 at 10:39 PM Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>>
>>>> On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
>>>>> On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>>
>>>> <snip>
>>>>
>>>>> yeah, I think overall this file is a good idea and being able to get a
>>>>> quick overview over the driver is helpful. I think if we focus on the
>>>>> user facing things first, like the hwmon or other things users
>>>>> generally interact with would be helpful. I think if we start to
>>>>> document areas where there are many low hanging fruits, this could
>>>>> help random people to start with easier tasks and get more used to the
>>>>> driver overall, so I'd probably ignore most of the stuff which really
>>>>> requires a fundamental understanding on how things work and focus more
>>>>> on vbios parsing (which has annoying interfaces anyway and it might
>>>>> make sense to make it more consistent and nicer to use) and/or simple
>>>>> code interfacing with the mmio space.
>>>>>
>>>>
>>>> I'll admit to being motivated by entirely selfish reasons. I know
>>>> practically nothing about nouveau and I'm the type of person who likes
>>>> to keep notes about how things work together, both free form and
>>>> structured in-line docs. All that to say, I think focusing on the
>>>> "low-hanging fruit" stuff will be very beneficial and I'm happy to do
>>>> that, but I'm also interested in documenting everything else I run
>>>> across.
>>>>
>>>
>>> yeah, that's fine. I was just giving a suggestion on where the initial
>>> focus should be on.
>>>
>>>>> Eg some users have problems with their fans as they are either always
>>>>> ramping up to max, or not running at all... GPUs temperature or power
>>>>> consumption is reporting incorrectly... all those things users hit
>>>>> regularly, but which isn't really important enough so it just falls
>>>>> under the table even if it gets reported.
>>>>>
>>>>
>>>> This does bring up an interesting point about organization and target
>>>> audiences. Typically when I'm writing documentation I like to organize
>>>> things by target audiences, so we could have a layout like:
>>>>
>>>> * General Introduction
>>>>
>>>> * User Guide
>>>>       - Overview of supported hardware/features/etc
>>>
>>> That's best to document in a wiki though. And we had plans to convert
>>> the existing old wiki over to gitlab. And maybe It think we really
>>> should do that and clean it up while we work on that. It's just a huge
>>> project but maybe just starting with whatever you want to do would be
>>> fine and after a while nothing is left. Anyway, I think we should
>>> discuss this more openly with the others as well. i don't like the
>>> current wiki anyway, as only approved developers can change things and
>>> with a gitlab wiki we could even take MRs on stuff.
>>>
>>>>       - Installation
>>>
>>> well.. I think this can be skipped ;) But still, also belongs more
>>> into a wiki. I think what we could cover here is to how to clean up
>>> remaining stuff from the blob driver as this is something which comes
>>> up quite a lot on IRC though.
>>>
>>>>       - Configuration (module parameters and such)
>>>>       - Troubleshooting
>>>
>>> that would be cool to have in the wiki as well. Just collecting the
>>> most common issue and document it there. Especially if it is on
>>> gitlab, users can just do that as well :)
>>>
>>>>       - Getting Involved (bug reporting, running tests, etc)
>>>
>>> yeah, and we have some stuff on that on the old wiki already, it's
>>> just very outdated and needs updating, which as said above can only be
>>> done by developers and developers sadly have other things to do :)
>>>
>>>>
>>>> * Developer Guide
>>>>       - Architecture Overview
>>>>       - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
>>>>       - Internal APIs
>>>
>>> Right, those things I'd like to see in the kernel tree actually.
>>>
>>>>       - Debugging and Development Tools
>>>>       - Contribution Guide
>>>>
>>>
>>> Those I think belong more into the wiki again. The latter is a bit
>>> hard to split as there are kernel guides, but also community and
>>> project guides. Mesa does things differently than let's say the
>>> kernel. And Nouveau is still in this limbo state being on the old
>>> infra, but also on the new one with mesa...
>>>
>>>> I'm not sure how much stuff people want to keep on the
>>>> nouveau.freedesktop.org wiki vs here.
>>>>
>>>
>>> I think the first step actually is to set up a proper nouveau project
>>> on gitlab for dealing with issues and the wiki. I would be fine to do
>>> that and we can also move the code there late. But maybe let's start
>>> with the wiki :)
>>
>> Risking to turn this into a "let's fix everything in one go" project
>> that ends up never getting finished, I just want to make sure that
>> everybody is also aware of the documentation generated from Envytools
>> [0]. Especially "architecture overview" (that is, if we're talking about
>> hardware architecture and not driver/software architecture) might be
>> better suited in envytools.
>>
>> As for module parameters, IMHO modinfo is supposed to be the source of
>> information. It's sadly lacking any "sub-"option inside nouveau.config
>> and nouveau.debug, which may be by design. Perhaps expanding the modinfo
>> explanations can help cover at least all the other options in a way that
>> never gets out of sync with source code.
>>
> 
> technically true, but 99% of the users won't know that modinfo shows
> what parameters there are. I don't like this "config" parameter and I
> think we should split it up and have a nice line telling what they do
> for modinfo, but for user facing documentation we need something more
> detailed and something people find when searching for it on the web.

100% of the users shouldn't be using nouveau's module parameters. 
Unfortunately that assumes the ideal world of a bug-free nouveau. Since 
this utopia isn't reality, nouveau has module parameters that either 
enable debugging/experimental functionality or work around issues for 
which we don't have proper detection logic to automatically determine 
these issues need working around.
In my opinion (!) user documentation is much more useful if it takes the 
form of up-to-date FAQ entries that propose certain module parameters 
for common issues. And the form of an up-to-date "bugs" page that 
proposes specific module parameters for collecting additional 
information that helps the nouveau team debug their issues. A plain-old 
list of parameters is of little to no value to regular users, as the 
technical stuff jotted down in such a list rarely relates to a user's 
use-case. Those hackers that want to experiment should be able to resort 
to modinfo just fine if it wasn't for those pesky ( ;-) ) undocumented 
"config" options.

Speaking of which, I think Ben had some specific reasons for these 
config options. IIRC they were along the lines of "not formalised API, 
might change or remove later", but he may be able to tell you his line 
of reasoning in greater detail.

> 
>> Roy
>>
>> [0] https://envytools.readthedocs.io/en/latest/
>>
>>>
>>>>>> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
>>>>>> index 5a96c942d912..76b90d7ddfc6 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
>>>>>> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
>>>>>> @@ -1,22 +1,57 @@
>>>>>>    /* SPDX-License-Identifier: MIT */
>>>>>> +
>>>>>> +/**
>>>>>> + * DOC: Overview
>>>>>> + *
>>>>>> + * Interfaces for working with the display engine.
>>>>>> + */
>>>>>> +
>>>>>>    #ifndef __NVKM_DISP_H__
>>>>>>    #define __NVKM_DISP_H__
>>>>>> +
>>>>>> +/**
>>>>>> + * nvkm_disp() - Get a &struct nvkm_disp from a &struct nvkm_engine.
>>>>>> + *
>>>>>> + * @p: A &struct nvkm_engine reference.
>>>>>> + *
>>>>>> + * Return: The &struct nvkm_disp that contains the given engine.
>>>>>> + */
>>>>>>    #define nvkm_disp(p) container_of((p), struct nvkm_disp, engine)
>>>>>>    #include <core/engine.h>
>>>>>>    #include <core/event.h>
>>>>>>
>>>>>> +/**
>>>>>> + * struct nvkm_disp - Represents a display engine.
>>>>>> + *
>>>>>> + * This structure is for <some abstraction here>. It has <some assumptions
>>>>>> + * about its usage here>.
>>>>>> + */
>>>>>>    struct nvkm_disp {
>>>>>> +    /** @func: Chipset-specific vtable for manipulating the display. */
>>>>>>           const struct nvkm_disp_func *func;
>>>>>> +
>>>>>> +    /** @engine: The engine for this display. */
>>>>>>           struct nvkm_engine engine;
>>>>>>
>>>>>> +    /** @head: list of heads attached to this display. */
>>>>>>           struct list_head head;
>>>>>> +
>>>>>> +    /** @ior: List of IO resources for this display. */
>>>>>>           struct list_head ior;
>>>>>> +
>>>>>> +    /** @outp: List of outputs for this display. */
>>>>>>           struct list_head outp;
>>>>>> +
>>>>>> +    /** @conn: List of connectors for this display. */
>>>>>>           struct list_head conn;
>>>>>>
>>>>>> +    /** @hpd: An event that fires when something happens I guess. */
>>>>>>           struct nvkm_event hpd;
>>>>>> +
>>>>>> +    /** @vblank: An event that fires and has some relation to the vblank. */
>>>>>>           struct nvkm_event vblank;
>>>>>>
>>>>>> +    /** @client: The oproxy (?) client for this display. */
>>>>>>           struct nvkm_oproxy *client;
>>>>>>    };
>>>>>
>>>>> generally not a big fan of "int a; // a is an int" kind of
>>>>> documentation. But if it would specify constraints or details on how
>>>>> it's valid to use those fields, then it makes totally sense to add
>>>>> stuff.
>>>>
>>>> Definitely, I think that is not particularly helpful documentation. Of
>>>> course, the what and why of a function parameter or struct member is
>>>> very likely to be more interesting than that, but it's true that every
>>>> once in a while that the variable name can be so clear there's not much
>>>> else to say.
>>>>
>>>> I think it's fair to say the documentation I added for the above struct
>>>> is not good. I think it's also fair to say that a new-comer such as
>>>> myself who stumbles upon this structure has practically no chance of
>>>> guessing what it's all about without reading a bunch of additional code.
>>>> My first guess was that it represented a display I had plugged in, which
>>>> at this point I'm fairly confident is not at all correct. It required me
>>>> to look at many users of this struct along with perusing envytools
>>>> documentation to guess it represented a display engine.
>>>>
>>>
>>> yeah, but given that you run into the confusion you can actually
>>> document this and leave a comment addressing that. So describing a
>>> little bit what the engine does, what are heads, iors and outputs,
>>> etc... I think getting the high level overview should be the focus
>>> atm. We can always deal with the technical details later as those are
>>> usually easier to get once you have a rough idea on what's going on.
>>>
>>>> It may well be I'm an exceptionally slow learner, but even short notes
>>>> can be extremely helpful.
>>>>
>>>>>
>>>>> not sure if you were aware of it, but we have some documentation on
>>>>> the module options here:
>>>>> https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
>>>>>
>>>>> But I think it makes sense to move it into the source code and link to
>>>>> the new thing from the wiki then.
>>>>>
>>>>
>>>> Indeed, and in fact I started this documentation from the wiki, but
>>>> tried my best to fill in the missing parameters and config options (you
>>>> don't happen to know what the NvAcrWpr* config options do, do you?)
>>>>
>>>
>>> I only know that this option specifies the version of the ACR WPR
>>> firmware to load, but I don't know what that actually is :)
>>>
>>>> Thanks!
>>>>
>>>> - Jeremy
>>>>
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>
> 
