From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Synchronization mostly missing?
Date: Mon, 28 Dec 2009 14:33:09 +0100
Message-ID: <878wcnmdey.fsf@riseup.net>
References: <ff13bc9a0912271941s5d465634te43213ea9df1d14f@mail.gmail.com>
	<87d41zn20v.fsf@riseup.net>
	<ff13bc9a0912272255n13e3ab3wf1c126b0341045e2@mail.gmail.com>
	<586c2acd0912272315o4e2858b5gffd76b24ad741ee9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0432002878=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0912272315o4e2858b5gffd76b24ad741ee9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Younes Manton's message of "Mon, 28 Dec 2009 02:15:51 -0500")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0432002878==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Mon, Dec 28, 2009 at 1:55 AM, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> wrote:
>>> Can you reproduce this with your vertex buffers in VRAM instead of GART?
>>> (to rule out that it's a fencing issue).
>>
>> Putting the vertex buffers in VRAM makes things almost perfect, but
>> still with rare artifacts.
>> In particular, the yellow arrow in dinoshade sometimes becames a
>> yellow polygon on the floor, which happens almost every frame if I
>> move the window around.
>> It does fix demos/engine, blender and etracer is almost perfect.
>>
>> Using my sync patch fixes demos/engine and demos/dinoshade, but still
>> leaves artifacts in blender when moving the rectangle and artifacts in
>> etracer.
>>
>> Putting the vertex buffers in VRAM _AND_ adding my sync patch makes
>> things perfect on my system.
>>
>> Using sync + a delay loop before drawing makes things better but still
>> problematic.
>>
>> Also note that both adding wbinvd in the kernel at the start of push
>> buffer submission, running with "nopat" and synchronizing with the
>> current fence in the kernel had no effect on demos/engine artifacts.
>>

To stay on the safe side, you should flush both before and after writing
your vertex buffers (e.g. both at CPU_PREP and FINI).

>> Preventing loading of intel_agp did not seem to have any effect either
>> (but strangely, it still listed the aperture size, not sure what's up
>> there).
>>

Some intel AGP chipsets are known to contain an evil write cache, adding
drm_agp_chipset_flush() calls at random places in the kernel is
something else you could try.

>> The last test I tried was, all together:
>> 1. My nv40_sync patch
>> 2. 3 wbinvd followed by spinning 10000 times in the kernel at the
>> start of pushbuffer validation
>> 3. Adding
>> BEGIN_RING(curie, NV40TCL_VTX_CACHE_INVALIDATE, 1);
>> OUT_RING(0);
>> before and after draw_elements and draw_arrays
>> 4. Removing intel_agp
>>
>> The logo on etracer's splash screen still, on some frames, flickered.
>> Only putting vertex buffers in VRAM fixed that.
>>
>> I'm not really sure what is happening there.
>>
>> It seems that there is the lack of synchronization plus some other problem.
>>
>> Maybe there is indeed an on-GPU cache for AGP/PCI memory which isn't
>> getting flushed.
>> Maybe NV40TCL_VTX_CACHE_INVALIDATE should be used but not in the way I did.
>> I couldn't find it in renouveau traces, who did reverse engineer that?
>> What does that do?
>>
>> Also, what happens when I remove intel_agp? Does it use PCI DMA?
>>
>> BTW, it seems to me that adding the fencing mechanism I described is
>> necessary even if the vertices are read before the FIFO continues,
>> since rendering is not completed and currently I don't see anything
>> preventing TTM from, for instance, evicting the render buffer while it
>> is being rendered to.
>
> It's my understanding that once the FIFO get reg is past a certain
> point all previous commands are guaranteed to be finished, which is
> what our fencing is based on. I think we would all have corruption
> issues if this wasn't the case. You can see that the FIFO get ptr
> stops advancing after long running draw commands are submitted, and
> the video decoder FIFO works similarly as well when the HW is lagging.
>

Yeah, really, if PFIFO wasn't waiting for PGRAPH to finish its task
before putting in the next command, your X server wouldn't stand a
single minute alive. A fencing implementation based on notifiers or
DMA_FENCEs is likely to exhibit the same corruption.

> Anyhow, another person with a GF7 had the same problem and putting
> vertex buffers in VRAM also improved things for him, so it could be a
> hardware bug/quirk for some/all GF7s. We don't do it in general
> because it's slower, but as a temporary workaround we can do that for
> GF7 NV40s I guess. It likely also doesn't happen with immediate mode
> vertex submission, which will be implemented sooner or later. I can't
> reproduce it on my GF6 and I don't think anyone else has either.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAks4s5UACgkQ196Zy2qEI5f7FQCcDk3AdLSMZTiW43AoRKO0m+2/
nDUAn37eOtZUgd8Lv0f+1/qdQNK78SHf
=Xhow
-----END PGP SIGNATURE-----
--==-=-=--

--===============0432002878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0432002878==--
