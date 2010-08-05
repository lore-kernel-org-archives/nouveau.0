From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29403] New: [nvac] attempting to use displayport
 freezes machine
Date: Wed,  4 Aug 2010 23:34:30 -0700 (PDT)
Message-ID: <bug-29403-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29403

           Summary: [nvac] attempting to use displayport freezes machine
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=37579)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=37579)
dmesg output from startup

I've got a MacBookAir2,1 with an NVAC/9400M.  LVDS works fine with the patch
from bug #29171, but whenever I plug my Dell 2407FPW in via a mini-DP -> DVI
adaptor, my log quickly fills up with:
Aug  5 16:21:09 tempa kernel: [drm] nouveau 0000:02:00.0: plugged DisplayPort-1
Aug  5 16:21:10 tempa kernel: [drm] nouveau 0000:02:00.0: 0xC542: parsing clock
script 0
Aug  5 16:21:10 tempa kernel: [drm] nouveau 0000:02:00.0: 0xBC68: parsing clock
script 1
Aug  5 16:21:10 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1
Aug  5 16:21:10 tempa kernel: [drm] nouveau 0000:02:00.0: plugged DisplayPort-1
Aug  5 16:21:10 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1
Aug  5 16:21:10 tempa kernel: [drm] nouveau 0000:02:00.0: DDC responded, but no
EDID for DisplayPort-1
Aug  5 16:21:10 tempa kernel: [drm] nouveau 0000:02:00.0: plugged DisplayPort-1
Aug  5 16:21:15 tempa kernel: [drm:drm_edid_block_valid] *ERROR* EDID checksum
is invalid, remainder is 84
Aug  5 16:21:15 tempa kernel: [drm:drm_edid_block_valid] *ERROR* Raw EDID:
Aug  5 16:21:15 tempa kernel: <3>00 ff ff ff ff ff ff 00 10 ac 2a a0 53 32 56
31  ..........*.S2V1
Aug  5 16:21:15 tempa kernel: <3>2b 12 01 03 80 34 20 78 ea b3 25 ac 51 30 b4
26  +....4 x..%.Q0.&
Aug  5 16:21:15 tempa kernel: <3>10 50 54 a5 4b 00 81 80 a9 40 71 4f 01 01 01
01  .PT.K....@qO....
Aug  5 16:21:15 tempa kernel: <3>01 01 01 01 01 01 28 3c 80 a0 70 b0 23 40 30
20  ......(<..p.#@0 
Aug  5 16:21:15 tempa kernel: <3>36 00 07 44 21 00 00 1a 00 00 00 ff 00 47 32
39  6..D!........G29
Aug  5 16:21:15 tempa kernel: <3>31 48 38 41 4d 31 56 32 53 0a 00 00 00 fc 00
44  1H8AM1V2S......D
Aug  5 16:21:15 tempa kernel: <3>45 4c 4c 20 32 34 30 38 57 46 50 0a 00 00 10
ff  ELL 2408WFP.....
Aug  5 16:21:15 tempa kernel: <3>ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff  ................
Aug  5 16:21:15 tempa kernel:
Aug  5 16:21:46 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1
Aug  5 16:21:47 tempa kernel: [drm] nouveau 0000:02:00.0: plugged DisplayPort-1
Aug  5 16:21:47 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1
Aug  5 16:21:47 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1
Aug  5 16:21:47 tempa kernel: [drm] nouveau 0000:02:00.0: plugged DisplayPort-1
Aug  5 16:21:48 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1

Aug  5 16:21:49 tempa kernel: [drm] nouveau 0000:02:00.0: plugged DisplayPort-1
Aug  5 16:21:51 tempa kernel: [drm] nouveau 0000:02:00.0: DDC responded, but no
EDID for DisplayPort-1
Aug  5 16:22:04 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1
Aug  5 16:22:04 tempa kernel: [drm] nouveau 0000:02:00.0: plugged DisplayPort-1
Aug  5 16:22:04 tempa kernel: i2c i2c-3: sendbytes: NAK bailout.
Aug  5 16:22:04 tempa kernel: [drm] nouveau 0000:02:00.0: unplugged
DisplayPort-1

LVDS flickers a bit while this happens, and eventually the machine deadlocks. 
Let me know if you'd like any more logs, etc; I've attached the relevant parts
of dmesg from startup, but I'm not particularly sure it's useful.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
