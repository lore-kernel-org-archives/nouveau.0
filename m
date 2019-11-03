From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112201] New: Syscall param ioctl(generic) points to
 uninitialised byte(s)
Date: Sun, 03 Nov 2019 02:44:05 +0000
Message-ID: <bug-112201-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1846456461=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1846456461==
Content-Type: multipart/alternative; boundary="15727490462.7F0b01aD.2643"
Content-Transfer-Encoding: 7bit


--15727490462.7F0b01aD.2643
Date: Sun, 3 Nov 2019 02:44:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112201

            Bug ID: 112201
           Summary: Syscall param ioctl(generic) points to uninitialised
                    byte(s)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: stratus-FGqvDjY7+Vo@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Dear bugzilla,
I built the example program here:
https://www.khronos.org/registry/OpenGL-Refpages/gl2.1/xhtml/glXIntro.xml
$ gcc -Wall -Wextra -o glxample glxample.c -lX11 -lGL
(The test app works and shows a little yellow window then exits after 10
seconds as it is supposed to)
I ran it under valgrind, with the relevant packages built unstripped.
I found the same error, but from a different initial function, with xfwm4,
while trying to resolve an issue with that in another as yet unresolved bug
report, which includes that valgrind trace, and more os/hw details:
https://bugzilla.xfce.org/show_bug.cgi?id=3D16032
I was intending to find a simple test app to try out the function
glXQueryServerString to confirm if this problem was in mesa / libdrm but di=
dn't
even need to do that.
Any ideas what is happening here, and if this apparent buffer overflow coul=
d be
relevant to the xfwm4 bug, or something extra besides that?

$ valgrind --tool=3Dmemcheck --fullpath-after=3D/home/name/debug-xwfm4
--num-callers=3D100 ./glxample=20
=3D=3D3018=3D=3D Memcheck, a memory error detector
=3D=3D3018=3D=3D Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward e=
t al.
=3D=3D3018=3D=3D Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyri=
ght info
=3D=3D3018=3D=3D Command: ./glxample
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D Syscall param ioctl(generic) points to uninitialised byte(=
s)
=3D=3D3018=3D=3D    at 0x4B3325B: ioctl (in /usr/lib/libc-2.30.so)
=3D=3D3018=3D=3D    by 0x52280DE: drmIoctl
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/xf86drm.c:180)
=3D=3D3018=3D=3D    by 0x52290F3: drmCommandWriteRead
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/xf86drm.c:2644)
=3D=3D3018=3D=3D    by 0xC0679DA: nouveau_object_ioctl
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:88)
=3D=3D3018=3D=3D    by 0xC068286: nouveau_object_init
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:262)
=3D=3D3018=3D=3D    by 0xC06A55C: nouveau_device_new
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:389)
=3D=3D3018=3D=3D    by 0x5D5D0AD: nouveau_drm_screen_create
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/winsys/nouveau/drm/n=
ouveau_drm_winsys.c:101)
=3D=3D3018=3D=3D    by 0x5AD319A: pipe_nouveau_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/target-hel=
pers/drm_helper.h:76)
=3D=3D3018=3D=3D    by 0x5B7186C: pipe_loader_drm_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader_drm.c:314)
=3D=3D3018=3D=3D    by 0x5B7134E: pipe_loader_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader.c:128)
=3D=3D3018=3D=3D    by 0x5AD6EA1: dri2_init_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/state_trackers/dri/d=
ri2.c:2036)
=3D=3D3018=3D=3D    by 0x5AD4725: driCreateNewScreen2
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/mesa/drivers/dri/common/dri_=
util.c:154)
=3D=3D3018=3D=3D    by 0x51B7570: dri2CreateScreen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/dri2_glx.c:1288)
=3D=3D3018=3D=3D    by 0x51A80F0: AllocAndFetchScreenConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:817)
=3D=3D3018=3D=3D    by 0x51A84C3: __glXInitialize
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:940)
=3D=3D3018=3D=3D    by 0x51A49D7: glXGetFBConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1660)
=3D=3D3018=3D=3D    by 0x51A5099: glXChooseFBConfig
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1599)
=3D=3D3018=3D=3D    by 0x4C386F9: glXChooseFBConfig (in /usr/lib/libGLX.so.=
0.0.0)
=3D=3D3018=3D=3D    by 0x109301: main (in /home/name/debug-xwfm4/glxample)
=3D=3D3018=3D=3D  Address 0x4f1a382 is 2 bytes inside a block of size 72 al=
loc'd
=3D=3D3018=3D=3D    at 0x483877F: malloc
(/build/valgrind/src/valgrind/coregrind/m_replacemalloc/vg_replace_malloc.c=
:309)
=3D=3D3018=3D=3D    by 0xC068237: nouveau_object_init
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:251)
=3D=3D3018=3D=3D    by 0xC06A55C: nouveau_device_new
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:389)
=3D=3D3018=3D=3D    by 0x5D5D0AD: nouveau_drm_screen_create
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/winsys/nouveau/drm/n=
ouveau_drm_winsys.c:101)
=3D=3D3018=3D=3D    by 0x5AD319A: pipe_nouveau_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/target-hel=
pers/drm_helper.h:76)
=3D=3D3018=3D=3D    by 0x5B7186C: pipe_loader_drm_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader_drm.c:314)
=3D=3D3018=3D=3D    by 0x5B7134E: pipe_loader_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader.c:128)
=3D=3D3018=3D=3D    by 0x5AD6EA1: dri2_init_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/state_trackers/dri/d=
ri2.c:2036)
=3D=3D3018=3D=3D    by 0x5AD4725: driCreateNewScreen2
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/mesa/drivers/dri/common/dri_=
util.c:154)
=3D=3D3018=3D=3D    by 0x51B7570: dri2CreateScreen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/dri2_glx.c:1288)
=3D=3D3018=3D=3D    by 0x51A80F0: AllocAndFetchScreenConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:817)
=3D=3D3018=3D=3D    by 0x51A84C3: __glXInitialize
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:940)
=3D=3D3018=3D=3D    by 0x51A49D7: glXGetFBConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1660)
=3D=3D3018=3D=3D    by 0x51A5099: glXChooseFBConfig
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1599)
=3D=3D3018=3D=3D    by 0x4C386F9: glXChooseFBConfig (in /usr/lib/libGLX.so.=
0.0.0)
=3D=3D3018=3D=3D    by 0x109301: main (in /home/name/debug-xwfm4/glxample)
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D HEAP SUMMARY:
=3D=3D3018=3D=3D     in use at exit: 964,131 bytes in 3,934 blocks
=3D=3D3018=3D=3D   total heap usage: 8,989 allocs, 5,055 frees, 3,301,060 b=
ytes
allocated
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D LEAK SUMMARY:
=3D=3D3018=3D=3D    definitely lost: 64 bytes in 2 blocks
=3D=3D3018=3D=3D    indirectly lost: 0 bytes in 0 blocks
=3D=3D3018=3D=3D      possibly lost: 80,104 bytes in 537 blocks
=3D=3D3018=3D=3D    still reachable: 883,963 bytes in 3,395 blocks
=3D=3D3018=3D=3D         suppressed: 0 bytes in 0 blocks
=3D=3D3018=3D=3D Rerun with --leak-check=3Dfull to see details of leaked me=
mory
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D Use --track-origins=3Dyes to see where uninitialised value=
s come from
=3D=3D3018=3D=3D For lists of detected and suppressed errors, rerun with: -s
=3D=3D3018=3D=3D ERROR SUMMARY: 6 errors from 1 contexts (suppressed: 0 fro=
m 0)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15727490462.7F0b01aD.2643
Date: Sun, 3 Nov 2019 02:44:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Syscall param ioctl(generic) points to uninitialised byte=
(s)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112201">112201</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Syscall param ioctl(generic) points to uninitialised byte(s)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>stratus&#64;tuta.io
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Dear bugzilla,
I built the example program here:
<a href=3D"https://www.khronos.org/registry/OpenGL-Refpages/gl2.1/xhtml/glX=
Intro.xml">https://www.khronos.org/registry/OpenGL-Refpages/gl2.1/xhtml/glX=
Intro.xml</a>
$ gcc -Wall -Wextra -o glxample glxample.c -lX11 -lGL
(The test app works and shows a little yellow window then exits after 10
seconds as it is supposed to)
I ran it under valgrind, with the relevant packages built unstripped.
I found the same error, but from a different initial function, with xfwm4,
while trying to resolve an issue with that in another as yet unresolved bug
report, which includes that valgrind trace, and more os/hw details:
<a href=3D"https://bugzilla.xfce.org/show_bug.cgi?id=3D16032">https://bugzi=
lla.xfce.org/show_bug.cgi?id=3D16032</a>
I was intending to find a simple test app to try out the function
glXQueryServerString to confirm if this problem was in mesa / libdrm but di=
dn't
even need to do that.
Any ideas what is happening here, and if this apparent buffer overflow coul=
d be
relevant to the xfwm4 bug, or something extra besides that?

$ valgrind --tool=3Dmemcheck --fullpath-after=3D/home/name/debug-xwfm4
--num-callers=3D100 ./glxample=20
=3D=3D3018=3D=3D Memcheck, a memory error detector
=3D=3D3018=3D=3D Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward e=
t al.
=3D=3D3018=3D=3D Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyri=
ght info
=3D=3D3018=3D=3D Command: ./glxample
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D Syscall param ioctl(generic) points to uninitialised byte(=
s)
=3D=3D3018=3D=3D    at 0x4B3325B: ioctl (in /usr/lib/libc-2.30.so)
=3D=3D3018=3D=3D    by 0x52280DE: drmIoctl
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/xf86drm.c:180)
=3D=3D3018=3D=3D    by 0x52290F3: drmCommandWriteRead
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/xf86drm.c:2644)
=3D=3D3018=3D=3D    by 0xC0679DA: nouveau_object_ioctl
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:88)
=3D=3D3018=3D=3D    by 0xC068286: nouveau_object_init
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:262)
=3D=3D3018=3D=3D    by 0xC06A55C: nouveau_device_new
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:389)
=3D=3D3018=3D=3D    by 0x5D5D0AD: nouveau_drm_screen_create
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/winsys/nouveau/drm/n=
ouveau_drm_winsys.c:101)
=3D=3D3018=3D=3D    by 0x5AD319A: pipe_nouveau_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/target-hel=
pers/drm_helper.h:76)
=3D=3D3018=3D=3D    by 0x5B7186C: pipe_loader_drm_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader_drm.c:314)
=3D=3D3018=3D=3D    by 0x5B7134E: pipe_loader_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader.c:128)
=3D=3D3018=3D=3D    by 0x5AD6EA1: dri2_init_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/state_trackers/dri/d=
ri2.c:2036)
=3D=3D3018=3D=3D    by 0x5AD4725: driCreateNewScreen2
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/mesa/drivers/dri/common/dri_=
util.c:154)
=3D=3D3018=3D=3D    by 0x51B7570: dri2CreateScreen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/dri2_glx.c:1288)
=3D=3D3018=3D=3D    by 0x51A80F0: AllocAndFetchScreenConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:817)
=3D=3D3018=3D=3D    by 0x51A84C3: __glXInitialize
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:940)
=3D=3D3018=3D=3D    by 0x51A49D7: glXGetFBConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1660)
=3D=3D3018=3D=3D    by 0x51A5099: glXChooseFBConfig
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1599)
=3D=3D3018=3D=3D    by 0x4C386F9: glXChooseFBConfig (in /usr/lib/libGLX.so.=
0.0.0)
=3D=3D3018=3D=3D    by 0x109301: main (in /home/name/debug-xwfm4/glxample)
=3D=3D3018=3D=3D  Address 0x4f1a382 is 2 bytes inside a block of size 72 al=
loc'd
=3D=3D3018=3D=3D    at 0x483877F: malloc
(/build/valgrind/src/valgrind/coregrind/m_replacemalloc/vg_replace_malloc.c=
:309)
=3D=3D3018=3D=3D    by 0xC068237: nouveau_object_init
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:251)
=3D=3D3018=3D=3D    by 0xC06A55C: nouveau_device_new
(/symbolpkgs/libdrm/src/build/../libdrm-2.4.100/nouveau/nouveau.c:389)
=3D=3D3018=3D=3D    by 0x5D5D0AD: nouveau_drm_screen_create
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/winsys/nouveau/drm/n=
ouveau_drm_winsys.c:101)
=3D=3D3018=3D=3D    by 0x5AD319A: pipe_nouveau_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/target-hel=
pers/drm_helper.h:76)
=3D=3D3018=3D=3D    by 0x5B7186C: pipe_loader_drm_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader_drm.c:314)
=3D=3D3018=3D=3D    by 0x5B7134E: pipe_loader_create_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/auxiliary/pipe-loade=
r/pipe_loader.c:128)
=3D=3D3018=3D=3D    by 0x5AD6EA1: dri2_init_screen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/gallium/state_trackers/dri/d=
ri2.c:2036)
=3D=3D3018=3D=3D    by 0x5AD4725: driCreateNewScreen2
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/mesa/drivers/dri/common/dri_=
util.c:154)
=3D=3D3018=3D=3D    by 0x51B7570: dri2CreateScreen
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/dri2_glx.c:1288)
=3D=3D3018=3D=3D    by 0x51A80F0: AllocAndFetchScreenConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:817)
=3D=3D3018=3D=3D    by 0x51A84C3: __glXInitialize
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxext.c:940)
=3D=3D3018=3D=3D    by 0x51A49D7: glXGetFBConfigs
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1660)
=3D=3D3018=3D=3D    by 0x51A5099: glXChooseFBConfig
(/symbolpkgs/mesa/src/build/../mesa-19.2.2/src/glx/glxcmds.c:1599)
=3D=3D3018=3D=3D    by 0x4C386F9: glXChooseFBConfig (in /usr/lib/libGLX.so.=
0.0.0)
=3D=3D3018=3D=3D    by 0x109301: main (in /home/name/debug-xwfm4/glxample)
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D HEAP SUMMARY:
=3D=3D3018=3D=3D     in use at exit: 964,131 bytes in 3,934 blocks
=3D=3D3018=3D=3D   total heap usage: 8,989 allocs, 5,055 frees, 3,301,060 b=
ytes
allocated
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D LEAK SUMMARY:
=3D=3D3018=3D=3D    definitely lost: 64 bytes in 2 blocks
=3D=3D3018=3D=3D    indirectly lost: 0 bytes in 0 blocks
=3D=3D3018=3D=3D      possibly lost: 80,104 bytes in 537 blocks
=3D=3D3018=3D=3D    still reachable: 883,963 bytes in 3,395 blocks
=3D=3D3018=3D=3D         suppressed: 0 bytes in 0 blocks
=3D=3D3018=3D=3D Rerun with --leak-check=3Dfull to see details of leaked me=
mory
=3D=3D3018=3D=3D=20
=3D=3D3018=3D=3D Use --track-origins=3Dyes to see where uninitialised value=
s come from
=3D=3D3018=3D=3D For lists of detected and suppressed errors, rerun with: -s
=3D=3D3018=3D=3D ERROR SUMMARY: 6 errors from 1 contexts (suppressed: 0 fro=
m 0)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15727490462.7F0b01aD.2643--

--===============1846456461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1846456461==--
