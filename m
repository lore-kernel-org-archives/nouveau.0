From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40938] New: Garbage on screen during "animations"
Date: Fri, 16 Sep 2011 06:09:32 -0700 (PDT)
Message-ID: <bug-40938-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40938

           Summary: Garbage on screen during "animations"
           Product: xorg
           Version: unspecified
          Platform: All
        OS/Version: other
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: aurelien-KAXVyhDHzBc@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=51261)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=51261)
Garbage when the screensaver starts

When menu appears or when the screensaver starts garbage are showed on screen.
I'm using nouveau in version 20110303 with xorg v 1.10.4 and my nvidia card is:
01:00.0 VGA compatible controller: nVidia Corporation G98M [Quadro NVS 160M]
(rev a1).

The first attachment has been taken when the screen saver just begun. The
garbage is located on the top and on the bottom of the picture (note that the
horizontal lines you can see inside the picture is normal.)

The second attachment has been taken when a terminal (yakuake) was opening from
the top of the screen. This garbage appears when the terminal is "falling
down". Once this animation is finished the terminal appears fine.

It's the same with menus when they appear with fading: during the fading there
is garbage and once it's over the menu appears fine.

Finaly I always seen this problem with nouveau driver and don't have it with
the proprietary nvidia driver.

AS far as I can imagine I guess this is a small bug concerning an uninitialized
buffer?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
