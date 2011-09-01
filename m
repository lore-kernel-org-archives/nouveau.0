From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40548] New: Displayport not working on NV50
Date: Thu,  1 Sep 2011 07:28:23 -0700 (PDT)
Message-ID: <bug-40548-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40548

           Summary: Displayport not working on NV50
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: felipe.contreras-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


This is what I get when I plug it in:

[ 1065.198294] [drm] nouveau 0000:01:00.0: plugged DP-1
[ 1070.813104] [drm] nouveau 0000:01:00.0: unplugged DP-1
[ 1070.937571] [drm] nouveau 0000:01:00.0: plugged DP-1
[ 1072.928409] [drm] nouveau 0000:01:00.0: unplugged DP-1
[ 1072.929480] [drm] nouveau 0000:01:00.0: plugged DP-1
[ 1099.207135] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 125
[ 1099.207138] Raw EDID:
[ 1099.207141] <3>00 ff ff ff ff ff ff 00 10 ac 0f a0 53 48 36 30 
............SH60
[ 1099.207142] <3>24 0f 01 03 0e 34 21 78 ee ee 50 a3 54 4c 9b 26 
$....4!x..P.TL.&
[ 1099.207143] <3>0f 50 54 a5 4b 00 81 80 a9 40 71 4f b3 00 01 01 
.PT.K....@qO....
[ 1099.207144] <3>01 01 01 01 01 01 28 3c 80 a0 70 b0 23 40 30 20 
......(<..p.#@0 
[ 1099.207146] <3>36 00 07 44 21 00 00 1a 00 00 00 ff 00 4d 36 37 
6..D!........M67
[ 1099.207147] <3>35 34 35 38 56 30 36 48 53 20 00 00 00 fc 00 44  5458V06HS
.....D
[ 1099.207148] <3>45 4c 4c 20 30 00 00 5f ff ff ff ff ff ff ff ff  ELL
0.._........
[ 1099.207149] <3>ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
................
[ 1099.207150] 
[ 1107.718299] [drm] nouveau 0000:01:00.0: unplugged DP-1

I don't see anything particular on X.org, but xrandr throws this:

xrandr: cannot find crtc for output DP-1

I'm using Linux 3.0.3, and nouveau git 8378443.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
