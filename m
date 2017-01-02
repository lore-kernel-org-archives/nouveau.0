From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref on nv50 when
 rendering from multiple threads
Date: Mon, 02 Jan 2017 07:37:58 +0000
Message-ID: <bug-92438-8800-u18lOEbPYg@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1046324101=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1046324101==
Content-Type: multipart/alternative; boundary="14833426781.b2dA.23350";
 charset="UTF-8"


--14833426781.b2dA.23350
Date: Mon, 2 Jan 2017 07:37:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92438

David Kredba <nheghathivhistha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nheghathivhistha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #41 from David Kredba <nheghathivhistha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am getting the same with libdrm-2.4.74, mesa=3D13.0.2, crashes when the
html5test web page is opened in the Konqueror browser with QTWebengine-5.7.=
1:
libdrm-2.4.74/nouveau/pushbuf.c:727: nouveau_pushbuf_data: Assertion
=E2=80=9Ekref=E2=80=9Cfailed

[New Thread 0x7fff655dc700 (LWP 21049)]
konqueror:
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:727:
nouveau_pushbuf_data: P=C5=99edpoklad =E2=80=9Ekref=E2=80=9C nespln=C4=9Bn.

Thread 1 "konqueror" received signal SIGABRT, Aborted.
0x00007ffff7767228 in raise () from /lib64/libc.so.6
(gdb) where
#0  0x00007ffff7767228 in raise () from /lib64/libc.so.6
#1  0x00007ffff77686aa in abort () from /lib64/libc.so.6
#2  0x00007ffff7760167 in ?? () from /lib64/libc.so.6
#3  0x00007ffff7760212 in __assert_fail () from /lib64/libc.so.6
#4  0x00007fffe0619e54 in nouveau_pushbuf_data (push=3Dpush@entry=3D0x6d0d8=
0,
bo=3D0x6a58b0, offset=3D331932, length=3D496)
    at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:727
#5  0x00007fffe0619d9b in nouveau_pushbuf_data (push=3Dpush@entry=3D0x6d0d8=
0,
bo=3Dbo@entry=3D0x0, offset=3Doffset@entry=3D0, length=3Dlength@entry=3D0)
    at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:719
#6  0x00007fffe0619ee9 in pushbuf_submit (push=3Dpush@entry=3D0x6d0d80,
chan=3D<optimized out>, chan=3D<optimized out>)
    at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:330
#7  0x00007fffe061a18f in pushbuf_flush (push=3Dpush@entry=3D0x6d0d80) at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:405
#8  0x00007fffe061ad50 in nouveau_pushbuf_kick (push=3D0x6d0d80, chan=3D<op=
timized
out>) at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:779
#9  0x00007fffe0f54d06 in PUSH_KICK (push=3D<optimized out>) at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/gallium/driver=
s/nouveau/nouveau_winsys.h:59
#10 nv50_flush (pipe=3D0x2733370, fence=3D<optimized out>, flags=3D<optimiz=
ed out>)
    at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/gallium/driver=
s/nouveau/nv50/nv50_context.c:40
#11 0x00007fffe0c2bc1b in st_finish (st=3Dst@entry=3D0x276c570) at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/mesa/state_tra=
cker/st_cb_flush.c:98
#12 0x00007fffe0c2bc80 in st_glFinish (ctx=3D<optimized out>) at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/mesa/state_tra=
cker/st_cb_flush.c:136
#13 0x00007ffff39916a9 in QOpenGLWidgetPrivate::beginCompose (this=3D0x2667=
c50)
at kernel/qopenglwidget.cpp:727
#14 0x00007ffff395f629 in QWidgetPrivate::sendComposeStatus (w=3D<optimized=
 out>,
end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12227
#15 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D<optimized=
 out>,
end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12233
#16 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D<optimized=
 out>,
end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12233
#17 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D<optimized=
 out>,
end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12233
#18 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D<optimized=
 out>,
end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12233
#19 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D<optimized=
 out>,
end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12233
#20 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D<optimized=
 out>,
end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12233
#21 0x00007ffff3937709 in QWidgetBackingStore::qt_flush (widget=3D0x75a5d0,
region=3D..., backingStore=3D<optimized out>, tlw=3D0x75a5d0, tlwOffset=3D.=
..,=20
    widgetTextures=3D<optimized out>, widgetBackingStore=3D0xb17e20) at
kernel/qwidgetbackingstore.cpp:132
#22 0x00007ffff3938ed9 in QWidgetBackingStore::flush (this=3Dthis@entry=3D0=
xb17e20,
widget=3Dwidget@entry=3D0x0) at kernel/qwidgetbackingstore.cpp:1431
#23 0x00007ffff393a442 in QWidgetBackingStore::doSync
(this=3Dthis@entry=3D0xb17e20) at kernel/qwidgetbackingstore.cpp:1323
#24 0x00007ffff393aded in QWidgetBackingStore::sync (this=3D0xb17e20) at
kernel/qwidgetbackingstore.cpp:1179
#25 0x00007ffff3959a9f in QWidgetPrivate::syncBackingStore (this=3D0x75c3f0=
) at
kernel/qwidget.cpp:1962
#26 0x00007ffff3971c08 in QWidget::event (this=3Dthis@entry=3D0x75a5d0,
event=3Devent@entry=3D0x268a660) at kernel/qwidget.cpp:9100
#27 0x00007ffff3a6fb0b in QMainWindow::event (this=3Dthis@entry=3D0x75a5d0,
event=3Devent@entry=3D0x268a660) at widgets/qmainwindow.cpp:1543
#28 0x00007ffff592c9d7 in KMainWindow::event (this=3Dthis@entry=3D0x75a5d0,
ev=3Dev@entry=3D0x268a660)
    at
/var/tmp/portage/kde-frameworks/kxmlgui-5.29.0/work/kxmlgui-5.29.0/src/kmai=
nwindow.cpp:867
#29 0x00007ffff5971295 in KXmlGuiWindow::event (this=3Dthis@entry=3D0x75a5d=
0,
ev=3Dev@entry=3D0x268a660)
    at
/var/tmp/portage/kde-frameworks/kxmlgui-5.29.0/work/kxmlgui-5.29.0/src/kxml=
guiwindow.cpp:118
#30 0x00007ffff7b504e4 in KonqMainWindow::event (this=3D0x75a5d0, e=3D0x268=
a660) at
/var/tmp/portage/kde-apps/konqueror-16.12.0/work/konqueror-16.12.0/src/konq=
mainwindow.cpp:5494
#31 0x00007ffff392aacc in QApplicationPrivate::notify_helper (this=3D<optim=
ized
out>, receiver=3D0x75a5d0, e=3D0x268a660) at kernel/qapplication.cpp:3799
#32 0x00007ffff39324c6 in QApplication::notify (this=3D0x7fffffffd300,
receiver=3D0x75a5d0, e=3D0x268a660) at kernel/qapplication.cpp:3556
#33 0x00007ffff2ea2b7a in QCoreApplication::notifyInternal2 (receiver=3D0x7=
5a5d0,
event=3Devent@entry=3D0x268a660) at kernel/qcoreapplication.cpp:988
#34 0x00007ffff2ea51bb in QCoreApplication::sendEvent (event=3D0x268a660,
receiver=3D<optimized out>) at kernel/qcoreapplication.h:231
#35 QCoreApplicationPrivate::sendPostedEvents (receiver=3Dreceiver@entry=3D=
0x0,
event_type=3Devent_type@entry=3D0, data=3D0x61ab10) at
kernel/qcoreapplication.cpp:1649
#36 0x00007ffff2ea5628 in QCoreApplication::sendPostedEvents
(receiver=3Dreceiver@entry=3D0x0, event_type=3Devent_type@entry=3D0) at
kernel/qcoreapplication.cpp:1503
#37 0x00007ffff2eef6d3 in postEventSourceDispatch (s=3D0x667670) at
kernel/qeventdispatcher_glib.cpp:276
#38 0x00007fffed0995e7 in g_main_context_dispatch () from
/usr/lib64/libglib-2.0.so.0
#39 0x00007fffed099840 in ?? () from /usr/lib64/libglib-2.0.so.0
#40 0x00007fffed0998ec in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#41 0x00007ffff2eef74f in QEventDispatcherGlib::processEvents (this=3D0x670=
e90,
flags=3D...) at kernel/qeventdispatcher_glib.cpp:423
#42 0x00007ffff2ea1b3a in QEventLoop::exec (this=3Dthis@entry=3D0x7fffffffd=
1b0,
flags=3D..., flags@entry=3D...) at kernel/qeventloop.cpp:212
#43 0x00007ffff2ea940c in QCoreApplication::exec () at
kernel/qcoreapplication.cpp:1261
#44 0x00007ffff341b39c in QGuiApplication::exec () at
kernel/qguiapplication.cpp:1633
#45 0x00007ffff392aa25 in QApplication::exec () at kernel/qapplication.cpp:=
2975
#46 0x00007ffff7b929c0 in kdemain (argc=3D1, argv=3D<optimized out>) at
/var/tmp/portage/kde-apps/konqueror-16.12.0/work/konqueror-16.12.0/src/konq=
main.cpp:233
#47 0x00007ffff7754720 in __libc_start_main () from /lib64/libc.so.6
#48 0x00000000004006e9 in _start ()

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14833426781.b2dA.23350
Date: Mon, 2 Jan 2017 07:37:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:nheghathi=
vhistha&#64;gmail.com" title=3D"David Kredba &lt;nheghathivhistha&#64;gmail=
.com&gt;"> <span class=3D"fn">David Kredba</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Segfault in pushbuf_kref on nv50 when rendering from=
 multiple threads"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92438">bug 92438<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>nheghathivhistha&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Segfault in pushbuf_kref on nv50 when rendering from=
 multiple threads"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92438#c41">Commen=
t # 41</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Segfault in pushbuf_kref on nv50 when rendering from=
 multiple threads"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92438">bug 92438<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nheghathivhistha&#64;gmail.com" title=3D"David Kredba &lt;nheghathivhistha&=
#64;gmail.com&gt;"> <span class=3D"fn">David Kredba</span></a>
</span></b>
        <pre>I am getting the same with libdrm-2.4.74, mesa=3D13.0.2, crash=
es when the
html5test web page is opened in the Konqueror browser with QTWebengine-5.7.=
1:
libdrm-2.4.74/nouveau/pushbuf.c:727: nouveau_pushbuf_data: Assertion
=E2=80=9Ekref=E2=80=9Cfailed

[New Thread 0x7fff655dc700 (LWP 21049)]
konqueror:
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:727:
nouveau_pushbuf_data: P=C5=99edpoklad =E2=80=9Ekref=E2=80=9C nespln=C4=9Bn.

Thread 1 &quot;konqueror&quot; received signal SIGABRT, Aborted.
0x00007ffff7767228 in raise () from /lib64/libc.so.6
(gdb) where
#0  0x00007ffff7767228 in raise () from /lib64/libc.so.6
#1  0x00007ffff77686aa in abort () from /lib64/libc.so.6
#2  0x00007ffff7760167 in ?? () from /lib64/libc.so.6
#3  0x00007ffff7760212 in __assert_fail () from /lib64/libc.so.6
#4  0x00007fffe0619e54 in nouveau_pushbuf_data (push=3Dpush&#64;entry=3D0x6=
d0d80,
bo=3D0x6a58b0, offset=3D331932, length=3D496)
    at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:727
#5  0x00007fffe0619d9b in nouveau_pushbuf_data (push=3Dpush&#64;entry=3D0x6=
d0d80,
bo=3Dbo&#64;entry=3D0x0, offset=3Doffset&#64;entry=3D0, length=3Dlength&#64=
;entry=3D0)
    at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:719
#6  0x00007fffe0619ee9 in pushbuf_submit (push=3Dpush&#64;entry=3D0x6d0d80,
chan=3D&lt;optimized out&gt;, chan=3D&lt;optimized out&gt;)
    at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:330
#7  0x00007fffe061a18f in pushbuf_flush (push=3Dpush&#64;entry=3D0x6d0d80) =
at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:405
#8  0x00007fffe061ad50 in nouveau_pushbuf_kick (push=3D0x6d0d80, chan=3D&lt=
;optimized
out&gt;) at
/var/tmp/portage/x11-libs/libdrm-2.4.74/work/libdrm-2.4.74/nouveau/pushbuf.=
c:779
#9  0x00007fffe0f54d06 in PUSH_KICK (push=3D&lt;optimized out&gt;) at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/gallium/driver=
s/nouveau/nouveau_winsys.h:59
#10 nv50_flush (pipe=3D0x2733370, fence=3D&lt;optimized out&gt;, flags=3D&l=
t;optimized out&gt;)
    at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/gallium/driver=
s/nouveau/nv50/nv50_context.c:40
#11 0x00007fffe0c2bc1b in st_finish (st=3Dst&#64;entry=3D0x276c570) at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/mesa/state_tra=
cker/st_cb_flush.c:98
#12 0x00007fffe0c2bc80 in st_glFinish (ctx=3D&lt;optimized out&gt;) at
/var/tmp/portage/media-libs/mesa-13.0.2/work/mesa-13.0.2/src/mesa/state_tra=
cker/st_cb_flush.c:136
#13 0x00007ffff39916a9 in QOpenGLWidgetPrivate::beginCompose (this=3D0x2667=
c50)
at kernel/qopenglwidget.cpp:727
#14 0x00007ffff395f629 in QWidgetPrivate::sendComposeStatus (w=3D&lt;optimi=
zed out&gt;,
end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.cpp:12227
#15 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D&lt;optimi=
zed out&gt;,
end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.cpp:12233
#16 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D&lt;optimi=
zed out&gt;,
end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.cpp:12233
#17 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D&lt;optimi=
zed out&gt;,
end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.cpp:12233
#18 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D&lt;optimi=
zed out&gt;,
end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.cpp:12233
#19 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D&lt;optimi=
zed out&gt;,
end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.cpp:12233
#20 0x00007ffff395f5e7 in QWidgetPrivate::sendComposeStatus (w=3D&lt;optimi=
zed out&gt;,
end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.cpp:12233
#21 0x00007ffff3937709 in QWidgetBackingStore::qt_flush (widget=3D0x75a5d0,
region=3D..., backingStore=3D&lt;optimized out&gt;, tlw=3D0x75a5d0, tlwOffs=
et=3D...,=20
    widgetTextures=3D&lt;optimized out&gt;, widgetBackingStore=3D0xb17e20) =
at
kernel/qwidgetbackingstore.cpp:132
#22 0x00007ffff3938ed9 in QWidgetBackingStore::flush (this=3Dthis&#64;entry=
=3D0xb17e20,
widget=3Dwidget&#64;entry=3D0x0) at kernel/qwidgetbackingstore.cpp:1431
#23 0x00007ffff393a442 in QWidgetBackingStore::doSync
(this=3Dthis&#64;entry=3D0xb17e20) at kernel/qwidgetbackingstore.cpp:1323
#24 0x00007ffff393aded in QWidgetBackingStore::sync (this=3D0xb17e20) at
kernel/qwidgetbackingstore.cpp:1179
#25 0x00007ffff3959a9f in QWidgetPrivate::syncBackingStore (this=3D0x75c3f0=
) at
kernel/qwidget.cpp:1962
#26 0x00007ffff3971c08 in QWidget::event (this=3Dthis&#64;entry=3D0x75a5d0,
event=3Devent&#64;entry=3D0x268a660) at kernel/qwidget.cpp:9100
#27 0x00007ffff3a6fb0b in QMainWindow::event (this=3Dthis&#64;entry=3D0x75a=
5d0,
event=3Devent&#64;entry=3D0x268a660) at widgets/qmainwindow.cpp:1543
#28 0x00007ffff592c9d7 in KMainWindow::event (this=3Dthis&#64;entry=3D0x75a=
5d0,
ev=3Dev&#64;entry=3D0x268a660)
    at
/var/tmp/portage/kde-frameworks/kxmlgui-5.29.0/work/kxmlgui-5.29.0/src/kmai=
nwindow.cpp:867
#29 0x00007ffff5971295 in KXmlGuiWindow::event (this=3Dthis&#64;entry=3D0x7=
5a5d0,
ev=3Dev&#64;entry=3D0x268a660)
    at
/var/tmp/portage/kde-frameworks/kxmlgui-5.29.0/work/kxmlgui-5.29.0/src/kxml=
guiwindow.cpp:118
#30 0x00007ffff7b504e4 in KonqMainWindow::event (this=3D0x75a5d0, e=3D0x268=
a660) at
/var/tmp/portage/kde-apps/konqueror-16.12.0/work/konqueror-16.12.0/src/konq=
mainwindow.cpp:5494
#31 0x00007ffff392aacc in QApplicationPrivate::notify_helper (this=3D&lt;op=
timized
out&gt;, receiver=3D0x75a5d0, e=3D0x268a660) at kernel/qapplication.cpp:3799
#32 0x00007ffff39324c6 in QApplication::notify (this=3D0x7fffffffd300,
receiver=3D0x75a5d0, e=3D0x268a660) at kernel/qapplication.cpp:3556
#33 0x00007ffff2ea2b7a in QCoreApplication::notifyInternal2 (receiver=3D0x7=
5a5d0,
event=3Devent&#64;entry=3D0x268a660) at kernel/qcoreapplication.cpp:988
#34 0x00007ffff2ea51bb in QCoreApplication::sendEvent (event=3D0x268a660,
receiver=3D&lt;optimized out&gt;) at kernel/qcoreapplication.h:231
#35 QCoreApplicationPrivate::sendPostedEvents (receiver=3Dreceiver&#64;entr=
y=3D0x0,
event_type=3Devent_type&#64;entry=3D0, data=3D0x61ab10) at
kernel/qcoreapplication.cpp:1649
#36 0x00007ffff2ea5628 in QCoreApplication::sendPostedEvents
(receiver=3Dreceiver&#64;entry=3D0x0, event_type=3Devent_type&#64;entry=3D0=
) at
kernel/qcoreapplication.cpp:1503
#37 0x00007ffff2eef6d3 in postEventSourceDispatch (s=3D0x667670) at
kernel/qeventdispatcher_glib.cpp:276
#38 0x00007fffed0995e7 in g_main_context_dispatch () from
/usr/lib64/libglib-2.0.so.0
#39 0x00007fffed099840 in ?? () from /usr/lib64/libglib-2.0.so.0
#40 0x00007fffed0998ec in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#41 0x00007ffff2eef74f in QEventDispatcherGlib::processEvents (this=3D0x670=
e90,
flags=3D...) at kernel/qeventdispatcher_glib.cpp:423
#42 0x00007ffff2ea1b3a in QEventLoop::exec (this=3Dthis&#64;entry=3D0x7ffff=
fffd1b0,
flags=3D..., flags&#64;entry=3D...) at kernel/qeventloop.cpp:212
#43 0x00007ffff2ea940c in QCoreApplication::exec () at
kernel/qcoreapplication.cpp:1261
#44 0x00007ffff341b39c in QGuiApplication::exec () at
kernel/qguiapplication.cpp:1633
#45 0x00007ffff392aa25 in QApplication::exec () at kernel/qapplication.cpp:=
2975
#46 0x00007ffff7b929c0 in kdemain (argc=3D1, argv=3D&lt;optimized out&gt;) =
at
/var/tmp/portage/kde-apps/konqueror-16.12.0/work/konqueror-16.12.0/src/konq=
main.cpp:233
#47 0x00007ffff7754720 in __libc_start_main () from /lib64/libc.so.6
#48 0x00000000004006e9 in _start ()</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14833426781.b2dA.23350--

--===============1046324101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1046324101==--
