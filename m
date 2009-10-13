From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24370] nouveau and xorg-server-1.7 does not work
 without NoAccel
Date: Tue, 13 Oct 2009 01:09:59 -0700 (PDT)
Message-ID: <20091013080959.89A8013005D@annarchy.freedesktop.org>
References: <bug-24370-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24370-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24370





--- Comment #3 from Peter Hjalmarsson <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org>  2009-10-13 01:09:58 PST ---
I redid this today when I relised that somehow CONFIG_CC_STACKPROTECT (or what
the config option for gcc flag -fstack-protector is called) probably was
enabled last time and I wanted to see if disabling made things work.

The nouveau linux-2.6 kernel freshly pulled (commit
2e68b1d4775b7b773334a4a9c6ef2358bfa85d42).
libdrm (commit a107e5b12960f64722bff424502a4fc0ad33dc8f) and xf86-video-nouveau
(commit 9cbc139176ae991150bd9ddf66b61db471b391f2) freshly pulled from git,
rebuild and installed.
with xorg-server-1.6 it works, with xorg-server-1.7.0{,.901} it fails

X dies with Assert (ret==0) error message.

This time I did it like this.

I have a file in /etc/modprobe.d that blacklists nouveau so I can control when
it will be loaded, adds modeset=1 to it, and adds debug=1 to the drm module.
I also did an [MARK] in the kernl log every time I did something.

I ssh into the machine.
modprobe nouveau
X &
(waited for the machine to settle) gdb --pid=`pidof X`

from another ssh:
DISPLAY=":0" gnome-session


and then I waited for X to crash.
It seems like every gtk+ app has problem displaying stuff. If I start xterm
instead of gnome-session xterm works as it should. No gtk+ apps show stuff it
should. And something gnom-session loads crashes nouveau.

kern.log, Xorg.log and gbd.txt will be find at this address since they are too
big for bugzilla.
http://xake.rymdraket.net/nouveau/


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
