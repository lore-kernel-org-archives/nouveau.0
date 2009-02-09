From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20023] New: nv20: unwanted solid fills during
 busyloop rendering
Date: Mon,  9 Feb 2009 12:43:31 -0800 (PST)
Message-ID: <bug-20023-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20023

           Summary: nv20: unwanted solid fills during busyloop rendering
           Product: Mesa
           Version: CVS
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: ASSIGNED
          Severity: minor
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: pq-X3B1VOXEql0@public.gmane.org
        ReportedBy: pq-X3B1VOXEql0@public.gmane.org
                CC: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org


Created an attachment (id=22728)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22728)
screenshot of the corruption

This bug is mostly for myself as a devel to keep track of the issue.
It appears on both my nv20 and nv28. Current testing is on nv28.

Nouveau Gallium3D nv20 driver has recently got e.g. trivial/tri to work.
Trivial/tri-repeat is a version of trivial/tri, that cycles the colors and
renders as fast as possible (RAFAP). Another RAFAP application is glxgears,
which still shows only a black window.

When a RAFAP application is running, moving focus to a terminal window (aterm,
xterm) sometimes paints a rectangle filled with a solid color into the terminal
window. Examples of this are seen in the attached screenshot. The color of the
solid color fill (SCF) is not random: the aterm cursor is a yellow block, the
irc client has a blue status bar that updates occasionally, and gray is the
basic color in the terminal. I have no idea where the red comes from.

When SCF first appears, it is a single complete solid rectangle, properly
clipped by other windows, if they overlap. The holes seen in the screenshot are
due to the terminal repainting some of its contents. The SCF seems to respect
the terminal window borders, which does not make any sense. Sometimes the SCF
stops at the same x-coordinate as the tri-repeat window, for instance.

The composite extension is disabled in the X server, so the terminal windows
should not have a backing pixmap in VRAM. If they had, it would be easy to
hypothesise that NV20 Gallium is overwriting some VRAM with solid color, and
separate backing pixmaps would explain respecting the window borders and the
clipping to other windows.

The fact, that the SCF is a rectangle, suggests that whatever draws it, has the
"correct" pitch. Otherwise it would not have straight vertical edges.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
