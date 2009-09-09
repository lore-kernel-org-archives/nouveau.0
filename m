From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23813] New: [KMS] Dual-Head not working on NV50
Date: Wed,  9 Sep 2009 08:13:08 -0700 (PDT)
Message-ID: <bug-23813-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23813

           Summary: [KMS] Dual-Head not working on NV50
           Product: xorg
           Version: 7.4
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: me-OOeHgxleHsGsTnJN9+BGXg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                CC: me-OOeHgxleHsGsTnJN9+BGXg@public.gmane.org


Created an attachment (id=29351)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=29351)
lspci --vvs 01:00.0

Dual-Head is not working on my NV50.

If hot-plugging the second display and xrandr-enabling it, both screens do not
get any signal. switching (or trying to switch) to another vt does not work
(still does not display anything). Keyboard LEDS still work, but no keystroke
does anything. XRandR shows correct information for both displays though.

If cold-plugging, there it does not display anything either (in plymouth,
then).

In either case the System is still responding to ssh and can be shutdown
gracefully. There is no error in dmesg and Xorg.0.log.

I might test this with an uptodate nouveau-drm and x11-drv-nouveau next week,
but I cannot promise I will have the time.

Some details:
. both displays connected with DVI-I (e.g. DVI-I-0 and DVI-I-1)
. using Fedora 11, uptodate on 9th september 09, with packages
xorg-x11-drv-nouveau-0.0.12-40.20090528git0c17b87.fc11.x86_64
xorg-x11-server-Xorg-1.6.1.901-1.fc11.x86_64
kernel-2.6.30.5-43.fc11.x86_64


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
