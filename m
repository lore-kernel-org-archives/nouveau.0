From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: IMPORTANT : Regression since kernel > 3.4 as regards
 suspend to RAM while using 3D accel
Date: Sun, 30 Jun 2013 14:16:49 -0400
Message-ID: <CAKb7Uvjiuf5HT4tbiWSQPmEXUcHdNpmM5ycP+etkPv_jrZXb7g@mail.gmail.com>
References: <CA+T9nP8sBKxafn0szfpDcfudvJvMTsEvCL8eYzcV+EfYfX+3rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CA+T9nP8sBKxafn0szfpDcfudvJvMTsEvCL8eYzcV+EfYfX+3rQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Eric F <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jun 30, 2013 at 1:42 PM, Eric F <3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> Been wondering why I could never resume from s2r. That's because I always
> use 3D accel (compiz, cairo-dock). I have tested each Arch kernel releases,
> hoping each time to get s2r to work.
>
> Tired of this, I decided to use 3.4 LTS... 3.4.50
> ... And guess what ? I could resume from suspend to RAM 100% of the time !!!
>
> I know it may be a hard work for you, but suspend to RAM while using 3D
> accel only works with this kernel (and maybe 3.4.51, will give a try).
>
> Suspend to RAM is important for battery saving for laptops.
> I use GT555M nvc3.

It appears that some of the information was left out above from an
investigation session we had over IRC.

Resume actually works fine (from a strict kernel standpoint). However
some (all?) of the channels that were active at the time of the
suspend are now hung, and there are "failing to idle channel" messages
for compiz and cairo-dock when X is killed (and X has the appearance
of being hung, since compiz has hung): http://ix.io/6qt (hm, also note
that the channel values are identical for compiz and cairo-dock, not
sure if that's expected). If compiz and cairo-dock aren't running,
then the resume works fine.

It seems like some fence work went into v3.5 (e.g.
5e120f6e4b3f35b741c5445dfc755f50128c3c44, others), which could be
related. Other invasive changes like
c420b2dc8dc3cdd507214f4df5c5f96f08812cbe which affect FIFO handling
could be related as well.

My guess is that some semaphore write never happens, and the channels
are forever stuck waiting for some semaphore.

  -ilia
