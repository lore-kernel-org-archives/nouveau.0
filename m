From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10858] glxgears with mesa-git on PCI 10de0322 (NV34)
	GeForce FX 5200 crashes X
Date: Fri, 18 May 2007 22:00:09 -0700 (PDT)
Message-ID: <20070519050009.96F8E13006F@annarchy.freedesktop.org>
References: <bug-10858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10858





------- Comment #14 from mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-05-18 21:59 PST -------
refer bug 10933 have put nv34 in another machine. Once installed the new
machine only has one nvidia card in it the nv34 (will attach a new dmesg and
lspci).

running glxgears with;

drm: ea98d7e79657469545b865a353784d79fc8cff9d 
xf86-video-nouveau: 7af7d95eb8826fa3fb9914a8c6ad4b6f4867095e 
mesa: 25551bdfad8541337a4e59e7e3764fa9b876cb19 

no drm errors encountered!

gears window is drawn, can move mouse around (into and out of windows), can
move the gears window around.  glxgears consumes as much cpu as possible
(logged in remotely to verify).

No gears are drawn, and no frame rate information is written to the terminal in
which gears we started.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
