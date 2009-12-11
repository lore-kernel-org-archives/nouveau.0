From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: low memory
Date: Fri, 11 Dec 2009 20:11:00 +0100
Message-ID: <91752840912111111q222602f8g87b1727c24bd06ba@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Dec 11, 2009 at 1:30 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, 2009-12-11 at 13:23 +0100, Anders Eriksson wrote:
>> skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org said:
>> > It'd be useful to know of any cases out there where UMS is being used =
because
>> > KMS is failing, there's a couple of cases on RH bugzilla, but I don't =
recall
>> > the details right now.
>>
>> Try this one.
>>
>> https://bugs.freedesktop.org/show_bug.cgi?id=3D24810
>>
>> It used to work, but something changed which forced me back to UMS.
> It's not a solution by any means, but try:
>
> =A0Option "EXAPixmaps" "false"
>
> In your xorg.conf. =A0There'll be more work done to help the situation on
> low-mem cards.
>

Ah that is interesting, so this can workaround the problem on my nv25
that cannot render too big pictures in firefox. (my test case is a
single picture : 3782x2592 resized to 550x368)

So about that, I must mention the different behavior I got, in
chronological order :
1) old ddx (10/01) : X instant crash
2) newer ddx, after all the "handle reloc failures" patches : picture
is not displayed, just a black area instead. *much* better :)
3) after upgrading kernel/drm from 12/08 - 2.6.32-rc6 to 12/11 -
2.6.32 : X locks up.
I don't even see the usual message in dmesg ([TTM] Out of aperture
space or DRM memory quota.)
The gpu or at least nouveau drm is in a bad state and I must reboot to cove=
r.

Any clues about that last behavior ? I am not sure how
practical/possible regression testing will be since it seems to have
been caused by the last merge. I will open a bug report thats better.

Finally I am curious about what work will be done to help :)
If I got it right (and I probably did not) :
exapixmaps true -> always use videoram for pixmaps
exapixmaps false -> never use videoram for pixmaps
And so the solution would be something in between, like dynamically
choose whether to use vram or not, depending on the pixmap size and
the free vram ?
And how hard is that ?
