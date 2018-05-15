From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106530] New: [Wayland+Nouveau] KDE Desktop crashed
 after login.
Date: Tue, 15 May 2018 16:09:23 +0000
Message-ID: <bug-106530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0486757021=="
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


--===============0486757021==
Content-Type: multipart/alternative; boundary="15264005630.aDee.30715"
Content-Transfer-Encoding: 7bit


--15264005630.aDee.30715
Date: Tue, 15 May 2018 16:09:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106530

            Bug ID: 106530
           Summary: [Wayland+Nouveau] KDE Desktop crashed after login.
           Product: Mesa
           Version: 18.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jodr666-EMRzualFZlQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Was sent here from KDE bugzilla, crash seems to happen in nouveau.

https://bugs.kde.org/show_bug.cgi?id=3D394100

It happen with a GTX 760 Kepler(NVE0), i did not touched/changed any parame=
ters
for the module, all stock as ship by OpenSuse Tumbleweed.

Here is the trace for the crash:

-- Backtrace:
Application: Plasma (plasmashell), signal: Aborted
Using host libthread_db library "/lib64/libthread_db.so.1".
[Current thread is 1 (Thread 0x7fe0cbe4d880 (LWP 9602))]

Thread 11 (Thread 0x7fdffa0eb700 (LWP 9699)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7fdff00bca00) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x7fdff00bc9b0,
cond=3D0x7fdff00bc9d8) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x7fdff00bc9d8, mutex=3D0x7fdff00bc9b0) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fdffa0eb700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 10 (Thread 0x7fdffa8ec700 (LWP 9698)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x564e66f04e34) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e66f04de0,
cond=3D0x564e66f04e08) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e66f04e08, mutex=3D0x564e66f04de0) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fdffa8ec700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 9 (Thread 0x7fdffb114700 (LWP 9695)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x564e66da02a0) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e66da0250,
cond=3D0x564e66da0278) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e66da0278, mutex=3D0x564e66da0250) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fdffb114700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 8 (Thread 0x7fdffbb66700 (LWP 9694)):
[KCrash Handler]
#6  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
51
#7  0x00007fe0c508fda1 in __GI_abort () at abort.c:79
#8  0x00007fe0c508710a in __assert_fail_base (fmt=3D0x7fe0c51dc460 "%s%s%s:=
%u:
%s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0x7fe0a48a5c=
b5
"kref", file=3Dfile@entry=3D0x7fe0a48a5caa "pushbuf.c", line=3Dline@entry=
=3D727,
function=3Dfunction@entry=3D0x7fe0a48a5ce0 <__PRETTY_FUNCTION__.6480>
"nouveau_pushbuf_data") at assert.c:92
#9  0x00007fe0c5087182 in __GI___assert_fail
(assertion=3Dassertion@entry=3D0x7fe0a48a5cb5 "kref",
file=3Dfile@entry=3D0x7fe0a48a5caa "pushbuf.c", line=3Dline@entry=3D727,
function=3Dfunction@entry=3D0x7fe0a48a5ce0 <__PRETTY_FUNCTION__.6480>
"nouveau_pushbuf_data") at assert.c:101
#10 0x00007fe0a48a4128 in nouveau_pushbuf_data (push=3Dpush@entry=3D0x564e6=
51158c0,
bo=3D0x564e65115a80, offset=3D19700, length=3D928) at pushbuf.c:727
#11 0x00007fe0a48a40f0 in nouveau_pushbuf_data (push=3Dpush@entry=3D0x564e6=
51158c0,
bo=3Dbo@entry=3D0x0, offset=3Doffset@entry=3D0, length=3Dlength@entry=3D0) =
at pushbuf.c:719
#12 0x00007fe0a48a4b4e in nouveau_pushbuf_space
(push=3Dpush@entry=3D0x564e651158c0, dwords=3Ddwords@entry=3D26, relocs=3Dr=
elocs@entry=3D0,
pushes=3D<optimized out>, pushes@entry=3D0) at pushbuf.c:689
#13 0x00007fe0a50d05b6 in PUSH_SPACE (size=3D26, push=3D0x564e651158c0) at
./nouveau_winsys.h:31
#14 BEGIN_1IC0 (size=3D17, mthd=3D9100, subc=3D0, push=3D0x564e651158c0) at
./nvc0/nvc0_winsys.h:134
#15 nve4_update_surface_bindings (nvc0=3D0x564e66cb5750) at nvc0/nvc0_tex.c=
:1281
#16 nvc0_validate_surfaces (nvc0=3D0x564e66cb5750) at nvc0/nvc0_tex.c:1309
#17 0x00007fe0a50c78bc in nvc0_state_validate (nvc0=3Dnvc0@entry=3D0x564e66=
cb5750,
mask=3Dmask@entry=3D4294967295, validate_list=3Dvalidate_list@entry=3D0x7fe=
0a57897a0
<validate_list_3d>, size=3Dsize@entry=3D33, dirty=3Ddirty@entry=3D0x564e66c=
b5bb8,
bufctx=3D0x564e66cb9080) at nvc0/nvc0_state_validate.c:903
#18 0x00007fe0a50c79e7 in nvc0_state_validate_3d
(nvc0=3Dnvc0@entry=3D0x564e66cb5750, mask=3Dmask@entry=3D4294967295) at
nvc0/nvc0_state_validate.c:921
#19 0x00007fe0a50d3bed in nvc0_draw_vbo (pipe=3D0x564e66cb5750,
info=3D0x7fdffbb65690) at nvc0/nvc0_vbo.c:985
#20 0x00007fe0a4d059bf in st_draw_vbo (ctx=3D<optimized out>,
prims=3D0x7fdffbb65770, nr_prims=3D<optimized out>, ib=3D0x7fdffbb65750,
index_bounds_valid=3D<optimized out>, min_index=3D<optimized out>,
max_index=3D<optimized out>, tfb_vertcount=3D0x0, stream=3D0, indirect=3D0x=
0) at
state_tracker/st_draw.c:227
#21 0x00007fe0a4cc88f8 in vbo_validated_drawrangeelements
(ctx=3Dctx@entry=3D0x564e66cf8840, mode=3Dmode@entry=3D5,
index_bounds_valid=3Dindex_bounds_valid@entry=3D0 '\000', start=3Dstart@ent=
ry=3D0,
end=3Dend@entry=3D4294967295, count=3Dcount@entry=3D4, type=3D5123,
indices=3D0x7fdfec1604c2, basevertex=3D0, numInstances=3D1, baseInstance=3D=
0) at
vbo/vbo_exec_array.c:925
#22 0x00007fe0a4cc906f in vbo_exec_DrawElements (mode=3D5, count=3D4, type=
=3D5123,
indices=3D0x7fdfec1604c2) at vbo/vbo_exec_array.c:1075
#23 0x00007fe0c95e03c7 in
QSGBatchRenderer::Renderer::renderMergedBatch(QSGBatchRenderer::Batch const=
*)
() from /usr/lib64/libQt5Quick.so.5
#24 0x00007fe0c95e15c5 in QSGBatchRenderer::Renderer::renderBatches() () fr=
om
/usr/lib64/libQt5Quick.so.5
#25 0x00007fe0c95e692e in QSGBatchRenderer::Renderer::render() () from
/usr/lib64/libQt5Quick.so.5
#26 0x00007fe0c95d78ed in QSGRenderer::renderScene(QSGBindable const&) () f=
rom
/usr/lib64/libQt5Quick.so.5
#27 0x00007fe0c95d7d6b in QSGRenderer::renderScene(unsigned int) () from
/usr/lib64/libQt5Quick.so.5
#28 0x00007fe0c960fc70 in
QSGDefaultRenderContext::renderNextFrame(QSGRenderer*, unsigned int) () from
/usr/lib64/libQt5Quick.so.5
#29 0x00007fe0c966cf88 in QQuickWindowPrivate::renderSceneGraph(QSize const=
&)
() from /usr/lib64/libQt5Quick.so.5
#30 0x00007fe0c9617eaf in QSGRenderThread::syncAndRender() () from
/usr/lib64/libQt5Quick.so.5
#31 0x00007fe0c961b8f8 in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#32 0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#33 0x00007fe0c49f759b in start_thread (arg=3D0x7fdffbb66700) at
pthread_create.c:463
#34 0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 7 (Thread 0x7fe00eee7700 (LWP 9683)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x564e65612b10) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e65612ac0,
cond=3D0x564e65612ae8) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e65612ae8, mutex=3D0x564e65612ac0) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fe00eee7700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 6 (Thread 0x7fe01c407700 (LWP 9640)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x564e64ce21d4) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e64ce2180,
cond=3D0x564e64ce21a8) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e64ce21a8, mutex=3D0x564e64ce2180) at
pthread_cond_wait.c:655
#3  0x00007fe0a4de8d3b in cnd_wait (mtx=3D0x564e64ce2180, cond=3D0x564e64ce=
21a8) at
../../include/c11/threads_posix.h:155
#4  util_queue_thread_func (input=3Dinput@entry=3D0x564e651e7a40) at u_queu=
e.c:255
#5  0x00007fe0a4de8a67 in impl_thrd_routine (p=3D<optimized out>) at
../../include/c11/threads_posix.h:87
#6  0x00007fe0c49f759b in start_thread (arg=3D0x7fe01c407700) at
pthread_create.c:463
#7  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 5 (Thread 0x7fe0a7fff700 (LWP 9639)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x7fe0cb800fb8) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x7fe0cb800f68,
cond=3D0x7fe0cb800f90) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x7fe0cb800f90, mutex=3D0x7fe0cb800f68) at
pthread_cond_wait.c:655
#3  0x00007fe0cb50c674 in ?? () from /usr/lib64/libQt5Script.so.5
#4  0x00007fe0cb50c6b9 in ?? () from /usr/lib64/libQt5Script.so.5
#5  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0a7fff700) at
pthread_create.c:463
#6  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 4 (Thread 0x7fe0ae35f700 (LWP 9637)):
#0  0x00007fe0bf71ce29 in g_mutex_lock () from /usr/lib64/libglib-2.0.so.0
#1  0x00007fe0bf6d6993 in g_main_context_prepare () from
/usr/lib64/libglib-2.0.so.0
#2  0x00007fe0bf6d735b in ?? () from /usr/lib64/libglib-2.0.so.0
#3  0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#4  0x00007fe0c5a7082b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib64/libQt5Core.so.5
#5  0x00007fe0c5a180ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib64/libQt5Core.so.5
#6  0x00007fe0c585330a in QThread::exec() () from /usr/lib64/libQt5Core.so.5
#7  0x00007fe0c9119f35 in QQmlThreadPrivate::run() () from
/usr/lib64/libQt5Qml.so.5
#8  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#9  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0ae35f700) at
pthread_create.c:463
#10 0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7fe0afbef700 (LWP 9636)):
#0  0x00007fe0bf6d72bc in ?? () from /usr/lib64/libglib-2.0.so.0
#1  0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#2  0x00007fe0c5a7082b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib64/libQt5Core.so.5
#3  0x00007fe0c5a180ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c585330a in QThread::exec() () from /usr/lib64/libQt5Core.so.5
#5  0x00007fe0c9119f35 in QQmlThreadPrivate::run() () from
/usr/lib64/libQt5Qml.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0afbef700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7fe0b57c7700 (LWP 9621)):
#0  0x00007fe0c5147179 in __GI___poll (fds=3D0x7fe0b0003ce0, nfds=3D1, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007fe0bf6d7429 in ?? () from /usr/lib64/libglib-2.0.so.0
#2  0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#3  0x00007fe0c5a7082b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib64/libQt5Core.so.5
#4  0x00007fe0c5a180ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib64/libQt5Core.so.5
#5  0x00007fe0c585330a in QThread::exec() () from /usr/lib64/libQt5Core.so.5
#6  0x00007fe0c730fb55 in QDBusConnectionManager::run() () from
/usr/lib64/libQt5DBus.so.5
#7  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#8  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0b57c7700) at
pthread_create.c:463
#9  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7fe0cbe4d880 (LWP 9602)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D<optimized out>,
expected=3D0, futex_word=3D0x564e664ca550) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e664ca500,
cond=3D0x564e664ca528) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e664ca528, mutex=3D0x564e664ca500) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c9618a41 in
QSGThreadedRenderLoop::polishAndSync(QSGThreadedRenderLoop::Window*, bool) =
()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961954a in
QSGThreadedRenderLoop::handleUpdateRequest(QQuickWindow*) () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c967745e in QQuickWindow::event(QEvent*) () from
/usr/lib64/libQt5Quick.so.5
#7  0x0000564e638b2a4b in PanelView::event (this=3D0x564e656e8280,
e=3D0x7fffab1c69e0) at
/usr/src/debug/plasma5-workspace-5.12.4-4.1.x86_64/shell/panelview.cpp:925
#8  0x00007fe0c6c207ac in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib64/libQt5Widgets.so.5
#9  0x00007fe0c6c27894 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib64/libQt5Widgets.so.5
#10 0x00007fe0c5a197f8 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib64/libQt5Core.so.5
#11 0x00007fe0c5fcdb81 in QWindowPrivate::deliverUpdateRequest() () from
/usr/lib64/libQt5Gui.so.5
#12 0x00007fe0c5fce049 in QWindow::event(QEvent*) () from
/usr/lib64/libQt5Gui.so.5
#13 0x00007fe0c9677415 in QQuickWindow::event(QEvent*) () from
/usr/lib64/libQt5Quick.so.5
#14 0x0000564e638b2a4b in PanelView::event (this=3D0x564e656e8280,
e=3D0x7fffab1c6da0) at
/usr/src/debug/plasma5-workspace-5.12.4-4.1.x86_64/shell/panelview.cpp:925
#15 0x00007fe0c6c207ac in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib64/libQt5Widgets.so.5
#16 0x00007fe0c6c27894 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib64/libQt5Widgets.so.5
#17 0x00007fe0c5a197f8 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib64/libQt5Core.so.5
#18 0x00007fe0c5a6fdae in QTimerInfoList::activateTimers() () from
/usr/lib64/libQt5Core.so.5
#19 0x00007fe0c5a704f9 in idleTimerSourceDispatch(_GSource*, int (*)(void*),
void*) () from /usr/lib64/libQt5Core.so.5
#20 0x00007fe0bf6d7277 in g_main_context_dispatch () from
/usr/lib64/libglib-2.0.so.0
#21 0x00007fe0bf6d74b0 in ?? () from /usr/lib64/libglib-2.0.so.0
#22 0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#23 0x00007fe0c5a7080f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /usr/lib64/libQt5Core.so.5
#24 0x00007fe0b7c8cd61 in ?? () from /usr/lib64/libQt5WaylandClient.so.5
#25 0x00007fe0c5a180ea in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/usr/lib64/libQt5Core.so.5
#26 0x00007fe0c5a20bd0 in QCoreApplication::exec() () from
/usr/lib64/libQt5Core.so.5
#27 0x0000564e638a3e23 in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>) at
/usr/src/debug/plasma5-workspace-5.12.4-4.1.x86_64/shell/main.cpp:172

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15264005630.aDee.30715
Date: Tue, 15 May 2018 16:09:23 +0000
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
   title=3D"NEW - [Wayland+Nouveau] KDE Desktop crashed after login."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106530">106530</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Wayland+Nouveau] KDE Desktop crashed after login.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jodr666&#64;live.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Was sent here from KDE bugzilla, crash seems to happen in nouv=
eau.

<a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D394100">https://bugs.kde.=
org/show_bug.cgi?id=3D394100</a>

It happen with a GTX 760 Kepler(NVE0), i did not touched/changed any parame=
ters
for the module, all stock as ship by OpenSuse Tumbleweed.

Here is the trace for the crash:

-- Backtrace:
Application: Plasma (plasmashell), signal: Aborted
Using host libthread_db library &quot;/lib64/libthread_db.so.1&quot;.
[Current thread is 1 (Thread 0x7fe0cbe4d880 (LWP 9602))]

Thread 11 (Thread 0x7fdffa0eb700 (LWP 9699)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7fdff00bca00) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x7fdff00bc9b0,
cond=3D0x7fdff00bc9d8) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x7fdff00bc9d8, mutex=3D0x7fdff00bc9b0) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fdffa0eb700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 10 (Thread 0x7fdffa8ec700 (LWP 9698)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x564e66f04e34) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e66f04de0,
cond=3D0x564e66f04e08) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e66f04e08, mutex=3D0x564e66f04de0) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fdffa8ec700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 9 (Thread 0x7fdffb114700 (LWP 9695)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x564e66da02a0) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e66da0250,
cond=3D0x564e66da0278) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e66da0278, mutex=3D0x564e66da0250) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fdffb114700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 8 (Thread 0x7fdffbb66700 (LWP 9694)):
[KCrash Handler]
#6  __GI_raise (sig=3Dsig&#64;entry=3D6) at ../sysdeps/unix/sysv/linux/rais=
e.c:51
#7  0x00007fe0c508fda1 in __GI_abort () at abort.c:79
#8  0x00007fe0c508710a in __assert_fail_base (fmt=3D0x7fe0c51dc460 &quot;%s=
%s%s:%u:
%s%sAssertion `%s' failed.\n%n&quot;, assertion=3Dassertion&#64;entry=3D0x7=
fe0a48a5cb5
&quot;kref&quot;, file=3Dfile&#64;entry=3D0x7fe0a48a5caa &quot;pushbuf.c&qu=
ot;, line=3Dline&#64;entry=3D727,
function=3Dfunction&#64;entry=3D0x7fe0a48a5ce0 &lt;__PRETTY_FUNCTION__.6480=
&gt;
&quot;nouveau_pushbuf_data&quot;) at assert.c:92
#9  0x00007fe0c5087182 in __GI___assert_fail
(assertion=3Dassertion&#64;entry=3D0x7fe0a48a5cb5 &quot;kref&quot;,
file=3Dfile&#64;entry=3D0x7fe0a48a5caa &quot;pushbuf.c&quot;, line=3Dline&#=
64;entry=3D727,
function=3Dfunction&#64;entry=3D0x7fe0a48a5ce0 &lt;__PRETTY_FUNCTION__.6480=
&gt;
&quot;nouveau_pushbuf_data&quot;) at assert.c:101
#10 0x00007fe0a48a4128 in nouveau_pushbuf_data (push=3Dpush&#64;entry=3D0x5=
64e651158c0,
bo=3D0x564e65115a80, offset=3D19700, length=3D928) at pushbuf.c:727
#11 0x00007fe0a48a40f0 in nouveau_pushbuf_data (push=3Dpush&#64;entry=3D0x5=
64e651158c0,
bo=3Dbo&#64;entry=3D0x0, offset=3Doffset&#64;entry=3D0, length=3Dlength&#64=
;entry=3D0) at pushbuf.c:719
#12 0x00007fe0a48a4b4e in nouveau_pushbuf_space
(push=3Dpush&#64;entry=3D0x564e651158c0, dwords=3Ddwords&#64;entry=3D26, re=
locs=3Drelocs&#64;entry=3D0,
pushes=3D&lt;optimized out&gt;, pushes&#64;entry=3D0) at pushbuf.c:689
#13 0x00007fe0a50d05b6 in PUSH_SPACE (size=3D26, push=3D0x564e651158c0) at
./nouveau_winsys.h:31
#14 BEGIN_1IC0 (size=3D17, mthd=3D9100, subc=3D0, push=3D0x564e651158c0) at
./nvc0/nvc0_winsys.h:134
#15 nve4_update_surface_bindings (nvc0=3D0x564e66cb5750) at nvc0/nvc0_tex.c=
:1281
#16 nvc0_validate_surfaces (nvc0=3D0x564e66cb5750) at nvc0/nvc0_tex.c:1309
#17 0x00007fe0a50c78bc in nvc0_state_validate (nvc0=3Dnvc0&#64;entry=3D0x56=
4e66cb5750,
mask=3Dmask&#64;entry=3D4294967295, validate_list=3Dvalidate_list&#64;entry=
=3D0x7fe0a57897a0
&lt;validate_list_3d&gt;, size=3Dsize&#64;entry=3D33, dirty=3Ddirty&#64;ent=
ry=3D0x564e66cb5bb8,
bufctx=3D0x564e66cb9080) at nvc0/nvc0_state_validate.c:903
#18 0x00007fe0a50c79e7 in nvc0_state_validate_3d
(nvc0=3Dnvc0&#64;entry=3D0x564e66cb5750, mask=3Dmask&#64;entry=3D4294967295=
) at
nvc0/nvc0_state_validate.c:921
#19 0x00007fe0a50d3bed in nvc0_draw_vbo (pipe=3D0x564e66cb5750,
info=3D0x7fdffbb65690) at nvc0/nvc0_vbo.c:985
#20 0x00007fe0a4d059bf in st_draw_vbo (ctx=3D&lt;optimized out&gt;,
prims=3D0x7fdffbb65770, nr_prims=3D&lt;optimized out&gt;, ib=3D0x7fdffbb657=
50,
index_bounds_valid=3D&lt;optimized out&gt;, min_index=3D&lt;optimized out&g=
t;,
max_index=3D&lt;optimized out&gt;, tfb_vertcount=3D0x0, stream=3D0, indirec=
t=3D0x0) at
state_tracker/st_draw.c:227
#21 0x00007fe0a4cc88f8 in vbo_validated_drawrangeelements
(ctx=3Dctx&#64;entry=3D0x564e66cf8840, mode=3Dmode&#64;entry=3D5,
index_bounds_valid=3Dindex_bounds_valid&#64;entry=3D0 '\000', start=3Dstart=
&#64;entry=3D0,
end=3Dend&#64;entry=3D4294967295, count=3Dcount&#64;entry=3D4, type=3D5123,
indices=3D0x7fdfec1604c2, basevertex=3D0, numInstances=3D1, baseInstance=3D=
0) at
vbo/vbo_exec_array.c:925
#22 0x00007fe0a4cc906f in vbo_exec_DrawElements (mode=3D5, count=3D4, type=
=3D5123,
indices=3D0x7fdfec1604c2) at vbo/vbo_exec_array.c:1075
#23 0x00007fe0c95e03c7 in
QSGBatchRenderer::Renderer::renderMergedBatch(QSGBatchRenderer::Batch const=
*)
() from /usr/lib64/libQt5Quick.so.5
#24 0x00007fe0c95e15c5 in QSGBatchRenderer::Renderer::renderBatches() () fr=
om
/usr/lib64/libQt5Quick.so.5
#25 0x00007fe0c95e692e in QSGBatchRenderer::Renderer::render() () from
/usr/lib64/libQt5Quick.so.5
#26 0x00007fe0c95d78ed in QSGRenderer::renderScene(QSGBindable const&amp;) =
() from
/usr/lib64/libQt5Quick.so.5
#27 0x00007fe0c95d7d6b in QSGRenderer::renderScene(unsigned int) () from
/usr/lib64/libQt5Quick.so.5
#28 0x00007fe0c960fc70 in
QSGDefaultRenderContext::renderNextFrame(QSGRenderer*, unsigned int) () from
/usr/lib64/libQt5Quick.so.5
#29 0x00007fe0c966cf88 in QQuickWindowPrivate::renderSceneGraph(QSize const=
&amp;)
() from /usr/lib64/libQt5Quick.so.5
#30 0x00007fe0c9617eaf in QSGRenderThread::syncAndRender() () from
/usr/lib64/libQt5Quick.so.5
#31 0x00007fe0c961b8f8 in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#32 0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#33 0x00007fe0c49f759b in start_thread (arg=3D0x7fdffbb66700) at
pthread_create.c:463
#34 0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 7 (Thread 0x7fe00eee7700 (LWP 9683)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x564e65612b10) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e65612ac0,
cond=3D0x564e65612ae8) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e65612ae8, mutex=3D0x564e65612ac0) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c961b558 in QSGRenderThread::processEventsAndWaitForMore() ()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961b93a in QSGRenderThread::run() () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fe00eee7700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 6 (Thread 0x7fe01c407700 (LWP 9640)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x564e64ce21d4) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e64ce2180,
cond=3D0x564e64ce21a8) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e64ce21a8, mutex=3D0x564e64ce2180) at
pthread_cond_wait.c:655
#3  0x00007fe0a4de8d3b in cnd_wait (mtx=3D0x564e64ce2180, cond=3D0x564e64ce=
21a8) at
../../include/c11/threads_posix.h:155
#4  util_queue_thread_func (input=3Dinput&#64;entry=3D0x564e651e7a40) at u_=
queue.c:255
#5  0x00007fe0a4de8a67 in impl_thrd_routine (p=3D&lt;optimized out&gt;) at
../../include/c11/threads_posix.h:87
#6  0x00007fe0c49f759b in start_thread (arg=3D0x7fe01c407700) at
pthread_create.c:463
#7  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 5 (Thread 0x7fe0a7fff700 (LWP 9639)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x7fe0cb800fb8) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x7fe0cb800f68,
cond=3D0x7fe0cb800f90) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x7fe0cb800f90, mutex=3D0x7fe0cb800f68) at
pthread_cond_wait.c:655
#3  0x00007fe0cb50c674 in ?? () from /usr/lib64/libQt5Script.so.5
#4  0x00007fe0cb50c6b9 in ?? () from /usr/lib64/libQt5Script.so.5
#5  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0a7fff700) at
pthread_create.c:463
#6  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 4 (Thread 0x7fe0ae35f700 (LWP 9637)):
#0  0x00007fe0bf71ce29 in g_mutex_lock () from /usr/lib64/libglib-2.0.so.0
#1  0x00007fe0bf6d6993 in g_main_context_prepare () from
/usr/lib64/libglib-2.0.so.0
#2  0x00007fe0bf6d735b in ?? () from /usr/lib64/libglib-2.0.so.0
#3  0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#4  0x00007fe0c5a7082b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib64/libQt5Core.so.5
#5  0x00007fe0c5a180ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib64/libQt5Core.so.5
#6  0x00007fe0c585330a in QThread::exec() () from /usr/lib64/libQt5Core.so.5
#7  0x00007fe0c9119f35 in QQmlThreadPrivate::run() () from
/usr/lib64/libQt5Qml.so.5
#8  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#9  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0ae35f700) at
pthread_create.c:463
#10 0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7fe0afbef700 (LWP 9636)):
#0  0x00007fe0bf6d72bc in ?? () from /usr/lib64/libglib-2.0.so.0
#1  0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#2  0x00007fe0c5a7082b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib64/libQt5Core.so.5
#3  0x00007fe0c5a180ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c585330a in QThread::exec() () from /usr/lib64/libQt5Core.so.5
#5  0x00007fe0c9119f35 in QQmlThreadPrivate::run() () from
/usr/lib64/libQt5Qml.so.5
#6  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#7  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0afbef700) at
pthread_create.c:463
#8  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7fe0b57c7700 (LWP 9621)):
#0  0x00007fe0c5147179 in __GI___poll (fds=3D0x7fe0b0003ce0, nfds=3D1, time=
out=3D-1)
at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007fe0bf6d7429 in ?? () from /usr/lib64/libglib-2.0.so.0
#2  0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#3  0x00007fe0c5a7082b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib64/libQt5Core.so.5
#4  0x00007fe0c5a180ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib64/libQt5Core.so.5
#5  0x00007fe0c585330a in QThread::exec() () from /usr/lib64/libQt5Core.so.5
#6  0x00007fe0c730fb55 in QDBusConnectionManager::run() () from
/usr/lib64/libQt5DBus.so.5
#7  0x00007fe0c585daf8 in QThreadPrivate::start(void*) () from
/usr/lib64/libQt5Core.so.5
#8  0x00007fe0c49f759b in start_thread (arg=3D0x7fe0b57c7700) at
pthread_create.c:463
#9  0x00007fe0c5151a1f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7fe0cbe4d880 (LWP 9602)):
#0  0x00007fe0c49fd56c in futex_wait_cancelable (private=3D&lt;optimized ou=
t&gt;,
expected=3D0, futex_word=3D0x564e664ca550) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  __pthread_cond_wait_common (abstime=3D0x0, mutex=3D0x564e664ca500,
cond=3D0x564e664ca528) at pthread_cond_wait.c:502
#2  __pthread_cond_wait (cond=3D0x564e664ca528, mutex=3D0x564e664ca500) at
pthread_cond_wait.c:655
#3  0x00007fe0c585e86b in QWaitCondition::wait(QMutex*, unsigned long) () f=
rom
/usr/lib64/libQt5Core.so.5
#4  0x00007fe0c9618a41 in
QSGThreadedRenderLoop::polishAndSync(QSGThreadedRenderLoop::Window*, bool) =
()
from /usr/lib64/libQt5Quick.so.5
#5  0x00007fe0c961954a in
QSGThreadedRenderLoop::handleUpdateRequest(QQuickWindow*) () from
/usr/lib64/libQt5Quick.so.5
#6  0x00007fe0c967745e in QQuickWindow::event(QEvent*) () from
/usr/lib64/libQt5Quick.so.5
#7  0x0000564e638b2a4b in PanelView::event (this=3D0x564e656e8280,
e=3D0x7fffab1c69e0) at
/usr/src/debug/plasma5-workspace-5.12.4-4.1.x86_64/shell/panelview.cpp:925
#8  0x00007fe0c6c207ac in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib64/libQt5Widgets.so.5
#9  0x00007fe0c6c27894 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib64/libQt5Widgets.so.5
#10 0x00007fe0c5a197f8 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib64/libQt5Core.so.5
#11 0x00007fe0c5fcdb81 in QWindowPrivate::deliverUpdateRequest() () from
/usr/lib64/libQt5Gui.so.5
#12 0x00007fe0c5fce049 in QWindow::event(QEvent*) () from
/usr/lib64/libQt5Gui.so.5
#13 0x00007fe0c9677415 in QQuickWindow::event(QEvent*) () from
/usr/lib64/libQt5Quick.so.5
#14 0x0000564e638b2a4b in PanelView::event (this=3D0x564e656e8280,
e=3D0x7fffab1c6da0) at
/usr/src/debug/plasma5-workspace-5.12.4-4.1.x86_64/shell/panelview.cpp:925
#15 0x00007fe0c6c207ac in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /usr/lib64/libQt5Widgets.so.5
#16 0x00007fe0c6c27894 in QApplication::notify(QObject*, QEvent*) () from
/usr/lib64/libQt5Widgets.so.5
#17 0x00007fe0c5a197f8 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /usr/lib64/libQt5Core.so.5
#18 0x00007fe0c5a6fdae in QTimerInfoList::activateTimers() () from
/usr/lib64/libQt5Core.so.5
#19 0x00007fe0c5a704f9 in idleTimerSourceDispatch(_GSource*, int (*)(void*),
void*) () from /usr/lib64/libQt5Core.so.5
#20 0x00007fe0bf6d7277 in g_main_context_dispatch () from
/usr/lib64/libglib-2.0.so.0
#21 0x00007fe0bf6d74b0 in ?? () from /usr/lib64/libglib-2.0.so.0
#22 0x00007fe0bf6d753c in g_main_context_iteration () from
/usr/lib64/libglib-2.0.so.0
#23 0x00007fe0c5a7080f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /usr/lib64/libQt5Core.so.5
#24 0x00007fe0b7c8cd61 in ?? () from /usr/lib64/libQt5WaylandClient.so.5
#25 0x00007fe0c5a180ea in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/usr/lib64/libQt5Core.so.5
#26 0x00007fe0c5a20bd0 in QCoreApplication::exec() () from
/usr/lib64/libQt5Core.so.5
#27 0x0000564e638a3e23 in main (argc=3D&lt;optimized out&gt;, argv=3D&lt;op=
timized out&gt;) at
/usr/src/debug/plasma5-workspace-5.12.4-4.1.x86_64/shell/main.cpp:172</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15264005630.aDee.30715--

--===============0486757021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0486757021==--
