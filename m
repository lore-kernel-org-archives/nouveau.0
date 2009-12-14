From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25639] New: NV43 (6600GT): Monitor goes blank during
	boot
Date: Mon, 14 Dec 2009 09:27:34 -0800 (PST)
Message-ID: <bug-25639-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25639

           Summary: NV43 (6600GT): Monitor goes blank during boot
           Product: xorg
           Version: 7.5
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pantherchen-t/9kahPp1Zsb1SvskN2V4Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32069)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32069)
output of dmesg

Using the latest git kernel tree (commit
91ed558e422465df7ea8f857785881a74528bb32), my CRT monitor loses the signal
during the boot (right after the firmware request). The system seems to boot
fine, though.

If I'm interpreting this right, the card switches to TV-out, but there is
nothing connected to the card's TV-out connector:

...
[    3.595456] [drm:edid_is_valid] *ERROR* Raw EDID:
...
[    3.697841] [drm:edid_is_valid] *ERROR* Raw EDID:
...
[    3.796737] [drm:edid_is_valid] *ERROR* Raw EDID:
...
[    3.894956] [drm:edid_is_valid] *ERROR* Raw EDID:
...
[    3.895062] nouveau 0000:05:00.0: VGA-1: EDID invalid.
[    3.895112] [drm] nouveau 0000:05:00.0: DDC responded, but no EDID for VGA-1
[    3.956043] [drm] nouveau 0000:05:00.0: Load detected on output B
[    3.956154] [drm] nouveau 0000:05:00.0: allocated 720x576 fb: 0x9000, bo
f6afc600
[    3.957190] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on CRTC 0
[    3.957200] [drm] nouveau 0000:05:00.0: vpll: n 20 m 3 log2p 1
[    3.957203] [drm] TV-10: set mode 720x576 26
[    3.957438] [drm] nouveau 0000:05:00.0: Setting dpms mode 0 on CRTC 0
[    3.967428] [drm] nouveau 0000:05:00.0: Setting dpms mode 0 on TV encoder
(output 3)
[    3.967439] [drm] nouveau 0000:05:00.0: Output TV-1 is running on CRTC 0
using output B
[    3.967570] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on CRTC 1
...

Full log attached.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
