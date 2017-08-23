From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102349] nv4x crashing with plasmashell - gdb log
	included
Date: Wed, 23 Aug 2017 21:37:58 +0000
Message-ID: <bug-102349-8800-BZWnolzFK6@http.bugs.freedesktop.org/>
References: <bug-102349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1945066119=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1945066119==
Content-Type: multipart/alternative; boundary="15035242781.51Cf.6384";
 charset="UTF-8"


--15035242781.51Cf.6384
Date: Wed, 23 Aug 2017 21:37:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

--- Comment #2 from caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org ---
Thanks for the patch. Mesa is been rebuild with this patch. Still crashing:

Thread 7 (Thread 0x7fff4189b700 (LWP 1745)):
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
#6  0x00007ffff5de6406 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 6 (Thread 0x7fffd0f55700 (LWP 1744)):
#0  0x00007ffff1ce915f in pthread_cond_wait@@GLIBC_2.3.2 () from
/lib/x86_64-linux-gnu/libpthread.so.0
#1  0x00007ffff786b2c4 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#2  0x00007ffff786b309 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#3  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#4  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 5 (Thread 0x7fffd2bb6700 (LWP 1742)):
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

Thread 4 (Thread 0x7fffe0ed1700 (LWP 1741)):
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

Thread 3 (Thread 0x7fffe1f0d700 (LWP 1733)):
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

Thread 2 (Thread 0x7fffe2b7a700 (LWP 1727)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007ffff67b3150 in ?? () from /usr/lib/x86_64-linux-gnu/libxcb.so.1
#2  0x00007ffff67b4ee9 in xcb_wait_for_event () from
/usr/lib/x86_64-linux-gnu/libxcb.so.1
#3  0x00007fffe4490b69 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#4  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#5  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#6  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 1 (Thread 0x7ffff7e0a940 (LWP 1723)):
#0  0x00007fff4b70c22d in PUSH_RESET (bin=3D0, push=3D0x555555bef630) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h:39
#1  nv30_validate_fb (nv30=3D0x555555fb42f0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_state_validate.c:102
#2  0x00007fff4b70cb29 in nv30_state_validate (nv30=3Dnv30@entry=3D0x555555=
fb42f0,
mask=3Dmask@entry=3D10240, hwtnl=3Dhwtnl@entry=3Dtrue) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_state_validate.c:493
#3  0x00007fff4b700f05 in nv30_clear (pipe=3D0x555555fb42f0, buffers=3D5,
color=3D0x555555f834c4, depth=3D1, stencil=3D0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_clear.c:61
#4  0x00007fff4b458771 in st_Clear (ctx=3D0x555555f81a10, mask=3D272) at
../../../src/mesa/state_tracker/st_cb_clear.c:481
#5  0x00007ffff5e1594a in QSGBatchRenderer::Renderer::renderBatches() () fr=
om
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#6  0x00007ffff5e1b215 in QSGBatchRenderer::Renderer::render() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#7  0x00007ffff5e26b3f in QSGRenderer::renderScene(QSGBindable const&) () f=
rom
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#8  0x00007ffff5e5daa6 in QSGDefaultLayer::grab() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#9  0x00007ffff5e5df55 in QSGDefaultLayer::updateTexture() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#10 0x00007ffff5f6b556 in QQuickShaderEffectMaterial::updateTextures() cons=
t ()
from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#11 0x00007ffff5e273b7 in QSGRenderer::preprocess() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#12 0x00007ffff5e26b0f in QSGRenderer::renderScene(QSGBindable const&) () f=
rom
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#13 0x00007ffff5e2720b in QSGRenderer::renderScene(unsigned int) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#14 0x00007ffff5e36eae in QSGRenderContext::renderNextFrame(QSGRenderer*,
unsigned int) () from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#15 0x00007ffff5e8076e in QQuickWindowPrivate::renderSceneGraph(QSize const=
&)
() from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#16 0x00007ffff5e4d9a5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#17 0x00007ffff5e8b216 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#18 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#19 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#20 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#21 0x00007ffff333360e in QWindowPrivate::deliverUpdateRequest() () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#22 0x00007ffff3333b59 in QWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#23 0x00007ffff5e8b1b5 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#24 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#25 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#26 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#27 0x00007ffff3032fee in QTimerInfoList::activateTimers() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#28 0x00007ffff3033511 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#29 0x00007fffede4b7f7 in g_main_context_dispatch () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#30 0x00007fffede4ba60 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#31 0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#32 0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#33 0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#34 0x00007ffff2fe613c in QCoreApplication::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#35 0x0000555555572daf in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>) at
./shell/main.cpp:166

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15035242781.51Cf.6384
Date: Wed, 23 Aug 2017 21:37:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">bug 10234=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
caguduzexi&#64;go2vpn.net" title=3D"caguduzexi&#64;go2vpn.net">caguduzexi&#=
64;go2vpn.net</a>
</span></b>
        <pre>Thanks for the patch. Mesa is been rebuild with this patch. St=
ill crashing:

Thread 7 (Thread 0x7fff4189b700 (LWP 1745)):
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
#6  0x00007ffff5de6406 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#7  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#8  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#9  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 6 (Thread 0x7fffd0f55700 (LWP 1744)):
#0  0x00007ffff1ce915f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () from
/lib/x86_64-linux-gnu/libpthread.so.0
#1  0x00007ffff786b2c4 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#2  0x00007ffff786b309 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5Script.so.5
#3  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#4  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 5 (Thread 0x7fffd2bb6700 (LWP 1742)):
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

Thread 4 (Thread 0x7fffe0ed1700 (LWP 1741)):
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

Thread 3 (Thread 0x7fffe1f0d700 (LWP 1733)):
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

Thread 2 (Thread 0x7fffe2b7a700 (LWP 1727)):
#0  0x00007ffff271f6ad in poll () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007ffff67b3150 in ?? () from /usr/lib/x86_64-linux-gnu/libxcb.so.1
#2  0x00007ffff67b4ee9 in xcb_wait_for_event () from
/usr/lib/x86_64-linux-gnu/libxcb.so.1
#3  0x00007fffe4490b69 in ?? () from
/usr/lib/x86_64-linux-gnu/libQt5XcbQpa.so.5
#4  0x00007ffff2e0fda8 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#5  0x00007ffff1ce3494 in start_thread () from
/lib/x86_64-linux-gnu/libpthread.so.0
#6  0x00007ffff2728aff in clone () from /lib/x86_64-linux-gnu/libc.so.6

Thread 1 (Thread 0x7ffff7e0a940 (LWP 1723)):
#0  0x00007fff4b70c22d in PUSH_RESET (bin=3D0, push=3D0x555555bef630) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_winsys.h:39
#1  nv30_validate_fb (nv30=3D0x555555fb42f0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_state_validate.c:102
#2  0x00007fff4b70cb29 in nv30_state_validate (nv30=3Dnv30&#64;entry=3D0x55=
5555fb42f0,
mask=3Dmask&#64;entry=3D10240, hwtnl=3Dhwtnl&#64;entry=3Dtrue) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_state_validate.c:493
#3  0x00007fff4b700f05 in nv30_clear (pipe=3D0x555555fb42f0, buffers=3D5,
color=3D0x555555f834c4, depth=3D1, stencil=3D0) at
../../../../../src/gallium/drivers/nouveau/nv30/nv30_clear.c:61
#4  0x00007fff4b458771 in st_Clear (ctx=3D0x555555f81a10, mask=3D272) at
../../../src/mesa/state_tracker/st_cb_clear.c:481
#5  0x00007ffff5e1594a in QSGBatchRenderer::Renderer::renderBatches() () fr=
om
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#6  0x00007ffff5e1b215 in QSGBatchRenderer::Renderer::render() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#7  0x00007ffff5e26b3f in QSGRenderer::renderScene(QSGBindable const&amp;) =
() from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#8  0x00007ffff5e5daa6 in QSGDefaultLayer::grab() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#9  0x00007ffff5e5df55 in QSGDefaultLayer::updateTexture() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#10 0x00007ffff5f6b556 in QQuickShaderEffectMaterial::updateTextures() cons=
t ()
from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#11 0x00007ffff5e273b7 in QSGRenderer::preprocess() () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#12 0x00007ffff5e26b0f in QSGRenderer::renderScene(QSGBindable const&amp;) =
() from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#13 0x00007ffff5e2720b in QSGRenderer::renderScene(unsigned int) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#14 0x00007ffff5e36eae in QSGRenderContext::renderNextFrame(QSGRenderer*,
unsigned int) () from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#15 0x00007ffff5e8076e in QQuickWindowPrivate::renderSceneGraph(QSize const=
&amp;)
() from /usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#16 0x00007ffff5e4d9a5 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Quick.=
so.5
#17 0x00007ffff5e8b216 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#18 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#19 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#20 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#21 0x00007ffff333360e in QWindowPrivate::deliverUpdateRequest() () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#22 0x00007ffff3333b59 in QWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Gui.so.5
#23 0x00007ffff5e8b1b5 in QQuickWindow::event(QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Quick.so.5
#24 0x00007ffff38c2b8c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#25 0x00007ffff38ca341 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5
#26 0x00007ffff2fdf9e0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#27 0x00007ffff3032fee in QTimerInfoList::activateTimers() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#28 0x00007ffff3033511 in ?? () from /usr/lib/x86_64-linux-gnu/libQt5Core.s=
o.5
#29 0x00007fffede4b7f7 in g_main_context_dispatch () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#30 0x00007fffede4ba60 in ?? () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#31 0x00007fffede4bb0c in g_main_context_iteration () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#32 0x00007ffff303404f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#33 0x00007ffff2fdd9ca in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#34 0x00007ffff2fe613c in QCoreApplication::exec() () from
/usr/lib/x86_64-linux-gnu/libQt5Core.so.5
#35 0x0000555555572daf in main (argc=3D&lt;optimized out&gt;, argv=3D&lt;op=
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

--15035242781.51Cf.6384--

--===============1945066119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1945066119==--
