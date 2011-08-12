From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40050] New: freezing nouveau,
 when playing videos on a 2nd screen
Date: Fri, 12 Aug 2011 12:26:48 -0700 (PDT)
Message-ID: <bug-40050-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40050

           Summary: freezing nouveau, when playing videos on a 2nd screen
           Product: xorg
           Version: 7.6
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: calestyo-Jy7UQHNrZ9Pk1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=50168)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50168)
kern.log

Hi.

Not sure whether this is related to the similar bugs I've reported recently,
neither whether it's related to the 2D or 3D part... so please be patient with
my report ;)

It happens on a Debian sid machine with Linux 3.0 and:
$ apt-cache show xserver-xorg | grep Version
Version: 1:7.6+7
apt-cache show xserver-xorg-core | grep Version
Version: 2:1.10.3-1
apt-cache show xserver-xorg-video-nouveau | grep Version
Version: 1:0.0.16+git20110411+8378443-1+b1
apt-cache show libdrm-nouveau1a | grep Version
Version: 2.4.26-1
apt-cache show libgl1-mesa-dri-experimental | grep Version
Version: 7.10.3-4

The GPU is a G94 [GeForce 9600 GT].
I have two screens attached, but  not via Xinerama or the like, but two
separate X screens.

When I play a video on the 2nd screen it quickly happens that nouveau/X
freezes,... keyboard no longer works, switching to console neither,.. mouse
works (but as everything is frozen,.. this is of little use.
It seems that the system in the back continues to run (see the SysRq messages
that are printed in the log).
SysRq also works (well at least +b).

The funny thing is, that is happens only very rarely (but also sometimes) that
the system freezes when I play a video on the 1st screen.

(btw: I used mplayer from Debian Multimedia)

Sometimes (but rarely) I see it already coming (the freeze),.. then strange
graphic erros appear on the screen (and the system has not yet frozen),... even
more rarely I can than trigger a clean shutdown.


Cheers,
Chris.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
