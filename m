From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26321] [9400M] GPU lockup and X does not start
Date: Sat, 20 Feb 2010 07:29:15 -0800 (PST)
Message-ID: <20100220152915.5DD97130091@annarchy.freedesktop.org>
References: <bug-26321-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26321-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26321


Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #32900|0                           |1
        is obsolete|                            |




--- Comment #2 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2010-02-20 07:29:14 PST ---
Created an attachment (id=33449)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33449)
dmesg | grep drm with drm.debug=6

When starting X I can connect via SSH but nothing else works (like keyboard,
power button). Only reset button works and I can also reboot system via SSH
(execute "reboot" twice) ...

X looks like this:
http://www.bilder-hosting.de/show/C8J82.jpg

dmesg with drm.debug=6 is attached.

Xorg.0.log is not really changed (only time/date).

startx -- -verbose 6 -logverbose 6 2> startx.log provides only an empty file.
(Is this command obsolete?)

But I can provide a gdb - bt full attached to /usr/bin/Xorg ...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
