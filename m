From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22179] New: [KMS] Black screen with KMS enabled
Date: Tue,  9 Jun 2009 11:52:10 -0700 (PDT)
Message-ID: <bug-22179-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22179

           Summary: [KMS] Black screen with KMS enabled
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have this hardware in AGP slot:

01:00.0 VGA compatible controller: nVidia Corporation NV44A [GeForce 6200] (rev
a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 81e1
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 16
        Memory at d6000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (32-bit, prefetchable) [size=256M]
        Memory at d5000000 (32-bit, non-prefetchable) [size=16M]
        Expansion ROM at d7ee0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb

Tried to use in-kernel DRM from
http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=newttm-devel, comments
between 59a3759d0fe8d969888c741bb33f4946e4d3750d and       
c05c0840514599d229e6719d42a2f4e6e0e8ea1e were extracted as patch, and this
patch applied to 2.6.30-rc8-git4 (due to unrelated XFS bug in earlier
2.6.30-rc7 kernel)

Resulted kernel boots fine, and nouveau DRM works in two-minute testing, but
KMS (modeset=1 as module parameter) gives me black screen. No, this time, i
verified  that fbcon was loaded. 

Also, DRM thee from
http://cgit.freedesktop.org/~jinghua/drm/log/?h=modesetting-gem works fine  in
KMS mode with my current hardware (I need to correct screen resolution, X seems
to be started in doublescan mode, but after this X works ok)

Logs will follow ....


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
