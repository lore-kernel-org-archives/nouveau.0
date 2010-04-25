From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27828] New: Changing mode repeatedly locks up card
Date: Sat, 24 Apr 2010 19:34:28 -0700 (PDT)
Message-ID: <bug-27828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27828

           Summary: Changing mode repeatedly locks up card
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: hramrach-aRb0bU7PRFPrBKCeMvbIDA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=35277)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=35277)
xrandr output

Due to bug 692 it is possible to manipulate DPI by resizing screen with xrandr.

Running the resizing script attached as attachment 35274 to bug 692 repeatedly
(like 5x) locks up the nouveau drm module.

kernel 2.6.34-rc5

nouveau 0.16 git 13c10430

[   13.000776] [drm] nouveau 0000:03:00.0: Allocating FIFO number 2
[   13.006362] [drm] nouveau 0000:03:00.0: nouveau_channel_alloc: initialised
FIFO 2
[ 2491.712196] [drm] nouveau 0000:03:00.0: EvoCh 0 Mthd 0x0000 Data 0x00000400
(0x0002 0x01)
[ 2670.359238] [drm] nouveau 0000:03:00.0: no space while committing crtc
[ 2670.431869] [drm] nouveau 0000:03:00.0: no space while hiding cursor
[ 2673.758246] [drm] nouveau 0000:03:00.0: no space while disconnecting SOR
[ 2673.821315] [drm] nouveau 0000:03:00.0: no space while hiding cursor
[ 2673.884453] [drm] nouveau 0000:03:00.0: no space while blanking crtc
[ 2673.947594] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on
crtc ffff8800bfae0800
[ 2675.531613] [drm] nouveau 0000:03:00.0: no space while disconnecting SOR
[ 2675.594721] [drm] nouveau 0000:03:00.0: no space while hiding cursor
[ 2675.657810] [drm] nouveau 0000:03:00.0: no space while blanking crtc
[ 2675.720830] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on
crtc ffff8800bfae6800
[ 2677.111435] [drm] nouveau 0000:03:00.0: no space while disconnecting SOR
[ 2677.174561] [drm] nouveau 0000:03:00.0: no space while hiding cursor
[ 2677.237587] [drm] nouveau 0000:03:00.0: no space while blanking crtc
[ 2677.300732] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on
crtc ffff8800bfae6800
[ 2678.680200] [drm] nouveau 0000:03:00.0: no space while disconnecting SOR
[ 2678.743350] [drm] nouveau 0000:03:00.0: no space while hiding cursor
[ 2678.806413] [drm] nouveau 0000:03:00.0: no space while blanking crtc

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
