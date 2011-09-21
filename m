From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] dri2: Fixes to swap scheduling,
	especially for copy-swaps.
Date: Wed, 21 Sep 2011 02:11:36 +0200
Message-ID: <878vpipxdz.fsf@riseup.net>
References: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1314984801-12029-4-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<87wrdkufec.fsf@riseup.net>
	<103D9770-D3B1-4E14-A177-645C19798057@tuebingen.mpg.de>
	<8739g5to4b.fsf@riseup.net> <4E76A349.70103@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2089553994=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4E76A349.70103-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> (Mario Kleiner's message of
	"Mon, 19 Sep 2011 04:04:57 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2089553994==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> writes:

> On 09/09/2011 11:14 PM, Francisco Jerez wrote:
>> Mario Kleiner<mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>  writes:
>>
>>>[...]
>>> But the current implementation under a compositor is not great. You
>>> get glxgears reporting that "vsync is on and the redraw rate should
>>> equal the refresh rate" but see 2900 fps reported on a 60 Hz display,
>>> with apparently 60 Hz animation. And, in my use case, toolkits that
>>> care about timing and do some consistency checks on their swapbuffers
>>> execution bail out immediately, telling you to fix your "totally
>>> broken graphics driver setup".
>>>
>>> It's a pure "better than nothing" change for the redirected case,
>>> which seems to behave less confusing, at least as no fancy
>>> transformations are used, e.g., during desktop transitions.
>>>
>> OK, fair enough.
>>
>
> So, you're ok with that "better than nothing" change?
>
Yeah, but it probably deserves its own separate patch.

>>>[...]
>>> Oh ok, thanks. I have special measurement equipment here to test
>>> pageflipped swaps for timing, but can't test the copyswap case
>>> easily. My toolkit was complaining loudly about inconsistencies, so i
>>> was just assuming it is due to the same logic as on other gpu's +
>>> missing code in the ddx. If copy-swaps are intentionally scheduled
>>> one frame ahead, then DRI2SwapComplete timestamps would need to be
>>> corrected for that. Currently you get the puzzling result from the
>>> timestamps that swaps complete before they were even scheduled by the
>>> client, typically a clear indication of broken vsync support in the
>>> driver.
>>>
>> Heh, yeah...
>>
>
> I will change the patch to remove the unneccessary bits and try if the
> DRI2SwapComplete timestamps for the copy-swap case can be "fixed"
> instead.
>
We should probably fix the kernel interface for that, instead of adding
more band-aids to userspace.

>>> Do you know how this is done at the hardware level? Exactly as with
>>> pageflips? The gpu programming seems to be the same in the ddx.
>>
>> Yes, we use the same synchronization mechanism for pageflips and blits.
>>
>
> Hm. Then would it be easily possible for the kms-driver to emit
> "pageflip completion" events for blits as well, e.g., when the drawing
> engine continues or the main x server channel submits the blit? That
> would be a simple and reliable way to timestamp blit-swaps on nouveau
> as well. I've come up with some sketchy ideas to do this on intel and
> ati, but didn't get around to test them so far. Their implementation
> will be quite a bit more involved.
>
Yes, the implementation would be exactly the same as what we use to get
pageflip completion events, we're just missing the interface to expose
it to the user.

>>> Is the blip operation started at leading edge of the vblank interval?
>>> Or anywhere inside the vblank interval (level triggered)? Are such
>>> blits submitted on a separate fifo (or even dma engine?) in the gpu to
>>> avoid stalling the rest of the command stream until vblank?
>>
>> It depends, right now we have two completely different implementations
>> and we use one or the other depending on the card generation:
>>
>> On nv11-nv4x, we use the PGRAPH vsync methods (0x120-0x134), that means
>> it's the drawing engine that waits. Basically you have a counter that's
>> incremented by a CRTC of your choice when it reaches a scanline range of
>> your choice, wrapping around at a configurable value; you can put the
>> drawing engine to sleep until the counter reaches a given value. Right
>> now we make it wait until somewhere between vdisplay-3 and vdisplay-1
>> before going on with the swap.
>>
>
> Interesting, thanks for the explanation. Maybe that counter could also
> be used to implement a hardware vblank counter on pre-NV50? Currently
> the .get_vblank_counter hook is not correctly implemented in the
> nouveau-kms driver. It currently hooks up to drm_vblank_count(), i.e.,
> it uses the value of the software drm counter which it is supposed to
> reinitialize from scratch with fresh and independent values from the
> hardware. At the moment this is basically a no-op and the drm will
> lose vblank counts whenever it disables vblank irq's for power saving.
>
> I wanted to prepare a patch for this. For NV-50 there is a hardware
> vblank counter. For earlier cards i couldn't find one, last time i
> searched six month ago?
>
I'm almost certain that you couldn't because there isn't one...

>>  From nv5x on, we use PFIFO semaphores to suspend the execution of the
>> channel (right now the main X server channel but this could be changed)
>> until a pre-allocated memory location gets a given value, which is
>> written there manually by the PDISPLAY vblank interrupt handler. I'm not
>> sure when exactly this IRQ happens, most likely it can be configured,
>> but I have reasons to believe that in some set-ups it happens at the
>> end of the vblank period causing the tearing I've seen a few times.
>>
>
> I've observed something similar on my QuadroFX-570 here with pageflips
> as well. The kms-pageflip seems to always happen in scanline 5 of the
> active scanout, instead of inside the vblank. Either that, or there's
> some funny delay due to some additional buffering in the gpu between
> crtc and output port?
>
I'd say the former, but I may be wrong.

> Thanks,
> -mario

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF0EAREIAAYFAk55K7gACgkQg5k4nX1Sv1tgxgD/dm8CDkL1f7ckGfUbOvmudSWF
TNZ7uZ76ycyywIi7lbsA92YvM8OnhUplOc7k4Y+U3z1IFZh6yFqRkwHRD4tApp4=
=ouFS
-----END PGP SIGNATURE-----
--==-=-=--

--===============2089553994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2089553994==--
