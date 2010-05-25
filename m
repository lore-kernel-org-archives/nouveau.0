From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28248] New: the system completely freezes when
	playing videos
Date: Tue, 25 May 2010 12:18:08 -0700 (PDT)
Message-ID: <bug-28248-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28248

           Summary: the system completely freezes when playing videos
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bastien0705-YDxpq3io04c@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=35849)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=35849)
Kernel log from boot. The issue occurs at 19:02.

Hi,
First, sorry if I make mistakes, English isn't my native language.

I'm experiencing an annoying issue since I use Nouveau driver (which I keep
up-to-date).
Sometimes, when I'm playing a video, my screen completely freezes. I can still
move the cursor (which keeps the same appearance) but I can't do anything else.
Ctrl-Alt-Backspace doesn't restart X, and Ctrl-Alt-Fn doesn't bring me to a
console. The sound stops too. I have to manually shutdown the computer.
This bug occurs whith any player (mplayer, vlc...). It doesn't occur with
videos embedded in a Flash plugin. I would say this happens half the time,
often during the first seconds.

I'm using Debian Sid for amd64. My graphic card is a GeForce 8200.
I have RandR enabled and two monitors.

I attach my kernel log. The issue occurs at 19:02. These are the most useful
lines :
May 25 19:02:25 Igloo kernel: [43778.248875] [drm] nouveau 0000:02:00.0:
PFIFO_DMA_PUSHER - Ch 2
May 25 19:02:25 Igloo kernel: [43778.250999] [drm] nouveau 0000:02:00.0:
PGRAPH_DATA_ERROR - Ch 2/5 Class 0x8397 Mthd 0x0e08 Data 0x00000000:0x3f4c0000
May 25 19:02:25 Igloo kernel: [43778.251006] [drm] nouveau 0000:02:00.0:
PGRAPH_DATA_ERROR - INVALID_VALUE

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
