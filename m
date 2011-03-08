From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CCACHE and VFETCH FAULTs causing lockups
Date: Tue, 8 Mar 2011 22:44:33 +0000
Message-ID: <AANLkTim2iO=GeWSYhvMuzswk7tjwOBMzBkcya3DW=Cb6@mail.gmail.com>
References: <AANLkTik0CkbQz=PoXNG7bQEn_5ssAfp7cr=Z=3qJz6h2@mail.gmail.com>
	<1299016269.1822.3.camel@nisroch>
	<AANLkTimiy=U04vfiXRAqDj_eT+zxSN2_3NvmF4jRQWxc@mail.gmail.com>
	<65DF9FD4-DDE0-4BA3-950A-422A3F1EF9DA@gmail.com>
	<AANLkTi=7YDLL8N=15ktHE3oYB2LMkm2WQ6y20+-gfmT_@mail.gmail.com>
	<62F49887-5C29-4DFD-9166-3BB6AD0E23F1@gmail.com>
	<AANLkTi=jNcm+868ppNTGA+6ufqi7muctHxMnpzj9J-k8@mail.gmail.com>
	<1299536569.29441.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1299536569.29441.1.camel@nisroch>
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

On Mon, Mar 7, 2011 at 10:22 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, 2011-03-07 at 21:51 +0000, Maarten Maathuis wrote:
>> On Sun, Mar 6, 2011 at 2:24 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >
>> >
>> > Sent from my iPhone
>> >
>> > On 07/03/2011, at 0:03, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >
>> >> On Sun, Mar 6, 2011 at 1:44 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >>> Sorry for the top posting, it's late and typing from my phone in bed=
 lol.
>> >>>
>> >>> Just wanted to see if you had an update? And, this is NV86 I guess?
>> >>>
>> >>> Ben.
>> >>>
>> >>> Sent from my iPhone
>> >>>
>> >>> On 02/03/2011, at 8:20, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>> >>>
>> >>>> On Tue, Mar 1, 2011 at 9:51 PM, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
>> >>>>> On Tue, 2011-03-01 at 21:08 +0000, Maarten Maathuis wrote:
>> >>>>>
>> >>>>>> Those come after 15-30 minutes of running warzone2100, i haven't
>> >>>>>> played any games for a while, so no idea how long this has been g=
oing
>> >>>>>> on.
>> >>>>>> I also got a TRAP_CCACHE on channel 2 a little while ago, it takes
>> >>>>>> much longer to trigger (a few hours). I'm using todays "nouveau
>> >>>>>> kernel" git.
>> >>>>> You're not the first person to have reported this fwiw, personally=
, I
>> >>>>> haven't seen it yet..
>> >>>>>
>> >>>>>>
>> >>>>>> I'm guessing something is being unmapped too early or without rea=
son,
>> >>>>>> or some cache is stale. But it isn't obvious what exactly it is.
>> >>>>>>
>> >>>>>> Because i don't remember having these lockups before I'm inclined=
 to
>> >>>>>> guess that this commit is involved
>> >>>>>> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=3D6330d8=
f5ecc4a19fd2ad3c7fa128b2f4c2ce3360
>> >>>>>>
>> >>>>>> Any ideas?
>> >>>>> Not really. =A0If this commit *is* the cause, the problem is still
>> >>>>> somewhere else. =A0That commit just makes sure PTEs are marked inv=
alid, so
>> >>>>> if it's causing your faults, then previously the GPU would still h=
ave
>> >>>>> been reading/writing invalid data.
>> >>>>>
>> >>>>> Plus, I expect you should probably have seen a VM fault..
>> >>>>
>> >>>> So these faults are just generic errors? Unrelated to page faults?
>> >>>>
>> >>>>>
>> >>>>> Ben.
>> >>>>>>
>> >>>>>> Maarten.
>> >>>>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>> --
>> >>>> Far away from the primal instinct, the song seems to fade away, the
>> >>>> river get wider between your thoughts and the things we do and say.
>> >>>> _______________________________________________
>> >>>> Nouveau mailing list
>> >>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> >>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>> >>>
>> >>
>> >> No this is NV96. The revert definitely helps, but no luck so far in
>> >> finding a plausible cause for the problem.
>> > Hey,
>> >
>> > Ok. Hmm. I thought you had NV86 for some reason! It's a long shot and =
I'm not entirely convinced it'll help at all, but can you switch graph.tlb_=
flush pointer to the nv86 version and see if anything changes?
>>
>> I used to have a NV86, but it died more than a year ago in the typical
>> way for that generation of card, due to thermal issues I guess (it was
>> a passively cooled card). I haven't tried using the nv86 tlb flush,
>> out of curiosity, is this something nvidia does (a lot) on nv86?
> Yes, NVIDIA do it on pretty much every card I've looked at traces for,
> we've never seen any need for other chipsets as of yet however.
> Originally, it looked like NVIDIA did this on all pre-NVA3 cards, but, a
> trace of my T510 with recent drivers show that they do it on NVA3+ now
> too.
>
>>
>> >
>> > The *other* possible thing is that the ttm delayed delete queue is cau=
sing multiple tlb flushes to happen at the same time. =A0I'll add locking f=
or that in the morning, that was a complete oversight.
>>
>> I've had no lockups since you added the spinlocks, so maybe that was
>> it. Time will tell.
> *crosses fingers*
>
> Ben.
>>
>> >
>> > Ben.
>> >
>> >>
>> >> --
>> >> Far away from the primal instinct, the song seems to fade away, the
>> >> river get wider between your thoughts and the things we do and say.
>> >
>>
>>
>>
>
>
>

It went alright for quite some time (much longer than before), but i
got another one. I should note this happened at the exact moment X
rendered something over my fullscreen opengl app. So it does smell a
bit fishy. I'll have a look myself at possible causes again.

Mar  8 23:30:58 madman kernel: [25325.644794] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE FAULT
Mar  8 23:30:58 madman kernel: [25325.644815] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE 00000080 00000000 00000000 00000000
00000000 00000004 00000000
Mar  8 23:30:58 madman kernel: [25325.644829] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_MP - TP1: Unhandled ustatus 0x00020000
Mar  8 23:30:58 madman kernel: [25325.644836] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP
Mar  8 23:30:58 madman kernel: [25325.644848] [drm] nouveau
0000:01:00.0: PGRAPH - ch 2 (0x0000840000) subc 5 class 0x8297 mthd
0x0f04 data 0x00000000
Mar  8 23:30:58 madman kernel: [25325.644865] [drm] nouveau
0000:01:00.0: VM: trapped read at 0x002000f000 on ch 2 [0x00000840]
PFIFO/PFIFO_READ/SEMAPHORE reason: DMAOBJ_LIMIT

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
