From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25754] New: Nouveau - GPU Lockup on 2.6.33-rc1
Date: Mon, 21 Dec 2009 20:59:53 -0800 (PST)
Message-ID: <bug-25754-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25754

           Summary: Nouveau - GPU Lockup on 2.6.33-rc1
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mattkoco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32238)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32238)
Xorg.0.log

nouveau GPU Lockup on startx.  here is some more info;

dmesg:
   79.923860] [drm] nouveau 0000:01:00.0: Load detected on head A
[   80.143860] [drm] nouveau 0000:01:00.0: Load detected on head A
[   80.183541] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[   80.184650] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised
FIFO 1
[   81.183888] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1
[   84.704784] JBD: barrier-based sync failed on hda6-8 - disabling barriers
[   85.718292] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718307] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c04 Data 0x00000000:0x00000000
[   85.718318] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718328] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c08 Data 0x00000000:0x00000000
[   85.718339] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718348] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c10 Data 0x00000000:0x00000000
[   85.718359] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718368] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c18 Data 0x00000000:0x00000000
[   85.718380] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718389] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c20 Data 0x00000000:0x00000000
[   85.718400] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718409] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c28 Data 0x00000000:0x00000000
[   85.718420] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718430] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c30 Data 0x00000000:0x00000000
[   85.718441] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718450] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c38 Data 0x00000000:0x00000000
[   85.718461] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718471] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c40 Data 0x00000000:0x00000000
[   85.718482] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718491] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c48 Data 0x00000000:0x00000000
[   85.718502] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718511] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c50 Data 0x00000000:0x00000000
[   85.718522] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718532] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c58 Data 0x00000000:0x00000000
[   85.718543] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718552] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c60 Data 0x00000000:0x00000000
[   85.718563] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718572] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c68 Data 0x00000000:0x00000000
[   85.718583] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718593] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c70 Data 0x00000000:0x00000000
[   85.718604] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718613] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c78 Data 0x00000000:0x00000000
[   85.718624] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718634] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c80 Data 0x00000000:0x00000000
[   85.718645] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718654] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c88 Data 0x00000000:0x00000000
[   85.718665] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718674] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c90 Data 0x00000000:0x00000000
[   85.718685] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
STATE_INVALID METHOD_CNT, nStatus: INVALID_STATE
[   85.718695] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 1/2 Class 0x008a
Mthd 0x0c98 Data 0x00000000:0x00000000
[   85.726867] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1
[   85.767500] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 1
[   85.772414] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 1
[   88.772007] [drm] nouveau 0000:01:00.0: Failed to idle channel 1.

lspci:
00:00.0 Host bridge: Intel Corporation 82845 845 [Brookdale] Chipset Host
Bridge (rev 04)
00:01.0 PCI bridge: Intel Corporation 82845 845 [Brookdale] Chipset AGP Bridge
(rev 04)
00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 05)
00:1f.0 ISA bridge: Intel Corporation 82801BA ISA Bridge (LPC) (rev 05)
00:1f.1 IDE interface: Intel Corporation 82801BA IDE U100 Controller (rev 05)
00:1f.2 USB Controller: Intel Corporation 82801BA/BAM USB Controller #1 (rev
05)
00:1f.3 SMBus: Intel Corporation 82801BA/BAM SMBus Controller (rev 05)
00:1f.4 USB Controller: Intel Corporation 82801BA/BAM USB Controller #1 (rev
05)
00:1f.5 Multimedia audio controller: Intel Corporation 82801BA/BAM AC'97 Audio
Controller (rev 05)
01:00.0 VGA compatible controller: nVidia Corporation NV20 [GeForce3 Ti 200]
(rev a3)
02:08.0 Ethernet controller: Intel Corporation 82801BA/BAM/CA/CAM Ethernet
Controller (rev 03)
02:0a.0 Multimedia audio controller: Creative Labs SB Live! EMU10k1 (rev 07)
02:0a.1 Input device controller: Creative Labs SB Live! Game Port (rev 07)
02:0c.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL-8139/8139C/8139C+ (rev 10)


Full Xorg.0.log attached.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
