From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49243] New: graphical corruption with GeForce 6150SE
	nForce 430
Date: Sat, 28 Apr 2012 06:48:35 +0000
Message-ID: <bug-49243-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49243

             Bug #: 49243
           Summary: graphical corruption with GeForce 6150SE nForce 430
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


I just built wayland/mesa and related with this script which pulls from git
http://www.chaosreigns.com/wayland/buildscript/dl/wayland-build-master.sh

I am using Ubuntu 12.04 release, 3.2.0-24-generic

window-screen-cap: https://imgur.com/Wg1ej

kern.log:
Apr 27 23:42:57 host kernel: [50991.175684] [drm] nouveau 0000:00:0d.0: PGRAPH
- ERROR nsource: DATA_ERROR nstatus: BAD_ARGUMENT
Apr 27 23:42:57 host kernel: [50991.175699] [drm] nouveau 0000:00:0d.0: PGRAPH
- ch 4 (0x00073000) subc 7 class 0x4497 mthd 0x0208 data 0x050a0228
etc...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
