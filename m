From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29729] New: VT/Frame Buffer Blank..X screens are
 cloned instead of one virtual screen
Date: Sat, 21 Aug 2010 15:54:25 -0700 (PDT)
Message-ID: <bug-29729-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29729

           Summary: VT/Frame Buffer Blank..X screens are cloned instead of
                    one virtual screen
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shaun.reich-sVbgdUKTYbrR7s880joybQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I believe this occurred because of a system upgrade..but I can't exactly
pinpoint it from the pacman logs. It could have occurred when linux-firmware
was upgraded, I am really unsure.

Basically, I am running kernel26 2.6.35.2 on ArchLinux, linux-firmware
20100807, and have tried xf86-video-nouvea-git (the AUR package) as of (now).

So..my computer boots up, vesa fb takes over initially, as usual. Then right
when nouveau normally loads, my display(s) go into a power-off state. (amber
light).

I can login (fyi, I boot straight to terminal and manually run startx) and call
startx. KDE4 then starts up properly and I can use kwin effects perfectly as
usual (like present windows) via xrender.

Also, what is weird, is my displays are clones of each other instead of being
one whole virtual screen, like I have set in my xorg.conf (and have not
changed).

For anything else, just ask..obviously I'm anxious to get this fixed,
especially since college starts very soon ;-)

Attached is xorg.conf. more incoming.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
