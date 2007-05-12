From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10933] New: nouveau defaults to first graphics card
	in system even when xorg instructed differently
Date: Sat, 12 May 2007 13:51:54 -0700 (PDT)
Message-ID: <bug-10933-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10933

           Summary: nouveau defaults to first graphics card in system even
                    when xorg instructed differently
           Product: xorg
           Version: 7.2
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Testing nouveau on a system with both;

01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro]
(rev 15) (prog-if 00 [VGA])
        Subsystem: Compaq Computer Corporation Unknown device 001f
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
        Memory at 42000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 50000000 (32-bit, prefetchable) [size=32M]
        [virtual] Expansion ROM at 43000000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 1
        Capabilities: [44] AGP version 2.0
00: de 10 28 00 06 00 b0 02 15 00 00 03 00 40 00 00

02:04.0 VGA compatible controller: nVidia Corporation NV34 [GeForce FX 5200]
(rev a1) (prog-if 00 [VGA])
        Subsystem: XFX Pine Group Inc. Unknown device 203e
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 20
        Memory at 40000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 48000000 (32-bit, prefetchable) [size=128M]
        [virtual] Expansion ROM at 41020000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
00: de 10 22 03 07 00 b0 02 a1 00 00 03 00 40 00 00

/etc/X11/xorg.conf 

Section "Device"
        Identifier      "Generic Video Card"
        Driver          "nouveau"
        Busid           "PCI:2:4:0"
        Option          "MigrationHeuristic"    "greedy"
EndSection

i.e xorg is configured to use 2:4:0, after insmod drm.ko debug=1, the drm
appears to enable interrupts from both cards (will attache syslog) however only
works with the first card it sees.

Resulting in repeatable failures on method 0x03b0 as nv05 0028 doesnt
understand method 0x03b0 (does not appear in a clean renouveau output for
10de0028).

May 13 08:38:03 daisy kernel: [ 1528.379012] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: PGRAPH error interrupt
May 13 08:38:03 daisy kernel: [ 1528.379023] [drm:nouveau_pgraph_irq_handler]
*ERROR* nsource:0x00040000^Instatus:0x01000000
May 13 08:38:03 daisy kernel: [ 1528.379031] [drm:nouveau_pgraph_irq_handler]
*ERROR* instance:0x00002920
May 13 08:38:03 daisy kernel: [ 1528.379041] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: nSource: 0x00040000, nStatus: 0x01000000
May 13 08:38:03 daisy kernel: [ 1528.379051] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: Channel 1/7 (class 0x0697) -Method 0x03b0, Data 0x00100000


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
