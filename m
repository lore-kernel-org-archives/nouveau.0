From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15206] [dualhead, randr12,
	ppc] Second head displays nothing
Date: Thu,  5 Jun 2008 11:22:33 -0700 (PDT)
Message-ID: <20080605182233.BAA52130052@annarchy.freedesktop.org>
References: <bug-15206-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15206-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15206


Paulo R. Zanoni <przanoni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |przanoni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #6 from Paulo R. Zanoni <przanoni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-06-05 11:22:32 PST ---
I also have this problem, but on x86.

If I open 1 xserver with 2 nouveau screens, one of the screens will open
normally and the other will get black. X won't put anything wrong on the log
(as if everything started normally).

Then, if I open an X client and then kill it (like: DISPLAY=:0.0 xterm, and
then ctrl+c) the Xserver will crash, and will print something like this:

(EE) NOUVEAU(0): [DRI] Locking deadlock.
        Already locked with context 136431004,
        trying to lock with context 2.
(EE) NOUVEAU(0): Error creating device

Fatal server error:
AddScreen/ScreenInit failed for driver 0


Should "2" be a pointer? Unitialized variable problem?


My xorg.conf is configured to open a screen for each output.



I also discovered that if I use one nouveau in one screen and nv in the other,
the same problem will happen.

There is also a related problem that might have the same cause:
If I open 1 xserver with a nouveau screen and a radeonhd screen, both screens
will open normally, but when I kill an X client (like opening an xterm and then
killing it) the machine will freeze, and won't even respond to ping!

Since both events are triggered when a client dies, they might have the same
cause. Maybe they are not related.

Cards I used to test:
GeForce 7300
GeForce fx 5500

And the ATI mentioned as a RS690 (X1200).

Nouveau version is the most recent
today.(e034616ab2bbbc486f90c5f64e2bd2de194cf92e)


Pieces of xorg.conf:
#### nvidia1 DVI-to-VGA + VGA ####
Section "Device"
    Identifier     "nvidia1"
    Driver         "nouveau"
    BusID          "PCI:2:0:0"

    Option "monitor-DVI-A-0" "nvidia1-DVI"
    Option "monitor-VGA-0"   "nvidia1-VGA"
EndSection

Section "Monitor"
    Identifier "nvidia1-DVI"
    Option "PreferredMode" "1024x768"
    Option "Enable" "true"
EndSection

Section "Monitor"
    Identifier "nvidia1-VGA"
    Option "PreferredMode" "1024x768"
    Option "Enable" "true"
    Option "RightOf" "nvidia1-DVI"
EndSection

#### nvidia2 DVI cable + VGA####
Section "Device"
    Identifier     "nvidia2"
    Driver         "nouveau"
    BusID          "PCI:3:1:0"

    Option "monitor-DVI-A-0" "nvidia2-DVI"
    Option "monitor-VGA-0"   "nvidia2-VGA"
EndSection

Section "Monitor"
    Identifier "nvidia2-DVI"
    Option "PreferredMode" "1024x768"
    Option "Enable" "true"
EndSection

Section "Monitor"
    Identifier "nvidia2-VGA"
    Option "PreferredMode" "1024x768"
    Option "Enable" "true"
    Option "RightOf" "nvidia2-DVI"
EndSection


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
