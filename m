From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31920] Brightness control is erratic
 (/sys/class/backlight/nv_backlight/max_brightness is wrong)
Date: Sun, 01 Apr 2012 05:55:16 +0000
Message-ID: <bug-31920-8800-yDh7hcDW8i@http.bugs.freedesktop.org/>
References: <bug-31920-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31920-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31920

--- Comment #24 from Alex Mayorga Adame <alex_mayorga-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> 2012-03-31 22:55:16 PDT ---
Did this make it into kernel 3.2? What can be done for the brightness controls
to work properly?

I reported https://bugs.launchpad.net/nouveau/+bug/551668 a while ago on
Ubuntu's bug tracker I believe is this bug or a related one and it is still
causing problems on the following configuration:

alex-mayorga@VPCCW1FFXL:~$ uname -a
Linux VPCCW1FFXL 3.2.0-21-generic #34-Ubuntu SMP Fri Mar 30 04:25:35 UTC 2012
x86_64 x86_64 x86_64 GNU/Linux
alex-mayorga@VPCCW1FFXL:~$ lspci -nn | grep VGA
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT216 [GeForce GT
230M] [10de:0a2a] (rev a2)
alex-mayorga@VPCCW1FFXL:~$ apt-cache show xserver-xorg-video-nouveau
Package: xserver-xorg-video-nouveau
Priority: optional
Section: x11
Installed-Size: 344
Maintainer: Ubuntu Developers <ubuntu-devel-discuss-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org>
Original-Maintainer: Debian X Strike Force <debian-x-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
Architecture: amd64
Version: 1:0.0.16+git20111201+b5534a1-1build2
Provides: xorg-driver-video
Depends: libc6 (>= 2.4), libdrm-nouveau1a (>= 2.4.23), libudev0 (>= 147),
xorg-video-abi-11, xserver-xorg-core (>= 2:1.10.99.901)
Recommends: libgl1-mesa-dri (>= 7.11.1)
Filename:
pool/main/x/xserver-xorg-video-nouveau/xserver-xorg-video-nouveau_0.0.16+git20111201+b5534a1-1build2_amd64.deb
Size: 109400
MD5sum: 5ab8e5861a11a57d783fa9862d88900f
SHA1: 7abb48438df08eed97dd4676bc111bdbaf714376
SHA256: 886d7e2f968819373d81a932388ede20995d9bd1d3d8f2091100f988a314a780
Description-en: X.Org X server -- Nouveau display driver
 This driver for the X.Org X server (see xserver-xorg for a further
description)
 provides support for NVIDIA Riva, TNT, GeForce, and Quadro cards.
 .
 This package provides 2D support including EXA acceleration, Xv and
 RandR.  3D functionality is provided by the libgl1-mesa-dri package.
 .
 This package is built from the FreeDesktop.org xf86-video-nouveau driver.
Homepage: http://nouveau.freedesktop.org/wiki/
Description-md5: b084a16945b86c1eda89ad33dbb4530d
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Origin: Ubuntu
Supported: 5y
Task: ubuntu-desktop, ubuntu-usb, kubuntu-desktop, kubuntu-active-desktop,
kubuntu-active, edubuntu-desktop, edubuntu-usb, xubuntu-desktop,
mythbuntu-frontend, mythbuntu-desktop, mythbuntu-backend-slave,
mythbuntu-backend-master, lubuntu-core, ubuntustudio-desktop

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
