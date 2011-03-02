From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34919] New: DVI Dock Connectors: Signal but not
	usable.
Date: Wed,  2 Mar 2011 05:33:46 -0800 (PST)
Message-ID: <bug-34919-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34919

           Summary: DVI Dock Connectors: Signal but not usable.
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: kirchmeyer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


When monitor(s) plugged into DVI port(s) (any combination), the monitor stays
black as if it has a signal (no check cable message) however they are not
available to use. xrandr does not report any DVI ports. Please let me know what
further information would be useful.

VGA seems to work...


xrandr 
Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 8192 x 8192
LVDS-1 unknown connection (normal left inverted right x axis y axis)
   1920x1200      60.0 +   59.9  
   1920x1080      60.0  
   1600x1200      59.9  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 connected 1680x1050+0+0 (normal left inverted right x axis y axis) 434mm
x 270mm
   1680x1050      59.9*+   60.0  
   1280x1024      75.0     60.0  
   1440x900       75.0     59.9  
   1280x960       60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   832x624        74.6  
   800x600        75.0     60.3     56.2  
   640x480        75.0     60.0  
   720x400        70.1  





dmesg | grep drm
[drm] Initialized drm 1.1.0 20060810
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x092f00a2)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 62.92.5a.00
[drm] nouveau 0000:01:00.0: TMDS table version 2.0
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02011300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 01122306 0f220d00
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 01122302 00020d00
[drm] nouveau 0000:01:00.0: Raw DCB entry 4: 02133316 0f320e00
[drm] nouveau 0000:01:00.0: Raw DCB entry 5: 02133312 00120e00
[drm] nouveau 0000:01:00.0: Raw DCB entry 6: 0000000e 00000000
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16 4
[drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
[drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
[drm] nouveau 0000:01:00.0:   2: 0x00005246: type 0x46 idx 2 tag 0x07
[drm] nouveau 0000:01:00.0:   3: 0x0000a346: type 0x46 idx 3 tag 0x08
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xCF9A
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xD4E5
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xE24D
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xE34B
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xE5B3
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xE618
[drm] nouveau 0000:01:00.0: 0xE618: Condition still not met after 20ms,
skipping following opcodes
[drm] nouveau 0000:01:00.0: 4 available performance level(s)
[drm] nouveau 0000:01:00.0: 0: memory 100MHz core 200MHz shader 400MHz voltage
850mV fanspeed 100%
[drm] nouveau 0000:01:00.0: 1: memory 301MHz core 275MHz shader 550MHz voltage
850mV fanspeed 100%
[drm] nouveau 0000:01:00.0: 2: memory 301MHz core 383MHz shader 767MHz voltage
850mV fanspeed 100%
[drm] nouveau 0000:01:00.0: 3: memory 799MHz core 550MHz shader 1375MHz voltage
1000mV fanspeed 100%
[drm] nouveau 0000:01:00.0: c: memory 300MHz core 275MHz shader 1100MHz
[drm] nouveau 0000:01:00.0: Detected 1024MiB VRAM
[drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: Off-chip encoder 6/0 unsupported
[drm] nouveau 0000:01:00.0: Off-chip encoder 2/0 unsupported
[drm] nouveau 0000:01:00.0: Off-chip encoder 6/1 unsupported
[drm] nouveau 0000:01:00.0: Off-chip encoder 2/1 unsupported
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
[drm] nouveau 0000:01:00.0: ACPI backlight interface available, not registering
our own
[drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x60000000, bo
ffff88040d20a400
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
[drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid, remainder is 92
[drm:drm_edid_block_valid] *ERROR* Raw EDID:
[drm] nouveau 0000:01:00.0: DDC responded, but no EDID for VGA-1
[drm] nouveau 0000:01:00.0: DDC responded, but no EDID for VGA-1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
