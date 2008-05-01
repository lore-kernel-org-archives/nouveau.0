From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15792] New: nv04 (TNT2) video blitter problem.
Date: Thu,  1 May 2008 15:35:10 -0700 (PDT)
Message-ID: <bug-15792-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15792

           Summary: nv04 (TNT2) video blitter problem.
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


Created an attachment (id=16304)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16304)
xorg log

Hw:

01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro]
(rev 15) (prog-if 00 [VGA])
        Subsystem: ASUSTeK Computer Inc. AGP-V3800PRO
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at da000000 (32-bit, prefetchable) [size=32M]
        Expansion ROM at dfef0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 1
        Capabilities: [44] AGP version 2.0

[1043:4000]

software:
kernel 2.6.24.5
glibc-2.7
gcc-4.2.2
X server - git 3b8d53452cd6c74d32d7759964a7cd9ee775f161
xf86-video-nouveau - 85536023ed7050632d121299ab99382e096b9984
drm - 3ac74f3208ed15a990a0a26742fbfe566f08aa80


Screen resolution 1024x768, 24bpp. Option "Randr12" "1". (important). Composite
extension enabled in xorg.conf, composite manager disabled.

Trying to watch movie in fullscreen resulted in blue rectangle and following
errors in dmesg [playing 3 frames in mplayer]: 



[drm] Initialized drm 1.1.0 20060810
ACPI: PCI Interrupt 0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 19
[drm] Detected an NV4 generation card (0x20154000)
[drm] Initialized nouveau 0.0.10 drm-2.3.0-1227-g3ac74f3208ed15a99 on minor 0
agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
agpgart: Putting AGP V2 device at 0000:01:00.0 into 4x mode
[drm] Allocating FIFO number 0
[drm] nouveau_fifo_alloc: initialised FIFO 0
[drm] Allocating FIFO number 1
[drm] nouveau_fifo_alloc: initialised FIFO 1
[drm] NV: PGRAPH context switch interrupt channel 0 -> 1
eth0: no IPv6 routers present
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x0304 Data
0xc03f4380:0x15a815a8
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x0308 Data
0xc03f4380:0xfe2bb038
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x030c Data
0xc03f4380:0xfe2bb038
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/2 Class 0x0077 Mthd 0x040c Data
0xc03f4380:0x00000000
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: INVALID_STATE BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x0304 Data
0xd09467d1:0x15a815a8
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: INVALID_STATE BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x0308 Data
0xd09467d1:0xfe2bb038
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: INVALID_STATE BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x030c Data
0xd09467d1:0xfe2bb038
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/2 Class 0x0077 Mthd 0x040c Data
0xd09467d1:0x00000000
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: INVALID_STATE BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x0304 Data
0xd09467d1:0x15a815a8
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: INVALID_STATE BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x0308 Data
0xd09467d1:0xfe2bb038
[drm] PGRAPH_NOTIFY - nSource: DATA_ERROR, nStatus: INVALID_STATE BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/6 Class 0x0042 Mthd 0x030c Data
0xd09467d1:0xfe2bb038
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
BAD_ARGUMENT
[drm] PGRAPH_NOTIFY - Ch 1/2 Class 0x0077 Mthd 0x040c Data
0xd09467d1:0x00000000



Workarounds:
1) Using xrandr and lowering resolution to 832 x 624 at runtime, for example.
2) add "Virtual 1024x768" line in xorg.conf
3) Disable randr12 (X will start with 1024x768 framebuffer)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
