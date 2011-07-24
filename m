From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39498] nouveau hangs on unresponsive black screen at
	startup
Date: Sun, 24 Jul 2011 12:25:34 -0700 (PDT)
Message-ID: <20110724192534.E6ABD13011D@annarchy.freedesktop.org>
References: <bug-39498-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39498-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39498

--- Comment #11 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-07-24 12:25:34 PDT ---
(In reply to comment #9)
> Emil, I tried following your advice, using the original driver which comes with
> kernel 3.0.0-git3 but the problem is still there (it gets stuck on an
> unresponsive black screen which only displays a small underscore "_" in the top
> left corner and I do not get the gdm greeter).
If you are starting at runlevel 3 there will be no kdm/gdm/xdm greeter

Thus I take that the display is _not_ black but there is still nothing relevant
on it

> ....
> [drm] nouveau 0000:01:00.0: Pointer to BIT loadval table invalid
> 
AFAIK the above message is not crucial

There are a few things you can try - all without loading X

1. Play with the module options "noaccel" and/or "nofbaccel" (modinfo nouveau
for more info)

2. Select different resolution - append "video=..." [1] to your kernel command
line

3. Add some printf() statements in the kernel module to narrow in which state
the issue occurs

Cheers
Emil

[1] http://nouveau.freedesktop.org/wiki/KernelModeSetting - Forcing Mode

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
