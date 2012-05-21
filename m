From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50175] New: [regression kernel 3.4] : nouveau
 detects internal laptop display as "disconnected" / screen is turned off
Date: Mon, 21 May 2012 14:20:30 +0000
Message-ID: <bug-50175-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50175

             Bug #: 50175
           Summary: [regression kernel 3.4] : nouveau detects internal
                    laptop display as "disconnected" / screen is turned
                    off
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mus.svz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 61914
  --> https://bugs.freedesktop.org/attachment.cgi?id=61914
dmesg output

After upgrading from kernel 3.3.6 to 3.4.0 the internal display of my laptop
turns off as soon as the nouveau driver / KMS is loaded. xrandr detects the
LVDS-1 connection as "disconnected" while my external HDMI display works fine.
Downgrading back to 3.3.6 fixes the problem.

Note that this is NOT an Optimus laptop, the integrated Intel graphic chip is
disabled.

Sony Vaio S (VPCS11C5E)
NVIDIA GeForce 310M
Intel Core i5 M520
Arch Linux x64 (testing)

Although I assume this is irrelevant since this is obviously not an X problem:
xorg-server 1.12.1.902
xf86-video-nouveau 0.0.16_git20120512
libdrm 2.4.33
libdrm-nouveau 2.4.34
nouveau-dri 8.0.3

output of dmesg, lspci and xrandr are attached.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
