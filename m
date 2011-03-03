From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31676] garbled text after loading nouveau module on
 EFI boot; X driver thinks there are no connected outputs
Date: Thu,  3 Mar 2011 13:14:12 -0800 (PST)
Message-ID: <20110303211412.C1E9E130005@annarchy.freedesktop.org>
References: <bug-31676-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31676-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31676

--- Comment #13 from Armando Di Cianno <armando-Xv4Cf/eB9g3k1uMJSBkQmQ@public.gmane.org> 2011-03-03 13:14:12 PST ---
I can confirm this bug, and especially comment #10 - I have exactly the same
distortion in BIOS mode (not worrying about EFI here at the moment. As
expected, the binary blob NVIDIA drivers work just fine.

None of 2.6.35-gentoo-r5, or more importantly vanilla 2.6.37 or 2.6.36-rc7 work
with nouveau.

`dmesg |grep -e "drm" -e "nouveau" -e "nvidia"` on 2.6.38-rc7 looks like this:
#####
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:02:00.0: PCI INT A -> Link[LGPU] -> GSI 22 (level, low) -> IRQ 22
nouveau 0000:02:00.0: setting latency timer to 64
[drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x0af100a2)
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:02:00.0: ... appears to be valid
[drm] nouveau 0000:02:00.0: BIT BIOS found
[drm] nouveau 0000:02:00.0: Bios version 70.89.13.00
[drm] nouveau 0000:02:00.0: Pointer to BIT loadval table invalid
[drm] nouveau 0000:02:00.0: TMDS table version 2.0
[drm] nouveau 0000:02:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:02:00.0: Raw DCB entry 0: 040001b6 0f220010
[drm] nouveau 0000:02:00.0: Raw DCB entry 1: 020112a6 0f220010
[drm] nouveau 0000:02:00.0: Raw DCB entry 2: 02011262 00020010
[drm] nouveau 0000:02:00.0: Raw DCB entry 3: 0000000e 00000000
[drm] nouveau 0000:02:00.0: DCB connector table: VHER 0x40 5 16 4
[drm] nouveau 0000:02:00.0:   0: 0x00002047: type 0x47 idx 0 tag 0x08
[drm] nouveau 0000:02:00.0:   1: 0x00101146: type 0x46 idx 1 tag 0x07
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0x6A0C
[drm] nouveau 0000:02:00.0: 0x6CC8: Condition still not met after 20ms,
skipping following opcodes
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0x6E7D
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0x6E7F
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0x6EB4
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0x6F78
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offset 0x6FDD
[drm] nouveau 0000:02:00.0: 0x6FDD: Condition still not met after 20ms,
skipping following opcodes
[drm] nouveau 0000:02:00.0: 4 available performance level(s)
[drm] nouveau 0000:02:00.0: 0: memory 405MHz core 405MHz shader 405MHz voltage
900mV
[drm] nouveau 0000:02:00.0: 1: memory 450MHz core 450MHz shader 810MHz voltage
900mV
[drm] nouveau 0000:02:00.0: 2: memory 450MHz core 450MHz shader 810MHz voltage
900mV
[drm] nouveau 0000:02:00.0: 3: memory 450MHz core 450MHz shader 950MHz voltage
900mV
[drm] nouveau 0000:02:00.0: c: memory 0MHz core 550MHz shader 1400MHz
[drm] nouveau 0000:02:00.0: Detected 256MiB VRAM
[drm] nouveau 0000:02:00.0: Stolen system memory at: 0x00af000000
[drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
[drm] nouveau 0000:02:00.0: allocated 1366x768 fb: 0x60000000, bo
ffff88013a93fc00
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:02:00.0 on minor 0
ehci_hcd 0000:00:04.1: disable lpm/ppcd for nvidia mcp89
ehci_hcd 0000:00:06.1: disable lpm/ppcd for nvidia mcp89
mbp_nvidia_bl: MacBookAir 3,1 detected
Modules linked in: sco bnep rfcomm l2cap snd_hda_codec_hdmi
snd_hda_codec_cirrus snd_hda_intel snd_hda_codec snd_hwdep snd_pcm uvcvideo
snd_timer applesmc input_polldev mbp_nvidia_bl btusb snd snd_page_alloc mac_hid
rtc_cmos xfs exportfs jfs reiserfs raid10 raid456 async_raid6_recov
async_memcpy async_pq async_xor xor async_tx raid6_pq raid1 raid0 dm_snapshot
dm_mirror dm_region_hash dm_log scsi_wait_scan usbhid usb_storage hid_apple hid
bcm5974
#####

Happy to test any patches or suggestions.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
