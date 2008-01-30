From: "Phillip Ezolt" <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Hacking 3D on the NV17
Date: Wed, 30 Jan 2008 11:25:30 -0500
Message-ID: <62cc563b0801300825k7b505f6drd2b9fe3ae662c884@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

Hi,
   I recently got access to an old NV17 card (my wife's old laptop) ,
and I would like to start hacking.

I grabbed the 1/20/08 fedora DRM + nouveau driver packages from
hughsie's fedora repo.
http://people.freedesktop.org/~hughsient/fedora/8/i386/
(Shame on me, I didn't build from git)

I installed mesa with:  'git clone
git://anongit.freedesktop.org/git/mesa/mesa', and compiled
with "make linux-dri-x86 DRI_DIRS=nouveau"

However, when I try to run any glx apps, with the appropriate LD paths
set, I get
"nouveau DRI driver expected DDX version 1-1.2.x but got version 2.1.6"

This agrees with my xorg.log:
"
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules//drivers/nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 2.1.6
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 1.2
"

The DDX expected value is hard coded in:
nouveau_screen.c:
...
__GLcontextModes *__driDriverInitScreen(__DRIscreenPrivate *psp)
{
        static const __DRIversion ddx_expected = { 1, 2, 0 };
...

Example:

"
[root@localhost lib]# export LD_LIBRARY_PATH=/home/ezolt/nouveau/mesa/lib/
[root@localhost lib]# export LIBGL_DRIVERS_PATH=/home/ezolt/nouveau/mesa/lib/
[root@localhost lib]# env DISPLAY=:0 glxinfo
name of display: :0.0
nouveau DRI driver expected DDX version 1-1.2.x but got version 2.1.6
libGL warning: 3D driver returned no fbconfigs.
libGL warning: 3D driver returned no fbconfigs.
libGL error: InitDriver failed
libGL error: reverting to (slow) indirect rendering
glxinfo: xcb_lock.c:77: _XGetXCBBuffer: Assertion `((int) ((xcb_req) -
(dpy->request)) >= 0)' failed.
Aborted
"

What am I doing wrong?

Cheers,
--Phil
