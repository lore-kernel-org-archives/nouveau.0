From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13481] RandR12 fails on GF6600Go
Date: Fri, 14 Dec 2007 17:39:30 -0800 (PST)
Message-ID: <20071215013930.9A9E1130051@annarchy.freedesktop.org>
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





------- Comment #12 from anssi-4qZELD6Fgxhg9hUCZPvPmw@public.gmane.org  2007-12-14 17:39 PST -------
Created an attachment (id=13120)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=13120&action=view)
Garbage on LVDS stays even after X restart

The garbage mentioned in the previous comment stays even past X restarts.

Attached is the following reproducable scenario:
1. LVDS is garbaged by switching DVI mode with xrandr.
2. X is restarted (log starts here), garbage stays
3. Trying to switch LVDS to 1024x768, but X server drops connection to xrandr.
3. Trying again, now LVDS switched to 1024x768, and output works fine again.
4. LVDS switched back to 1400x1050, still works.

Notes:
- Garbage is the same kind that happens on failing console restore.
- When switching the LVDS mode, both displays go black for a moment. However,
when switching DVI mode, the LVDS does not go black, just goes to garbage
immediately


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
