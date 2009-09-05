From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23593] nouveau hangs after a few minutes
Date: Sat,  5 Sep 2009 10:35:23 -0700 (PDT)
Message-ID: <20090905173523.14D64130058@annarchy.freedesktop.org>
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





--- Comment #15 from aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org  2009-09-05 05:52:27 PST ---
Created an attachment (id=29248)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=29248)
40 min boot to crash log

40 minutes run. Boot to hang.

The nouveau.ko module (and deps) was manually insmodded after boot, hence the
initial rows in the log are more readable. There are still the occational
overrun downstream though.

This time no screensaver was involved. The display was on for the entire run.


--- Comment #16 from aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org  2009-09-05 10:35:21 PST ---
> I've been trying to reproduce this for a while on another nv05 without success,
> I'm using master though. You said you were on master-compat but later that you
> were using a 2.6.31 release candidate so, which branch are you using exactly?
> 
vanilla 2.6.31-rc6 kernel

nouveau-drm-99999999
xf86-video-nouveau-9999
libdrm-9999

from gentoo's x11 overlay.

Looking inside the nouveau-drm-99999999 ebuild, I see that it pulls:
http://people.freedesktop.org/~pq/nouveau-drm/master-compat.tar.gz

The vanilla kernel has no nouveau stuff in it. The master-compat tarball builds
fine against it. 


> There might be an specific acceleration request deterministically triggering
> the lockup. Have you tried e.g. "$ x11perf -all"? 
Runnig it now. I've seen one hang so far, but rebooting and running just that
specific test failed to trigger it.

Just a thought...As the failure mode is "looping on ebusy", and it seems it's
on the same (ioctl) call all the time, are there any debuggning things which
can be enabled for that particular call? printf'ing the reason for the ebusy
might give some lead...


> 
> That could be easily done. In fact it's already done for the non-KMS case. I
> guess patches are welcome.
> 
It seems I'm being lured into actuially looking at the code. :-) I might end up
doing exactly that, but I cannot seem to find the time...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
