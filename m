From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: low memory
Date: Sat, 12 Dec 2009 01:04:53 +0100
Message-ID: <6d4bc9fc0912111604oca0be3dm7f001bb05e85084@mail.gmail.com>
References: <91752840912111111q222602f8g87b1727c24bd06ba@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752840912111111q222602f8g87b1727c24bd06ba-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Dec 11, 2009 at 8:11 PM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Dec 11, 2009 at 1:30 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, 2009-12-11 at 13:23 +0100, Anders Eriksson wrote:
>>> skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org said:
>>> > It'd be useful to know of any cases out there where UMS is being used=
 because
>>> > KMS is failing, there's a couple of cases on RH bugzilla, but I don't=
 recall
>>> > the details right now.
>>>
>>> Try this one.
>>>
>>> https://bugs.freedesktop.org/show_bug.cgi?id=3D24810
>>>
>>> It used to work, but something changed which forced me back to UMS.
>> It's not a solution by any means, but try:
>>
>> =A0Option "EXAPixmaps" "false"
>>
>> In your xorg.conf. =A0There'll be more work done to help the situation on
>> low-mem cards.
>>
>
> Ah that is interesting, so this can workaround the problem on my nv25
> that cannot render too big pictures in firefox. (my test case is a
> single picture : 3782x2592 resized to 550x368)
>
> So about that, I must mention the different behavior I got, in
> chronological order :
> 1) old ddx (10/01) : X instant crash
> 2) newer ddx, after all the "handle reloc failures" patches : picture
> is not displayed, just a black area instead. *much* better :)
> 3) after upgrading kernel/drm from 12/08 - 2.6.32-rc6 to 12/11 -
> 2.6.32 : X locks up.
> I don't even see the usual message in dmesg ([TTM] Out of aperture
> space or DRM memory quota.)
> The gpu or at least nouveau drm is in a bad state and I must reboot to co=
ver.
>
> Any clues about that last behavior ? I am not sure how
> practical/possible regression testing will be since it seems to have
> been caused by the last merge. I will open a bug report thats better.
>
> Finally I am curious about what work will be done to help :)
> If I got it right (and I probably did not) :
> exapixmaps true -> always use videoram for pixmaps
> exapixmaps false -> never use videoram for pixmaps

It switches between a classic exa implementation which is used to
working with a fixed amount of vram, but will never cooperate with
dri2. The default is a "mixed" exa implementation that does work with
dri2. Both are accelerated for 2d purposes.

> And so the solution would be something in between, like dynamically
> choose whether to use vram or not, depending on the pixmap size and
> the free vram ?
> And how hard is that ?
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
