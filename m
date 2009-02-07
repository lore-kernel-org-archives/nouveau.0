From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15758] Invisible mouse pointer on NV4E (C51)
Date: Sat,  7 Feb 2009 12:30:25 -0800 (PST)
Message-ID: <20090207203025.A7EB4130058@annarchy.freedesktop.org>
References: <bug-15758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15758





--- Comment #11 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-07 12:30:22 PST ---
(In reply to comment #10)
> Created an attachment (id=22252)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22252) [details]
> use the PCRTC regs for cursor setting
> 
> and *on top of the previous patch*, this implements cursor setting more like
> the way the nvidia blob does, so could also be worth a go
> 

Sorry for the late reply, I had the assumption that I was notified of changes
in this bug (I added myself to the CC list right now). OK

Versions:

nouveau-f1099810bb3cfe451877667a0224eb3d664e442f

Question: The patch: Always allocate 2 hw cursors. Is it worth another try
since I just downloaded my source minutes or seconds *before* it was applied?
Want me to retry with it?

drm-97fdadee6a79f9406a55c235ee46104814321152

I used a small script that changed the resolution. Kept it going for a minute
changing resolution every 2 seconds. The cursor stayed 'alive'.

Logging out and rebooting the X-server caused the cursor to disappear.

Trying to kill the X server just after the cursor disappeared made the kernel
unhappy and my system somehow crashed. (want more data?)

I also noticed something else: Whenever I change the resolution with xrandr. If
you move the cursor during the change the screen seems to go 'white'. I noticed
this as well sometimes when the X-server crashed because of the blob after a
severe error. However, if I stop moving the cursor, the screen restores after a
while since another xrandr -s [1-5] command is issued effectively restoring the
display.

Please let me know if you need more information / want me to do more testing.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
