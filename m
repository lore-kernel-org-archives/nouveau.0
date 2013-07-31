From: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 2/2] xv: speed up YV12 -> NV12 conversion
	using SSE2 if available
Date: Wed, 31 Jul 2013 19:28:35 +0200
Message-ID: <87zjt2iqpo.fsf@turtle.gmx.de>
References: <1375080039-22607-1-git-send-email-imirkin@alum.mit.edu>
	<1375080039-22607-2-git-send-email-imirkin@alum.mit.edu>
	<877gg6k5ur.fsf@turtle.gmx.de>
	<CAKb7Uvi-nVtxhENZnwm6kbRaOW-a_Gv5D_v6Ex1CuyJWTE5aUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi-nVtxhENZnwm6kbRaOW-a_Gv5D_v6Ex1CuyJWTE5aUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Ilia Mirkin's message of "Wed, 31 Jul 2013 13:18:31 -0400")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Ben Skeggs <public-bskeggs-H+wXaHxf7aLQT0dZR+AlfA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, public-nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, Ilia Mirkin <public-imirkin-FrUbXkNCsVf2fBVCVOL8/A@plane.gmane.org>
List-Id: nouveau.vger.kernel.org



On 2013-07-31 19:18 +0200, Ilia Mirkin wrote:

> On Wed, Jul 31, 2013 at 1:16 PM, Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org> wrote:
>>
>> Unfortunately, immintrin.h is not available on most architectures,
>> leading to build failures as can be seen on
>> https://buildd.debian.org/status/package.php?p=xserver-xorg-video-nouveau.
>
> Sorry :( I thought that immintrin.h would be available everywhere and
> just end up empty since none of the __SSE*__ would be defined. I was
> wrong.
>
>>
>> Any ideas?
>
> A fix is checked into master already:
> http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=1df177f35a05db505577cdc929e63fde906a704b

Ah, good to hear and sorry that I didn't check myself.  I'll merge that
commit into the Debian package.

Cheers,
       Sven
