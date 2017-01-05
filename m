From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99282] New: KDE kontact crashes always
Date: Thu, 05 Jan 2017 11:56:53 +0000
Message-ID: <bug-99282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1119304260=="
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


--===============1119304260==
Content-Type: multipart/alternative; boundary="14836174130.F73b49.24764";
 charset="UTF-8"


--14836174130.F73b49.24764
Date: Thu, 5 Jan 2017 11:56:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99282

            Bug ID: 99282
           Summary: KDE kontact crashes always
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: thanosk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Application: kontact (5.3.3 (QtWebEngine))

Qt Version: 5.7.1
Frameworks Version: 5.27.0
Operating System: Linux 4.8.14-300.fc25.x86_64 x86_64
Distribution: "Fedora release 25 (Twenty Five)"

-- Information about the crash:
Kontact crashes nearly always when browsing feeds

The crash can be reproduced every time.

-- Backtrace:
Application: Kontact (kontact), signal: Segmentation fault
Using host libthread_db library "/lib64/libthread_db.so.1".
84      T_PSEUDO (SYSCALL_SYMBOL, SYSCALL_NAME, SYSCALL_NARGS)
[Current thread is 1 (Thread 0x7f21611b7940 (LWP 6579))]

Thread 40 (Thread 0x7f2019fa1700 (LWP 7131)):
#0  0x00007f216c28e7f9 in g_mutex_lock () from /lib64/libglib-2.0.so.0
#1  0x00007f216c248d06 in g_main_context_dispatch () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c2491c0 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#3  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#4  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#5  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#6  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#7  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2019fa1700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 39 (Thread 0x7f201a7a2700 (LWP 7129)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f201a=
7a19d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f201a7a2700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 38 (Thread 0x7f201afa3700 (LWP 7118)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f201a=
fa29d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f201afa3700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 37 (Thread 0x7f201b7a4700 (LWP 7116)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f201b=
7a39d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f201b7a4700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 36 (Thread 0x7f2011248700 (LWP 7114)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f2011=
2479d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2011248700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 35 (Thread 0x7f2011c56700 (LWP 7112)):
#0  0x00007f216c28e814 in g_mutex_unlock () from /lib64/libglib-2.0.so.0
#1  0x00007f216c248b25 in g_main_context_check () from /lib64/libglib-2.0.s=
o.0
#2  0x00007f216c2490f4 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#3  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#4  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#5  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#6  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#7  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2011c56700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 34 (Thread 0x7f200f878700 (LWP 7110)):
#0  0x00007f216c249276 in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#1  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#2  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#3  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#4  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f200f878700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 33 (Thread 0x7f201307e700 (LWP 7108)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f201307e700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 32 (Thread 0x7f202d104700 (LWP 6691)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751f5c49 in
base::SequencedWorkerPool::Inner::ThreadLoop(base::SequencedWorkerPool::Wor=
ker*)
() from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f6289 in base::SequencedWorkerPool::Worker::Run() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f6440 in base::SimpleThread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f202d104700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 31 (Thread 0x7f202f3ee700 (LWP 6630)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f202f3ee700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 30 (Thread 0x7f202fbef700 (LWP 6628)):
#0  0x00007f216c248c08 in g_main_context_check () from /lib64/libglib-2.0.s=
o.0
#1  0x00007f216c2490f4 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f202fbef700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 29 (Thread 0x7f2042795700 (LWP 6622)):
#0  0x00007f216c248ba1 in g_main_context_check () from /lib64/libglib-2.0.s=
o.0
#1  0x00007f216c2490f4 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2042795700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 28 (Thread 0x7f2042f96700 (LWP 6620)):
#0  0x00007f2179c7e741 in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#1  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#2  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#3  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#4  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2042f96700) at
pthread_create.c:333
#5  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 27 (Thread 0x7f2043bd5700 (LWP 6618)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2043bd5700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 26 (Thread 0x7f2051376700 (LWP 6616)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2051376700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 25 (Thread 0x7f2051b77700 (LWP 6614)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f2051=
b769d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2051b77700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 24 (Thread 0x7f2052378700 (LWP 6612)):
#0  0x00007f216c24868c in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#1  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2052378700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 23 (Thread 0x7f2052b79700 (LWP 6611)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f2052=
b789d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2052b79700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 22 (Thread 0x7f2104ff9700 (LWP 6610)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f216308f2f4 in QTWTF::TCMalloc_PageHeap::scavengerThread() () fr=
om
/lib64/libQt5Script.so.5
#2  0x00007f216308f339 in QTWTF::TCMalloc_PageHeap::runScavengerThread(void=
*)
() from /lib64/libQt5Script.so.5
#3  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2104ff9700) at
pthread_create.c:333
#4  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 21 (Thread 0x7f21057fa700 (LWP 6605)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751f5c49 in
base::SequencedWorkerPool::Inner::ThreadLoop(base::SequencedWorkerPool::Wor=
ker*)
() from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f6289 in base::SequencedWorkerPool::Worker::Run() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f6440 in base::SimpleThread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21057fa700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 20 (Thread 0x7f2105ffb700 (LWP 6604)):
#0  __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f2178e93ac4 in ___fprintf_chk (fp=3D0x7f217913e730
<_IO_stdfile_2_lock>, flag=3Dflag@entry=3D1, format=3Dformat@entry=3D0x7f21=
6a84cc74
"[%s] %s\n") at fprintf_chk.c:30
#2  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 "[%s] %s\n",
__stream=3D<optimized out>) at /usr/include/bits/stdio2.h:97
#3  event_log (msg=3D0x7f2105ffa550 "epoll_wait: Bad file descriptor",
severity=3D2) at log.c:222
#4  _warn_helper (severity=3Dseverity@entry=3D2, errstr=3D0x7f2178f05c0e "B=
ad file
descriptor", fmt=3Dfmt@entry=3D0x7f216a84d45a "epoll_wait",
ap=3Dap@entry=3D0x7f2105ffa980) at log.c:187
#5  0x00007f216a834a64 in event_warn (fmt=3Dfmt@entry=3D0x7f216a84d45a
"epoll_wait") at log.c:101
#6  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f20ec0019e0, tv=3D<opti=
mized
out>) at epoll.c:413
#7  0x00007f216a82318a in event_base_loop (base=3D0x7f20ec0019e0, flags=3D1=
) at
event.c:1625
#8  0x00007f21751a3a12 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2105ffb700) at
pthread_create.c:333
#14 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 19 (Thread 0x7f21067fc700 (LWP 6603)):
[KCrash Handler]
#6  0x00007f214d47c22f in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
#7  0x00007f214d47c8b9 in pushbuf_validate () from /lib64/libdrm_nouveau.so=
.2
#8  0x00007f214e0b1dc3 in nv50_blit () from /usr/lib64/dri/nouveau_dri.so
#9  0x00007f214dcc67f7 in st_TexSubImage () from /usr/lib64/dri/nouveau_dri=
.so
#10 0x00007f214dc4b5db in _mesa_texture_sub_image () from
/usr/lib64/dri/nouveau_dri.so
#11 0x00007f214dc4b846 in texsubimage () from /usr/lib64/dri/nouveau_dri.so
#12 0x00007f214dc4bc68 in _mesa_TexSubImage2D () from
/usr/lib64/dri/nouveau_dri.so
#13 0x00007f21757f4123 in
gpu::gles2::TextureManager::ValidateAndDoTexSubImage(gpu::gles2::GLES2Decod=
er*,
gpu::gles2::DecoderTextureState*, gpu::gles2::ContextState*,
gpu::gles2::DecoderFramebufferState*, char const*,
gpu::gles2::TextureManager::DoTexSubImageArguments const&) () from
/lib64/libQt5WebEngineCore.so.5
#14 0x00007f2175784f35 in
gpu::gles2::GLES2DecoderImpl::HandleTexSubImage2D(unsigned int, void const*=
) ()
from /lib64/libQt5WebEngineCore.so.5
#15 0x00007f21757af7c2 in gpu::error::Error
gpu::gles2::GLES2DecoderImpl::DoCommandsImpl<false>(unsigned int, void cons=
t*,
int, int*) () from /lib64/libQt5WebEngineCore.so.5
#16 0x00007f21757fe37a in gpu::CommandParser::ProcessCommands(int) () from
/lib64/libQt5WebEngineCore.so.5
#17 0x00007f21757c356a in gpu::GpuScheduler::PutChanged() () from
/lib64/libQt5WebEngineCore.so.5
#18 0x00007f2174b7f490 in content::GpuCommandBufferStub::OnAsyncFlush(int,
unsigned int, std::vector<ui::LatencyInfo, std::allocator<ui::LatencyInfo> >
const&) () from /lib64/libQt5WebEngineCore.so.5
#19 0x00007f2174b82ad1 in
content::GpuCommandBufferStub::OnMessageReceived(IPC::Message const&) () fr=
om
/lib64/libQt5WebEngineCore.so.5
#20 0x00007f2174b7e20e in content::GpuChannel::HandleMessage() [clone
.part.322] () from /lib64/libQt5WebEngineCore.so.5
#21 0x00007f217521dfa9 in base::debug::TaskAnnotator::RunTask(char const*,
base::PendingTask const&) () from /lib64/libQt5WebEngineCore.so.5
#22 0x00007f21751c9ed9 in base::MessageLoop::RunTask(base::PendingTask cons=
t&)
() from /lib64/libQt5WebEngineCore.so.5
#23 0x00007f21751caa99 in
base::MessageLoop::DeferOrRunPendingTask(base::PendingTask const&) () from
/lib64/libQt5WebEngineCore.so.5
#24 0x00007f21751caf52 in base::MessageLoop::DoWork() () from
/lib64/libQt5WebEngineCore.so.5
#25 0x00007f21751ccdc9 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#26 0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#27 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#28 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#29 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#30 0x00007f2170ccd6ca in start_thread (arg=3D0x7f21067fc700) at
pthread_create.c:333
#31 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 18 (Thread 0x7f21077fe700 (LWP 6602)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f2174d971c0 in mojo::system::Waiter::Wait(unsigned long, unsigned
long*) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f2174d7fff0 in mojo::system::Core::WaitManyInternal(unsigned int
const*, unsigned int const*, unsigned int, unsigned long, unsigned int*,
mojo::system::HandleSignalsState*) () from /lib64/libQt5WebEngineCore.so.5
#3  0x00007f2174d8037b in mojo::system::Core::Wait(unsigned int, unsigned i=
nt,
unsigned long, mojo::system::UserPointer<MojoHandleSignalsState>) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2174d7c00a in MojoWait () from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2175ef582e in
mojo::common::MessagePumpMojo::WaitForReadyHandles(mojo::common::MessagePum=
pMojo::RunState
const&) const () from /lib64/libQt5WebEngineCore.so.5
#6  0x00007f2175ef7be4 in
mojo::common::MessagePumpMojo::DoInternalWork(mojo::common::MessagePumpMojo=
::RunState
const&, bool) () from /lib64/libQt5WebEngineCore.so.5
#7  0x00007f2175ef7c35 in
mojo::common::MessagePumpMojo::DoRunLoop(mojo::common::MessagePumpMojo::Run=
State*,
base::MessagePump::Delegate*) () from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2175ef7d09 in
mojo::common::MessagePumpMojo::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f2170ccd6ca in start_thread (arg=3D0x7f21077fe700) at
pthread_create.c:333
#14 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 17 (Thread 0x7f2106ffd700 (LWP 6601)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f21544b7f51 in poll (__timeout=3D-1, __nfds=3D3, __fds=3D0x7f20e=
8006c50)
at /usr/include/bits/poll2.h:46
#2  poll_func (ufds=3D0x7f20e8006c50, nfds=3D3, timeout=3D-1,
userdata=3D0x557ddb1f3cf0) at pulse/thread-mainloop.c:69
#3  0x00007f21544a9721 in pa_mainloop_poll (m=3Dm@entry=3D0x557ddb1f6130) at
pulse/mainloop.c:844
#4  0x00007f21544a9dbe in pa_mainloop_iterate (m=3D0x557ddb1f6130,
block=3D<optimized out>, retval=3D0x0) at pulse/mainloop.c:926
#5  0x00007f21544a9e70 in pa_mainloop_run (m=3D0x557ddb1f6130,
retval=3Dretval@entry=3D0x0) at pulse/mainloop.c:944
#6  0x00007f21544b7e99 in thread (userdata=3D0x557ddb1f9770) at
pulse/thread-mainloop.c:100
#7  0x00007f214fdd2178 in internal_thread_func (userdata=3D0x557ddb1f1610) =
at
pulsecore/thread-posix.c:81
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2106ffd700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 16 (Thread 0x7f2107fff700 (LWP 6600)):
#0  pthread_cond_timedwait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:225
#1  0x00007f21751ea912 in base::ConditionVariable::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1b5 in base::WaitableEvent::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce51 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2107fff700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 15 (Thread 0x7f2128ff9700 (LWP 6599)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21748b0a0d in cc::SingleThreadTaskGraphRunner::Run() () from
/lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f631e in base::DelegateSimpleThread::Run() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f6440 in base::SimpleThread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2128ff9700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 14 (Thread 0x7f21297fa700 (LWP 6598)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21297fa700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 13 (Thread 0x7f2129ffb700 (LWP 6597)):
#0  0x00007f2178e84563 in epoll_wait () at
../sysdeps/unix/syscall-template.S:84
#1  0x00007f216a8390c8 in epoll_dispatch (base=3D0x7f2110001950, tv=3D<opti=
mized
out>) at epoll.c:407
#2  0x00007f216a82318a in event_base_loop (base=3D0x7f2110001950, flags=3D1=
) at
event.c:1625
#3  0x00007f21751a3ac5 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7fa8 in
content::BrowserThreadImpl::IOThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d80eb in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2129ffb700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 12 (Thread 0x7f212a7fc700 (LWP 6596)):
#0  __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f2178e93ac4 in ___fprintf_chk (fp=3D0x7f217913e730
<_IO_stdfile_2_lock>, flag=3Dflag@entry=3D1, format=3Dformat@entry=3D0x7f21=
6a84cc74
"[%s] %s\n") at fprintf_chk.c:30
#2  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 "[%s] %s\n",
__stream=3D<optimized out>) at /usr/include/bits/stdio2.h:97
#3  event_log (msg=3D0x7f212a7fb1c0 "epoll_wait: Bad file descriptor",
severity=3D2) at log.c:222
#4  _warn_helper (severity=3Dseverity@entry=3D2, errstr=3D0x7f2178f05c0e "B=
ad file
descriptor", fmt=3Dfmt@entry=3D0x7f216a84d45a "epoll_wait",
ap=3Dap@entry=3D0x7f212a7fb5f0) at log.c:187
#5  0x00007f216a834a64 in event_warn (fmt=3Dfmt@entry=3D0x7f216a84d45a
"epoll_wait") at log.c:101
#6  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f211c0019e0, tv=3D<opti=
mized
out>) at epoll.c:413
#7  0x00007f216a82318a in event_base_loop (base=3D0x7f211c0019e0, flags=3D1=
) at
event.c:1625
#8  0x00007f21751a3ac5 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21744d7ef8 in
content::BrowserThreadImpl::CacheThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21744d814b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#14 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#15 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212a7fc700) at
pthread_create.c:333
#16 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 11 (Thread 0x7f212affd700 (LWP 6595)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7e48 in
content::BrowserThreadImpl::ProcessLauncherThreadRun(base::MessageLoop*) ()
from /lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d813b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212affd700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 10 (Thread 0x7f212b7fe700 (LWP 6594)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7d98 in
content::BrowserThreadImpl::FileUserBlockingThreadRun(base::MessageLoop*) ()
from /lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d812b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212b7fe700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 9 (Thread 0x7f212bfff700 (LWP 6593)):
#0  __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f2178e93ac4 in ___fprintf_chk (fp=3D0x7f217913e730
<_IO_stdfile_2_lock>, flag=3Dflag@entry=3D1, format=3Dformat@entry=3D0x7f21=
6a84cc74
"[%s] %s\n") at fprintf_chk.c:30
#2  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 "[%s] %s\n",
__stream=3D<optimized out>) at /usr/include/bits/stdio2.h:97
#3  event_log (msg=3D0x7f212bffe1c0 "epoll_wait: Bad file descriptor",
severity=3D2) at log.c:222
#4  _warn_helper (severity=3Dseverity@entry=3D2, errstr=3D0x7f2178f05c0e "B=
ad file
descriptor", fmt=3Dfmt@entry=3D0x7f216a84d45a "epoll_wait",
ap=3Dap@entry=3D0x7f212bffe5f0) at log.c:187
#5  0x00007f216a834a64 in event_warn (fmt=3Dfmt@entry=3D0x7f216a84d45a
"epoll_wait") at log.c:101
#6  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f21180019e0, tv=3D<opti=
mized
out>) at epoll.c:413
#7  0x00007f216a82318a in event_base_loop (base=3D0x7f21180019e0, flags=3D1=
) at
event.c:1625
#8  0x00007f21751a3a12 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21744d7ce8 in
content::BrowserThreadImpl::FileThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21744d811b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#14 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#15 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212bfff700) at
pthread_create.c:333
#16 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 8 (Thread 0x7f2140ff9700 (LWP 6592)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7c38 in
content::BrowserThreadImpl::DBThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d810b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2140ff9700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 7 (Thread 0x7f21417fa700 (LWP 6591)):
#0  pthread_cond_timedwait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:225
#1  0x00007f21751ea912 in base::ConditionVariable::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f94f0 in base::PosixDynamicThreadPool::WaitForTask() () fr=
om
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f9a23 in base::(anonymous
namespace)::WorkerThread::ThreadMain() () from /lib64/libQt5WebEngineCore.s=
o.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21417fa700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 6 (Thread 0x7f2141ffb700 (LWP 6590)):
#0  pthread_cond_timedwait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:225
#1  0x00007f21751ea912 in base::ConditionVariable::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f94f0 in base::PosixDynamicThreadPool::WaitForTask() () fr=
om
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f9a23 in base::(anonymous
namespace)::WorkerThread::ThreadMain() () from /lib64/libQt5WebEngineCore.s=
o.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2141ffb700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 5 (Thread 0x7f21427fc700 (LWP 6589)):
#0  pthread_cond_wait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21427fc700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 4 (Thread 0x7f2142ffd700 (LWP 6588)):
#0  __lll_unlock_wake_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:341
#1  0x00007f2178e93b6b in _IO_acquire_lock_clear_flags2_fct (p=3D<synthetic
pointer>) at ../libio/libioP.h:873
#2  ___fprintf_chk (fp=3D0x7f217913d500 <_IO_2_1_stderr_>, flag=3Dflag@entr=
y=3D1,
format=3Dformat@entry=3D0x7f216a84cc74 "[%s] %s\n") at fprintf_chk.c:30
#3  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 "[%s] %s\n",
__stream=3D<optimized out>) at /usr/include/bits/stdio2.h:97
#4  event_log (msg=3D0x7f2142ffc550 "epoll_wait: Bad file descriptor",
severity=3D2) at log.c:222
#5  _warn_helper (severity=3Dseverity@entry=3D2, errstr=3D0x7f2178f05c0e "B=
ad file
descriptor", fmt=3Dfmt@entry=3D0x7f216a84d45a "epoll_wait",
ap=3Dap@entry=3D0x7f2142ffc980) at log.c:187
#6  0x00007f216a834a64 in event_warn (fmt=3Dfmt@entry=3D0x7f216a84d45a
"epoll_wait") at log.c:101
#7  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f21380019e0, tv=3D<opti=
mized
out>) at epoll.c:413
#8  0x00007f216a82318a in event_base_loop (base=3D0x7f21380019e0, flags=3D1=
) at
event.c:1625
#9  0x00007f21751a3a12 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#13 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2142ffd700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 3 (Thread 0x7f2149eb2700 (LWP 6581)):
#0  0x00007f216c2486c3 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#1  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f217ea9d739 in QDBusConnectionManager::run() () from
/lib64/libQt5DBus.so.5
#7  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2149eb2700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 2 (Thread 0x7f21564c0700 (LWP 6580)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216f739d10 in poll (__timeout=3D-1, __nfds=3D1, __fds=3D0x7f215=
64bfb80)
at /usr/include/bits/poll2.h:46
#2  _xcb_conn_wait (c=3Dc@entry=3D0x557ddafbc4c0, cond=3Dcond@entry=3D0x557=
ddafbc500,
vector=3Dvector@entry=3D0x0, count=3Dcount@entry=3D0x0) at xcb_conn.c:479
#3  0x00007f216f73baa9 in xcb_wait_for_event (c=3D0x557ddafbc4c0) at xcb_in=
.c:693
#4  0x00007f215a530d69 in QXcbEventReader::run() () from
/lib64/libQt5XcbQpa.so.5
#5  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#6  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21564c0700) at
pthread_create.c:333
#7  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 1 (Thread 0x7f21611b7940 (LWP 6579)):
[KCrash Handler]
#6  0x00007f214d47c22f in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
#7  0x00007f214d47c8b9 in pushbuf_validate () from /lib64/libdrm_nouveau.so=
.2
#8  0x00007f214e097c16 in nv50_flush () from /usr/lib64/dri/nouveau_dri.so
#9  0x00007f214dcbcdd4 in st_glFlush () from /usr/lib64/dri/nouveau_dri.so
#10 0x00007f214db6a9c8 in _mesa_make_current () from
/usr/lib64/dri/nouveau_dri.so
#11 0x00007f214dcefe2b in st_api_make_current () from
/usr/lib64/dri/nouveau_dri.so
#12 0x00007f214de59a7f in dri_unbind_context () from
/usr/lib64/dri/nouveau_dri.so
#13 0x00007f214de5952a in driUnbindContext () from
/usr/lib64/dri/nouveau_dri.so
#14 0x00007f216f2d4f05 in glXMakeCurrentReadSGI () from /lib64/libGL.so.1
#15 0x00007f217eb6e1a0 in QGLXContext::makeCurrent(QPlatformSurface*) () fr=
om
/usr/lib64/qt5/plugins/xcbglintegrations/libqxcb-glx-integration.so
#16 0x00007f2179f9eb08 in QOpenGLContext::makeCurrent(QSurface*) () from
/lib64/libQt5Gui.so.5
#17 0x00007f217a4d86b1 in QOpenGLWidget::makeCurrent() () from
/lib64/libQt5Widgets.so.5
#18 0x00007f217a4d8845 in QOpenGLWidgetPrivate::render() () from
/lib64/libQt5Widgets.so.5
#19 0x00007f217a4b8780 in QWidget::event(QEvent*) () from
/lib64/libQt5Widgets.so.5
#20 0x00007f217ea190ab in
QtWebEngineCore::RenderWidgetHostViewQtDelegateWidget::event(QEvent*) () fr=
om
/lib64/libQt5WebEngineWidgets.so.5
#21 0x00007f217a470ecc in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /lib64/libQt5Widgets.so.5
#22 0x00007f217a478671 in QApplication::notify(QObject*, QEvent*) () from
/lib64/libQt5Widgets.so.5
#23 0x00007f2179c307aa in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /lib64/libQt5Core.so.5
#24 0x00007f217a4b146a in QWidgetPrivate::sendPaintEvent(QRegion const&) ()
from /lib64/libQt5Widgets.so.5
#25 0x00007f217a4809ae in QWidgetBackingStore::doSync() () from
/lib64/libQt5Widgets.so.5
#26 0x00007f217a48147f in QWidgetBackingStore::sync() () from
/lib64/libQt5Widgets.so.5
#27 0x00007f217a4a03df in QWidgetPrivate::syncBackingStore() () from
/lib64/libQt5Widgets.so.5
#28 0x00007f217a4b8858 in QWidget::event(QEvent*) () from
/lib64/libQt5Widgets.so.5
#29 0x00007f217a5b801b in QMainWindow::event(QEvent*) () from
/lib64/libQt5Widgets.so.5
#30 0x00007f217d3127b7 in KMainWindow::event (this=3Dthis@entry=3D0x557ddb1=
2e920,
ev=3Dev@entry=3D0x557ddcbfa980) at
/usr/src/debug/kxmlgui-5.27.0/src/kmainwindow.cpp:867
#31 0x00007f217d357365 in KXmlGuiWindow::event (this=3D0x557ddb12e920,
ev=3D0x557ddcbfa980) at /usr/src/debug/kxmlgui-5.27.0/src/kxmlguiwindow.cpp=
:118
#32 0x00007f217a470ecc in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /lib64/libQt5Widgets.so.5
#33 0x00007f217a478671 in QApplication::notify(QObject*, QEvent*) () from
/lib64/libQt5Widgets.so.5
#34 0x00007f2179c307aa in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /lib64/libQt5Core.so.5
#35 0x00007f2179c32e90 in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () from /lib64/libQt5Core.so.5
#36 0x00007f2179c7e6a3 in postEventSourceDispatch(_GSource*, int (*)(void*),
void*) () from /lib64/libQt5Core.so.5
#37 0x00007f216c248e42 in g_main_context_dispatch () from
/lib64/libglib-2.0.so.0
#38 0x00007f216c2491c0 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#39 0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#40 0x00007f2179c7e71f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
from /lib64/libQt5Core.so.5
#41 0x00007f2179c2f73a in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () from
/lib64/libQt5Core.so.5
#42 0x00007f2179c3723c in QCoreApplication::exec() () from
/lib64/libQt5Core.so.5
#43 0x0000557dda97746f in main ()

Reported using DrKonqi

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14836174130.F73b49.24764
Date: Thu, 5 Jan 2017 11:56:53 +0000
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
   title=3D"NEW - KDE kontact crashes always"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99282">99282</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>KDE kontact crashes always
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>thanosk&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Application: kontact (5.3.3 (QtWebEngine))

Qt Version: 5.7.1
Frameworks Version: 5.27.0
Operating System: Linux 4.8.14-300.fc25.x86_64 x86_64
Distribution: &quot;Fedora release 25 (Twenty Five)&quot;

-- Information about the crash:
Kontact crashes nearly always when browsing feeds

The crash can be reproduced every time.

-- Backtrace:
Application: Kontact (kontact), signal: Segmentation fault
Using host libthread_db library &quot;/lib64/libthread_db.so.1&quot;.
84      T_PSEUDO (SYSCALL_SYMBOL, SYSCALL_NAME, SYSCALL_NARGS)
[Current thread is 1 (Thread 0x7f21611b7940 (LWP 6579))]

Thread 40 (Thread 0x7f2019fa1700 (LWP 7131)):
#0  0x00007f216c28e7f9 in g_mutex_lock () from /lib64/libglib-2.0.so.0
#1  0x00007f216c248d06 in g_main_context_dispatch () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c2491c0 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#3  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#4  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#5  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#6  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#7  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2019fa1700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 39 (Thread 0x7f201a7a2700 (LWP 7129)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f201a=
7a19d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&amp;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f201a7a2700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 38 (Thread 0x7f201afa3700 (LWP 7118)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f201a=
fa29d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&amp;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f201afa3700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 37 (Thread 0x7f201b7a4700 (LWP 7116)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f201b=
7a39d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&amp;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f201b7a4700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 36 (Thread 0x7f2011248700 (LWP 7114)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f2011=
2479d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&amp;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2011248700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 35 (Thread 0x7f2011c56700 (LWP 7112)):
#0  0x00007f216c28e814 in g_mutex_unlock () from /lib64/libglib-2.0.so.0
#1  0x00007f216c248b25 in g_main_context_check () from /lib64/libglib-2.0.s=
o.0
#2  0x00007f216c2490f4 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#3  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#4  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#5  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#6  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#7  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2011c56700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 34 (Thread 0x7f200f878700 (LWP 7110)):
#0  0x00007f216c249276 in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#1  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#2  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#3  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#4  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f200f878700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 33 (Thread 0x7f201307e700 (LWP 7108)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f201307e700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 32 (Thread 0x7f202d104700 (LWP 6691)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751f5c49 in
base::SequencedWorkerPool::Inner::ThreadLoop(base::SequencedWorkerPool::Wor=
ker*)
() from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f6289 in base::SequencedWorkerPool::Worker::Run() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f6440 in base::SimpleThread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f202d104700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 31 (Thread 0x7f202f3ee700 (LWP 6630)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f202f3ee700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 30 (Thread 0x7f202fbef700 (LWP 6628)):
#0  0x00007f216c248c08 in g_main_context_check () from /lib64/libglib-2.0.s=
o.0
#1  0x00007f216c2490f4 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f202fbef700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 29 (Thread 0x7f2042795700 (LWP 6622)):
#0  0x00007f216c248ba1 in g_main_context_check () from /lib64/libglib-2.0.s=
o.0
#1  0x00007f216c2490f4 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2042795700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 28 (Thread 0x7f2042f96700 (LWP 6620)):
#0  0x00007f2179c7e741 in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#1  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#2  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#3  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#4  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2042f96700) at
pthread_create.c:333
#5  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 27 (Thread 0x7f2043bd5700 (LWP 6618)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2043bd5700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 26 (Thread 0x7f2051376700 (LWP 6616)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216c249156 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2051376700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 25 (Thread 0x7f2051b77700 (LWP 6614)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f2051=
b769d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&amp;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2051b77700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 24 (Thread 0x7f2052378700 (LWP 6612)):
#0  0x00007f216c24868c in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#1  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#7  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2052378700) at
pthread_create.c:333
#8  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 23 (Thread 0x7f2052b79700 (LWP 6611)):
#0  0x00007ffdf5680b12 in clock_gettime ()
#1  0x00007f2178e92686 in __GI___clock_gettime (clock_id=3D1, tp=3D0x7f2052=
b789d0)
at ../sysdeps/unix/clock_gettime.c:115
#2  0x00007f2179b27af1 in qt_gettime() () from /lib64/libQt5Core.so.5
#3  0x00007f2179c7cde9 in QTimerInfoList::updateCurrentTime() () from
/lib64/libQt5Core.so.5
#4  0x00007f2179c7d1e5 in QTimerInfoList::timerWait(timespec&amp;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179c7e3dc in timerSourcePrepareHelper(GTimerSource*, int*) () =
from
/lib64/libQt5Core.so.5
#6  0x00007f2179c7e4a5 in timerSourcePrepare(_GSource*, int*) () from
/lib64/libQt5Core.so.5
#7  0x00007f216c248699 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#8  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#9  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#10 0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#11 0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#12 0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#13 0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2052b79700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 22 (Thread 0x7f2104ff9700 (LWP 6610)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f216308f2f4 in QTWTF::TCMalloc_PageHeap::scavengerThread() () fr=
om
/lib64/libQt5Script.so.5
#2  0x00007f216308f339 in QTWTF::TCMalloc_PageHeap::runScavengerThread(void=
*)
() from /lib64/libQt5Script.so.5
#3  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2104ff9700) at
pthread_create.c:333
#4  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 21 (Thread 0x7f21057fa700 (LWP 6605)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751f5c49 in
base::SequencedWorkerPool::Inner::ThreadLoop(base::SequencedWorkerPool::Wor=
ker*)
() from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f6289 in base::SequencedWorkerPool::Worker::Run() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f6440 in base::SimpleThread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21057fa700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 20 (Thread 0x7f2105ffb700 (LWP 6604)):
#0  __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f2178e93ac4 in ___fprintf_chk (fp=3D0x7f217913e730
&lt;_IO_stdfile_2_lock&gt;, flag=3Dflag&#64;entry=3D1, format=3Dformat&#64;=
entry=3D0x7f216a84cc74
&quot;[%s] %s\n&quot;) at fprintf_chk.c:30
#2  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 &quot;[%s] %s\n&q=
uot;,
__stream=3D&lt;optimized out&gt;) at /usr/include/bits/stdio2.h:97
#3  event_log (msg=3D0x7f2105ffa550 &quot;epoll_wait: Bad file descriptor&q=
uot;,
severity=3D2) at log.c:222
#4  _warn_helper (severity=3Dseverity&#64;entry=3D2, errstr=3D0x7f2178f05c0=
e &quot;Bad file
descriptor&quot;, fmt=3Dfmt&#64;entry=3D0x7f216a84d45a &quot;epoll_wait&quo=
t;,
ap=3Dap&#64;entry=3D0x7f2105ffa980) at log.c:187
#5  0x00007f216a834a64 in event_warn (fmt=3Dfmt&#64;entry=3D0x7f216a84d45a
&quot;epoll_wait&quot;) at log.c:101
#6  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f20ec0019e0, tv=3D&lt;o=
ptimized
out&gt;) at epoll.c:413
#7  0x00007f216a82318a in event_base_loop (base=3D0x7f20ec0019e0, flags=3D1=
) at
event.c:1625
#8  0x00007f21751a3a12 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2105ffb700) at
pthread_create.c:333
#14 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 19 (Thread 0x7f21067fc700 (LWP 6603)):
[KCrash Handler]
#6  0x00007f214d47c22f in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
#7  0x00007f214d47c8b9 in pushbuf_validate () from /lib64/libdrm_nouveau.so=
.2
#8  0x00007f214e0b1dc3 in nv50_blit () from /usr/lib64/dri/nouveau_dri.so
#9  0x00007f214dcc67f7 in st_TexSubImage () from /usr/lib64/dri/nouveau_dri=
.so
#10 0x00007f214dc4b5db in _mesa_texture_sub_image () from
/usr/lib64/dri/nouveau_dri.so
#11 0x00007f214dc4b846 in texsubimage () from /usr/lib64/dri/nouveau_dri.so
#12 0x00007f214dc4bc68 in _mesa_TexSubImage2D () from
/usr/lib64/dri/nouveau_dri.so
#13 0x00007f21757f4123 in
gpu::gles2::TextureManager::ValidateAndDoTexSubImage(gpu::gles2::GLES2Decod=
er*,
gpu::gles2::DecoderTextureState*, gpu::gles2::ContextState*,
gpu::gles2::DecoderFramebufferState*, char const*,
gpu::gles2::TextureManager::DoTexSubImageArguments const&amp;) () from
/lib64/libQt5WebEngineCore.so.5
#14 0x00007f2175784f35 in
gpu::gles2::GLES2DecoderImpl::HandleTexSubImage2D(unsigned int, void const*=
) ()
from /lib64/libQt5WebEngineCore.so.5
#15 0x00007f21757af7c2 in gpu::error::Error
gpu::gles2::GLES2DecoderImpl::DoCommandsImpl&lt;false&gt;(unsigned int, voi=
d const*,
int, int*) () from /lib64/libQt5WebEngineCore.so.5
#16 0x00007f21757fe37a in gpu::CommandParser::ProcessCommands(int) () from
/lib64/libQt5WebEngineCore.so.5
#17 0x00007f21757c356a in gpu::GpuScheduler::PutChanged() () from
/lib64/libQt5WebEngineCore.so.5
#18 0x00007f2174b7f490 in content::GpuCommandBufferStub::OnAsyncFlush(int,
unsigned int, std::vector&lt;ui::LatencyInfo, std::allocator&lt;ui::Latency=
Info&gt; &gt;
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#19 0x00007f2174b82ad1 in
content::GpuCommandBufferStub::OnMessageReceived(IPC::Message const&amp;) (=
) from
/lib64/libQt5WebEngineCore.so.5
#20 0x00007f2174b7e20e in content::GpuChannel::HandleMessage() [clone
.part.322] () from /lib64/libQt5WebEngineCore.so.5
#21 0x00007f217521dfa9 in base::debug::TaskAnnotator::RunTask(char const*,
base::PendingTask const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#22 0x00007f21751c9ed9 in base::MessageLoop::RunTask(base::PendingTask cons=
t&amp;)
() from /lib64/libQt5WebEngineCore.so.5
#23 0x00007f21751caa99 in
base::MessageLoop::DeferOrRunPendingTask(base::PendingTask const&amp;) () f=
rom
/lib64/libQt5WebEngineCore.so.5
#24 0x00007f21751caf52 in base::MessageLoop::DoWork() () from
/lib64/libQt5WebEngineCore.so.5
#25 0x00007f21751ccdc9 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#26 0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#27 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#28 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#29 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#30 0x00007f2170ccd6ca in start_thread (arg=3D0x7f21067fc700) at
pthread_create.c:333
#31 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 18 (Thread 0x7f21077fe700 (LWP 6602)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f2174d971c0 in mojo::system::Waiter::Wait(unsigned long, unsigned
long*) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f2174d7fff0 in mojo::system::Core::WaitManyInternal(unsigned int
const*, unsigned int const*, unsigned int, unsigned long, unsigned int*,
mojo::system::HandleSignalsState*) () from /lib64/libQt5WebEngineCore.so.5
#3  0x00007f2174d8037b in mojo::system::Core::Wait(unsigned int, unsigned i=
nt,
unsigned long, mojo::system::UserPointer&lt;MojoHandleSignalsState&gt;) () =
from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2174d7c00a in MojoWait () from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2175ef582e in
mojo::common::MessagePumpMojo::WaitForReadyHandles(mojo::common::MessagePum=
pMojo::RunState
const&amp;) const () from /lib64/libQt5WebEngineCore.so.5
#6  0x00007f2175ef7be4 in
mojo::common::MessagePumpMojo::DoInternalWork(mojo::common::MessagePumpMojo=
::RunState
const&amp;, bool) () from /lib64/libQt5WebEngineCore.so.5
#7  0x00007f2175ef7c35 in
mojo::common::MessagePumpMojo::DoRunLoop(mojo::common::MessagePumpMojo::Run=
State*,
base::MessagePump::Delegate*) () from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2175ef7d09 in
mojo::common::MessagePumpMojo::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f2170ccd6ca in start_thread (arg=3D0x7f21077fe700) at
pthread_create.c:333
#14 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 17 (Thread 0x7f2106ffd700 (LWP 6601)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f21544b7f51 in poll (__timeout=3D-1, __nfds=3D3, __fds=3D0x7f20e=
8006c50)
at /usr/include/bits/poll2.h:46
#2  poll_func (ufds=3D0x7f20e8006c50, nfds=3D3, timeout=3D-1,
userdata=3D0x557ddb1f3cf0) at pulse/thread-mainloop.c:69
#3  0x00007f21544a9721 in pa_mainloop_poll (m=3Dm&#64;entry=3D0x557ddb1f613=
0) at
pulse/mainloop.c:844
#4  0x00007f21544a9dbe in pa_mainloop_iterate (m=3D0x557ddb1f6130,
block=3D&lt;optimized out&gt;, retval=3D0x0) at pulse/mainloop.c:926
#5  0x00007f21544a9e70 in pa_mainloop_run (m=3D0x557ddb1f6130,
retval=3Dretval&#64;entry=3D0x0) at pulse/mainloop.c:944
#6  0x00007f21544b7e99 in thread (userdata=3D0x557ddb1f9770) at
pulse/thread-mainloop.c:100
#7  0x00007f214fdd2178 in internal_thread_func (userdata=3D0x557ddb1f1610) =
at
pulsecore/thread-posix.c:81
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2106ffd700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 16 (Thread 0x7f2107fff700 (LWP 6600)):
#0  pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:225
#1  0x00007f21751ea912 in base::ConditionVariable::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1b5 in base::WaitableEvent::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce51 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2107fff700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 15 (Thread 0x7f2128ff9700 (LWP 6599)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21748b0a0d in cc::SingleThreadTaskGraphRunner::Run() () from
/lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f631e in base::DelegateSimpleThread::Run() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f6440 in base::SimpleThread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2128ff9700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 14 (Thread 0x7f21297fa700 (LWP 6598)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21297fa700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 13 (Thread 0x7f2129ffb700 (LWP 6597)):
#0  0x00007f2178e84563 in epoll_wait () at
../sysdeps/unix/syscall-template.S:84
#1  0x00007f216a8390c8 in epoll_dispatch (base=3D0x7f2110001950, tv=3D&lt;o=
ptimized
out&gt;) at epoll.c:407
#2  0x00007f216a82318a in event_base_loop (base=3D0x7f2110001950, flags=3D1=
) at
event.c:1625
#3  0x00007f21751a3ac5 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7fa8 in
content::BrowserThreadImpl::IOThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d80eb in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2129ffb700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 12 (Thread 0x7f212a7fc700 (LWP 6596)):
#0  __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f2178e93ac4 in ___fprintf_chk (fp=3D0x7f217913e730
&lt;_IO_stdfile_2_lock&gt;, flag=3Dflag&#64;entry=3D1, format=3Dformat&#64;=
entry=3D0x7f216a84cc74
&quot;[%s] %s\n&quot;) at fprintf_chk.c:30
#2  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 &quot;[%s] %s\n&q=
uot;,
__stream=3D&lt;optimized out&gt;) at /usr/include/bits/stdio2.h:97
#3  event_log (msg=3D0x7f212a7fb1c0 &quot;epoll_wait: Bad file descriptor&q=
uot;,
severity=3D2) at log.c:222
#4  _warn_helper (severity=3Dseverity&#64;entry=3D2, errstr=3D0x7f2178f05c0=
e &quot;Bad file
descriptor&quot;, fmt=3Dfmt&#64;entry=3D0x7f216a84d45a &quot;epoll_wait&quo=
t;,
ap=3Dap&#64;entry=3D0x7f212a7fb5f0) at log.c:187
#5  0x00007f216a834a64 in event_warn (fmt=3Dfmt&#64;entry=3D0x7f216a84d45a
&quot;epoll_wait&quot;) at log.c:101
#6  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f211c0019e0, tv=3D&lt;o=
ptimized
out&gt;) at epoll.c:413
#7  0x00007f216a82318a in event_base_loop (base=3D0x7f211c0019e0, flags=3D1=
) at
event.c:1625
#8  0x00007f21751a3ac5 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21744d7ef8 in
content::BrowserThreadImpl::CacheThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21744d814b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#14 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#15 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212a7fc700) at
pthread_create.c:333
#16 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 11 (Thread 0x7f212affd700 (LWP 6595)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7e48 in
content::BrowserThreadImpl::ProcessLauncherThreadRun(base::MessageLoop*) ()
from /lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d813b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212affd700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 10 (Thread 0x7f212b7fe700 (LWP 6594)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7d98 in
content::BrowserThreadImpl::FileUserBlockingThreadRun(base::MessageLoop*) ()
from /lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d812b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212b7fe700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 9 (Thread 0x7f212bfff700 (LWP 6593)):
#0  __lll_lock_wait_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:95
#1  0x00007f2178e93ac4 in ___fprintf_chk (fp=3D0x7f217913e730
&lt;_IO_stdfile_2_lock&gt;, flag=3Dflag&#64;entry=3D1, format=3Dformat&#64;=
entry=3D0x7f216a84cc74
&quot;[%s] %s\n&quot;) at fprintf_chk.c:30
#2  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 &quot;[%s] %s\n&q=
uot;,
__stream=3D&lt;optimized out&gt;) at /usr/include/bits/stdio2.h:97
#3  event_log (msg=3D0x7f212bffe1c0 &quot;epoll_wait: Bad file descriptor&q=
uot;,
severity=3D2) at log.c:222
#4  _warn_helper (severity=3Dseverity&#64;entry=3D2, errstr=3D0x7f2178f05c0=
e &quot;Bad file
descriptor&quot;, fmt=3Dfmt&#64;entry=3D0x7f216a84d45a &quot;epoll_wait&quo=
t;,
ap=3Dap&#64;entry=3D0x7f212bffe5f0) at log.c:187
#5  0x00007f216a834a64 in event_warn (fmt=3Dfmt&#64;entry=3D0x7f216a84d45a
&quot;epoll_wait&quot;) at log.c:101
#6  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f21180019e0, tv=3D&lt;o=
ptimized
out&gt;) at epoll.c:413
#7  0x00007f216a82318a in event_base_loop (base=3D0x7f21180019e0, flags=3D1=
) at
event.c:1625
#8  0x00007f21751a3a12 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21744d7ce8 in
content::BrowserThreadImpl::FileThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21744d811b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#13 0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#14 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#15 0x00007f2170ccd6ca in start_thread (arg=3D0x7f212bfff700) at
pthread_create.c:333
#16 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 8 (Thread 0x7f2140ff9700 (LWP 6592)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21744d7c38 in
content::BrowserThreadImpl::DBThreadRun(base::MessageLoop*) () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21744d810b in content::BrowserThreadImpl::Run(base::MessageLoop=
*)
() from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f21751f6a78 in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#9  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#10 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2140ff9700) at
pthread_create.c:333
#11 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 7 (Thread 0x7f21417fa700 (LWP 6591)):
#0  pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:225
#1  0x00007f21751ea912 in base::ConditionVariable::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f94f0 in base::PosixDynamicThreadPool::WaitForTask() () fr=
om
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f9a23 in base::(anonymous
namespace)::WorkerThread::ThreadMain() () from /lib64/libQt5WebEngineCore.s=
o.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21417fa700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 6 (Thread 0x7f2141ffb700 (LWP 6590)):
#0  pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:225
#1  0x00007f21751ea912 in base::ConditionVariable::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751f94f0 in base::PosixDynamicThreadPool::WaitForTask() () fr=
om
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751f9a23 in base::(anonymous
namespace)::WorkerThread::ThreadMain() () from /lib64/libQt5WebEngineCore.s=
o.5
#4  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#5  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2141ffb700) at
pthread_create.c:333
#6  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 5 (Thread 0x7f21427fc700 (LWP 6589)):
#0  pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
#1  0x00007f21751eb125 in base::WaitableEvent::TimedWait(base::TimeDelta
const&amp;) () from /lib64/libQt5WebEngineCore.so.5
#2  0x00007f21751eb1e5 in base::WaitableEvent::Wait() () from
/lib64/libQt5WebEngineCore.so.5
#3  0x00007f21751cce13 in
base::MessagePumpDefault::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#4  0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#5  0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#6  0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#7  0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21427fc700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 4 (Thread 0x7f2142ffd700 (LWP 6588)):
#0  __lll_unlock_wake_private () at
../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:341
#1  0x00007f2178e93b6b in _IO_acquire_lock_clear_flags2_fct (p=3D&lt;synthe=
tic
pointer&gt;) at ../libio/libioP.h:873
#2  ___fprintf_chk (fp=3D0x7f217913d500 &lt;_IO_2_1_stderr_&gt;, flag=3Dfla=
g&#64;entry=3D1,
format=3Dformat&#64;entry=3D0x7f216a84cc74 &quot;[%s] %s\n&quot;) at fprint=
f_chk.c:30
#3  0x00007f216a83486e in fprintf (__fmt=3D0x7f216a84cc74 &quot;[%s] %s\n&q=
uot;,
__stream=3D&lt;optimized out&gt;) at /usr/include/bits/stdio2.h:97
#4  event_log (msg=3D0x7f2142ffc550 &quot;epoll_wait: Bad file descriptor&q=
uot;,
severity=3D2) at log.c:222
#5  _warn_helper (severity=3Dseverity&#64;entry=3D2, errstr=3D0x7f2178f05c0=
e &quot;Bad file
descriptor&quot;, fmt=3Dfmt&#64;entry=3D0x7f216a84d45a &quot;epoll_wait&quo=
t;,
ap=3Dap&#64;entry=3D0x7f2142ffc980) at log.c:187
#6  0x00007f216a834a64 in event_warn (fmt=3Dfmt&#64;entry=3D0x7f216a84d45a
&quot;epoll_wait&quot;) at log.c:101
#7  0x00007f216a8391e8 in epoll_dispatch (base=3D0x7f21380019e0, tv=3D&lt;o=
ptimized
out&gt;) at epoll.c:413
#8  0x00007f216a82318a in event_base_loop (base=3D0x7f21380019e0, flags=3D1=
) at
event.c:1625
#9  0x00007f21751a3a12 in
base::MessagePumpLibevent::Run(base::MessagePump::Delegate*) () from
/lib64/libQt5WebEngineCore.so.5
#10 0x00007f21751de84a in base::RunLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#11 0x00007f21751c92e5 in base::MessageLoop::Run() () from
/lib64/libQt5WebEngineCore.so.5
#12 0x00007f21751f69fa in base::Thread::ThreadMain() () from
/lib64/libQt5WebEngineCore.so.5
#13 0x00007f21751f2fdc in base::(anonymous namespace)::ThreadFunc(void*) ()
from /lib64/libQt5WebEngineCore.so.5
#14 0x00007f2170ccd6ca in start_thread (arg=3D0x7f2142ffd700) at
pthread_create.c:333
#15 0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 3 (Thread 0x7f2149eb2700 (LWP 6581)):
#0  0x00007f216c2486c3 in g_main_context_prepare () from
/lib64/libglib-2.0.so.0
#1  0x00007f216c24907b in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#2  0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#3  0x00007f2179c7e73b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#4  0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#5  0x00007f2179a8c5f3 in QThread::exec() () from /lib64/libQt5Core.so.5
#6  0x00007f217ea9d739 in QDBusConnectionManager::run() () from
/lib64/libQt5DBus.so.5
#7  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#8  0x00007f2170ccd6ca in start_thread (arg=3D0x7f2149eb2700) at
pthread_create.c:333
#9  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 2 (Thread 0x7f21564c0700 (LWP 6580)):
#0  0x00007f2178e7800d in poll () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f216f739d10 in poll (__timeout=3D-1, __nfds=3D1, __fds=3D0x7f215=
64bfb80)
at /usr/include/bits/poll2.h:46
#2  _xcb_conn_wait (c=3Dc&#64;entry=3D0x557ddafbc4c0, cond=3Dcond&#64;entry=
=3D0x557ddafbc500,
vector=3Dvector&#64;entry=3D0x0, count=3Dcount&#64;entry=3D0x0) at xcb_conn=
.c:479
#3  0x00007f216f73baa9 in xcb_wait_for_event (c=3D0x557ddafbc4c0) at xcb_in=
.c:693
#4  0x00007f215a530d69 in QXcbEventReader::run() () from
/lib64/libQt5XcbQpa.so.5
#5  0x00007f2179a909da in QThreadPrivate::start(void*) () from
/lib64/libQt5Core.so.5
#6  0x00007f2170ccd6ca in start_thread (arg=3D0x7f21564c0700) at
pthread_create.c:333
#7  0x00007f2178e83f6f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:105

Thread 1 (Thread 0x7f21611b7940 (LWP 6579)):
[KCrash Handler]
#6  0x00007f214d47c22f in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
#7  0x00007f214d47c8b9 in pushbuf_validate () from /lib64/libdrm_nouveau.so=
.2
#8  0x00007f214e097c16 in nv50_flush () from /usr/lib64/dri/nouveau_dri.so
#9  0x00007f214dcbcdd4 in st_glFlush () from /usr/lib64/dri/nouveau_dri.so
#10 0x00007f214db6a9c8 in _mesa_make_current () from
/usr/lib64/dri/nouveau_dri.so
#11 0x00007f214dcefe2b in st_api_make_current () from
/usr/lib64/dri/nouveau_dri.so
#12 0x00007f214de59a7f in dri_unbind_context () from
/usr/lib64/dri/nouveau_dri.so
#13 0x00007f214de5952a in driUnbindContext () from
/usr/lib64/dri/nouveau_dri.so
#14 0x00007f216f2d4f05 in glXMakeCurrentReadSGI () from /lib64/libGL.so.1
#15 0x00007f217eb6e1a0 in QGLXContext::makeCurrent(QPlatformSurface*) () fr=
om
/usr/lib64/qt5/plugins/xcbglintegrations/libqxcb-glx-integration.so
#16 0x00007f2179f9eb08 in QOpenGLContext::makeCurrent(QSurface*) () from
/lib64/libQt5Gui.so.5
#17 0x00007f217a4d86b1 in QOpenGLWidget::makeCurrent() () from
/lib64/libQt5Widgets.so.5
#18 0x00007f217a4d8845 in QOpenGLWidgetPrivate::render() () from
/lib64/libQt5Widgets.so.5
#19 0x00007f217a4b8780 in QWidget::event(QEvent*) () from
/lib64/libQt5Widgets.so.5
#20 0x00007f217ea190ab in
QtWebEngineCore::RenderWidgetHostViewQtDelegateWidget::event(QEvent*) () fr=
om
/lib64/libQt5WebEngineWidgets.so.5
#21 0x00007f217a470ecc in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /lib64/libQt5Widgets.so.5
#22 0x00007f217a478671 in QApplication::notify(QObject*, QEvent*) () from
/lib64/libQt5Widgets.so.5
#23 0x00007f2179c307aa in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /lib64/libQt5Core.so.5
#24 0x00007f217a4b146a in QWidgetPrivate::sendPaintEvent(QRegion const&amp;=
) ()
from /lib64/libQt5Widgets.so.5
#25 0x00007f217a4809ae in QWidgetBackingStore::doSync() () from
/lib64/libQt5Widgets.so.5
#26 0x00007f217a48147f in QWidgetBackingStore::sync() () from
/lib64/libQt5Widgets.so.5
#27 0x00007f217a4a03df in QWidgetPrivate::syncBackingStore() () from
/lib64/libQt5Widgets.so.5
#28 0x00007f217a4b8858 in QWidget::event(QEvent*) () from
/lib64/libQt5Widgets.so.5
#29 0x00007f217a5b801b in QMainWindow::event(QEvent*) () from
/lib64/libQt5Widgets.so.5
#30 0x00007f217d3127b7 in KMainWindow::event (this=3Dthis&#64;entry=3D0x557=
ddb12e920,
ev=3Dev&#64;entry=3D0x557ddcbfa980) at
/usr/src/debug/kxmlgui-5.27.0/src/kmainwindow.cpp:867
#31 0x00007f217d357365 in KXmlGuiWindow::event (this=3D0x557ddb12e920,
ev=3D0x557ddcbfa980) at /usr/src/debug/kxmlgui-5.27.0/src/kxmlguiwindow.cpp=
:118
#32 0x00007f217a470ecc in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() from /lib64/libQt5Widgets.so.5
#33 0x00007f217a478671 in QApplication::notify(QObject*, QEvent*) () from
/lib64/libQt5Widgets.so.5
#34 0x00007f2179c307aa in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() from /lib64/libQt5Core.so.5
#35 0x00007f2179c32e90 in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () from /lib64/libQt5Core.so.5
#36 0x00007f2179c7e6a3 in postEventSourceDispatch(_GSource*, int (*)(void*),
void*) () from /lib64/libQt5Core.so.5
#37 0x00007f216c248e42 in g_main_context_dispatch () from
/lib64/libglib-2.0.so.0
#38 0x00007f216c2491c0 in g_main_context_iterate.isra () from
/lib64/libglib-2.0.so.0
#39 0x00007f216c24926c in g_main_context_iteration () from
/lib64/libglib-2.0.so.0
#40 0x00007f2179c7e71f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
from /lib64/libQt5Core.so.5
#41 0x00007f2179c2f73a in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () from
/lib64/libQt5Core.so.5
#42 0x00007f2179c3723c in QCoreApplication::exec() () from
/lib64/libQt5Core.so.5
#43 0x0000557dda97746f in main ()

Reported using DrKonqi</pre>
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

--14836174130.F73b49.24764--

--===============1119304260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1119304260==--
