From: "Renato Caldas" <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: unable to compile xf86-video-nouveau
Date: Wed, 9 Jul 2008 11:51:27 +0100
Message-ID: <1caff7430807090351w4337cae6rf5e873ced1a31eaf@mail.gmail.com>
References: <200807082243.12120.rjgleits@bellsouth.net>
	<1caff7430807090333t571925c5wf0ea4cbef105bbff@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1caff7430807090333t571925c5wf0ea4cbef105bbff-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Jul 9, 2008 at 11:33 AM, Renato Caldas
<seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jul 9, 2008 at 3:43 AM, Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> wrote:
>> Greetings,
>>
>> After the modesetting commit, I have been unable to compile
>> xf86-video-nouveau. The git site for drm given on the wiki page does not get
>> the proper xf86drmMode.h, etc. I noted that libdrm git has over 100 branches
>> and I really don't want to try all of them. Fedora 9 has a patch of the
>> libdrm source rpm that includes an earlier version of xf86drmMode.h but it's
>> now out of date. I would like to follow along in the development of nouveau
>> as I have a GeForce 6800 GTO.
>> Your kind help would be appreciated.
>
> You're probably using a modesetting drm branch. The easy solution is
> to switch to the plain drm branch.
>
> If you really want to stick to the drm modesetting branch then you
> AFAICT need git xorg, or some workarounds that make it compile for
> non-git xorg.
>
> Patch attached, but note that this is only a workaround. You can
> commit it to your local nouveau repo and then git-rebase it after
> git-fetching (I hope you know how to do that ;) .

Ah, the problem is a different one, and just realized it was there.
You need to stick to plain drm for now. Some changes were made to it
that are still not part of the modesetting branch.

Cheers,
 Renato

> Good luck,
>  Renato Caldas
>
>> Best Wishes,
>>
>> Bob Gleitsmann
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>
