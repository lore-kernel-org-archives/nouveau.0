From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23741] Driver pixmaps cause pushbuf validation
 failure on mode change (nv28, KMS)
Date: Thu, 17 Sep 2009 12:35:33 -0700 (PDT)
Message-ID: <20090917193533.3A791130058@annarchy.freedesktop.org>
References: <bug-23741-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23741-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23741


Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-09-17 12:35:32 PST ---
The original issue seems to be fixed.

First worked around by DRM commit 18895876371e616db9f04652460c1d72174909c3
"drm/nouveau: bail out if validation fails repeatedly"

The proper handling of the effect of the bug, DRM commit
e6c757cc15b32f995f3aed9a4997ed710b740758
"drm/nouveau: protect against validating the same buffer twice"

And the fix to the bug itself in DDX, commit
806eaf6b0b36cb05ca9d883ff4572629812a1d48
"kms: rework fbcon transition"

However, changing mode with xrandr while watching TV (cable-tv-card, gxine,
with Xv most likely) results in X spinning in kernel and giving up in few
minutes. But that's another bug for another day. It too results in monitor
switching off.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
