From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51971] MacBook Pro 10, 1 Retina - Display Resets,
	No Connectors
Date: Wed, 11 Jul 2012 12:18:34 +0000
Message-ID: <bug-51971-8800-ORwQoBAB7u@http.bugs.freedesktop.org/>
References: <bug-51971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51971

--- Comment #5 from Ryan Bourgeois <bluedragonx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-07-11 05:18:34 PDT ---
Created attachment 64094
  --> https://bugs.freedesktop.org/attachment.cgi?id=64094
drm.debug=0x04 during screen reset

I've attached the output of dmesg during a screen reset with drm.debug=0x04. It
looks like DRM is receiving a hotplug event indicating that the connector eDP-2
has been unplugged. This disconnects the display. Then nouveau, seeing that
eDP-2 has been force enabled, reconnects the display.

So now I'm fairly certain that solving the disconnected connector issue will
fix the every-9-seconds screen blanking.

The fun starts at line 1504:

[ 1860.869890] [drm:output_poll_execute], [CONNECTOR:15:eDP-2] status updated
from 1 to 2
[ 1860.900386] [drm:output_poll_execute], [CONNECTOR:17:DP-1] status updated
from 2 to 2
[ 1860.930656] [drm:output_poll_execute], [CONNECTOR:20:DP-2] status updated
from 2 to 2
[ 1860.931886] [drm:output_poll_execute], [CONNECTOR:23:HDMI-A-1] status
updated from 2 to 2
[ 1860.932011] [drm:drm_fb_helper_hotplug_event], 
[ 1860.932013] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:15:eDP-2]
[ 1860.932016] [drm] nouveau 0000:01:00.0: nouveau_connector_native_mode:583 -
native mode from largest: 0x0@0
[ 1860.932023] [drm:drm_mode_debug_printmodeline], Modeline 25:"2880x1800" 0
325842 2880 3088 3400 3920 1800 1801 1804 1847 0x0 0x6
[ 1860.932026] [drm:drm_mode_prune_invalid], Not using 2880x1800 mode -3
[ 1860.932028] [drm:drm_mode_debug_printmodeline], Modeline 32:"1024x768" 0
65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[ 1860.932030] [drm:drm_mode_prune_invalid], Not using 1024x768 mode 15
[ 1860.932032] [drm:drm_mode_debug_printmodeline], Modeline 31:"848x480" 0
33750 848 864 976 1088 480 486 494 517 0x40 0x5
[ 1860.932034] [drm:drm_mode_prune_invalid], Not using 848x480 mode 15
[ 1860.932035] [drm:drm_mode_debug_printmodeline], Modeline 30:"800x600" 0
40000 800 840 968 1056 600 601 605 628 0x40 0x5
[ 1860.932038] [drm:drm_mode_prune_invalid], Not using 800x600 mode 15
[ 1860.932039] [drm:drm_mode_debug_printmodeline], Modeline 29:"800x600" 0
36000 800 824 896 1024 600 601 603 625 0x40 0x5
[ 1860.932041] [drm:drm_mode_prune_invalid], Not using 800x600 mode 15
[ 1860.932042] [drm:drm_mode_debug_printmodeline], Modeline 28:"640x480" 0
25175 640 656 752 800 480 489 492 525 0x40 0xa
[ 1860.932044] [drm:drm_mode_prune_invalid], Not using 640x480 mode 15
[ 1860.932046] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:17:DP-1]
[ 1860.962546] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:17:DP-1] disconnected
[ 1860.962549] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:20:DP-2]
[ 1860.992829] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:20:DP-2] disconnected
[ 1860.992830] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:23:HDMI-A-1]
[ 1860.994059] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:23:HDMI-A-1] disconnected
[ 1860.994060] [drm:drm_setup_crtcs], 
[ 1860.994062] [drm:drm_enable_connectors], connector 15 enabled? yes
[ 1860.994063] [drm:drm_enable_connectors], connector 17 enabled? no
[ 1860.994064] [drm:drm_enable_connectors], connector 20 enabled? no
[ 1860.994066] [drm:drm_enable_connectors], connector 23 enabled? no
[ 1860.994067] [drm:drm_target_preferred], looking for cmdline mode on
connector 15
[ 1860.994070] [drm:drm_target_preferred], found mode 2880x1800
[ 1860.994071] [drm:drm_setup_crtcs], picking CRTCs for 8192x8192 config
[ 1860.994073] [drm:drm_setup_crtcs], desired mode 2880x1800 set on crtc 11
[ 1860.994076] [drm:drm_crtc_helper_set_config], 
[ 1860.994077] [drm:drm_crtc_helper_set_config], [CRTC:11] [FB:27]
#connectors=1 (x y) (0 0)
[ 1860.994081] [drm:drm_crtc_helper_set_config], crtc changed, full mode switch
[ 1860.994083] [drm:drm_crtc_helper_set_config], [CONNECTOR:15:eDP-2] to
[CRTC:11]
[ 1860.994084] [drm:drm_crtc_helper_set_config], attempting to set mode from
userspace
[ 1860.994085] [drm:drm_mode_debug_printmodeline], Modeline 26:"2880x1800" 0
325842 2880 3088 3400 3920 1800 1801 1804 1847 0x0 0x6
[ 1860.994089] [drm:drm_crtc_helper_set_mode], [CRTC:11]

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
