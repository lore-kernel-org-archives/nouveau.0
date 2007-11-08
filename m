From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13147] New: nv11 hang at startup with randr12 enabled
Date: Thu,  8 Nov 2007 11:00:15 -0800 (PST)
Message-ID: <bug-13147-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13147

           Summary: nv11 hang at startup with randr12 enabled
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


I have

lspci -v
01:00.0 VGA compatible controller: nVidia Corporation NV11 [GeForce2 MX/MX 400]
(rev b2) (prog-if 00 [VGA])
        Subsystem: Micro-Star International Co., Ltd. Unknown device 8523
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (32-bit, prefetchable) [size=128M]
        Expansion ROM at dfef0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 2.0

lspci -vn
01:00.0 0300: 10de:0110 (rev b2) (prog-if 00 [VGA])
        Subsystem: 1462:8523
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (32-bit, prefetchable) [size=128M]
        Expansion ROM at dfef0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 2.0

Kernel 2.6.21.7
drm/libdrm from git (47497abc1e38081564db429329a3ba16198c1521)
xserver master branch from git (476a9d85f819f454a6901ccb7eb028d1c563c341)
xf86-video-nouveau (fe3d49ccb24ff20fba79ee97cceba64850d9387f)

And machine hard-freeze (no ACPI shutdown) just after X server startup. Black
screen (but light on my monitor's front panel indicates some signal. I don't
have   OSD functionality here ...old CRT SyncMaster 550s) 

My be my logs just truncated, but for me it was looking strange to freeze just
after:

(II) NOUVEAU(0): 0xAF9B: Parsing init table 7                                   
(II) NOUVEAU(0): 0xAF9B: ------ EXECUTING FOLLOWING COMMANDS ------  

full log follow


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
