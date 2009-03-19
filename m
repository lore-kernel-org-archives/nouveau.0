From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16792] modesetting on NV86: cannot allocate
	framebuffer
Date: Wed, 18 Mar 2009 22:27:00 -0700 (PDT)
Message-ID: <20090319052700.4CE3F13005A@annarchy.freedesktop.org>
References: <bug-16792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16792





--- Comment #11 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-03-18 22:26:58 PST ---
(In reply to comment #9)
> I installed nouveau master, drm modesetting-gem and rebooted.
> 
> I modprobed drm, then nouveau with "modeset=1", the screen went black, like
> when X start, then the console came back but at panel native resolution.
Cool, that sounds about right :)

> 
> I then started GDM but X gave the error I attach.
Hmm, the dmesg log would be very useful here (bonus points for loading drm with
"modprobe drm debug=1").

> 
> I then tried to remove the nouveau module but it said it was busy, though
> "lsmod" told no other module was using it.
That's normal, the console is being controlled by nouveau.ko.  You can unload
the module first if you "echo 0 > /sys/class/vtconsole/vtcon<n>/bind" first. 
What exactly <n> is probably depends on your system, it's 1 for me.  Also, once
you do that, you won't have a visible console.  Nouveau can't switch back to
the original resolution yet..

> 
> I forgot to save "dmesg" before reboot. It contained many information about the
> DRM. Do you need it?
It would be very useful :)

> 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
