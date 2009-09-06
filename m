From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23593] nouveau hangs after a few minutes
Date: Sun,  6 Sep 2009 04:58:41 -0700 (PDT)
Message-ID: <20090906115842.02D8E13005B@annarchy.freedesktop.org>
References: <bug-23593-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23593-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23593





--- Comment #17 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2009-09-06 04:58:40 PST ---
(In reply to comment #16)
> > I've been trying to reproduce this for a while on another nv05 without success,
> > I'm using master though. You said you were on master-compat but later that you
> > were using a 2.6.31 release candidate so, which branch are you using exactly?
> > 
> vanilla 2.6.31-rc6 kernel
> 
> nouveau-drm-99999999
> xf86-video-nouveau-9999
> libdrm-9999
> 
> from gentoo's x11 overlay.
> 
> Looking inside the nouveau-drm-99999999 ebuild, I see that it pulls:
> http://people.freedesktop.org/~pq/nouveau-drm/master-compat.tar.gz
> 
> The vanilla kernel has no nouveau stuff in it. The master-compat tarball builds
> fine against it. 
> 

This sounds like a master-compat issue then. Would you mind to confirm it is by
installing the DRM from master?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
