From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42479] New: piglit/glean/readPixSanity fails - dmesg
 PGRAPH - TRAP_TPDMA - TP0: Unhandled ustatus 0x00020000
Date: Tue, 01 Nov 2011 15:24:29 +0000
Message-ID: <bug-42479-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42479

             Bug #: 42479
           Summary: piglit/glean/readPixSanity fails - dmesg PGRAPH -
                    TRAP_TPDMA - TP0: Unhandled ustatus 0x00020000
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dirkneukirchen-S0/GAf8tV78@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 53001
  --> https://bugs.freedesktop.org/attachment.cgi?id=53001
dmesg with nonrelated errors removed

System:

- Ubuntu Oneiric with xorg-edgers (
- piglit from git

Steps to reproduce:

1. running piglit
env PIGLIT_BUILD_DIR=Programming/piglit ./piglit-run.py tests/sanity.tests
results/sanity.results

2. readPixSanity tests create dmesg
[ 7963.282652] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP_TPDMA - TP0: Unhandled
ustatus 0x00020000
[ 7963.282658] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 7963.282665] [drm] nouveau 0000:02:00.0: PGRAPH - ch 4 (0x0007d60000) subc 5
class 0x8397 mthd 0x19d0 data 0x00000001

3. piglit/glean fails

uname -a
Linux tenchi-htpc 3.1.0-1-generic #1-Ubuntu SMP Tue Oct 18 21:46:02 UTC 2011
i686 athlon i386 GNU/Linux

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
