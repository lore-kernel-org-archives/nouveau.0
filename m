From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: =?utf-8?q?=5BBug_23291=5D_nv50=5Fprogram=2Ec=3A__In_fun?=
 =?utf-8?b?Y3Rpb24g4oCYY3Rvcl9pbW1k4oCZICwgIOKAmHLigJkgdW5kZWNsYXJlZCAo?=
 =?utf-8?q?first_use_in_this_function=29?=
Date: Fri, 14 Aug 2009 06:11:14 -0700 (PDT)
Message-ID: <20090814131114.6FD03130058@annarchy.freedesktop.org>
References: <bug-23291-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23291-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23291





--- Comment #2 from Steven Ward <STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>  2009-08-14 06:11:13 PST ---
Hi there,
        I'm sorry about that,here is some more detail.I'm currently using
Fedora 12 Rawhide Alpha.My Graphics Card is a Nividia Geforce 6,800 G.T,my
Monitor is a A.D.I Microscan G1,000.I compile D.R.M,The Nouveau Kernel Modules
from the nouveaulinux-2.6 repository,Mesa and the Nouveau Driver.All from their
respective git repositories.

The one I'm having trouble with(hence the error report for it),is from the Mesa
code.
The ./configure options are:
./configure --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin
--sbindir=/usr/sbin --datadir=/usr/share --sysconfdir=/etc
--includedir=/usr/include --libdir=/usr/lib --libexecdir=/usr/libexec
--localstatedir=/var --mandir=/usr/share/man --docdir=/usr/share/doc
--x-libraries=/usr/lib --enable-32-bit --enable-xcb --enable-gallium-nouveau
--with-x --with-dri-driverdir=/usr/lib/dri
--with-xorg-driver-dir=/usr/lib/xorg/modules/drivers
--with-state-trackers=dri,egl,xorg,glx,vega,g3dvl --enable-motif
--enable-gl-osmesa --with-osmesa-bits=32 --disable-gallium-intel
--disable-gallium-radeon --with-expat=/usr/lib
--with-demos=xdemos,demos,trivial,tests --with-dri-drivers=swrast,ffb 

I then run make,and that's where the Mesa code stops when I compile it.

If you need any other information,please let me know.

Regards,
       STEVE555


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
