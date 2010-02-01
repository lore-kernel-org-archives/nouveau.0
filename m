From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/nouveau: add lockless dynamic
	semaphore allocator
Date: Mon, 1 Feb 2010 14:27:53 +0100
Message-ID: <ff13bc9a1002010527n5812d30fj8555a940aeba179f@mail.gmail.com>
References: <1265017810-13354-1-git-send-email-luca@luca-barbieri.com>
	<1265017810-13354-2-git-send-email-luca@luca-barbieri.com>
	<87bpg9w1w8.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87bpg9w1w8.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> How often do we expect cross-channel sync to kick in? Maybe 2-3 times
> per frame? I suspect contentions will be rare enough to make spinlocks
> as fast as atomics for all real-life cases, and they don't have such a
> high maintainability cost. What do you guys think?

For the case of a single (or a few) GL application the requirements
are indeed modest.

I'm not sure that spinlocks or an otherwise reduced solution would be
much simpler.
You basically would just avoid the retrying code.

Also if you have a multithreaded/multiprocess GPGPU application on
large SMP machine things may change, as you may have a lot of commands
and semaphores in flight, as well as high contention for anything
global.

Of course, currently we hold both the BKL and struct_mutex around
things, which makes it all moot, but hopefully we'll switch to
per-channel mutexes soon (I'm looking into that).
