From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13481] RandR12 fails on GF6600Go
Date: Fri, 14 Dec 2007 17:25:33 -0800 (PST)
Message-ID: <20071215012533.96F27130051@annarchy.freedesktop.org>
References: <bug-13481-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13481-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13481


anssi-4qZELD6Fgxhg9hUCZPvPmw@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #12897|0                           |1
        is obsolete|                            |




------- Comment #11 from anssi-4qZELD6Fgxhg9hUCZPvPmw@public.gmane.org  2007-12-14 17:25 PST -------
Created an attachment (id=13119)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=13119&action=view)
Garbage on LVDS when switching DVI mode

Any switch of DVI mode causes LVDS to go garbage until it is switched as well.

Attached log of the following scenario:
Initial state: LVDS+DVI, 1400x1050,1280x1024
1. xrandr DVI to 1680x1050 => LVDS goes garbage
2. LVDS to 1024x768 => no more garbage
3. LVDS back to 1400x1050

The earlier xrandr "crashing" problem was my own fault, I had no other X
clients.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
