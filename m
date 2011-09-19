From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: [PATCH 3/3] dri2: Fixes to swap scheduling,
	especially for copy-swaps.
Date: Mon, 19 Sep 2011 04:04:57 +0200
Message-ID: <4E76A349.70103@tuebingen.mpg.de>
References: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>	<1314984801-12029-4-git-send-email-mario.kleiner@tuebingen.mpg.de>	<87wrdkufec.fsf@riseup.net>	<103D9770-D3B1-4E14-A177-645C19798057@tuebingen.mpg.de>
	<8739g5to4b.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8739g5to4b.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 09/09/2011 11:14 PM, Francisco Jerez wrote:
> Mario Kleiner<mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>  writes:
>
>> On Sep 8, 2011, at 1:00 AM, Francisco Jerez wrote:
>>
>> Thanks for your review. See comments below.
>>
>>> Mario Kleiner<mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>  writes:
>>>
>>>> Treats vblank event scheduling for the non-pageflip swap
>>>> case correctly. Allows vblank controlled swaps for redirected
>>>> windows. Fixes some corner-cases in OML_sync_control scheduling
>>>> when divisor and remainder parameters are used.
>>>>
>>>> Signed-off-by: Mario Kleiner<mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
>>>> ---
>>>>   src/nouveau_dri2.c |   71 ++++++++++++++++++++++++++++++++++++++++
>>>> ++++-------
>>>>   1 files changed, 61 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
>>>> index 9f0ee97..f14dea4 100644
>>>> --- a/src/nouveau_dri2.c
>>>> +++ b/src/nouveau_dri2.c
>>>> @@ -196,10 +196,8 @@ can_sync_to_vblank(DrawablePtr draw)
>>>>   {
>>>>   	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
>>>>   	NVPtr pNv = NVPTR(scrn);
>>>> -	PixmapPtr pix = NVGetDrawablePixmap(draw);
>>>>
>>>>   	return pNv->glx_vblank&&
>>>> -		nouveau_exa_pixmap_is_onscreen(pix)&&
>>>
>>> I'm not sure that this is the right way to fix this problem, depending
>>> on the kind of transformations that the compositing manager is doing
>>> you're likely to end up picking a CRTC at random... I just have the
>>> impression that for redirected windows syncing to vblank is no longer
>>> our responsibility, but rather the compositing manager's.
>>>
>>
>> I don't think it is the perfect way either, but to me it seems to be
>> some improvement for the time being. Ideally there would be protocol
>> probably between the compositor and mesa to get this perfectly right -
>> translate the oml_sync_control and classic glXSwapBuffers requests
>> into some requests for the compositor and x-server.
>>
> I'm not sure the spec itself makes that much sense when you're running a
> compositing manager... Anyway I suspect there's a common fix for this
> and the synchronization issue we had with the "exchange" swapbuffers
> path, that only involves some minor rewording in the DRI2 protocol.
>

Afaik the oml_sync_control spec is based on some sgi spec for their 
former big multi-pipe machines (Onyx Infinite Reality engine and such), 
where you had multiple displays, but they were usually driven with 
exactly the same video modes in perfect sync, always acting like one big 
single x-screen. That shows through in some places i think.

But the spec itself should still make sense with composition manager. It 
"just" requires quite a bit of extra protocol and effort for 
unredirected windows if one wants to do it properly, as far as i can 
see. Basically send the whole dri2swapbuffers request to the compositor, 
get some acknowledge from it when it is safe to exchange the buffers and 
then the compositor would need to schedule and send swaprequests itself, 
according to the (target_msc, divisor, remainder) and would also need to 
call dri2swapcomplete when the swap is actually done. Probably these 
interactions should rather happen between mesa <-> compositor <-> 
x-server/ddx rather than mesa <-> x-server <-> ddx <-> compositor. But 
the spec itself - the api from the viewpoint of the gl client - would 
still make a lot of sense imho.

There were some plans on this on the 
<http://dri.freedesktop.org/wiki/CompositeSwap> Wiki.

>> But the current implementation under a compositor is not great. You
>> get glxgears reporting that "vsync is on and the redraw rate should
>> equal the refresh rate" but see 2900 fps reported on a 60 Hz display,
>> with apparently 60 Hz animation. And, in my use case, toolkits that
>> care about timing and do some consistency checks on their swapbuffers
>> execution bail out immediately, telling you to fix your "totally
>> broken graphics driver setup".
>>
>> It's a pure "better than nothing" change for the redirected case,
>> which seems to behave less confusing, at least as no fancy
>> transformations are used, e.g., during desktop transitions.
>>
> OK, fair enough.
>

So, you're ok with that "better than nothing" change?

>> Some consistent crtc selection is another thing that imho would need a
>> bit of work for nouveau and the other drivers. Currently nouveau
>> always selects the 1st crtc for vblank events based swap scheduling
>> and vsync if a window spans multiple displays on xinerama setups,
>> regardless if a non-fullscreen window is displaying on the first or
>> second monitor. Same goes for fullscreen drawables, regardless of how
>> much area is covered by the viewport of a crtc. The other drivers
>> select the crtc to sync by the intersection area of drawable and
>> crtc, so tearing fuer multi-display spanning windows is limited to
>> the "smaller display". It also makes sense to give users some control
>> over this for clone mode, e.g., when they give a presentation and
>> don't care if their laptops flat panel tears, but don't want tearing
>> on the presentation screen for the audience. E.g., one could prefer
>> the --primary output as defined by xrandr.
>>
>>>>   		nv_window_belongs_to_crtc(scrn, draw->x, draw->y,
>>>>   					  draw->width, draw->height);
>>>>   }
>>>> @@ -344,9 +342,40 @@ nouveau_dri2_schedule_swap(ClientPtr client,
>>>> DrawablePtr draw,
>>>>   			   CARD64 *target_msc, CARD64 divisor, CARD64 remainder,
>>>>   			   DRI2SwapEventPtr func, void *data)
>>>>   {
>>>> +	PixmapPtr dst_pix;
>>>> +	PixmapPtr src_pix = nouveau_dri2_buffer(src)->ppix;
>>>>   	struct nouveau_dri2_vblank_state *s;
>>>>   	CARD64 current_msc, expect_msc;
>>>> -	int ret;
>>>> +	int ret, flip = 0;
>>>> +	Bool front_updated;
>>>> +
>>>> +	/* Truncate to match kernel interfaces; means occasional overflow
>>>> +	 * misses, but that's generally not a big deal.
>>>> +	 */
>>>> +	*target_msc&= 0xffffffff;
>>>> +	divisor&= 0xffffffff;
>>>> +	remainder&= 0xffffffff;
>>>> +
>>> This doesn't really fix the problem with our 32bit counters wrapping
>>> around, but, as the comment says, it's not a big deal...
>>>
>>
>> Yes. Another item, get 64-bit counters and api for the kernel
>> drm. Mostly to make explicit that there is a 32-bit limit in place.
>>
>>>> +	/* Update frontbuffer pixmap and name: Could have changed due to
>>>> +	 * window (un)redirection as part of compositing.
>>>> +	 */
>>>> +	front_updated = update_front(draw, dst);
>>>> +
>>>> +	/* Assign frontbuffer pixmap, after update in update_front() */
>>>> +	dst_pix = nouveau_dri2_buffer(dst)->ppix;
>>>> +
>>>> +	/* Flips need to be submitted one frame before */
>>>> +	if (DRI2CanFlip(draw)&&  front_updated&&
>>>> +	    can_exchange(draw, dst_pix, src_pix)) {
>>>> +		flip = 1;
>>>> +	}
>>>> +
>>>> +	/* Correct target_msc by 'flip' if this is a page-flipped swap.
>>>> +	 * Do it early, so handling of different timing constraints
>>>> +	 * for divisor, remainder and msc vs. target_msc works.
>>>> +	 */
>>>> +	if (*target_msc>  0)
>>>> +		*target_msc -= (CARD64) flip;
>>>
>>> We don't need the code above, blits are submitted one frame before as
>>> well - the wait for the final vblank is done in hardware by the GPU
>>> itself, that way we don't have to worry about tearing caused by the
>>> GPU
>>> being too busy to finish all its previous work in time for the
>>> specified
>>> vblank interval.
>>>
>>
>> Oh ok, thanks. I have special measurement equipment here to test
>> pageflipped swaps for timing, but can't test the copyswap case
>> easily. My toolkit was complaining loudly about inconsistencies, so i
>> was just assuming it is due to the same logic as on other gpu's +
>> missing code in the ddx. If copy-swaps are intentionally scheduled
>> one frame ahead, then DRI2SwapComplete timestamps would need to be
>> corrected for that. Currently you get the puzzling result from the
>> timestamps that swaps complete before they were even scheduled by the
>> client, typically a clear indication of broken vsync support in the
>> driver.
>>
> Heh, yeah...
>

I will change the patch to remove the unneccessary bits and try if the 
DRI2SwapComplete timestamps for the copy-swap case can be "fixed" instead.

>> Do you know how this is done at the hardware level? Exactly as with
>> pageflips? The gpu programming seems to be the same in the ddx.
>
> Yes, we use the same synchronization mechanism for pageflips and blits.
>

Hm. Then would it be easily possible for the kms-driver to emit 
"pageflip completion" events for blits as well, e.g., when the drawing 
engine continues or the main x server channel submits the blit? That 
would be a simple and reliable way to timestamp blit-swaps on nouveau as 
well. I've come up with some sketchy ideas to do this on intel and ati, 
but didn't get around to test them so far. Their implementation will be 
quite a bit more involved.

>> Is the blip operation started at leading edge of the vblank interval?
>> Or anywhere inside the vblank interval (level triggered)? Are such
>> blits submitted on a separate fifo (or even dma engine?) in the gpu to
>> avoid stalling the rest of the command stream until vblank?
>
> It depends, right now we have two completely different implementations
> and we use one or the other depending on the card generation:
>
> On nv11-nv4x, we use the PGRAPH vsync methods (0x120-0x134), that means
> it's the drawing engine that waits. Basically you have a counter that's
> incremented by a CRTC of your choice when it reaches a scanline range of
> your choice, wrapping around at a configurable value; you can put the
> drawing engine to sleep until the counter reaches a given value. Right
> now we make it wait until somewhere between vdisplay-3 and vdisplay-1
> before going on with the swap.
>

Interesting, thanks for the explanation. Maybe that counter could also 
be used to implement a hardware vblank counter on pre-NV50? Currently 
the .get_vblank_counter hook is not correctly implemented in the 
nouveau-kms driver. It currently hooks up to drm_vblank_count(), i.e., 
it uses the value of the software drm counter which it is supposed to 
reinitialize from scratch with fresh and independent values from the 
hardware. At the moment this is basically a no-op and the drm will lose 
vblank counts whenever it disables vblank irq's for power saving.

I wanted to prepare a patch for this. For NV-50 there is a hardware 
vblank counter. For earlier cards i couldn't find one, last time i 
searched six month ago?

>  From nv5x on, we use PFIFO semaphores to suspend the execution of the
> channel (right now the main X server channel but this could be changed)
> until a pre-allocated memory location gets a given value, which is
> written there manually by the PDISPLAY vblank interrupt handler. I'm not
> sure when exactly this IRQ happens, most likely it can be configured,
> but I have reasons to believe that in some set-ups it happens at the
> end of the vblank period causing the tearing I've seen a few times.
>

I've observed something similar on my QuadroFX-570 here with pageflips 
as well. The kms-pageflip seems to always happen in scanline 5 of the 
active scanout, instead of inside the vblank. Either that, or there's 
some funny delay due to some additional buffering in the gpu between 
crtc and output port?

Thanks,
-mario
