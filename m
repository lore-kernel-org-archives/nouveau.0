From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Wed, 8 Dec 2010 00:34:58 -0900
Message-ID: <20101208093458.GA11429@localhost2.local>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101205133804.5430594f@daedalus.pq.iki.fi>
	<20101206011231.GC4122@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101206011231.GC4122-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I've gotten KGDB re-working here and didn't get anything on output via serial
console.  Might not have had an option activated, rechecking & rebooting.  But
with this hard freeze, kdump is likely the only option.

I've spent some time trying to get kdump working, but have been unsuccessful
kexec'ing a kernel.  Keeps telling me I haven't appended "crashkernel=" when I
already have appended it -- checked /proc/cmdline.  But rechecking a few more
options with kexec/kdump, recompiling and will check back if I get any further
debugging on this.

nosmp still fails too.

(My other two systems seem stable with nouveau framebuffer + Xorg.  Just this
one is freezing with nouveau drm loading.)

-- 
Roger
http://rogerx.freeshell.org/
