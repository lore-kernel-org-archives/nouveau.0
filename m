From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19986] New: Nouveau (20090116) fails to load on a
 PowerPC Pegasos 2 ( OF) using a Quaddro FX 1100 (AGP)
Date: Fri,  6 Feb 2009 03:29:48 -0800 (PST)
Message-ID: <bug-19986-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19986

           Summary: Nouveau (20090116) fails to load on a PowerPC Pegasos 2
                    (OF) using a Quaddro FX 1100 (AGP)
           Product: xorg
           Version: 7.4
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: markos-VYMTaqK72Q4@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=22638)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22638)
xorg.conf

Nouveau fails while loading BIOS signature and afterwards it fails to produce a
list of valid modes:

(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module
version 0.0.11
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to load BIOS image from PRAMIN
(!!) NOUVEAU(0): ... BIOS signature not found
(EE) NOUVEAU(0): No valid BIOS image found

...

(WW) NOUVEAU(0): No outputs definitely connected, trying again...
(WW) NOUVEAU(0): Unable to find initial modes
(EE) NOUVEAU(0): 1373: No valid modes.

The 'nv' driver works (no binary driver available for powerpc) on this
box/card.

Attached: xorg.conf, Xorg.log, dmesg output.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
