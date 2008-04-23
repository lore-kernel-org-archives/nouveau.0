From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15650] Hard freeze when starting X with GeForce 6800
	GS (NV43)
Date: Wed, 23 Apr 2008 07:19:58 -0700 (PDT)
Message-ID: <20080423141958.64CA313015B@annarchy.freedesktop.org>
References: <bug-15650-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15650-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15650





--- Comment #9 from Andrew McNabb <amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org>  2008-04-23 07:19:56 PST ---
When we replaced:

#if !defined(__powerpc__) && !defined(__ia64__)

with 

#if 0

on line 498 of nouveau_mem.c, clients were able to connect without X crashing. 
I was able to start gnome-terminal, xterm, Firefox, etc.

However, when I started urxvt (a simple terminal with unicode support), X
crashed and I got the following errors in .xsession-errors:

gnome-session: Fatal IO error 11 (Resource temporarily unavailable) on X server
: \0.0.
gnome-terminal: Fatal IO error 11 (Resource temporarily unavailable) on X
server :\0.0.
gnome-panel: Fatal IO error 11 (Resource temporarily unavailable) on X server
:0. \0.
bluetooth-applet: Fatal IO error 11 (Resource temporarily unavailable) on X    
  \server :0.0.
nm-applet: Fatal IO error 11 (Resource temporarily unavailable) on X server
:0.0.
pam-panel-icon: Fatal IO error 11 (Resource temporarily unavailable) on X
server :\0.0.
firefox: Fatal IO error 104 (Connection reset by peer) on X server :0.0.
Window manager warning: Fatal IO error 11 (Resource temporarily unavailable) on
  \display ':0.0'.
kerneloops-applet: Fatal IO error 11 (Resource temporarily unavailable) on X   
  \server :0.0.
applet.py: Fatal IO error 11 (Resource temporarily unavailable) on X server
:0.0.
gpk-update-icon: Fatal IO error 11 (Resource temporarily unavailable) on X     
  \server :0.0.


I checked Xorg.0.log, and it didn't give any additional output.  I also tried
with Composite both enabled and disabled, and both showed the same problem.  I
will attach the kernel log (with drm output) from the time X started to the
time it crashed.

This seems related to the earlier crashes, but it might not be.  You would
probably know better than I do.

Thanks for your help.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
