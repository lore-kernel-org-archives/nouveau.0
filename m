From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37770] New: UT2003: Out of code space for shader
	type 0
Date: Mon, 30 May 2011 16:48:31 -0700 (PDT)
Message-ID: <bug-37770-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37770

           Summary: UT2003: Out of code space for shader type 0
           Product: Mesa
           Version: unspecified
          Platform: All
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org


After a few minutes of gameplay the following message pops up in the console:
nv50_program_validate:150 - out of code space for shader type 0
This is accompanied with random or unexplainable renders in the frame. Happens
on NVA8,  with or without gnome-shell. This did not happen however in Fedora 14
as far as I can remember
On NV4B similar render problems show as well during gameplay. However on NV4B
no message is printed to the console, and the misrenders start immediately.
Although it looks like the same issue, it might be completely non-related.

Running:
kernel-2.6.38.6-27.fc15.x86_64 (but also tried with Koji kernel and upstream
nouveau module)
mesa-dri-drivers-7.11-0.11.20110525.0.fc15.i686
xorg-x11-drv-nouveau-0.0.16-24.20110324git8378443.fc15.x86_64
xorg-x11-server-Xorg-1.10.1-14.fc15.x86_64

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
