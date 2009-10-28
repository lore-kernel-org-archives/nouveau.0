From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24780] New: 2 second delay during boot using nouveau
Date: Wed, 28 Oct 2009 16:43:32 -0700 (PDT)
Message-ID: <bug-24780-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24780

           Summary: 2 second delay during boot using nouveau
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: amade-dvG7DYx+7LWsTnJN9+BGXg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


There is 2 seconds od delay while booting kernel with nouveau driver.
Here is the revelant part of dmesg:

[    0.166495] Linux agpgart interface v0.103
[    0.166686] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.166692] ACPI: Power Button [PWRB]
[    0.166754] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.166757] ACPI: Power Button [PWRF]
[    0.167216] ACPI: SSDT 000000007ff8e0d0 00214 (v01    AMI   CPU1PM 00000001
INTL 20060113)
[    0.167504] processor LNXCPU:00: registered as cooling_device0
[    0.167799] ACPI: SSDT 000000007ff8e2f0 00143 (v01    AMI   CPU2PM 00000001
INTL 20060113)
[    0.168073] processor LNXCPU:01: registered as cooling_device1
[    0.168205] [drm] Initialized drm 1.1.0 20060810
[    0.168252] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.168257] nouveau 0000:01:00.0: setting latency timer to 64
[    0.170706] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x086100a2)
[    0.170970] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    0.219181] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    0.219184] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    0.219187] [drm] nouveau 0000:01:00.0: Bios version 60.86.34.00
[    0.219191] [drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not
currently supported
[    0.219194] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 4.0
[    0.219196] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 02000300 00000028
[    0.219199] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01000302 00100030
[    0.219201] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011320 00000028
[    0.219203] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 010223f1 00c0c080
[    0.219211] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xBC41
[    0.244973] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xBF5C
[    0.264062] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xCB9E
[    0.264072] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xCC90
[    0.266150] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xCE73
[    0.266154] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xCED8
[    2.366021] [drm] nouveau 0000:01:00.0: 0xCED8: Condition still not met
after 2000ms, skipping following opcodes
[    2.366031] [drm] nouveau 0000:01:00.0: 0xAED4: parsing output script 0
[    2.366035] [drm] nouveau 0000:01:00.0: 0xA564: parsing output script 0
[    2.439777] [TTM] Zone  kernel: Available graphics memory: 1028254 kiB.
[    2.439786] [drm] nouveau 0000:01:00.0: 256 MiB VRAM
[    2.460797] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    2.461613] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[    2.470273] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised
FIFO 1
[    2.470744] [drm] nouveau 0000:01:00.0: Detected a DAC output
[    2.470746] [drm] nouveau 0000:01:00.0: Detected a TMDS output
[    2.470748] [drm] nouveau 0000:01:00.0: Detected a DAC output
[    2.470750] [drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
[    2.470753] [drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[    2.470858] [drm] nouveau 0000:01:00.0: Detected a VGA connector
[    2.646392] [drm] nouveau 0000:01:00.0: allocated 1600x1200 fb: 0x40250000,
bo ffff88007fa3a000
[    2.647332] [drm] DAC-7: set mode 1600x1200 29
[    2.647766] [drm] nouveau 0000:01:00.0: 0x0FAF: parsing clock script 0
[    2.650949] Console: switching to colour frame buffer device 200x75
[    2.653054] fb0: nouveaufb frame buffer device
[    2.653056] registered panic notifier
[    2.653060] [drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on
minor 0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
