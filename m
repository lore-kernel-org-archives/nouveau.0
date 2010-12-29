From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: CRTC video scanout position for high precision vblank
 timestamping?
Date: Wed, 29 Dec 2010 11:20:18 +0100
Message-ID: <4D1B0B62.3040107@tuebingen.mpg.de>
References: <4D1AF8F4.6020707@tuebingen.mpg.de>	
	<AANLkTi=9FagJJYP148Zsc26mm+BCvRCNTqD4jsLT7os6@mail.gmail.com>	
	<AANLkTimBropE8C8uxnwkuQKdM-yNByY2a=EQQfGZNVCf@mail.gmail.com>
	<1293615882.4523.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1293615882.4523.1.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 12/29/2010 10:44 AM, Ben Skeggs wrote:
> On Wed, 2010-12-29 at 10:37 +0100, Maarten Maathuis wrote:
>> On Wed, Dec 29, 2010 at 10:35 AM, Maarten Maathuis<madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>>> On Wed, Dec 29, 2010 at 10:01 AM, Mario Kleiner
>>> <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>  wrote:
>>>> Hello all,
>>>>
>>>> i have recently implemented some patches to the drm core and to the intel
>>>> and radeon kms drivers to provide high precision timestamping of vblank
>>>> intervals and for timestamping of pageflip bufferswap completion. This is
>>>> needed to properly implement the DRI2 sync&  swap bits and their support for
>>>> the oml_sync_control extension.
>>>>
>>>> The patches are in drm-next and will hopefully land in the 2.6.38 merge
>>>> window. Now i'd like to add support for the nouveau kms driver as well.
>>>>
>>>> I had a look at the current nouveau code in drm-next. Implementing the
>>>> patches shouldn't be a problem, it is mostly copy&  paste from radeon/intel
>>>> kms + a little bit of adjustments and then testing.
>>>>
>>>> Problem: The code needs to query the current video scanout position of a
>>>> given crtc. My missing bit of information is the location and format of the
>>>> MMIO registers which presumably exist on nvidia gpu's to provide this
>>>> information. I know the gpu's support this, because the NVidia proprietary
>>>> drivers on both MS-Windows and MacOS/X provide a function to query this info
>>>> from userspace (Windows DirectDraw-7 GetScanline() function, OS/X
>>>> CGDisplayBeamposition() function). Unfortunately the nvidia blob on Linux
>>>> (and Linux/X11 itself) to my knowledge doesn't support such an api, so i
>>>> can't simply mmio-trace the blob to find the relevant register. Also afaik
>>>> the rules-ng database and the current driver source code don't document the
>>>> location of such a register.
>>>>
>>>> I've already made friendship with renouveau and hacked it a bit for my
>>>> purpose, but playing with it for an hour on a Geforce 8800 and staring at
>>>> dumps didn't get me lucky that easily.
>>>>
>>>> I thought i'd ask if any of you have by accident stumbled across such a
>>>> register or would have any good hints how i could narrow down the search.
>>>> Otherwise i'll hack up renouveau to do a bit of pattern matching, searching
>>>> for characteristic patterns in the brute force way and praying to the gods
>>>> of computing that this won't take forever. To my surprise I already had to
>>>> learn that apparently just reading the wrong registers can cause display
>>>> corruption and crash the whole machine.
>>>>
>>>> Any helpful comments highly appreciated.
>>>>
>>>> Thanks,
>>>> -mario
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>>
>>>
>>> If you promise to (get someone to) document them i'll tell you the
>>> ones for my NV96 (probably the same registers on all geforce 8 and
>>> upwards) :-)
>>>
>>> 0x616340: CRTC0 vertical scanline (lower 16 bits, upper 16 bits empty)
>>> 0x616344: CRTC0 horizontal scanline (lower 16 bits, upper 16 bits is a
>>> counter that increments every display cycle)
>>>
>>> 0x616B40: CRTC1 vertical scanline
>>> 0x616B44: CRTC1 horizontal scanline
>>>
>>> I found these by simply dumping the entire range modesetting related
>>> registers. At the time they didn't help me (the issue of swapbuffers
>>> remains unsolved on this generation of hardware, it didn't interest me
>>> *that* much). I don't know what exactly you are doing, but a lot of
>>> stuff is done through pushbuffers (even modesetting) so there are no
>>> "instant" registers that i know of.
>>>
>>> With respect to older cards, i think the VGA spec should offer some
>>> help. That data has been duplicated into normally accessible
>>> registers. If you're lucky Francisco Jerez will reply, he might know
>>> the exact registers.
>>>
>>> I wish you much fun and happiness.
>>>
>>> Sincerely,
>>>
>>> Maarten.
>>>
>>> --
>>> Far away from the primal instinct, the song seems to fade away, the
>>> river get wider between your thoughts and the things we do and say.
>>>
>>
>> In my infinite wisdom i swapped the vertical and horizontal regs,
>> these are the right ones:
>>
>> 0x616340: CRTC0 horizontal scanline (lower 16 bits, upper 16 bits is a
>> counter that increments every display cycle)
>> 0x616344: CRTC0 vertical scanline (lower 16 bits, upper 16 bits empty)
>>
>> 0x616B40: CRTC1 horizontal scanline
>> 0x616B44: CRTC1 vertical scanline
> Ah, I should've waited 10 minutes before doing the same here.  Ah well,
> I can confirm at least on NV84, I can't imagine it differs at all on any
> nv50+ board either.
>
> Ben.
>>

Wow, that was fast! Thanks! I'll get some good sleep now and then give 
it a try on my GF-8800. This is probably also useful to implement the 
.get_vblank_counter() hook properly. Currently it hooks up to 
drm_vblank_count() which is problematic, as .get_vblank_counter() is 
meant to query the hardware for the purpose of reinitializing 
drm_vblank_count() after a long vblank irq off period.

I'll let you know how it goes, hopefully with some nice patches asap.

If somebody knows about similar NV40 and earlier registers, keep it 
coming :-)

Is the range from NV_PCRTC0_OFFSET to NV_PCRTC0_OFFSET + NV_PCRTC0_SIZE 
a good starting point for a search on NV40 and earlier?

thanks,
-mario
