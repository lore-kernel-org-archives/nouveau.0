From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47306] New: segfault in nouveau_fence_update
Date: Wed, 14 Mar 2012 13:03:28 +0000
Message-ID: <bug-47306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47306

             Bug #: 47306
           Summary: segfault in nouveau_fence_update
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: brian-SquOHqY54CVWr29BmMi2cA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


9 times out of 10, trying to start mythtv's mythfrontend it will segfault with
the following stacktrace:

#0  nouveau_fence_update (screen=0x0, flushed=1 '\001') at nouveau_fence.c:141
        fence = <optimized out>
        next = 0x0
        sequence = <optimized out>
#1  0xaae1ec77 in nv50_default_flush_notify (chan=0x8f29af0) at
nv50_context.c:68
        nv50 = 0xa8248c68
#2  0xad19ff50 in nouveau_pushbuf_flush () from
/usr/lib/i386-linux-gnu/libdrm_nouveau.so.1
No symbol table info available.
#3  0xaae1ec0e in FIRE_RING (chan=<optimized out>) at
/usr/include/nouveau/nouveau_pushbuf.h:101
No locals.
#4  nv50_flush (pipe=0x8f53028, fence=0x0) at nv50_context.c:46
        screen = 0x8f29810
#5  0xaa974561 in st_flush (st=0x9001c60, fence=0x0) at
state_tracker/st_cb_flush.c:92
No locals.
#6  0xaa9745a0 in st_glFlush (ctx=0x8fc0678) at state_tracker/st_cb_flush.c:126
        st = 0x9001c60
#7  0xaabb34b0 in _mesa_flush (ctx=0x8fc0678) at main/context.c:1656
No locals.
#8  0xaabb3bce in _mesa_Flush () at main/context.c:1688
        ctx = 0x8fc0678
#9  0xb6af9899 in MythRenderOpenGL::Flush(bool) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#10 0xb6b01d1a in MythRenderOpenGL::CreateTexture(QSize, bool, unsigned int,
unsigned int, unsigned int, unsigned int, unsigned int, unsigned int) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#11 0xb6af78f3 in MythOpenGLPainter::GetTextureFromCache(MythImage*) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#12 0xb6af7da8 in MythOpenGLPainter::DrawImage(QRect const&, MythImage*, QRect
const&, int) () from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#13 0xb6a03a6f in MythUIImage::DrawSelf(MythPainter*, int, int, int, QRect) ()
from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#14 0xb69fd0e4 in MythUIType::Draw(MythPainter*, int, int, int, QRect) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#15 0xb69fd180 in MythUIType::Draw(MythPainter*, int, int, int, QRect) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#16 0xb69bb068 in MythMainWindow::draw() () from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#17 0xb69bb6f8 in MythMainWindow::drawScreen() () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#18 0xb69bb8bb in ?? () from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#19 0xb5b1cf6e in QWidget::event(QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#20 0xb235dfe2 in QGLWidget::event(QEvent*) () from
/usr/lib/i386-linux-gnu/libQtOpenGL.so.4
No symbol table info available.
#21 0xb5ac2d84 in QApplicationPrivate::notify_helper(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#22 0xb5ac81d8 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#23 0xb56f319e in QCoreApplication::notifyInternal(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#24 0xb5b19e1b in QWidgetPrivate::drawWidget(QPaintDevice*, QRegion const&,
QPoint const&, int, QPainter*, QWidgetBackingStore*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#25 0xb5cfe39e in QWidgetPrivate::repaint_sys(QRegion const&) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#26 0xb5b0f6a0 in QWidgetPrivate::syncBackingStore() () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#27 0xb5b1d8ff in QWidget::event(QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#28 0xb235dfe2 in QGLWidget::event(QEvent*) () from
/usr/lib/i386-linux-gnu/libQtOpenGL.so.4
No symbol table info available.
#29 0xb5ac2d84 in QApplicationPrivate::notify_helper(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#30 0xb5ac81d8 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#31 0xb56f319e in QCoreApplication::notifyInternal(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#32 0xb56f6f93 in QCoreApplicationPrivate::sendPostedEvents(QObject*, int,
QThreadData*) () from /usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#33 0xb56f70ec in QCoreApplication::sendPostedEvents(QObject*, int) () from
/usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#34 0xb57216a4 in ?? () from /usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#35 0xb219725f in g_main_dispatch (context=0x8db7e70) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:2441
        dispatch = 0xb5721670
        was_in_call = 0
        user_data = 0x0
        callback = 0
        cb_funcs = 0x0
        cb_data = 0x0
        current_source_link = {data = 0x8db7f00, next = 0x0}
        need_destroy = <optimized out>
        source = 0x8db7f00
        current = 0x8db7410
        i = <optimized out>
#36 g_main_context_dispatch (context=0x8db7e70) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:3011
No locals.
#37 0xb2197990 in g_main_context_iterate (context=0x8db7e70, block=-1306893536,
dispatch=1, self=<optimized out>) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:3089
        max_priority = 0
        timeout = 0
        some_ready = 1
        nfds = <optimized out>
        allocated_nfds = <optimized out>
        fds = 0xa8247fc8
#38 0xb2197c2a in g_main_context_iteration (context=0x8db7e70, may_block=0) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:3152
        retval = <optimized out>
#39 0xb5721ada in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) ()
from /usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#40 0xb5b7ae7a in ?? () from /usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#41 0xb56f7383 in
QCoreApplication::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#42 0xb6c0c1c8 in MythSystem::Wait(long) () from /usr/lib/libmythbase-0.25.so.0
No symbol table info available.
#43 0xb6c113b9 in myth_system(QString const&, unsigned int, unsigned int) ()
from /usr/lib/libmythbase-0.25.so.0
No symbol table info available.
#44 0xb6c67561 in ping(QString const&, int) () from
/usr/lib/libmythbase-0.25.so.0
No symbol table info available.
#45 0xb6c706bc in setHttpProxy() () from /usr/lib/libmythbase-0.25.so.0
No symbol table info available.
#46 0x0806d527 in ?? ()
No symbol table info available.
#47 0xb531f113 in __libc_start_main (main=0x806c160, argc=1, ubp_av=0xbfec5314,
init=0x829c060, fini=0x829c0d0, rtld_fini=0xb77deba0, stack_end=0xbfec530c) at
libc-start.c:226
        result = <optimized out>
        unwind_buf = {cancel_jmp_buf = {{jmp_buf = {-1253572620, 0, 0, 0,
632443622, -1627982093}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x1,
0x806fe74}, data = {prev = 0x0, cleanup = 0x0, canceltype = 1}}}
        not_first_call = <optimized out>
#48 0x0806fe95 in ?? ()
No symbol table info available.
Backtrace stopped: Not enough registers or memory available to unwind further

I don't know if it helps in determining the driver version information but I am
running Ubuntu kernel 3.0.0-16-generic-pae with libdrm-nouveau1a
2.4.26-1ubuntu1.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
