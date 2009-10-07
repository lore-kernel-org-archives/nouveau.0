From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24370] nouveau and xorg-server-1.7 does not work
 without NoAccel
Date: Wed,  7 Oct 2009 03:45:12 -0700 (PDT)
Message-ID: <20091007104512.5647813005C@annarchy.freedesktop.org>
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





--- Comment #2 from Peter Hjalmarsson <xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org>  2009-10-07 03:45:09 PST ---
Created an attachment (id=30139)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=30139)
backtrace of gdb X

Ok, this starts to get more fun.... When I startx it it runs for nearly a
minute, but then (more comment in the bottom).

Over ssh:

$ startx
xauth:  creating new authority file /home/xake/.serverauth.5061


X.Org X Server 1.7.0
Release Date: 2009-10-2
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.31-rc9 x86_64 
Current Operating System: Linux lillen 2.6.31-rc9 #1 SMP Wed Oct 7 12:18:32
CEST 2009 x86_64
Kernel command line: BOOT_IMAGE=/kernel root=/dev/mapper/System-root quiet
dolvm splash=verbose console=tty1
Build Date: 04 October 2009  01:27:35AM

Current version of pixman: 0.16.2
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Wed Oct  7 12:21:01 2009
(==) Using config file: "/etc/X11/xorg.conf"
Setting master 
record: RECORD extension enabled at configure time.
record: This extension is known to be broken, disabling extension now..
record: http://bugs.freedesktop.org/show_bug.cgi?id=20500
(EE) AIGLX error: dlopen of /usr/lib64/dri/nouveau_dri.so failed
(/usr/lib64/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
(EE) AIGLX: reverting to software rendering
resize called 1680 1050
The XKEYBOARD keymap compiler (xkbcomp) reports:
> Warning:          Type "ONE_LEVEL" has 1 levels, but <RALT> has 2 symbols
>                   Ignoring extra symbols
Errors from xkbcomp are not fatal to the X server
X: nouveau_pushbuf.c:289: nouveau_pushbuf_flush: Assertion `ret == 0' failed.
xinit:  connection to X server lost.

waiting for X server to shut down 


After this I did gdb X and it was stable.
I started xterm on this display, and it showed up and worked like it should.
I started gnome-session in this xterm.
The xterm-window stayed working, and gnome started to show up. Same problems as
before for the gnome apps. gnome-panel shows patilly some white rectangles,
with black dots in, same with the windows, the borders are all fine, but of the
rest there is not much drawn.

And then it crashes. I will attach a backtrace.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
