From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3] dri2: Implement handling of pageflip
	completion events.
Date: Wed, 21 Sep 2011 02:08:46 +0200
Message-ID: <87d3eupxip.fsf@riseup.net>
References: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1314984801-12029-2-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<871uvsvund.fsf@riseup.net>
	<F6AA723B-2F62-4FD7-8D1D-2A08BAEDFF51@tuebingen.mpg.de>
	<8762l1toi2.fsf@riseup.net> <4E769632.9010201@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0693869596=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4E769632.9010201-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> (Mario Kleiner's message of
	"Mon, 19 Sep 2011 03:09:06 +0200")
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

--===============0693869596==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> writes:

> On 09/09/2011 11:05 PM, Francisco Jerez wrote:
>> Mario Kleiner<mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>  writes:
>>
>>>[...]
>>>
>>> Hi, thanks for the comments.
>>
>> Thank you for looking into this :)
>>>
>
> Sorry for the late reply. I'm a bit slow at the moment.
>
No worries, right now I have my mind somewhere else as well...

>>> I see your point, but at least as a starting point for the first
>>> iteration i don't think the current dri2 implementation of pageflips
>>> was a dumb decision.
>>>
>>> It is the same default "double buffer" behaviour that the binary
>>> drivers on Linux and also on other os'es (OS/X and Windows) expose.
>>
>> Not the nvidia one, last time I checked.
>>
>
> It doesn't neccessarily block glXXX drawing command submission, but it
> doesn't do triple-buffering by default. It blocks rendering until swap
> completion, probably just queueing up drawing commands internally.
>
I didn't mean it does (real) triple-buffering, but rather that it
doesn't block command submission to the new back buffer after
glXSwapBuffers() is called (which for most practical purposes gives a
similar effect to triple-buffering where the command buffer acts as
third buffer).

> Here is how my toolkit waits for swap completion with the binary blob
> on linux, os/x and windows:
>
> 1. glXSwapBuffers() (aka SwapBuffers() on Windows aka
> CGLFlushDrawable()) on OS/X).
>
> 2. glBegin(GL_POINTS); glVertex2i(10,10); glEnd();
> 3. glFinish();
> 4. Read clock, scanout position etc. compute swap completion
> timestamp.
>
> On any tested binary NVidia, ATI or Intel drivers on any tested
> Windows, OS/X or Linux version this blocks in glFinish() until swap
> completion, at least for page-flipped fullscreen swaps if the optional
> "triple buffering" option is not selected in the driver control
> panel. This method is successfully tested on multiple ten thousand
> users setups over at least the last six years.
>
> So glFinish() waits for draw completion and drawing apparently waits
> for swap completion - strictly double-buffered with the drivers
> default settings. Or at least the observable behaviour of the drivers
> is consistent with this assumption.
>
AFAICT you'd still get the same effect even if it were using something
different to double-buffering.

>>[...]
>> With the current implementation (and IIRC it's the same on both
>> radeon
>> and intel) the divisor/remainder relation is ignored in the case
>> where
>> the gpu is too busy to finish its rendering in time for the predicted
>> MSC; the flip is carried out as soon as the GPU finishes, possibly a
>> few
>> vblank periods later.
>>
>> To fix this properly in nouveau, I think it would be good to push the
>> divisor/remainder calculation down to the kernel (second reason so
>> far
>> to extend the kernel interface), but once it's done we'll get the
>> divisor/remainder relation right no matter if multibuffering is being
>> used or not.
>>
>
> Agreed on that. The current fix only fixes the easy case where the
> client submits a swap request too late to satisfy the
> divisor/remainder relation, or where the relation is easily
> satisfiable. E.g., my toolkit uses it to make sure that a swap happens
> after a user specified deadline, but only on, e.g., odd numbered video
> refresh cycles, for the purpose of getting frame-sequential stereo
> right.
>
> None of the current ddx handles the case where the backbuffer is still
> busy at the target vblank.
>
> Imho there are a couple of things a pageflip ioctl() v2 should
> provide:
>
> * Some support for frame-sequential stereo.
> * 64 bit target_msc.
> * Divisor/remainder in kernel.
>
Personally I'd like a more stupid pageflip IOCTL instead of a smarter
one... We could split the sync-to-vblank functionality into a different,
orthogonal IOCTL that:
 * takes a GEM object, a CRTC number, and a sync
   target/divisor/remainder.
 * makes sure that any further references (including command submission
   and page-flipping) to the given GEM object are synchronized to the
   given CRTC according to the given sync parameters.
 * optionally sends an event back to userspace once the
   sync target is reached.

This would get us a standard interface for:
 * Standard page-flipping respecting the divisor/remainder relation.
 * Tear-free multihead flipping (if done correctly).
 * Tear-free blitting with completion notification.
 * Tearful but fast non-vsync'ed pageflip.

>
>>[...]
>> IMHO getting a small (and required) fix (the swaplimit API) into one
>> software component is more advisable from the maintainership
>> standpoint
>> than putting in place two different codepaths in another software
>> component, both of which are broken in its own way.
>>
>
> I totally agree with you. But assume we finally manage to persuade
> Keith to integrate that API into 1.12, it would still be nice - at
> least for my users - if the nouveau ddx could optionally support a
> double-buffered mode with correct timestamps on current servers, e.g.,
> 1.9 - 1.11.
>
> I think the proposed patch should work for n-buffering on future
> servers with a swaplimit api, and for double-buffering with correct
> timestamping on current servers. For triple buffering on current
> servers it would be simple to add your current implementation back as
> a special case with only a few lines of code: Just don't request
> pageflip completion events from the kernel, so the whole pageflip
> callback gets skipped, and call DRI2SwapComplete() directly, as in the
> current ddx.
>
I don't think that the current n-buffering path will be necessary
anymore if the swaplimit patch is accepted - If anyone complains about a
performance regression on old X servers we can always tell him to turn
pageflip off.

> I think a x-org.conf option for selecting double-buffering /
> triple-buffering / n-buffering will be needed anyway, even with a
> swaplimit api in place, so we could add it now and use it to switch
> between double-buffering and n-buffering.
>
Yeah, we could add an integer option to let the user choose a swap
limit, but, keep in mind that settings different to "2" are very likely
to be useless for most people.

> I'm not really sure what Keith remaining objections to Paul's imho
> rather small, simple and well reviewed swaplimit api patch are, or if
> we just have some kind of miscommunication about what specific patch
> we were talking about. I will try to look at it again next week.
>
It seems he's been especially busy in the last few weeks...

> thanks,
> -mario
>[...]

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk55Kw4ACgkQg5k4nX1Sv1v18wEAjKiM/+QTte5YpQYUWObrouAU
SE9CyT4VgPyDgwQGr8sA/jIF4M/gU1okG3ifqg8F/vWt9IJM3QGz7rgff1OnLKgl
=5WHg
-----END PGP SIGNATURE-----
--==-=-=--

--===============0693869596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0693869596==--
