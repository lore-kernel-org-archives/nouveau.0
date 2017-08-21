From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102349] New: nv4x crashing with plasmashell - gdb
	log included
Date: Mon, 21 Aug 2017 22:11:28 +0000
Message-ID: <bug-102349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0802399020=="
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


--===============0802399020==
Content-Type: multipart/alternative; boundary="15033534881.c2CEE.12874";
 charset="UTF-8"


--15033534881.c2CEE.12874
Date: Mon, 21 Aug 2017 22:11:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

            Bug ID: 102349
           Summary: nv4x crashing with plasmashell - gdb log included
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I have some NV4x graphics cards here and all of them are crashing on
plasmashell and on gnome.

In this report i would like to report from a NV42GL card (nvidia quadro)
running plasmashell. The kernel is 4.9. The os is debian.

Thanks to imirkin, tobijk and towo for the help to generate those logfiles.

Here is the output tobijk told me that it contains the relevant information:

Starting program: /usr/bin/plasmashell
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7fffe2cfa700 (LWP 5161)]
[New Thread 0x7fffe208d700 (LWP 5165)]
[New Thread 0x7fffe1051700 (LWP 5174)]
[New Thread 0x7fffd2f5f700 (LWP 5175)]
[New Thread 0x7fffd10f4700 (LWP 5176)]
warning: Could not find DWO CU
gallivm/.libs/lp_bld_debug.dwo(0x705e1d0e169ca1fe) referenced by CU at offs=
et
0x14078a9 [in module
/usr/lib/debug/.build-id/62/a543423306e4787e29a78fbd94c9a2cdf8ff3d.debug]
warning: Could not find DWO CU
gallivm/.libs/lp_bld_misc.dwo(0x3f68ad1a054cd591) referenced by CU at offset
0x1422424 [in module
/usr/lib/debug/.build-id/62/a543423306e4787e29a78fbd94c9a2cdf8ff3d.debug]
[New Thread 0x7fff42a8d700 (LWP 5177)]

Thread 1 "plasmashell" received signal SIGSEGV, Segmentation fault.
PUSH_RESET (bin=3D8, push=3D0x555555ac19f0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h:39
39  ../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h: Datei od=
er
Verzeichnis nicht gefunden.

Thread 7 (Thread 0x7fff42a8d700 (LWP 5177)):
#0  0x00007ffff33caafd in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so=
.5
#1  0x00007ffff33cb9b9 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so=
.5
#2  0x00007ffff338ba4b in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so=
.5
#3  0x00007ffff338c2ef in QImageReader::read(QImage*) () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#4  0x00007ffff5de3b46 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#5  0x00007ffff5de49b7 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#6  0x00007ffff5de627c in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#7  0x00007ffff5de63fe in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#8  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#9  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#10 0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 6 (Thread 0x7fffd10f4700 (LWP 5176)):
#0  0x00007ffff1ce915f in pthread_cond_wait@@GLIBC_2.3.2 () from
/lib/x86_64-linux-gnu/libpthread.so.0
#1  0x00007ffff786b2c4 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#2  0x00007ffff786b309 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#3  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#4  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 5 (Thread 0x7fffd2f5f700 (LWP 5175)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007fffede4b9f6 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007ffff2e0b0f3 in QThread::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007ffff545d6a5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Qml.so=
.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 4 (Thread 0x7fffe1051700 (LWP 5174)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007fffede4b9f6 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007ffff2e0b0f3 in QThread::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007ffff545d6a5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Qml.so=
.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 3 (Thread 0x7fffe208d700 (LWP 5165)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007fffede4b9f6 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007ffff2e0b0f3 in QThread::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007ffff7f4b6d5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5DBus.s=
o.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 2 (Thread 0x7fffe2cfa700 (LWP 5161)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007ffff67b3150 in ?? () from /usr/lib/x86_64-linux-gnu/libxcb.so.1
#2  0x00007ffff67b4ee9 in xcb_wait_for_event () from
/usr/lib/x86_64-linux-gnu/libxcb.so.1
#3  0x00007fffe4610b69 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#4  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#5  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#6  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 1 (Thread 0x7ffff7e0a940 (LWP 5160)):
#0  PUSH_RESET (bin=3D8, push=3D0x555555ac19f0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h:39
#1  nv30_fp_state_bind (pipe=3D0x5555558355b0, hwcso=3D0x555556648cc0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_fragprog.c:174
#2  0x00007fff4b4531a0 in update_fp (st=3D0x555555f90250) at
../../../src/mesa/state_tracker/st_atom_shader.c:152
#3  0x00007fff4b44f3bb in st_validate_state (st=3Dst@entry=3D0x555555f90250,
pipeline=3Dpipeline@entry=3DST_PIPELINE_RENDER) at
../../../src/mesa/state_tracker/st_atom.c:219
#4  0x00007fff4b470aaa in st_draw_vbo (ctx=3D0x555555f566f0,
prims=3D0x7fffffffacf0, nr_prims=3D1, ib=3D0x0, index_bounds_valid=3D<optim=
ized out>,
min_index=3D<optimized out>, max_index=3D<optimized out>, tfb_vertcount=3D0=
x0,
stream=3D0, indirect=3D0x0)
    at ../../../src/mesa/state_tracker/st_draw.c:202
#5  0x00007fff4b430b1a in vbo_draw_arrays (ctx=3D0x555555f566f0, mode=3D6, =
start=3D0,
count=3D4, numInstances=3D1, baseInstance=3D0) at
../../../src/mesa/vbo/vbo_exec_array.c:467
#6  0x00007ffff363f874 in QOpenGLTextureGlyphCache::resizeTextureData(int, =
int)
() from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#7  0x00007ffff35e0546 in QTextureGlyphCache::fillInPendingGlyphs() () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#8  0x00007ffff5e3cd37 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#9  0x00007ffff5e3abe4 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#10 0x00007ffff5ec2a97 in QQuickTextNode::addGlyphs(QPointF const&, QGlyphR=
un
const&, QColor const&, QQuickText::TextStyle, QColor const&, QSGNode*) () f=
rom
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#11 0x00007ffff5ec77a4 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#12 0x00007ffff5ec3a1c in QQuickTextNode::addTextLayout(QPointF const&,
QTextLayout*, QColor const&, QQuickText::TextStyle, QColor const&, QColor
const&, QColor const&, QColor const&, int, int, int, int) ()
   from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#13 0x00007ffff5ec2477 in QQuickText::updatePaintNode(QSGNode*,
QQuickItem::UpdatePaintNodeData*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#14 0x00007ffff5e7f780 in QQuickWindowPrivate::updateDirtyNode(QQuickItem*)=
 ()
from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#15 0x00007ffff5e7ff9b in QQuickWindowPrivate::updateDirtyNodes() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#16 0x00007ffff5e8100e in QQuickWindowPrivate::syncSceneGraph() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#17 0x00007ffff5e4d938 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#18 0x00007ffff5e8b216 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#19 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#20 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#21 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#22 0x00007ffff333360e in QWindowPrivate::deliverUpdateRequest() () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#23 0x00007ffff3333b59 in QWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#24 0x00007ffff5e8b1b5 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#25 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#26 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#27 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#28 0x00007ffff3032fee in QTimerInfoList::activateTimers() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#29 0x00007ffff3033511 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#30 0x00007fffede4b7f7 in g_main_context_dispatch () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#31 0x00007fffede4ba60 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#32 0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#33 0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#34 0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#35 0x00007ffff2fe613c in QCoreApplication::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#36 0x0000555555572daf in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>) at
./shell/main.cpp:166

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15033534881.c2CEE.12874
Date: Mon, 21 Aug 2017 22:11:28 +0000
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
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">102349</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv4x crashing with plasmashell - gdb log included
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
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
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
          <td>caguduzexi&#64;go2vpn.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have some NV4x graphics cards here and all of them are crash=
ing on
plasmashell and on gnome.

In this report i would like to report from a NV42GL card (nvidia quadro)
running plasmashell. The kernel is 4.9. The os is debian.

Thanks to imirkin, tobijk and towo for the help to generate those logfiles.

Here is the output tobijk told me that it contains the relevant information:

Starting program: /usr/bin/plasmashell
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;/lib/x86_64-linux-gnu/libthread_db.so=
.1&quot;.
[New Thread 0x7fffe2cfa700 (LWP 5161)]
[New Thread 0x7fffe208d700 (LWP 5165)]
[New Thread 0x7fffe1051700 (LWP 5174)]
[New Thread 0x7fffd2f5f700 (LWP 5175)]
[New Thread 0x7fffd10f4700 (LWP 5176)]
warning: Could not find DWO CU
gallivm/.libs/lp_bld_debug.dwo(0x705e1d0e169ca1fe) referenced by CU at offs=
et
0x14078a9 [in module
/usr/lib/debug/.build-id/62/a543423306e4787e29a78fbd94c9a2cdf8ff3d.debug]
warning: Could not find DWO CU
gallivm/.libs/lp_bld_misc.dwo(0x3f68ad1a054cd591) referenced by CU at offset
0x1422424 [in module
/usr/lib/debug/.build-id/62/a543423306e4787e29a78fbd94c9a2cdf8ff3d.debug]
[New Thread 0x7fff42a8d700 (LWP 5177)]

Thread 1 &quot;plasmashell&quot; received signal SIGSEGV, Segmentation faul=
t.
PUSH_RESET (bin=3D8, push=3D0x555555ac19f0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h:39
39  ../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h: Datei od=
er
Verzeichnis nicht gefunden.

Thread 7 (Thread 0x7fff42a8d700 (LWP 5177)):
#0  0x00007ffff33caafd in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so=
.5
#1  0x00007ffff33cb9b9 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so=
.5
#2  0x00007ffff338ba4b in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Gui.so=
.5
#3  0x00007ffff338c2ef in QImageReader::read(QImage*) () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#4  0x00007ffff5de3b46 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#5  0x00007ffff5de49b7 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#6  0x00007ffff5de627c in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#7  0x00007ffff5de63fe in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#8  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#9  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#10 0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 6 (Thread 0x7fffd10f4700 (LWP 5176)):
#0  0x00007ffff1ce915f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () from
/lib/x86_64-linux-gnu/libpthread.so.0
#1  0x00007ffff786b2c4 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#2  0x00007ffff786b309 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#3  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#4  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 5 (Thread 0x7fffd2f5f700 (LWP 5175)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007fffede4b9f6 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007ffff2e0b0f3 in QThread::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007ffff545d6a5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Qml.so=
.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 4 (Thread 0x7fffe1051700 (LWP 5174)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007fffede4b9f6 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007ffff2e0b0f3 in QThread::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007ffff545d6a5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Qml.so=
.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 3 (Thread 0x7fffe208d700 (LWP 5165)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007fffede4b9f6 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#4  0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#5  0x00007ffff2e0b0f3 in QThread::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#6  0x00007ffff7f4b6d5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5DBus.s=
o.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 2 (Thread 0x7fffe2cfa700 (LWP 5161)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007ffff67b3150 in ?? () from /usr/lib/x86_64-linux-gnu/libxcb.so.1
#2  0x00007ffff67b4ee9 in xcb_wait_for_event () from
/usr/lib/x86_64-linux-gnu/libxcb.so.1
#3  0x00007fffe4610b69 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#4  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#5  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#6  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 1 (Thread 0x7ffff7e0a940 (LWP 5160)):
#0  PUSH_RESET (bin=3D8, push=3D0x555555ac19f0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h:39
#1  nv30_fp_state_bind (pipe=3D0x5555558355b0, hwcso=3D0x555556648cc0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_fragprog.c:174
#2  0x00007fff4b4531a0 in update_fp (st=3D0x555555f90250) at
../../../src/mesa/state_tracker/st_atom_shader.c:152
#3  0x00007fff4b44f3bb in st_validate_state (st=3Dst&#64;entry=3D0x555555f9=
0250,
pipeline=3Dpipeline&#64;entry=3DST_PIPELINE_RENDER) at
../../../src/mesa/state_tracker/st_atom.c:219
#4  0x00007fff4b470aaa in st_draw_vbo (ctx=3D0x555555f566f0,
prims=3D0x7fffffffacf0, nr_prims=3D1, ib=3D0x0, index_bounds_valid=3D&lt;op=
timized out&gt;,
min_index=3D&lt;optimized out&gt;, max_index=3D&lt;optimized out&gt;, tfb_v=
ertcount=3D0x0,
stream=3D0, indirect=3D0x0)
    at ../../../src/mesa/state_tracker/st_draw.c:202
#5  0x00007fff4b430b1a in vbo_draw_arrays (ctx=3D0x555555f566f0, mode=3D6, =
start=3D0,
count=3D4, numInstances=3D1, baseInstance=3D0) at
../../../src/mesa/vbo/vbo_exec_array.c:467
#6  0x00007ffff363f874 in QOpenGLTextureGlyphCache::resizeTextureData(int, =
int)
() from /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#7  0x00007ffff35e0546 in QTextureGlyphCache::fillInPendingGlyphs() () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#8  0x00007ffff5e3cd37 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#9  0x00007ffff5e3abe4 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#10 0x00007ffff5ec2a97 in QQuickTextNode::addGlyphs(QPointF const&amp;, QGl=
yphRun
const&amp;, QColor const&amp;, QQuickText::TextStyle, QColor const&amp;, QS=
GNode*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#11 0x00007ffff5ec77a4 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#12 0x00007ffff5ec3a1c in QQuickTextNode::addTextLayout(QPointF const&amp;,
QTextLayout*, QColor const&amp;, QQuickText::TextStyle, QColor const&amp;, =
QColor
const&amp;, QColor const&amp;, QColor const&amp;, int, int, int, int) ()
   from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#13 0x00007ffff5ec2477 in QQuickText::updatePaintNode(QSGNode*,
QQuickItem::UpdatePaintNodeData*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#14 0x00007ffff5e7f780 in QQuickWindowPrivate::updateDirtyNode(QQuickItem*)=
 ()
from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#15 0x00007ffff5e7ff9b in QQuickWindowPrivate::updateDirtyNodes() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#16 0x00007ffff5e8100e in QQuickWindowPrivate::syncSceneGraph() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#17 0x00007ffff5e4d938 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#18 0x00007ffff5e8b216 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#19 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#20 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#21 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#22 0x00007ffff333360e in QWindowPrivate::deliverUpdateRequest() () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#23 0x00007ffff3333b59 in QWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#24 0x00007ffff5e8b1b5 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#25 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#26 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#27 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#28 0x00007ffff3032fee in QTimerInfoList::activateTimers() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#29 0x00007ffff3033511 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#30 0x00007fffede4b7f7 in g_main_context_dispatch () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#31 0x00007fffede4ba60 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#32 0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#33 0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#34 0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#35 0x00007ffff2fe613c in QCoreApplication::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#36 0x0000555555572daf in main (argc=3D&lt;optimized out&gt;, argv=3D&lt;op=
timized out&gt;) at
./shell/main.cpp:166</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15033534881.c2CEE.12874--

--===============0802399020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0802399020==--
