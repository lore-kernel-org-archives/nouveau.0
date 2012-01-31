From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45421] New: regression: nouveau.ko fails to load
Date: Tue, 31 Jan 2012 02:23:03 +0000
Message-ID: <bug-45421-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=45421

             Bug #: 45421
           Summary: regression: nouveau.ko fails to load
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jesse.brandeburg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 56355
  --> https://bugs.freedesktop.org/attachment.cgi?id=56355
dmesg from boot for failed driver load

nouveau fails to load
v3.2 works okay
v3.3-rc1 fails
nouveau git fails

I tried to bisect but got compile errors due to HWMON, and then two panics in a
row on different commits, so I gave up bisect.

full dmesg from boot attached, the critical bit is:
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.455869] MXM: GUID detected in BIOS
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.467051] VGA switcheroo: detected
Optimus DSM method \ handle
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.481163] [drm] nouveau
0000:01:00.0: Detected an NV50 generation card (0x096e00a1)
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.492671] checking generic (d1000000
1e0000) vs hw (c0000000 10000000)
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.492673] checking generic (d1000000
1e0000) vs hw (d0000000 2000000)
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.492675] fb: conflicting fb hw
usage nouveaufb vs VESA VGA - removing generic driver
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.504429] Console: switching to
colour dummy device 80x25
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.510526] sdhci-pci 0000:86:09.1:
Will use DMA mode even though HW doesn't fully claim to support it.
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.513433] [drm] nouveau
0000:01:00.0: Attempting to load BIOS image from PRAMIN
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.579993] sdhci-pci 0000:86:09.1:
Will use DMA mode even though HW doesn't fully claim to support it.
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.599872] [drm] nouveau
0000:01:00.0: ... appears to be valid
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.599876] [drm] nouveau
0000:01:00.0: BIT BIOS found
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.599880] [drm] nouveau
0000:01:00.0: Bios version 62.94.3b.00
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.599883] [drm] nouveau
0000:01:00.0: TMDS table version 2.0
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.600121] [drm] nouveau
0000:01:00.0: MXM: BIOS version 2.1
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.600449] [drm] nouveau
0000:01:00.0: MXM: failed to locate valid SIS
Jan 30 17:07:13 jbrandeb-mobl kernel: [    2.605529] nouveau: probe of
0000:01:00.0 failed with error -22

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
