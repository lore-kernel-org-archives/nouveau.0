From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35890] New: nVidia Quadro 600 gives "PGRAPH:
 unsupported chipset, please report!"
Date: Fri,  1 Apr 2011 17:36:27 -0700 (PDT)
Message-ID: <bug-35890-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35890

           Summary: nVidia Quadro 600 gives "PGRAPH: unsupported chipset,
                    please report!"
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: luke.hutch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Just installed Fedora 15 Alpha on a brand new i7 Xeon machine with an nVidia
Quadro 600 card.

See the full log below, but the three offending lines are:
    nouveau 0000:0c:00.0: PGRAPH: unsupported chipset, please report!
    nouveau 0000:0c:00.0: PGRAPH: unknown config: 2/0/0/0, 1
    nouveau 0000:0c:00.0: failed to load fuc409d

xorg-x11-drv-nouveau-0.0.16-24.20110324git8378443.fc15.x86_64
kernel-2.6.38.2-9.fc15.x86_64

Smolt profile:
http://www.smolts.org/client/show/pub_95a2518e-ff79-4aa0-920c-1f3ddfb54669

nouveau 0000:0c:00.0: PCI INT A -> GSI 24 (level, low) -> IRQ 24
nouveau 0000:0c:00.0: Detected an NVc0 generation card (0x0c1c00a1)
nouveau 0000:0c:00.0: Attempting to load BIOS image from PRAMIN
nouveau 0000:0c:00.0: ... appears to be valid
nouveau 0000:0c:00.0: BIT BIOS found
nouveau 0000:0c:00.0: Bios version 70.08.27.00
nouveau 0000:0c:00.0: Pointer to BIT loadval table invalid
nouveau 0000:0c:00.0: TMDS table version 2.0
nouveau 0000:0c:00.0: Found Display Configuration Block version 4.0
nouveau 0000:0c:00.0: Raw DCB entry 0: 01000302 00020030
nouveau 0000:0c:00.0: Raw DCB entry 1: 02000300 00000000
nouveau 0000:0c:00.0: Raw DCB entry 2: 028113a6 0f220010
nouveau 0000:0c:00.0: Raw DCB entry 3: 02011362 00020010
nouveau 0000:0c:00.0: DCB connector table: VHER 0x40 5 16 4
nouveau 0000:0c:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
nouveau 0000:0c:00.0:   1: 0x00002146: type 0x46 idx 1 tag 0x08
nouveau 0000:0c:00.0: Parsing VBIOS init table 0 at offset 0x6970
nouveau 0000:0c:00.0: Parsing VBIOS init table 1 at offset 0x6FB6
nouveau 0000:0c:00.0: Parsing VBIOS init table 2 at offset 0x814B
nouveau 0000:0c:00.0: Parsing VBIOS init table 3 at offset 0x814F
nouveau 0000:0c:00.0: Parsing VBIOS init table 4 at offset 0x8237
nouveau 0000:0c:00.0: Parsing VBIOS init table at offset 0x829C
nouveau 0000:0c:00.0: 0x68E3: Condition still not met after 20ms, skippingel: [
43446] [drm] nouveau 0000:0c:00.0: 3 available performance level(s)
nouveau 0000:0c:00.0: 0: memory 135MHz core 270MHz shader 540MHz voltage 8450]
[ouveau 0000:0c:00.0: 1: memory 405MHz core 810MHz shader 810MHz volt5.643452]
[duveau 0000:0c:00.0: 3: memory 540MHz core 1012MHz shader 1280M: [   
5.643605] [ouveau 0000:0c:00.0: Detected 512MiB VRAM
nouveau 0000:0c:00.0: 512 MiB GART (aperture)
nouveau 0000:0c:00.0: PGRAPH: unsupported chipset, please report!
nouveau 0000:0c:00.0: PGRAPH: unknown config: 2/0/0/0, 1
nouveau 0000:0c:00.0: failed to load fuc409d
nouveau 0000:0c:00.0: allocated 1280x1024 fb: 0x28020000, bo ffff880c0c8eb88]
fbcon: nouveaufb (fb0) is primary device
fb0: nouveaufb frame buffer device
Initialized nouveau 0.0.16 20090420 for 0000:0c:00.0 on minor 0

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
