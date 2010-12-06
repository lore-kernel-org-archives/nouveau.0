From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Sun, 5 Dec 2010 16:12:31 -0900
Message-ID: <20101206011231.GC4122@localhost2.local>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101205133804.5430594f@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101205133804.5430594f-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 05, 2010 at 01:38:04PM +0200, Pekka Paalanen wrote:
>On Sat, 4 Dec 2010 22:02:34 -0900
>Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Wow. This is a fluke.  I got around to the recommendation of installing the
>> latest kernel snapshot (2.6.37*), but ended up rebooting using 2.6.35 after
>> apparently recompiling nouveau-drm out of kernel driver package.
>
>Does this mean you never got the very latest git kernel modules running?
>Unfortunately, problems with earlier versions are easily disregarded as
>ancient, especially from 2.6.36 and earlier vanilla kernels.

I did pull =sys-kernel/vanilla-sources-2.6.37_rc3 from within Gentoo, but then
for some reason, make install either didn't work or wasn't issued and on reboot
I found things working, but when I did a uname -a, found I was still running
2.6.35. lol

>
>> [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 0
>
>That is a bad problem, which...
>
>> [drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon
>
>...forces the GPU unusable. No acceleration whatsoever. The
>problem may or may not have been fixed in the latest git. I assume
>this log is from 2.6.35, is it not?

Ok. This makes sense as to why I'm seening no accel on my other devices as
well.

>> fb0: nouveaufb frame buffer device
>> [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
>
>When you provide kernel logs, please, do not filter them. Nouveau
>possibly interacts with lots of other drivers.

Sorry, trying to keep things brief, but I understand.

And sorry I didn't see your email until after posting, not getting your replies
via the list address, but by my email address.  Working on P3 750 (and slower) boxes
are quite slow here, so it's going to take me some time to further trouble shoot
things here.  Not too mention, I'm even slower.

-- 
Roger
http://rogerx.freeshell.org/
