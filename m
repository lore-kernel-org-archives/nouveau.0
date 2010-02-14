From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26568] New: Xv Corruption and X Lockup w/ Nouveau on
 C51 (Geforce 6150 Go)
Date: Sun, 14 Feb 2010 15:57:49 -0800 (PST)
Message-ID: <bug-26568-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26568

           Summary: Xv Corruption and X Lockup w/ Nouveau on C51 (Geforce
                    6150 Go)
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: circular-AMv+oqoGJ4vR7s880joybQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I've spent some quality time with my HP tx2000 laptop this weekend because many
of the bugs I've previously reported here were still present in the mid-January
kernel/drm/ddx software that I had been using.  But they do not always appear
and performance is definitely better than the stock F12 packages (or any 
available updates) So, before coming back to you with an new bug entry, I 
updated everything to the latest versions I could get to verify that the bugs
are present in the most recent work:

So, on my HP tx2000 running the C51 chipset I am running Fedora 12 updated as
follows:

kernel-2.6.32.8-48.rc2.fc12 from koji
nouveau master snapshot on 12-Feb-2010
libdrm pulled from git on 13-Feb-2010
nouveau xorg ddx pulled from git on 13-Feb-2010
firmware from 29-Dec-2009
x server xorg-x11-server-1.7.4-3.fc12

Everything is compiled and installed (with a properly updated initramfs).

Here's the main problem I'm seeing: xv does not always work.  I'm using xine
(or the xine backend for kde players).  I have a number of mpeg2 vids captured
with mythtv or home movies I am putting on DVD.  I can play any video with xshm
with no problem.  With xv, 480i and 720p -usually- work.  I've found an odd
pattern for these videos.  If I boot the system with only my wifi connection
active, things these videos will play fine.  If I boot with my GigE connection
active, they flicker.  1080i files never work... they always flicker.

If I log out of my X session and the last video I've played was flickering, the
console is toast.  I can log on/off multiple times when I haven't seen the
corruption, -or- if I can play a clean low-res video after the flickering
video.
But if my last video played with xv flickers and I log off the system, kdm
can't
re-show the login screen.  I momentarily see the text console, then nothing.

When I have the system on the network, I can ssh in even when the laptop is in 
this state and see that X is using 100% of the processor (but the screen is
absolutely blank).  If I go to init 3 or otherwise kill the X process (and kdm
so it doesn't respawn), the LCD screen goes kind of cloudy, but I cannot get
back to a text console.

The only way to regain the local display at this point is a reboot, after
which everything works again.  I'm including my /var/log/messages and an Xorg
log, but I don't know that either is showing a clear indication of the problem.

The flickering video doesn't seem to be the only way to get this locked-up X
process, btw, but it is the most reliable method I have to reproduce the
behavior.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
