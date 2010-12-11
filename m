From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Fri, 10 Dec 2010 22:57:48 -0900
Message-ID: <20101211075748.GA4479@localhost2.local>
References: <20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101205133804.5430594f@daedalus.pq.iki.fi>
	<20101206011231.GC4122@localhost2.local>
	<20101208093458.GA11429@localhost2.local>
	<20101208122300.GA4480@localhost2.local>
	<20101209004202.GA4477@localhost2.local>
	<8762v3ards.fsf@riseup.net>
	<20101210104352.GA4505@localhost2.local> <op.vni2axo3tkuz1w@emo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <op.vni2axo3tkuz1w@emo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.velikov-/E1597aS9LT10XsdtD+oqA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Dec 11, 2010 at 02:24:25AM -0000, Emil Velikov wrote:
>Roger, looking at your logs it appears that you are still running an old  
>version of nouveau
>
>Make sure that you are running the latest git as it includes a few AGP  
>related bug-fixes
>Note that nouveau is NOT only a kernel. For more info on how to download,  
>compile and install take a look at the wiki [1] [2]
>
>[1] http://nouveau.freedesktop.org/wiki/InstallNouveau
>[2] http://nouveau.freedesktop.org/wiki/GentooEbuilds

I've already done all this. I experienced the same exact problem upstream.

This is the only card (box) experiencing this problem aside from my two other
nvidia driven boxes.

Think I documented on this thread that I stepped back down to stable; One, because I
think I was having compile problems; Second, I need stable around here --
especially when I was trying to get KDump working.  Since I was failing at
KDump too, one person here suggested sending in complete logs just so I could get
something in.

KGDB didn't show anything, either the debug output isn't getting out fast
enough before freeze, or likely because it's not putting out anything.

I need debug output to do anything, KDump is suppose to be it.  But so far, I'm just
chasing my tail around here.

Think I'll just leave this SMP box with "nouveau noagp=1" until I figure-out
KDump or I can get AGP debug output.

-- 
Roger
http://rogerx.freeshell.org/
