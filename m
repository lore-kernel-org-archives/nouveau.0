From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36167] New: Suspend does not work with Geforce7600
 GT and kernel2.6.38
Date: Tue, 12 Apr 2011 08:25:35 -0700 (PDT)
Message-ID: <bug-36167-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36167

           Summary: Suspend does not work with Geforce7600 GT and
                    kernel2.6.38
           Product: xorg
           Version: 7.6
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: otto.allmendinger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=45529)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45529)
messages.log

Going into suspend with gnome3, the display fades to black, then appears normal
for a second (not sure if this is relevant), and then is turned off.

When coming back from suspend, the display is garbled with black and white
stripes (see screenshot). Xorg crashes, then my gdm service restarts with
garbled display.

Additionally the ttys on ctrl-alt-f1..6 are slightly distorted too, but not as
much.

This is when using one display. When connecting my second display, the system
doesn't go into suspend mode at all but hangs on what seems like the display of
tty7 (not sure - there is only a black screen with a '_' character in the
upper-left corner). Sysrq-keys won't work and I have to do a hard reset.

When I have two displays connected, I can go into suspend mode by switching to
a tty, killing X and using pm --suspend, but after resume the system behaves
like when resuming with one monitor connected.

Everything else seems to work fine


Software versions:

Arch Linux using [testing] repository

kernel 2.6.38
xf86-video-noveau-git version from today
xorg-server 1.10.0.902-1
nouveau-dri 7.10.2-2 (git version takes too long to check out - sorry)

messages.log, lspci.txt and Xorg.0.log  as attachment

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
