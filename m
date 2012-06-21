From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51291] New: Segfault with mplayer -vo vdpau:
 vlVdpVideoSurfaceClear at surface.c:366
Date: Thu, 21 Jun 2012 11:26:44 +0000
Message-ID: <bug-51291-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51291

             Bug #: 51291
           Summary: Segfault with mplayer -vo vdpau:
                    vlVdpVideoSurfaceClear at surface.c:366
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
        ReportedBy: ungift-ed-k+OT61UuxXo@public.gmane.org


Program received signal SIGSEGV, Segmentation fault.
vlVdpVideoSurfaceClear (vlsurf=0xb21a90) at surface.c:366


(gdb) bt full
#0  vlVdpVideoSurfaceClear (vlsurf=0xb21a90) at surface.c:366
        c = {f = {0.5, 0.5, 0.5, 0.5}, i = {1056964608, 1056964608, 1056964608,
1056964608}, ui = {1056964608, 1056964608, 1056964608, 1056964608}}
        pipe = 0xb7a610
        surfaces = 0xb21ba8
#1  0x00007fffe9b1e722 in vlVdpVideoSurfaceCreate (device=<optimized out>,
chroma_type=0, width=1280, height=692, surface=<optimized out>) at surface.c:95
        pipe = 0xb7a610
        p_surf = 0xb21a90
        ret = <optimized out>
        dev = 0xb529d0
#2  0x000000000045c0fe in ?? ()
No symbol table info available.
#3  0x000000000045dc11 in ?? ()
No symbol table info available.
#4  0x00000000004b7309 in ?? ()
No symbol table info available.
#5  0x000000000048a15f in filter_video ()
No symbol table info available.
#6  0x0000000000439edf in ?? ()
No symbol table info available.
#7  0x000000000042e69f in main ()
No symbol table info available.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
