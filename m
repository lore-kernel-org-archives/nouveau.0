From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20006] New: powerpc64: Black screen using RandR12
Date: Sun,  8 Feb 2009 03:10:14 -0800 (PST)
Message-ID: <bug-20006-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20006

           Summary: powerpc64: Black screen using RandR12
           Product: xorg
           Version: 7.4
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bmaass-o02PS0xoJP/7u6qtEXMtuoQuADTiUCJX@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=22680)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22680)
Xorg log

Enabling Option RandR12 in xorg.conf results in black screen. Server starts up
fine, seems to be usable, only screen stays black. Monitor doesn't turn off.

VT switching works, albeit with picture degradation (bad resolution?) which
isn't recovered even when killing X (also, crash on killing X, with or without
RandR12, see messages).

Operating system: Gentoo Linux ppc64 with 64bit userland (problem the same on
32bit userland).

Hardware: Apple G5 with DVI-only GeForce7800GT PCI-E Apple OEM version, screen
is a Dell 30 inch 2560x1600 display on DVI connector 1.

drm commit: 97fdadee6a79f9406a55c235ee46104814321152
xf86-video-nouveau commit: 98b8cada6c355d437925a92ef0413e96751ed567

Legacy render path with RandR12 disabled works fine.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
