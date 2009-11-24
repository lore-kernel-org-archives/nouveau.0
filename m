From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25258] New: [9400M] KMS and X do not use monitor's
 native resolution
Date: Tue, 24 Nov 2009 06:16:04 -0800 (PST)
Message-ID: <bug-25258-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25258

           Summary: [9400M] KMS and X do not use monitor's native resolution
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johannesobermayr-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Graphic card: Zotac IONITX (9400M)
Monitor: Hisense LCD2233EU -> HEC LCD2233EU?, native Resolution 1680x1050
Software: git20091123

KMS and X recognise my monitor with a native resolution of 1280x720. If I try
setting resolution to 1680x1050 in X it switches to 1280x1024.
My monitor cannot handle a resolution of 1280x720 -> some parts are "outside"
monitor's viewable area. 

Maybe https://bugs.freedesktop.org/show_bug.cgi?id=24861 is useful, too. I link
provided logs here:
dmesg:      https://bugs.freedesktop.org/attachment.cgi?id=30933
Xorg.0.log: https://bugs.freedesktop.org/attachment.cgi?id=30934
xorg.conf:  https://bugs.freedesktop.org/attachment.cgi?id=30935

The problem described there with VGA->VGA connection exists with this
mainboard, too.
Only HDMI->HDMI or DVI->HDMI connections work on console but with the described
wrong native resolution...

Logs for DVI->HDMI connection follow...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
