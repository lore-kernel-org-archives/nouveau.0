From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47306] segfault in nouveau_fence_update
Date: Thu, 15 Mar 2012 12:22:42 +0000
Message-ID: <bug-47306-8800-6Zh4Aldok1@http.bugs.freedesktop.org/>
References: <bug-47306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

--- Comment #6 from Brian J. Murrell <brian-SquOHqY54CVWr29BmMi2cA@public.gmane.org> 2012-03-15 05:22:42 PDT ---
(In reply to comment #5)
> Hello Gents

Hi Emil,

> I believe your issue was addressed previously in bug 43428, can you please
> confirm with your distribution if mesa has the patches mentioned?

That patch was not part of Ubuntu (Oneiric)'s distribution so I have applied it
and built the packages and installed them.  I got a similar segfault though,
this time with screen not being null:


Thread 1 (Thread 0xb1688720 (LWP 20539)):
#0  nouveau_fence_update (screen=0x4071d000, flushed=1 '\001') at
nouveau_fence.c:141
        fence = <optimized out>
        next = 0x0
        sequence = <optimized out>
#1  0xaae1dc77 in nv50_default_flush_notify (chan=0x8c62a38) at
nv50_context.c:68
        nv50 = 0x8d11158
#2  0xad196f50 in nouveau_pushbuf_flush (chan=0x8c62a38, min=0) at
../../nouveau/nouveau_pushbuf.c:276
        nvdev = <optimized out>
        nvchan = 0x8c62a38
        nvpb = 0x8c62b00
        req = {channel = 6, nr_buffers = 11, buffers = 147217232, nr_relocs =
17, nr_push = 1, relocs = 147258200, push = 147204932, suffix0 = 0, suffix1 =
0, vram_available = 243978240, gart_available = 536383488}
        i = <optimized out>
        ret = 0
        __PRETTY_FUNCTION__ = "nouveau_pushbuf_flush"
#3  0xaae1dc0e in FIRE_RING (chan=<optimized out>) at
/usr/include/nouveau/nouveau_pushbuf.h:101
No locals.
#4  nv50_flush (pipe=0xb014c500, fence=0x0) at nv50_context.c:46
        screen = 0x8c62758
#5  0xaa973951 in st_flush (st=0xb01fb780, fence=0x0) at
state_tracker/st_cb_flush.c:92
No locals.
#6  0xaa973990 in st_glFlush (ctx=0xb01b9950) at
state_tracker/st_cb_flush.c:126
        st = 0xb01fb780
#7  0xaabb24f0 in _mesa_flush (ctx=0xb01b9950) at main/context.c:1656
No locals.
#8  0xaabb2c0e in _mesa_Flush () at main/context.c:1688
        ctx = 0xb01b9950
#9  0xb6aeb899 in MythRenderOpenGL::Flush(bool) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#10 0xb6af3d1a in MythRenderOpenGL::CreateTexture(QSize, bool, unsigned int,
unsigned int, unsigned int, unsigned int, unsigned int, unsigned int) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#11 0xb6ae98f3 in MythOpenGLPainter::GetTextureFromCache(MythImage*) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#12 0xb6ae9da8 in MythOpenGLPainter::DrawImage(QRect const&, MythImage*, QRect
const&, int) () from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#13 0xb69f5a6f in MythUIImage::DrawSelf(MythPainter*, int, int, int, QRect) ()
from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#14 0xb69ef0e4 in MythUIType::Draw(MythPainter*, int, int, int, QRect) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#15 0xb69ef180 in MythUIType::Draw(MythPainter*, int, int, int, QRect) () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#16 0xb69ad068 in MythMainWindow::draw() () from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#17 0xb69ad6f8 in MythMainWindow::drawScreen() () from
/usr/lib/libmythui-0.25.so.0
No symbol table info available.
#18 0xb69ad8bb in ?? () from /usr/lib/libmythui-0.25.so.0
No symbol table info available.
#19 0xb5b0ef6e in QWidget::event(QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#20 0xb234ffe2 in QGLWidget::event(QEvent*) () from
/usr/lib/i386-linux-gnu/libQtOpenGL.so.4
No symbol table info available.
#21 0xb5ab4d84 in QApplicationPrivate::notify_helper(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#22 0xb5aba1d8 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#23 0xb56e519e in QCoreApplication::notifyInternal(QObject*, QEvent*) () from
/usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#24 0xb5b0be1b in QWidgetPrivate::drawWidget(QPaintDevice*, QRegion const&,
QPoint const&, int, QPainter*, QWidgetBackingStore*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#25 0xb5cf039e in QWidgetPrivate::repaint_sys(QRegion const&) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#26 0xb5b01644 in QWidgetPrivate::syncBackingStore(QRegion const&) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#27 0xb5b402e4 in ?? () from /usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#28 0xb5b41488 in QApplication::x11ProcessEvent(_XEvent*) () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#29 0xb5b6d28c in ?? () from /usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#30 0xb218925f in g_main_dispatch (context=0x8b17e70) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:2441
        dispatch = 0xb5b6d0a0
        was_in_call = 0
        user_data = 0x0
        callback = 0
        cb_funcs = 0x0
        cb_data = 0x0
        current_source_link = {data = 0x8b18e68, next = 0x0}
        need_destroy = <optimized out>
        source = 0x8b18e68
        current = 0x8b17410
        i = <optimized out>
#31 g_main_context_dispatch (context=0x8b17e70) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:3011
No locals.
#32 0xb2189990 in g_main_context_iterate (context=0x8b17e70, block=-1306950880,
dispatch=1, self=<optimized out>) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:3089
        max_priority = 0
        timeout = 0
        some_ready = 1
        nfds = <optimized out>
        allocated_nfds = <optimized out>
        fds = 0xa7e9d708
#33 0xb2189c2a in g_main_context_iteration (context=0x8b17e70, may_block=1) at
/build/buildd/glib2.0-2.30.0/./glib/gmain.c:3152
        retval = <optimized out>
#34 0xb5713ada in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) ()
from /usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#35 0xb5b6ce7a in ?? () from /usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#36 0xb56e41dd in
QEventLoop::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#37 0xb56e4421 in QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) ()
from /usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#38 0xb56e919d in QCoreApplication::exec() () from
/usr/lib/i386-linux-gnu/libQtCore.so.4
No symbol table info available.
#39 0xb5ab2924 in QApplication::exec() () from
/usr/lib/i386-linux-gnu/libQtGui.so.4
No symbol table info available.
#40 0x0806d97e in ?? ()
No symbol table info available.
#41 0xb5311113 in __libc_start_main (main=0x806c160, argc=1, ubp_av=0xbfc52ba4,
init=0x829c060, fini=0x829c0d0, rtld_fini=0xb77d0ba0, stack_end=0xbfc52b9c) at
libc-start.c:226
        result = <optimized out>
        unwind_buf = {cancel_jmp_buf = {{jmp_buf = {-1253629964, 0, 0, 0,
-1459841158, 1082856303}, mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x1,
0x806fe74}, data = {prev = 0x0, cleanup = 0x0, canceltype = 1}}}
        not_first_call = <optimized out>
#42 0x0806fe95 in ?? ()
No symbol table info available.
Backtrace stopped: Not enough registers or memory available to unwind further

Here's what gdb has to say at the moment of the crash:

#0  nouveau_fence_update (screen=0x4071d000, flushed=1 '\001')
    at nouveau_fence.c:141
141       u32 sequence = screen->fence.update(&screen->base);
(gdb) print screen
$1 = (struct nouveau_screen *) 0x4071d000
(gdb) print *screen
Cannot access memory at address 0x4071d000

So, while screen is not null, it does not seem to be pointing at valid memory
either.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
