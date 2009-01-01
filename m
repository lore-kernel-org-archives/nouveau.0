From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19356] New: DPMS does not turn off LCD backlight on
 NV34M [ GeForce FX Go5200]
Date: Thu,  1 Jan 2009 04:26:30 -0800 (PST)
Message-ID: <bug-19356-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19356

           Summary: DPMS does not turn off LCD backlight on NV34M [GeForce
                    FX Go5200]
           Product: xorg
           Version: unspecified
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: m@tacker.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Expected:
$ xset -display :0 dpms force off
should turn off LCD backlight

Actual Result:
Screen is black, but LCD backlight stays on

Workaround:
Use nv driver, which handles the powersaving correctly.

Extract vom Xorg.0.log:
(II) Loading extension DPMS
(II) NOUVEAU(0): DPMS capabilities: Off; RGB/Color Display
(**) Option "dpms" "true"
(**) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): Setting dpms mode 3 on tmds encoder (output 0)
(II) NOUVEAU(0): Setting dpms mode 3 on CRTC 0

Using gentoo ebuilds from 
http://svn.hboeck.de/nouveau-overlay (r60)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
