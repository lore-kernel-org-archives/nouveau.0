From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26349] New: nouveau_hybrid_setup: disables a
 discrete NVS 3100m on ThinkPad T410
Date: Sun, 31 Jan 2010 07:53:47 -0800 (PST)
Message-ID: <bug-26349-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26349

           Summary: nouveau_hybrid_setup: disables a discrete NVS 3100m on
                    ThinkPad T410
           Product: xorg
           Version: git
          Platform: All
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pav_s-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


steps to reproduce:
 load the nouveau module (e.g. start fedora install, or so)

result:
 black screen & garbage in lspci

expected result:
 kms init + hi-res cnsole

explanation:

the module fails with the message
  [drm] nouveau 0000:01:00.0: _DSM hardware status gave 0x30040e3
  [drm] nouveau 0000:01:00.0: Unsupported chipset 0xffffffff

after a failed probe of the card, that disables the card:

01:00.0 VGA compatible controller: nVidia Corporation Device 0a6c (rev a2)
(prog-if 00 [VGA controller])
        Subsystem: Lenovo Device 2142
        Flags: bus master, fast devsel, latency 0, IRQ 11
        Memory at cc000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at ce000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 2000 [size=128]
        [virtual] Expansion ROM at cd000000 [disabled] [size=512K]
        ...


turns into 

01:00.0 VGA compatible controller: nVidia Corporation Device 0a6c (rev ff)
(prog-if ff)
        !!! Unknown header type 7f


After changing  (result & 0x1) to (!(result & 0x1)) in nouveau_hybrid_setup
everything works as expected.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
