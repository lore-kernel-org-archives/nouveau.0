From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23593] nouveau hangs after a few minutes
Date: Wed,  2 Sep 2009 05:41:41 -0700 (PDT)
Message-ID: <20090902124141.1DD3E130058@annarchy.freedesktop.org>
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





--- Comment #6 from aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org  2009-09-02 05:41:40 PST ---
(In reply to comment #5)
> (In reply to comment #4)
> > Douh. Sorry about that. Removing the nvidiafb modules does make it better (and
> > I get kms!!).
> 
> Cool.
> 
> > However, leaving the machine for the night locks the screensaver. Wiggling the
> > mouse/kbd doesn't light up the screen. The machine continues to route packets
> > though.
> 
> Which screensaver is that, does it run an animation?
> 
The in-kernel one I guess. The led on the display goes to "sleep" mode and the
display powers off . Waiting a long time (e.g. over night) triggers it. I have
DPMS to sleep/off after 10 minutes, and these dpms induced sleeps can be undone
by kbd/mouse. It's the long sleep sessions (hours) that tend to lock it up.  

I have no traditional singing-dancing screensaver in use.



> > I get a bunch of these in the log:
> > 
> > Sep  1 19:11:13 tippex [drm:drm_ioctl], pid=2376, cmd=0x40086485, nr=0x85, dev
> > 0xe200, auth=1
> > Sep  1 19:11:13 tippex [drm:drm_ioctl], ret = fffffff5
> 
> This is still DRM_NOUVEAU_GEM_CPU_PREP returning EAGAIN. This is a sort of a
> soft lockup, where the graphics memory manager gets stuck. Well, assuming it
> gets stuck here, a bunch of those might appear even without a bug, I guess.
> 
I get about 100 roundtrips of them each second, and nothing else. Normal?



> > Do you want the entire log from boot?
> 
> That would be nice, yes.
> 
I'll post that tonight.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
