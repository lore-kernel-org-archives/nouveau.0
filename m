From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15206] New: [dualhead, randr12,
 ppc] Second head displays nothing
Date: Wed, 26 Mar 2008 01:34:09 -0700 (PDT)
Message-ID: <bug-15206-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15206

           Summary: [dualhead, randr12, ppc] Second head displays nothing
           Product: xorg
           Version: unspecified
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15469)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15469)
Xorg.0.log

On my PPC, trying to get dualhead working. I get nothing at all on the second
display - the LCD thinks that there is no signal. xrandr does show two devices,
but xrandr --auto does not active the second head at all.

Platform: PPC64 (G5) w/ 32-bit userspace.
Distro: Gentoo
xf86-video-nouveau git commit: 6924d1ac900524d0978a02f8f8509faab1809b62
x11-drm git commit: a244d2905052d3263bdcc26b295558a354702b89

Graphics card (lspci -nn -s): 
2:0000:0b:00.0 VGA compatible controller: nVidia Corporation NV43 [GeForce
6600] (rev a2)

Display devices:
2x Samsung SyncMaster 206BW.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
