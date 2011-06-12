From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38198] X: (EE) FBDEV(0): FBIOPUTCMAP: Invalid
	argument
Date: Sun, 12 Jun 2011 07:07:40 -0700 (PDT)
Message-ID: <20110612140740.34E7513004E@annarchy.freedesktop.org>
References: <bug-38198-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38198-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38198

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-06-12 07:07:39 PDT ---
In order to work with nouveau you need the kernel module, libdrm, ddx and
(optional) mesa/gallium

A good starting point can be found here [1]

From your log I can see two things
1. You do not have the minimal xorg.conf [1]
2. Come to think of it, most likely you do not have the nouveau ddx
(xf86-video-nouveau)

Build the ddx, and add the "nouveau" to your xorg.conf.

Any further issues please consult yourself with the faq[2], bugs[3] and
mesadrivers[4]

[1] http://nouveau.freedesktop.org/wiki/InstallNouveau
[2] http://nouveau.freedesktop.org/wiki/FAQ
[3] http://nouveau.freedesktop.org/wiki/Bugs
[4] http://nouveau.freedesktop.org/wiki/MesaDrivers

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
