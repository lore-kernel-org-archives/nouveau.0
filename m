From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24780] 2 second delay during boot using nouveau
Date: Sat, 31 Oct 2009 11:08:03 -0700 (PDT)
Message-ID: <20091031180803.EE77F1300C0@annarchy.freedesktop.org>
References: <bug-24780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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





--- Comment #2 from Kai Ruhnau <kai.bugs.freedesktop.org-pRuQC+10xW7Pw1Vld6UZv03ROdm4KHy8@public.gmane.org>  2009-10-31 11:08:02 PST ---
I also have this issue:

[    0.350330] Non-volatile memory driver v1.3
[    0.350503] Linux agpgart interface v0.103
[    0.350643] [drm] Initialized drm 1.1.0 20060810
[    0.350812] nouveau 0000:01:00.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
[    0.350922] nouveau 0000:01:00.0: setting latency timer to 64
[    0.354749] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x450300a2)
[    0.355891] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    0.423911] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    0.424023] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    0.424123] [drm] nouveau 0000:01:00.0: Bios version 60.80.0a.00
[    0.424225] [drm] nouveau 0000:01:00.0: BIT table 'A' not found
[    0.424329] [drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not
currently supported
[    0.424472] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 4.0
[    0.424615] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 04000320 00000028
[    0.424721] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01000322 00000030
[    0.424828] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02011310 00000028
[    0.424934] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 02011312 00000030
[    0.425053] [drm] nouveau 0000:01:00.0: Raw DCB entry 4: 010223f1 00c0c0c3
[    0.425167] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xB60D
[    0.449247] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xB7F6
[    0.453038] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xC9BB
[    0.453187] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xCA71
[    0.455104] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xCC28
[    0.455247] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xCC8D
[    2.555042] [drm] nouveau 0000:01:00.0: 0xCC8D: Condition still not met
after 2000ms, skipping following opcodes
[    2.555200] [drm] nouveau 0000:01:00.0: 0xA9BC: parsing output script 0
[    2.555317] [drm] nouveau 0000:01:00.0: 0xA9BC: parsing output script 0
[    2.555422] [drm] nouveau 0000:01:00.0: 0xA118: parsing output script 0
[    2.693022] [TTM] Zone  kernel: Available graphics memory: 1029030 kiB.
[    2.712834] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[    2.720590] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised
FIFO 1
[    2.721184] [drm] nouveau 0000:01:00.0: Detected a DAC output
[    2.721294] [drm] nouveau 0000:01:00.0: Detected a TMDS output
[    2.721395] [drm] nouveau 0000:01:00.0: Detected a DAC output
[    2.721496] [drm] nouveau 0000:01:00.0: Detected a TMDS output
[    2.721598] [drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
[    2.721700] [drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[    2.721954] [drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[    2.959582] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x40250000,
bo ffff88007e8e5e00
[    2.966078] [drm] TMDS-8: set mode 1280x1024 2a
[    2.966120] [drm] TMDS-10: set mode 1280x1024 2b
[    2.971401] Console: switching to colour frame buffer device 160x64
[    2.974631] fb0: nouveaufb frame buffer device
[    2.974651] registered panic notifier
[    2.974670] [drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on
minor 0
[    2.974738] [drm] nouveau 0000:01:00.0: 0xA9C0: parsing output script 1
[    2.974763] [drm] nouveau 0000:01:00.0: 0x7C8D: parsing clock script 0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
