From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107210] New: Segment Fault while opening thunderbitf
 windows
Date: Thu, 12 Jul 2018 17:32:53 +0000
Message-ID: <bug-107210-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1891420863=="
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


--===============1891420863==
Content-Type: multipart/alternative; boundary="15314167730.ed71.4550"
Content-Transfer-Encoding: 7bit


--15314167730.ed71.4550
Date: Thu, 12 Jul 2018 17:32:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107210

            Bug ID: 107210
           Summary: Segment Fault while opening thunderbitf windows
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: fpedersoli-W5PRBNShjJq35wUkaLeaMEEOCMrvLtNR@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Application: KWin (kwin_x11), signal: Segmentation fault
Using host libthread_db library "/usr/lib/libthread_db.so.1".
[Current thread is 1 (Thread 0x7fac70d2de80 (LWP 2674))]

Thread 6 (Thread 0x7fac4f5ef700 (LWP 3324)):
#0  0x00007fac706afdd6 in ppoll () at /usr/lib/libc.so.6
#1  0x00007fac6da4ccbb in qt_safe_poll(pollfd*, unsigned long, timespec con=
st*)
() at /usr/lib/libQt5Core.so.5
#2  0x00007fac6da4e1ab in
QEventDispatcherUNIX::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/libQt5Core.so.5
#3  0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/libQt5Core.so.5
#4  0x00007fac6d845849 in QThread::exec() () at /usr/lib/libQt5Core.so.5
#5  0x00007fac680e79c9 in  () at /usr/lib/libQt5Qml.so.5
#6  0x00007fac6d84f8f5 in  () at /usr/lib/libQt5Core.so.5
#7  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#8  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 5 (Thread 0x7fac318be700 (LWP 2832)):
#0  0x00007fac696ad07c in pthread_cond_wait@@GLIBC_2.3.2 () at
/usr/lib/libpthread.so.0
#1  0x00007fac6c970aac in  () at /usr/lib/libQt5Script.so.5
#2  0x00007fac6c970ac9 in  () at /usr/lib/libQt5Script.so.5
#3  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#4  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 4 (Thread 0x7fac335ff700 (LWP 2831)):
#0  0x00007fac706afdd6 in ppoll () at /usr/lib/libc.so.6
#1  0x00007fac6da4ccbb in qt_safe_poll(pollfd*, unsigned long, timespec con=
st*)
() at /usr/lib/libQt5Core.so.5
#2  0x00007fac6da4e1ab in
QEventDispatcherUNIX::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/libQt5Core.so.5
#3  0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/libQt5Core.so.5
#4  0x00007fac6d845849 in QThread::exec() () at /usr/lib/libQt5Core.so.5
#5  0x00007fac680e79c9 in  () at /usr/lib/libQt5Qml.so.5
#6  0x00007fac6d84f8f5 in  () at /usr/lib/libQt5Core.so.5
#7  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#8  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 3 (Thread 0x7fac4098f700 (LWP 2830)):
#0  0x00007fac696ad07c in pthread_cond_wait@@GLIBC_2.3.2 () at
/usr/lib/libpthread.so.0
#1  0x00007fac424ced44 in  () at /usr/lib/dri/nouveau_dri.so
#2  0x00007fac424cea38 in  () at /usr/lib/dri/nouveau_dri.so
#3  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#4  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 2 (Thread 0x7fac5521c700 (LWP 2795)):
#0  0x00007ffe17f5bb04 in clock_gettime ()
#1  0x00007fac706c7d76 in clock_gettime () at /usr/lib/libc.so.6
#2  0x00007fac6da50712 in  () at /usr/lib/libQt5Core.so.5
#3  0x00007fac6da4eefa in QTimerInfoList::updateCurrentTime() () at
/usr/lib/libQt5Core.so.5
#4  0x00007fac6da4f4f6 in QTimerInfoList::timerWait(timespec&) () at
/usr/lib/libQt5Core.so.5
#5  0x00007fac6da4e3f5 in
QEventDispatcherUNIX::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/libQt5Core.so.5
#6  0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/libQt5Core.so.5
#7  0x00007fac6d845849 in QThread::exec() () at /usr/lib/libQt5Core.so.5
#8  0x00007fac66fd9976 in  () at /usr/lib/libQt5DBus.so.5
#9  0x00007fac6d84f8f5 in  () at /usr/lib/libQt5Core.so.5
#10 0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#11 0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 1 (Thread 0x7fac70d2de80 (LWP 2674)):
[KCrash Handler]
#6  0x00007fac42036f85 in  () at /usr/lib/dri/nouveau_dri.so
#7  0x00007fac41e1668e in  () at /usr/lib/dri/nouveau_dri.so
#8  0x00007fac42315697 in  () at /usr/lib/dri/nouveau_dri.so
#9  0x00007fac4231583a in  () at /usr/lib/dri/nouveau_dri.so
#10 0x00007fac421e25bd in  () at /usr/lib/dri/nouveau_dri.so
#11 0x00007fac421e2a22 in  () at /usr/lib/dri/nouveau_dri.so
#12 0x00007fac423115ef in  () at /usr/lib/dri/nouveau_dri.so
#13 0x00007fac41dba3fb in  () at /usr/lib/dri/nouveau_dri.so
#14 0x00007fac41db4be3 in  () at /usr/lib/dri/nouveau_dri.so
#15 0x00007fac43b9af21 in  () at /usr/lib/libGLX_mesa.so.0
#16 0x00007fac43b88769 in  () at /usr/lib/libGLX_mesa.so.0
#17 0x00007fac56b1131e in  () at
/usr/lib/qt/plugins/xcbglintegrations/libqxcb-glx-integration.so
#18 0x00007fac56b11329 in  () at
/usr/lib/qt/plugins/xcbglintegrations/libqxcb-glx-integration.so
#19 0x00007fac6e047ddf in QOpenGLContext::destroy() () at
/usr/lib/libQt5Gui.so.5
#20 0x00007fac6e048178 in QOpenGLContext::~QOpenGLContext() () at
/usr/lib/libQt5Gui.so.5
#21 0x00007fac6e04819a in QOpenGLContext::~QOpenGLContext() () at
/usr/lib/libQt5Gui.so.5
#22 0x00007fac54134b94 in  () at
/usr/lib/qt/plugins/org.kde.kdecoration2/kwin5_aurorae.so
#23 0x00007fac54134c39 in  () at
/usr/lib/qt/plugins/org.kde.kdecoration2/kwin5_aurorae.so
#24 0x00007fac701733e6 in KWin::AbstractClient::destroyDecoration() () at
/usr/lib/libkwin.so.5
#25 0x00007fac70183554 in KWin::Client::destroyDecoration() () at
/usr/lib/libkwin.so.5
#26 0x00007fac70178e8c in KWin::Client::destroyClient() () at
/usr/lib/libkwin.so.5
#27 0x00007fac701d5273 in
KWin::Client::unmapNotifyEvent(xcb_unmap_notify_event_t*) () at
/usr/lib/libkwin.so.5
#28 0x00007fac701d8b7c in KWin::Client::windowEvent(xcb_generic_event_t*) (=
) at
/usr/lib/libkwin.so.5
#29 0x00007fac701d9970 in KWin::Workspace::workspaceEvent(xcb_generic_event=
_t*)
() at /usr/lib/libkwin.so.5
#30 0x00007fac6d9fb51f in
QAbstractEventDispatcher::filterNativeEvent(QByteArray const&, void*, long*=
) ()
at /usr/lib/libQt5Core.so.5
#31 0x00007fac58a1aa22 in QXcbConnection::handleXcbEvent(xcb_generic_event_=
t*)
() at /usr/lib/libQt5XcbQpa.so.5
#32 0x00007fac58a1b60d in QXcbConnection::processXcbEvents() () at
/usr/lib/libQt5XcbQpa.so.5
#33 0x00007fac6da28182 in QObject::event(QEvent*) () at
/usr/lib/libQt5Core.so.5
#34 0x00007fac6e7d6a74 in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() at /usr/lib/libQt5Widgets.so.5
#35 0x00007fac6e7de341 in QApplication::notify(QObject*, QEvent*) () at
/usr/lib/libQt5Widgets.so.5
#36 0x00007fac6d9fda69 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib/libQt5Core.so.5
#37 0x00007fac6da00afc in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () at /usr/lib/libQt5Core.so.5
#38 0x00007fac6da4e01d in
QEventDispatcherUNIX::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib/libQt5Core.so.5
#39 0x00007fac58aae9de in  () at /usr/lib/libQt5XcbQpa.so.5
#40 0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib/libQt5Core.so.5
#41 0x00007fac6da049f6 in QCoreApplication::exec() () at
/usr/lib/libQt5Core.so.5
#42 0x00007fac70986b56 in kdemain () at /usr/lib/libkdeinit5_kwin_x11.so
#43 0x00007fac705e49a7 in __libc_start_main () at /usr/lib/libc.so.6
#44 0x000056548f6f875a in _start ()

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15314167730.ed71.4550
Date: Thu, 12 Jul 2018 17:32:53 +0000
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
   title=3D"NEW - Segment Fault while opening thunderbitf windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107210">107210</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segment Fault while opening thunderbitf windows
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
          <td>critical
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
          <td>fpedersoli&#64;kisantechnology.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Application: KWin (kwin_x11), signal: Segmentation fault
Using host libthread_db library &quot;/usr/lib/libthread_db.so.1&quot;.
[Current thread is 1 (Thread 0x7fac70d2de80 (LWP 2674))]

Thread 6 (Thread 0x7fac4f5ef700 (LWP 3324)):
#0  0x00007fac706afdd6 in ppoll () at /usr/lib/libc.so.6
#1  0x00007fac6da4ccbb in qt_safe_poll(pollfd*, unsigned long, timespec con=
st*)
() at /usr/lib/libQt5Core.so.5
#2  0x00007fac6da4e1ab in
QEventDispatcherUNIX::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/libQt5Core.so.5
#3  0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/libQt5Core.so.5
#4  0x00007fac6d845849 in QThread::exec() () at /usr/lib/libQt5Core.so.5
#5  0x00007fac680e79c9 in  () at /usr/lib/libQt5Qml.so.5
#6  0x00007fac6d84f8f5 in  () at /usr/lib/libQt5Core.so.5
#7  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#8  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 5 (Thread 0x7fac318be700 (LWP 2832)):
#0  0x00007fac696ad07c in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/usr/lib/libpthread.so.0
#1  0x00007fac6c970aac in  () at /usr/lib/libQt5Script.so.5
#2  0x00007fac6c970ac9 in  () at /usr/lib/libQt5Script.so.5
#3  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#4  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 4 (Thread 0x7fac335ff700 (LWP 2831)):
#0  0x00007fac706afdd6 in ppoll () at /usr/lib/libc.so.6
#1  0x00007fac6da4ccbb in qt_safe_poll(pollfd*, unsigned long, timespec con=
st*)
() at /usr/lib/libQt5Core.so.5
#2  0x00007fac6da4e1ab in
QEventDispatcherUNIX::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/libQt5Core.so.5
#3  0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/libQt5Core.so.5
#4  0x00007fac6d845849 in QThread::exec() () at /usr/lib/libQt5Core.so.5
#5  0x00007fac680e79c9 in  () at /usr/lib/libQt5Qml.so.5
#6  0x00007fac6d84f8f5 in  () at /usr/lib/libQt5Core.so.5
#7  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#8  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 3 (Thread 0x7fac4098f700 (LWP 2830)):
#0  0x00007fac696ad07c in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/usr/lib/libpthread.so.0
#1  0x00007fac424ced44 in  () at /usr/lib/dri/nouveau_dri.so
#2  0x00007fac424cea38 in  () at /usr/lib/dri/nouveau_dri.so
#3  0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#4  0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 2 (Thread 0x7fac5521c700 (LWP 2795)):
#0  0x00007ffe17f5bb04 in clock_gettime ()
#1  0x00007fac706c7d76 in clock_gettime () at /usr/lib/libc.so.6
#2  0x00007fac6da50712 in  () at /usr/lib/libQt5Core.so.5
#3  0x00007fac6da4eefa in QTimerInfoList::updateCurrentTime() () at
/usr/lib/libQt5Core.so.5
#4  0x00007fac6da4f4f6 in QTimerInfoList::timerWait(timespec&amp;) () at
/usr/lib/libQt5Core.so.5
#5  0x00007fac6da4e3f5 in
QEventDispatcherUNIX::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/libQt5Core.so.5
#6  0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/libQt5Core.so.5
#7  0x00007fac6d845849 in QThread::exec() () at /usr/lib/libQt5Core.so.5
#8  0x00007fac66fd9976 in  () at /usr/lib/libQt5DBus.so.5
#9  0x00007fac6d84f8f5 in  () at /usr/lib/libQt5Core.so.5
#10 0x00007fac696a70bc in start_thread () at /usr/lib/libpthread.so.0
#11 0x00007fac706ba2ff in clone () at /usr/lib/libc.so.6

Thread 1 (Thread 0x7fac70d2de80 (LWP 2674)):
[KCrash Handler]
#6  0x00007fac42036f85 in  () at /usr/lib/dri/nouveau_dri.so
#7  0x00007fac41e1668e in  () at /usr/lib/dri/nouveau_dri.so
#8  0x00007fac42315697 in  () at /usr/lib/dri/nouveau_dri.so
#9  0x00007fac4231583a in  () at /usr/lib/dri/nouveau_dri.so
#10 0x00007fac421e25bd in  () at /usr/lib/dri/nouveau_dri.so
#11 0x00007fac421e2a22 in  () at /usr/lib/dri/nouveau_dri.so
#12 0x00007fac423115ef in  () at /usr/lib/dri/nouveau_dri.so
#13 0x00007fac41dba3fb in  () at /usr/lib/dri/nouveau_dri.so
#14 0x00007fac41db4be3 in  () at /usr/lib/dri/nouveau_dri.so
#15 0x00007fac43b9af21 in  () at /usr/lib/libGLX_mesa.so.0
#16 0x00007fac43b88769 in  () at /usr/lib/libGLX_mesa.so.0
#17 0x00007fac56b1131e in  () at
/usr/lib/qt/plugins/xcbglintegrations/libqxcb-glx-integration.so
#18 0x00007fac56b11329 in  () at
/usr/lib/qt/plugins/xcbglintegrations/libqxcb-glx-integration.so
#19 0x00007fac6e047ddf in QOpenGLContext::destroy() () at
/usr/lib/libQt5Gui.so.5
#20 0x00007fac6e048178 in QOpenGLContext::~QOpenGLContext() () at
/usr/lib/libQt5Gui.so.5
#21 0x00007fac6e04819a in QOpenGLContext::~QOpenGLContext() () at
/usr/lib/libQt5Gui.so.5
#22 0x00007fac54134b94 in  () at
/usr/lib/qt/plugins/org.kde.kdecoration2/kwin5_aurorae.so
#23 0x00007fac54134c39 in  () at
/usr/lib/qt/plugins/org.kde.kdecoration2/kwin5_aurorae.so
#24 0x00007fac701733e6 in KWin::AbstractClient::destroyDecoration() () at
/usr/lib/libkwin.so.5
#25 0x00007fac70183554 in KWin::Client::destroyDecoration() () at
/usr/lib/libkwin.so.5
#26 0x00007fac70178e8c in KWin::Client::destroyClient() () at
/usr/lib/libkwin.so.5
#27 0x00007fac701d5273 in
KWin::Client::unmapNotifyEvent(xcb_unmap_notify_event_t*) () at
/usr/lib/libkwin.so.5
#28 0x00007fac701d8b7c in KWin::Client::windowEvent(xcb_generic_event_t*) (=
) at
/usr/lib/libkwin.so.5
#29 0x00007fac701d9970 in KWin::Workspace::workspaceEvent(xcb_generic_event=
_t*)
() at /usr/lib/libkwin.so.5
#30 0x00007fac6d9fb51f in
QAbstractEventDispatcher::filterNativeEvent(QByteArray const&amp;, void*, l=
ong*) ()
at /usr/lib/libQt5Core.so.5
#31 0x00007fac58a1aa22 in QXcbConnection::handleXcbEvent(xcb_generic_event_=
t*)
() at /usr/lib/libQt5XcbQpa.so.5
#32 0x00007fac58a1b60d in QXcbConnection::processXcbEvents() () at
/usr/lib/libQt5XcbQpa.so.5
#33 0x00007fac6da28182 in QObject::event(QEvent*) () at
/usr/lib/libQt5Core.so.5
#34 0x00007fac6e7d6a74 in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() at /usr/lib/libQt5Widgets.so.5
#35 0x00007fac6e7de341 in QApplication::notify(QObject*, QEvent*) () at
/usr/lib/libQt5Widgets.so.5
#36 0x00007fac6d9fda69 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib/libQt5Core.so.5
#37 0x00007fac6da00afc in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () at /usr/lib/libQt5Core.so.5
#38 0x00007fac6da4e01d in
QEventDispatcherUNIX::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib/libQt5Core.so.5
#39 0x00007fac58aae9de in  () at /usr/lib/libQt5XcbQpa.so.5
#40 0x00007fac6d9fc6fc in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib/libQt5Core.so.5
#41 0x00007fac6da049f6 in QCoreApplication::exec() () at
/usr/lib/libQt5Core.so.5
#42 0x00007fac70986b56 in kdemain () at /usr/lib/libkdeinit5_kwin_x11.so
#43 0x00007fac705e49a7 in __libc_start_main () at /usr/lib/libc.so.6
#44 0x000056548f6f875a in _start ()</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15314167730.ed71.4550--

--===============1891420863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1891420863==--
