From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39101] New: [NVA8] VirtualBox segfault when
	accelerating 3D
Date: Sat,  9 Jul 2011 13:34:31 -0700 (PDT)
Message-ID: <bug-39101-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39101

           Summary: [NVA8] VirtualBox segfault when accelerating 3D
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org


Since my upgrade to Fedora 15 (host OS), VirtualBox crashes when trying to do
OpenGL in Windows XP (guest OS, guest additions installed). The application
that makes it crash is OpenGL Extensions Viewer, when trying the OpenGL 1.1
(but really any) test program. On Fedora 14 3D acceleration with this program
worked which makes this a regression. The (brief) explanation in VirtualBox is:

[ 3395.279858] VirtualBox[9335]: segfault at 18 ip 000000308644f029 sp
00007f9d484f7900 error 4 in libGL.so.1.2[3086400000+6e000]

Relevant software versions:
mesa-libGL-7.11-0.11.20110525.0.fc15.x86_64
kernel-2.6.38.8-32.fc15.x86_64
VirtualBox-4.0-4.0.10_72479_fedora15-1.x86_64
Tried with both Gnome-shell and fallback, both failed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
