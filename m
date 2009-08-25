From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23505] New: KDE's Kubrick has problems with
 xf86-video-nouveau driver
Date: Tue, 25 Aug 2009 05:59:51 -0700 (PDT)
Message-ID: <bug-23505-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23505

           Summary: KDE's Kubrick has problems with xf86-video-nouveau
                    driver
           Product: Mesa
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johannesobermayr-Mmb7MZpHnFY@public.gmane.org


I only post what I communicated with Ian Wadham (Kubrick developer) and KDE
games devel:

openSuSE factory and additional packages from
http://download.opensuse.org/repositories/home:/oertel:/Radeon_DRI2/openSUSE_Factory/:
 - Mesa 7.6 devel (20090807), drm modules (20090812) and libdrm (20090807)
 - Geforce 2 GTS (NV 15)
 - crash on start (see backtrace)
 - It works with my ION system and Mesa 7.6 devel...

Comment from Ian:
Kubrick has just loaded a background from a 2-D SVG file, rendered it to the
size available in the window and painted it in the bottom left of a QImage
that is 1024x1024 pixels, which is then "bound" into an OpenGL texture,
using QGLWidget::bindTexture (QImage &).  And after that it crashes in
the libraries or drivers somewhere (items #5 to #21 in backtrace [1]). AFAIK
it is valid to bind a texture during the initialize phase of OpenGL, because
you are just cacheing the texture and getting its handle in the return value.
You are not drawing anything.


Application: Kubrick (kubrick), signal: Floating point exception
[KCrash Handler]
#5  0xb42b2e1e in vbuf_alloc_vertices () from /usr/lib/dri/nouveau_dri.so
#6  0xb42b3362 in vbuf_start_prim () from /usr/lib/dri/nouveau_dri.so
#7  0xb42b33a4 in vbuf_first_tri () from /usr/lib/dri/nouveau_dri.so
#8  0xb42b2cea in validate_tri () from /usr/lib/dri/nouveau_dri.so
#9  0xb42aecf7 in do_triangle () from /usr/lib/dri/nouveau_dri.so
#10 0xb42af150 in draw_pipeline_run () from /usr/lib/dri/nouveau_dri.so
#11 0xb42b5b49 in fetch_pipeline_run () from /usr/lib/dri/nouveau_dri.so
#12 0xb42b6b4f in vcache_run_extras () from /usr/lib/dri/nouveau_dri.so
#13 0xb42b4589 in draw_arrays () from /usr/lib/dri/nouveau_dri.so
#14 0xb4141078 in nv10_draw_elements () from /usr/lib/dri/nouveau_dri.so
#15 0xb4141183 in nv10_draw_arrays () from /usr/lib/dri/nouveau_dri.so
#16 0xb42e0764 in util_draw_vertex_buffer () from /usr/lib/dri/nouveau_dri.so
#17 0xb42e307f in util_gen_mipmap () from /usr/lib/dri/nouveau_dri.so
#18 0xb418f067 in st_generate_mipmap () from /usr/lib/dri/nouveau_dri.so
#19 0xb4250010 in st_TexImage () from /usr/lib/dri/nouveau_dri.so
#20 0xb42503eb in st_TexImage2D () from /usr/lib/dri/nouveau_dri.so
#21 0xb42199a4 in _mesa_TexImage2D () from /usr/lib/dri/nouveau_dri.so
#22 0xb8040443 in QGLContextPrivate::bindTexture (this=0x8191280,
image=@0xbf8bd0ec, target=3553, format=6408, key=261993005059, clean=<value
optimized out>) at qgl.cpp:1837
#23 0xb8040c25 in QGLContextPrivate::bindTexture (this=0x8191280,
image=@0xbf8bd0ec, target=3553, format=6408, clean=<value optimized out>) at
qgl.cpp:1885
#24 0xb8040ca1 in QGLContext::bindTexture (this=0x818b858, image=@0xbf8bd0ec,
target=3553, format=6408) at qgl.cpp:1976
#25 0xb8040ceb in QGLWidget::bindTexture (this=0x81974b0, image=@0xbf8bd0ec,
target=3553, format=6408) at qgl.cpp:3983
#26 0x080656ec in GameGLView::loadBackground (this=0x81974b0,
filepath=@0x83fbec4) at
/usr/src/debug/kdegames-4.3.0/kubrick/src/gameglview.cpp:136
#27 0x080659d3 in GameGLView::initializeGL (this=0x81974b0) at
/usr/src/debug/kdegames-4.3.0/kubrick/src/gameglview.cpp:73
#28 0xb8035ddf in QGLWidget::glInit (this=0x81974b0) at qgl.cpp:3480
#29 0xb806c733 in QGLWidget::resizeEvent (this=0x81974b0) at qgl_x11.cpp:1110
#30 0xb6a181e6 in QWidget::event (this=0x81974b0, event=0xbf8bd644) at
kernel/qwidget.cpp:7695
#31 0xb8038fdc in QGLWidget::event (this=0x81974b0, e=0xbf8bd644) at
qgl.cpp:3292
#32 0xb69c17fc in QApplicationPrivate::notify_helper (this=0x8079898,
receiver=0x81974b0, e=0xbf8bd644) at kernel/qapplication.cpp:4056
#33 0xb69c9bd2 in QApplication::notify (this=0xbf8bd86c, receiver=0x81974b0,
e=0xbf8bd644) at kernel/qapplication.cpp:4021
#34 0xb7e1876d in KApplication::notify(QObject*, QEvent*) () from
/usr/lib/libkdeui.so.5
#35 0xb738916b in QCoreApplication::notifyInternal (this=0xbf8bd86c,
receiver=0x81974b0, event=0xbf8bd644) at kernel/qcoreapplication.cpp:610
#36 0xb6a16aec in QWidgetPrivate::sendPendingMoveAndResizeEvents
(this=0x819fa88, recursive=false, disableUpdates=false) at
../../src/corelib/kernel/qcoreapplication.h:213
#37 0xb6a1d7b6 in QWidgetPrivate::show_helper (this=0x819fa88) at
kernel/qwidget.cpp:6697
#38 0xb6a1dee3 in QWidget::setVisible (this=0x81974b0, visible=true) at
kernel/qwidget.cpp:6975
#39 0xb6a1dcb8 in QWidgetPrivate::showChildren (this=0x818a310,
spontaneous=false) at ../../src/gui/kernel/qwidget.h:473
#40 0xb6a1d7e1 in QWidgetPrivate::show_helper (this=0x818a310) at
kernel/qwidget.cpp:6703
#41 0xb6a1dee3 in QWidget::setVisible (this=0x81891d8, visible=true) at
kernel/qwidget.cpp:6975
#42 0x08051db6 in main (argc=1, argv=0xbf8bd964) at
/usr/include/QtGui/qwidget.h:473


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
