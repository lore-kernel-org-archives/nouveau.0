From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17835] New: nouveau incorrectly identifies DFP size,
 option Randr12 crashes X server
Date: Mon, 29 Sep 2008 23:50:50 -0700 (PDT)
Message-ID: <bug-17835-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17835

           Summary: nouveau incorrectly identifies DFP size, option Randr12
                    crashes X server
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: hpx-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=19299)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=19299)
Nouveau/X server crash + backtrace with Randr12

DFP is a Sharp LC-42D64U 1920x1080 LCD HDTV connected via a DVI->HDMI cable.

nouveau incorrectly detects this panel as 1320x768 and ignores the 1920x1080
modeline, then starts properly at 1360 x 768. Unfortunately this is not the
native resolution of this panel and it looks terrible.

After reading some other bug reports here it was suggested adding option
"Randr12" may resolve the problem. This causes the X server to crash with a
backtrace (see attachment)

Its also interesting to note that the NV driver gives this message in regards
to this panel:

(--) NV(0): Panel size is 1360 x 768
(II) NV(0): NOTE: This driver cannot reconfigure the BIOS-programmed size.
(II) NV(0): These dimensions will be used as the panel size for mode
validation.

and refuses to set 1920x1080 as well.

I will attach all the Xorg logs from nouveau as well as an EDID dump from the
display.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
