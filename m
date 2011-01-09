From: rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: Latest Git still freezes AGP [GeForce 7600 GS]
Date: Sat, 8 Jan 2011 16:27:47 -0900
Message-ID: <20110109012747.GA4523@localhost2.local>
References: <20110108234155.GC4575@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110108234155.GC4575-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
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

On Sat, Jan 08, 2011 at 02:41:55PM -0900, Roger wrote:
>
>Just a ping here concerning the "nVidia Corporation G73 [GeForce 7600 GS]" and
>AGP issues.
>
>
>I still have to use agpmode=0 (aka kernel parameter nouveau.agpmode=0) to
>avoid kernel (framebuffer) freezes when loading drm/nouveau drivers.
>
>
>My next task will be to get KDB working to hopefully get a backtrace.  Or is it
>futile at this point?  Using KGDB, I think stalls the serial bus and, the info
>I earlier collected showed nothing relevant to this or to any indication of a
>kernel panic.

(I meant KDUMP instead of KDB within the above paragraph.)


Interesting. I've recompiled this kernel to include the drm & nouveau as
modules.  (I also added KDUMP along with RELOC.)  The modules seem to be
loading and activating framebuffer console mode now without freezing, while
also enabling AGP mode.

I was anticipating to use/activate KDUMP dump kernel after loading the drm &
nouveau modules which trigger the freeze when AGP is enabled.

Seems like this bug is halfway worked out?

-- 
Roger
http://rogerx.freeshell.org/
