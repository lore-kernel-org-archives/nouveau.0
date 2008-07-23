From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16815] New: losing fonts in gnome-terminal and other
 font weirdnesses
Date: Wed, 23 Jul 2008 03:07:14 -0700 (PDT)
Message-ID: <bug-16815-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16815

           Summary: losing fonts in gnome-terminal and other font
                    weirdnesses
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=17832)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17832)
my xorg.conf

losing fonts in gnome-terminal and other font weirdnesses

Using a NV86, nouveau/master, nouveau/drm/gallium and xserver 1.4.2.
losing fonts in gnome-terminal and firefox adress bar after a while
I used to have problem with fonts, but it was fixed with commit
022a9ed5c2657466dd2471a1b29d5e8bc92ca57a "nv50: no more sync in composite()
:)".

Now I'm observing that gnome-terminal is slightly loosing fonts over the time.
Let me explain.

At first, the display is all correct, but after a few hours, text is beginning
to disappear. I noticed that the colored text is the more likely to disappear
first. Selecting the text may help to see the characters. A new gnome-terminal
opened (window not tab) does not have this problem, while the other remains
"ill".

I'm using gnome and the option "Composite" is enable in xorg.conf.

I found out that running "xcompmgr" is 90% of the time fixing the problem.

Another symptom: the Python TK interpreter, "idle" is all scrambled (screenshot
to attach).

In metacity windows, the titlebar sometimes goes like bold. It seems like the
same text is written twice with a slight shift. I attach a screenshot as soon
as it appears.

In firefox, the text of the address bar is disappearing (or turning white?)
when firefox is open for a while. Sometimes the text of the user interface
(which is more or less a Gnome application thanks to integration) is turning
white. It generally comes back by itself after a moment (or when redrawing the
screen?).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
