From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10858] glxgears with mesa-git on PCI 10de0322 (NV34)
 GeForce FX 5200 crashes X
Date: Fri,  1 Feb 2008 16:55:32 -0800 (PST)
Message-ID: <20080202005532.E6E7F130051@annarchy.freedesktop.org>
References: <bug-10858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10858





--- Comment #31 from Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-01 16:55:31 PST ---
Ubuntu 8.04 alpha
X.Org X Server 1.4.0.90
drm c77b0937f290568604961fa0013691349c5fcf3b
xf86-video-nouveau 5b79b0a9e54fe99eaae5b411f46a601b6944b773
mesa  ca8d91610f547b9c66f703e07356f6347a121516

I get,

careym@daisy:~/nouveau/mesa$ glxgears
libGL: XF86DRIGetClientDriverName: 0.0.10 nouveau (screen 0)
libGL: OpenDriver: trying /home/careym/nouveau/mesa/lib//nouveau_dri.so
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 4, (OK)
drmOpenByBusid: Searching for BusID pci:0000:02:04.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 4, (OK)
drmOpenByBusid: drmOpenMinor returns 4
drmOpenByBusid: drmGetBusid reports
drmOpenDevice: node name is /dev/dri/card1
drmOpenDevice: open result is 4, (OK)
drmOpenByBusid: drmOpenMinor returns 4
drmOpenByBusid: drmGetBusid reports pci:0000:02:04.0
************************************INFO***********************************
File nouveau_fifo.c function nouveauFifoInit line 149
Fifo init ok. Using context 2
***************************************************************************
libGL error:
Can't open configuration file /etc/drirc: No such file or directory.
libGL error:
Can't open configuration file /home/careym/.drirc: No such file or directory.
do_wait: drmWaitVBlank returned -1, IRQs don't seem to be working correctly.
Try running with LIBGL_THROTTLE_REFRESH and LIBL_SYNC_REFRESH unset.
3477 frames in 5.0 seconds = 695.327 FPS
3783 frames in 5.0 seconds = 756.485 FPS
3788 frames in 5.0 seconds = 757.565 FPS
3423 frames in 5.0 seconds = 684.480 FPS
XIO:  fatal IO error 11 (Resource temporarily unavailable) on X server ":0.0"
      after 49395 requests (49214 known processed) with 0 events remaining.

The gears window and decorations are drawn but the background is black
and I cant see the gears.  If I remove git mesa and use the one
installed by ubuntu software rendering draws gears for me - albeit
really slowly.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
