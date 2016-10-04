From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98039] New: KMail crash on starting (nouveau-related)
Date: Tue, 04 Oct 2016 07:50:34 +0000
Message-ID: <bug-98039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0881848269=="
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


--===============0881848269==
Content-Type: multipart/alternative; boundary="14755674341.4cbfDe.31251";
 charset="UTF-8"


--14755674341.4cbfDe.31251
Date: Tue, 4 Oct 2016 07:50:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

            Bug ID: 98039
           Summary: KMail crash on starting (nouveau-related)
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: renda.krell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I was asked to report https://bugs.kde.org/show_bug.cgi?id=3D369514 also he=
re:

Application: kmail (5.3.0 (QtWebEngine))

Qt Version: 5.6.1
Frameworks Version: 5.26.0
Operating System: Linux 4.7.4-2-default x86_64
Distribution: "openSUSE Tumbleweed"

-- Information about the crash:
- What I was doing when the application crashed:
I started KMail.

Using OpenSUSE Tumbleweed 20160927 and the Nouveau driver (kernel 4.7.4,
xf86-video-nouveau-1.0.13), KMail crashes everytime I try to start it. The =
KDE
Plasma desktop and Chromium run without any flaw.

The crash can be reproduced every time.

-- Backtrace:
Application: KMail (kmail), signal: Aborted
Using host libthread_db library "/lib64/libthread_db.so.1".
[Current thread is 1 (Thread 0x7ff6d0b6a940 (LWP 12021))]

Thread 42 (Thread 0x7ff52effb700 (LWP 12105)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c95d49 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c96460 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c96630 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 41 (Thread 0x7ff52f7fc700 (LWP 12103)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 40 (Thread 0x7ff52fffd700 (LWP 12102)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 39 (Thread 0x7ff5f4fca700 (LWP 12101)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 38 (Thread 0x7ff5f57cb700 (LWP 12100)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 37 (Thread 0x7ff5f5fcc700 (LWP 12099)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 36 (Thread 0x7ff5f67cd700 (LWP 12098)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 35 (Thread 0x7ff5f6fce700 (LWP 12097)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be710201 in JSC::BlockAllocator::blockFreeingThreadMain() () =
at
heap/BlockAllocator.cpp:139
#2  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#3  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#4  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 34 (Thread 0x7ff5f7be0700 (LWP 12096)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6bea16c4b in WTF::TCMalloc_PageHeap::scavengerThread() () at
wtf/FastMalloc.cpp:2821
#2  0x00007ff6bea16c89 in WTF::TCMalloc_PageHeap::runScavengerThread(void*)=
 ()
at wtf/FastMalloc.cpp:1989
#3  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#4  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 33 (Thread 0x7ff600e48700 (LWP 12095)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b47587e4 in QTWTF::TCMalloc_PageHeap::scavengerThread()
(this=3D0x7ff6b4a41ec0 <QTWTF::pageheap_memory>) at
../3rdparty/javascriptcore/JavaScriptCore/wtf/FastMalloc.cpp:2359
#2  0x00007ff6b4758829 in QTWTF::TCMalloc_PageHeap::runScavengerThread(void=
*)
(context=3D<optimized out>) at
../3rdparty/javascriptcore/JavaScriptCore/wtf/FastMalloc.cpp:1464
#3  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#4  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 32 (Thread 0x7ff6020b4700 (LWP 12083)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c2f83876 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff5f00008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#4  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff6020b3c80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#5  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#6  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x2e4b2e0) at
thread/qthread_unix.cpp:341
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 31 (Thread 0x7ff60389b700 (LWP 12080)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c2f83876 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff5f8000940, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#4  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff60389ac80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#5  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#6  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x160f150) at
thread/qthread_unix.cpp:341
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 30 (Thread 0x7ff611d40700 (LWP 12073)):
#0  0x00007ff6c2fc8e89 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d85 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff5fc0008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff611d3fc80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x11fd060) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 29 (Thread 0x7ff612541700 (LWP 12066)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c2f83876 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff6080008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#4  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff612540c80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#5  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#6  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x107bec0) at
thread/qthread_unix.cpp:341
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 28 (Thread 0x7ff629ffb700 (LWP 12059)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9aee850 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9adb10c in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9adb5b7 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9ad7e35 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6bb1db937 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6bb1dbb6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6bb1dbca9 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#13 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 27 (Thread 0x7ff62a7fc700 (LWP 12058)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c95d49 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c96460 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c96630 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 26 (Thread 0x7ff62affd700 (LWP 12057)):
#0  0x00007ff6aa0b1eee in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#1  0x00007ff6aa0b276a in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#2  0x00007ff6b12de63c in pa_mainloop_dispatch () at /usr/lib64/libpulse.so=
.0
#3  0x00007ff6b12dea3c in pa_mainloop_iterate () at /usr/lib64/libpulse.so.0
#4  0x00007ff6b12deae0 in pa_mainloop_run () at /usr/lib64/libpulse.so.0
#5  0x00007ff6b12ecb09 in  () at /usr/lib64/libpulse.so.0
#6  0x00007ff6aa0c2108 in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 25 (Thread 0x7ff62b7fe700 (LWP 12056)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48b6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#12 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 24 (Thread 0x7ff62bfff700 (LWP 12055)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 23 (Thread 0x7ff648ff9700 (LWP 12054)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 22 (Thread 0x7ff6497fa700 (LWP 12053)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b94caf99 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c96630 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 21 (Thread 0x7ff649ffb700 (LWP 12052)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 20 (Thread 0x7ff64a7fc700 (LWP 12051)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48b6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9145ab8 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9145c1b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 19 (Thread 0x7ff64affd700 (LWP 12050)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48c02 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9145a08 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9145c7b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 18 (Thread 0x7ff64b7fe700 (LWP 12049)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9145958 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9145c6b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#11 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 17 (Thread 0x7ff64bfff700 (LWP 12048)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b91458a8 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9145c5b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#11 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 16 (Thread 0x7ff66cff9700 (LWP 12047)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48c02 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b91457f8 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9145c4b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 15 (Thread 0x7ff66d7fa700 (LWP 12046)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9145748 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9145c3b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#11 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 14 (Thread 0x7ff66dffb700 (LWP 12045)):
#0  0x00007ff6c37af4b8 in pthread_cond_timedwait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8b2e2 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c997d9 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c99d13 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 13 (Thread 0x7ff66e7fc700 (LWP 12044)):
#0  0x00007ff6c37af4b8 in pthread_cond_timedwait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8b2e2 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c997d9 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c99d13 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 12 (Thread 0x7ff66effd700 (LWP 12043)):
#0  0x00007ff6c37af10f in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 11 (Thread 0x7ff66f7fe700 (LWP 12042)):
#0  0x00007ff6cd9127bd in write () at /lib64/libc.so.6
#1  0x00007ff6cd8a9da7 in _IO_new_file_write () at /lib64/libc.so.6
#2  0x00007ff6cd8a90f2 in new_do_write () at /lib64/libc.so.6
#3  0x00007ff6cd8aa4fe in __GI__IO_file_xsputn () at /lib64/libc.so.6
#4  0x00007ff6cd881255 in buffered_vfprintf () at /lib64/libc.so.6
#5  0x00007ff6cd87e4d5 in vfprintf () at /lib64/libc.so.6
#6  0x00007ff6cd92d6d9 in __fprintf_chk () at /lib64/libc.so.6
#7  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#8  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#9  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#10 0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#11 0x00007ff6b9c48b6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#14 0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#15 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#16 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#17 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 10 (Thread 0x7ff679c13700 (LWP 12035)):
#0  0x00007ff6c2f808a0 in  () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f831a4 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f83814 in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff6680008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff679c12c80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x11eca60) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 9 (Thread 0x7ff67a414700 (LWP 12033)):
#0  0x00007ff6c2f83802 in  () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff6700008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#3  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff67a413c80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#4  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#5  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x10ed210) at
thread/qthread_unix.cpp:341
#6  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#7  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 8 (Thread 0x7ff6875e0700 (LWP 12031)):
#0  0x00007ff6c2fc8ea4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d6c in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff6740008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff6875dfc80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xe149b0) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 7 (Thread 0x7ff687fff700 (LWP 12029)):
#0  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D<optimized=
 out>)
at ../../src/corelib/thread/qmutex.h:159
#1  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D<optimized=
 out>)
at ../../src/corelib/thread/qmutex.h:138
#2  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D<optimized=
 out>,
__in_chrg=3D<optimized out>) at ../../src/corelib/thread/qmutex.h:132
#3  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D0xe64330) =
at
../../src/corelib/thread/qthread_p.h:246
#4  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (timeout=3D<synthe=
tic
pointer>, s=3D0x7ff67c0012d0) at kernel/qeventdispatcher_glib.cpp:253
#5  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*)
(source=3D0x7ff67c0012d0) at kernel/qeventdispatcher_glib.cpp:263
#6  0x00007ff6c2f83269 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#7  0x00007ff6c2f83814 in  () at /usr/lib64/libglib-2.0.so.0
#8  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#9  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff67c0008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#10 0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff687ffec80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#11 0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#12 0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xd98c30) at
thread/qthread_unix.cpp:341
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 6 (Thread 0x7ff694952700 (LWP 12027)):
#0  0x00007ff6c2fc8e89 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d85 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff6800008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff694951c80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xdfb5e0) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 5 (Thread 0x7ff695153700 (LWP 12025)):
#0  0x00007ff6cd91275d in read () at /lib64/libc.so.6
#1  0x00007ff6c2fc7ae0 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f83325 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f83814 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff68c0008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#6  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff695152c80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#7  0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#8  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xe672a0) at
thread/qthread_unix.cpp:341
#9  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#10 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 4 (Thread 0x7ff695fe5700 (LWP 12024)):
#0  0x00007ff6ce453d2f in QTimerInfoList::timerWait(timespec&) (t=3D<synthe=
tic
pointer>) at ../../src/corelib/kernel/qcore_unix_p.h:85
#1  0x00007ff6ce453d2f in QTimerInfoList::timerWait(timespec&) (t2=3D<synth=
etic
pointer>, t1=3D...) at ../../src/corelib/kernel/qcore_unix_p.h:115
#2  0x00007ff6ce453d2f in QTimerInfoList::timerWait(timespec&)
(this=3D0x7ff688002cd0, tm=3D...) at kernel/qtimerinfo_unix.cpp:398
#3  0x00007ff6ce454f9e in timerSourcePrepare(GSource*, gint*)
(timeout=3D0x7ff695fe4ab4, src=3D<optimized out>) at
kernel/qeventdispatcher_glib.cpp:126
#4  0x00007ff6ce454f9e in timerSourcePrepare(GSource*, gint*)
(source=3D<optimized out>, timeout=3D0x7ff695fe4ab4) at
kernel/qeventdispatcher_glib.cpp:159
#5  0x00007ff6c2f82d79 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#6  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#7  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#8  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff6880008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#9  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff695fe4c80, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#10 0x00007ff6ce2233c3 in QThread::exec() (this=3D<optimized out>) at
thread/qthread.cpp:500
#11 0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xdcb090) at
thread/qthread_unix.cpp:341
#12 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#13 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 3 (Thread 0x7ff6971f6700 (LWP 12023)):
#0  0x00007ff6c2fc8e89 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d85 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0x7ff6900008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7ff6971f5c50, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3Dthis@entry=3D0x7ff6ccafbd=
20
<(anonymous namespace)::Q_QGS__q_manager::innerFunction()::holder>) at
thread/qthread.cpp:500
#7  0x00007ff6cc888985 in QDBusConnectionManager::run() (this=3D0x7ff6ccafb=
d20
<(anonymous namespace)::Q_QGS__q_manager::innerFunction()::holder>) at
qdbusconnection.cpp:189
#8  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x7ff6ccafbd20
<(anonymous namespace)::Q_QGS__q_manager::innerFunction()::holder>) at
thread/qthread_unix.cpp:341
#9  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#10 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 2 (Thread 0x7ff6a4789700 (LWP 12022)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c0bc03f0 in  () at /usr/lib64/libxcb.so.1
#2  0x00007ff6c0bc2189 in xcb_wait_for_event () at /usr/lib64/libxcb.so.1
#3  0x00007ff6a62727a9 in QXcbEventReader::run() (this=3D0xc00b10) at
qxcbconnection.cpp:1325
#4  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xc00b10) at
thread/qthread_unix.cpp:341
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 1 (Thread 0x7ff6d0b6a940 (LWP 12021)):
[KCrash Handler]
#6  0x00007ff6cd86a5ef in raise () at /lib64/libc.so.6
#7  0x00007ff6cd86b9ea in abort () at /lib64/libc.so.6
#8  0x00007ff6cd8a8190 in __libc_message () at /lib64/libc.so.6
#9  0x00007ff6cd8ae546 in malloc_printerr () at /lib64/libc.so.6
#10 0x00007ff6cd8aed3e in _int_free () at /lib64/libc.so.6
#11 0x00007ff6a2bafe9f in nouveau_fence_trigger_work
(fence=3Dfence@entry=3D0x2ed01b0) at nouveau_fence.c:58
#12 0x00007ff6a2bb00de in nouveau_fence_update (screen=3Dscreen@entry=3D0xc=
c0980,
flushed=3Dflushed@entry=3Dfalse) at nouveau_fence.c:132
#13 0x00007ff6a2bb0403 in nouveau_fence_wait (fence=3D0x7ff62415f980, debug=
=3D0x0)
at nouveau_fence.c:223
#14 0x00007ff6a2921d1b in st_finish (st=3Dst@entry=3D0x1586210) at
state_tracker/st_cb_flush.c:101
#15 0x00007ff6a2921d60 in st_glFinish (ctx=3D<optimized out>) at
state_tracker/st_cb_flush.c:136
#16 0x00007ff6cf1ab4a9 in QOpenGLWidgetPrivate::beginCompose() (this=3D0x11=
42940)
at kernel/qopenglwidget.cpp:721
#17 0x00007ff6cf1794c1 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12180
#18 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#19 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#20 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#21 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#22 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#23 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#24 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#25 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#26 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#27 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D<optimized out>, end=3Dend@entry=3Dfalse) at kernel/qwidget.cpp:12184
#28 0x00007ff6cf150782 in QWidgetBackingStore::qt_flush(QWidget*, QRegion
const&, QBackingStore*, QWidget*, QPoint const&, QPlatformTextureList*,
QWidgetBackingStore*) (widget=3D0xe924a0, region=3D..., backingStore=3D0x11=
e2330,
tlw=3D0xe924a0, tlwOffset=3D..., widgetTextures=3D0xc00af0,
widgetBackingStore=3D0x12266f0) at kernel/qwidgetbackingstore.cpp:108
#29 0x00007ff6cf1517e5 in QWidgetBackingStore::flush(QWidget*)
(this=3Dthis@entry=3D0x12266f0, widget=3Dwidget@entry=3D0x0) at
kernel/qwidgetbackingstore.cpp:1387
#30 0x00007ff6cf1534e2 in QWidgetBackingStore::doSync()
(this=3Dthis@entry=3D0x12266f0) at kernel/qwidgetbackingstore.cpp:1279
#31 0x00007ff6cf153fe9 in QWidgetBackingStore::sync() (this=3D0x12266f0) at
kernel/qwidgetbackingstore.cpp:1145
#32 0x00007ff6cf17395f in QWidgetPrivate::syncBackingStore() (this=3D0xe9a3=
d0) at
kernel/qwidget.cpp:1942
#33 0x00007ff6cf18b678 in QWidget::event(QEvent*) (this=3Dthis@entry=3D0xe9=
24a0,
event=3Devent@entry=3D0x239a7f0) at kernel/qwidget.cpp:9053
#34 0x00007ff6cf2a4b5b in QMainWindow::event(QEvent*)
(this=3Dthis@entry=3D0xe924a0, event=3Devent@entry=3D0x239a7f0) at
widgets/qmainwindow.cpp:1543
#35 0x00007ff6cd3436a7 in KMainWindow::event(QEvent*)
(this=3Dthis@entry=3D0xe924a0, ev=3Dev@entry=3D0x239a7f0) at
/usr/src/debug/kxmlgui-5.26.0/src/kmainwindow.cpp:867
#36 0x00007ff6cd3885b5 in KXmlGuiWindow::event(QEvent*) (this=3D0xe924a0,
ev=3D0x239a7f0) at /usr/src/debug/kxmlgui-5.26.0/src/kxmlguiwindow.cpp:118
#37 0x00007ff6cf145acc in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
(this=3D<optimized out>, receiver=3D0xe924a0, e=3D0x239a7f0) at
kernel/qapplication.cpp:3804
#38 0x00007ff6cf14af6f in QApplication::notify(QObject*, QEvent*)
(this=3D0x7fffcd1f3eb0, receiver=3D0xe924a0, e=3D0x239a7f0) at
kernel/qapplication.cpp:3561
#39 0x00007ff6ce3ff9b0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
(receiver=3D0xe924a0, event=3Devent@entry=3D0x239a7f0) at
kernel/qcoreapplication.cpp:1015
#40 0x00007ff6ce40193c in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) (event=3D0x239a7f0, receiver=3D<optimized out>) at
kernel/qcoreapplication.h:225
#41 0x00007ff6ce40193c in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) (receiver=3Dreceiver@entry=3D0x0, event_type=3Devent_typ=
e@entry=3D0,
data=3D0xbd8a40) at kernel/qcoreapplication.cpp:1650
#42 0x00007ff6ce401df8 in QCoreApplication::sendPostedEvents(QObject*, int)
(receiver=3Dreceiver@entry=3D0x0, event_type=3Devent_type@entry=3D0) at
kernel/qcoreapplication.cpp:1508
#43 0x00007ff6ce455683 in postEventSourceDispatch(GSource*, GSourceFunc,
gpointer) (s=3D0xc51720) at kernel/qeventdispatcher_glib.cpp:270
#44 0x00007ff6c2f83677 in g_main_context_dispatch () at
/usr/lib64/libglib-2.0.so.0
#45 0x00007ff6c2f838e0 in  () at /usr/lib64/libglib-2.0.so.0
#46 0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#47 0x00007ff6ce455a8f in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3D0xc3d8a0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:417
#48 0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>)
(this=3Dthis@entry=3D0x7fffcd1f3840, flags=3D..., flags@entry=3D...) at
kernel/qeventloop.cpp:204
#49 0x00007ff6ce405f0c in QCoreApplication::exec() () at
kernel/qcoreapplication.cpp:1285
#50 0x00007ff6ce94eb5c in QGuiApplication::exec() () at
kernel/qguiapplication.cpp:1607
#51 0x00007ff6cf142b05 in QApplication::exec() () at
kernel/qapplication.cpp:2979
#52 0x0000000000403cbf in main(int, char**) (argc=3D<optimized out>,
argv=3D<optimized out>) at /usr/src/debug/kdepim-16.08.1/kmail/src/main.cpp=
:161

Reported using DrKonqi

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14755674341.4cbfDe.31251
Date: Tue, 4 Oct 2016 07:50:34 +0000
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
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">98039</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>KMail crash on starting (nouveau-related)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>renda.krell&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I was asked to report <a href=3D"https://bugs.kde.org/show_bug=
.cgi?id=3D369514">https://bugs.kde.org/show_bug.cgi?id=3D369514</a> also he=
re:

Application: kmail (5.3.0 (QtWebEngine))

Qt Version: 5.6.1
Frameworks Version: 5.26.0
Operating System: Linux 4.7.4-2-default x86_64
Distribution: &quot;openSUSE Tumbleweed&quot;

-- Information about the crash:
- What I was doing when the application crashed:
I started KMail.

Using OpenSUSE Tumbleweed 20160927 and the Nouveau driver (kernel 4.7.4,
xf86-video-nouveau-1.0.13), KMail crashes everytime I try to start it. The =
KDE
Plasma desktop and Chromium run without any flaw.

The crash can be reproduced every time.

-- Backtrace:
Application: KMail (kmail), signal: Aborted
Using host libthread_db library &quot;/lib64/libthread_db.so.1&quot;.
[Current thread is 1 (Thread 0x7ff6d0b6a940 (LWP 12021))]

Thread 42 (Thread 0x7ff52effb700 (LWP 12105)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c95d49 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c96460 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c96630 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 41 (Thread 0x7ff52f7fc700 (LWP 12103)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 40 (Thread 0x7ff52fffd700 (LWP 12102)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 39 (Thread 0x7ff5f4fca700 (LWP 12101)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 38 (Thread 0x7ff5f57cb700 (LWP 12100)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 37 (Thread 0x7ff5f5fcc700 (LWP 12099)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 36 (Thread 0x7ff5f67cd700 (LWP 12098)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:81
#2  0x00007ff6be711353 in JSC::GCThread::gcThreadMain() () at
heap/GCThread.cpp:99
#3  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 35 (Thread 0x7ff5f6fce700 (LWP 12097)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6be710201 in JSC::BlockAllocator::blockFreeingThreadMain() () =
at
heap/BlockAllocator.cpp:139
#2  0x00007ff6bea47971 in wtfThreadEntryPoint() () at
wtf/ThreadingPthreads.cpp:195
#3  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#4  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 34 (Thread 0x7ff5f7be0700 (LWP 12096)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6bea16c4b in WTF::TCMalloc_PageHeap::scavengerThread() () at
wtf/FastMalloc.cpp:2821
#2  0x00007ff6bea16c89 in WTF::TCMalloc_PageHeap::runScavengerThread(void*)=
 ()
at wtf/FastMalloc.cpp:1989
#3  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#4  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 33 (Thread 0x7ff600e48700 (LWP 12095)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b47587e4 in QTWTF::TCMalloc_PageHeap::scavengerThread()
(this=3D0x7ff6b4a41ec0 &lt;QTWTF::pageheap_memory&gt;) at
../3rdparty/javascriptcore/JavaScriptCore/wtf/FastMalloc.cpp:2359
#2  0x00007ff6b4758829 in QTWTF::TCMalloc_PageHeap::runScavengerThread(void=
*)
(context=3D&lt;optimized out&gt;) at
../3rdparty/javascriptcore/JavaScriptCore/wtf/FastMalloc.cpp:1464
#3  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#4  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 32 (Thread 0x7ff6020b4700 (LWP 12083)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c2f83876 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff5f00008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#4  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff6020b3c80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#5  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#6  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x2e4b2e0) at
thread/qthread_unix.cpp:341
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 31 (Thread 0x7ff60389b700 (LWP 12080)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c2f83876 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff5f8000940, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#4  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff60389ac80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#5  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#6  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x160f150) at
thread/qthread_unix.cpp:341
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 30 (Thread 0x7ff611d40700 (LWP 12073)):
#0  0x00007ff6c2fc8e89 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d85 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff5fc0008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff611d3fc80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x11fd060) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 29 (Thread 0x7ff612541700 (LWP 12066)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c2f83876 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff6080008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#4  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff612540c80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#5  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#6  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x107bec0) at
thread/qthread_unix.cpp:341
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 28 (Thread 0x7ff629ffb700 (LWP 12059)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9aee850 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9adb10c in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9adb5b7 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9ad7e35 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6bb1db937 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6bb1dbb6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6bb1dbca9 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#13 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 27 (Thread 0x7ff62a7fc700 (LWP 12058)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c95d49 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c96460 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c96630 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 26 (Thread 0x7ff62affd700 (LWP 12057)):
#0  0x00007ff6aa0b1eee in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#1  0x00007ff6aa0b276a in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#2  0x00007ff6b12de63c in pa_mainloop_dispatch () at /usr/lib64/libpulse.so=
.0
#3  0x00007ff6b12dea3c in pa_mainloop_iterate () at /usr/lib64/libpulse.so.0
#4  0x00007ff6b12deae0 in pa_mainloop_run () at /usr/lib64/libpulse.so.0
#5  0x00007ff6b12ecb09 in  () at /usr/lib64/libpulse.so.0
#6  0x00007ff6aa0c2108 in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#7  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 25 (Thread 0x7ff62b7fe700 (LWP 12056)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48b6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#12 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 24 (Thread 0x7ff62bfff700 (LWP 12055)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 23 (Thread 0x7ff648ff9700 (LWP 12054)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 22 (Thread 0x7ff6497fa700 (LWP 12053)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b94caf99 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c96630 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#5  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 21 (Thread 0x7ff649ffb700 (LWP 12052)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 20 (Thread 0x7ff64a7fc700 (LWP 12051)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48b6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9145ab8 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9145c1b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 19 (Thread 0x7ff64affd700 (LWP 12050)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48c02 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9145a08 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9145c7b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 18 (Thread 0x7ff64b7fe700 (LWP 12049)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9145958 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9145c6b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#11 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 17 (Thread 0x7ff64bfff700 (LWP 12048)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b91458a8 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9145c5b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#11 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 16 (Thread 0x7ff66cff9700 (LWP 12047)):
#0  0x00007ff6cd92bbcb in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007ff6cd92d684 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007ff6b9c48c02 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b91457f8 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6b9145c4b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 15 (Thread 0x7ff66d7fa700 (LWP 12046)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9145748 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9145c3b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6b9c96b68 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#11 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 14 (Thread 0x7ff66dffb700 (LWP 12045)):
#0  0x00007ff6c37af4b8 in pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8b2e2 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c997d9 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c99d13 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 13 (Thread 0x7ff66e7fc700 (LWP 12044)):
#0  0x00007ff6c37af4b8 in pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8b2e2 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c997d9 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c99d13 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 12 (Thread 0x7ff66effd700 (LWP 12043)):
#0  0x00007ff6c37af10f in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007ff6b9c8baf5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007ff6b9c8bbc4 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007ff6b9c6e473 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 11 (Thread 0x7ff66f7fe700 (LWP 12042)):
#0  0x00007ff6cd9127bd in write () at /lib64/libc.so.6
#1  0x00007ff6cd8a9da7 in _IO_new_file_write () at /lib64/libc.so.6
#2  0x00007ff6cd8a90f2 in new_do_write () at /lib64/libc.so.6
#3  0x00007ff6cd8aa4fe in __GI__IO_file_xsputn () at /lib64/libc.so.6
#4  0x00007ff6cd881255 in buffered_vfprintf () at /lib64/libc.so.6
#5  0x00007ff6cd87e4d5 in vfprintf () at /lib64/libc.so.6
#6  0x00007ff6cd92d6d9 in __fprintf_chk () at /lib64/libc.so.6
#7  0x00007ff6adc4f4de in  () at /usr/lib64/libevent-2.0.so.5
#8  0x00007ff6adc4f6d4 in event_warn () at /usr/lib64/libevent-2.0.so.5
#9  0x00007ff6adc53e58 in  () at /usr/lib64/libevent-2.0.so.5
#10 0x00007ff6adc3ddfa in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#11 0x00007ff6b9c48b6e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007ff6b9c7f0ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007ff6b9c6aa55 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#14 0x00007ff6b9c96ae6 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#15 0x00007ff6b9c9323d in  () at /usr/lib64/libQt5WebEngineCore.so.5
#16 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#17 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 10 (Thread 0x7ff679c13700 (LWP 12035)):
#0  0x00007ff6c2f808a0 in  () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f831a4 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f83814 in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff6680008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff679c12c80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x11eca60) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 9 (Thread 0x7ff67a414700 (LWP 12033)):
#0  0x00007ff6c2f83802 in  () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff6700008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#3  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff67a413c80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#4  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#5  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x10ed210) at
thread/qthread_unix.cpp:341
#6  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#7  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 8 (Thread 0x7ff6875e0700 (LWP 12031)):
#0  0x00007ff6c2fc8ea4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d6c in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff6740008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff6875dfc80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xe149b0) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 7 (Thread 0x7ff687fff700 (LWP 12029)):
#0  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D&lt;optimi=
zed out&gt;)
at ../../src/corelib/thread/qmutex.h:159
#1  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D&lt;optimi=
zed out&gt;)
at ../../src/corelib/thread/qmutex.h:138
#2  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D&lt;optimi=
zed out&gt;,
__in_chrg=3D&lt;optimized out&gt;) at ../../src/corelib/thread/qmutex.h:132
#3  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (this=3D0xe64330) =
at
../../src/corelib/thread/qthread_p.h:246
#4  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*) (timeout=3D&lt;syn=
thetic
pointer&gt;, s=3D0x7ff67c0012d0) at kernel/qeventdispatcher_glib.cpp:253
#5  0x00007ff6ce4552a0 in postEventSourceCheck(GSource*)
(source=3D0x7ff67c0012d0) at kernel/qeventdispatcher_glib.cpp:263
#6  0x00007ff6c2f83269 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#7  0x00007ff6c2f83814 in  () at /usr/lib64/libglib-2.0.so.0
#8  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#9  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff67c0008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#10 0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff687ffec80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#11 0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#12 0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xd98c30) at
thread/qthread_unix.cpp:341
#13 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#14 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 6 (Thread 0x7ff694952700 (LWP 12027)):
#0  0x00007ff6c2fc8e89 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d85 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff6800008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff694951c80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#7  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xdfb5e0) at
thread/qthread_unix.cpp:341
#8  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#9  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 5 (Thread 0x7ff695153700 (LWP 12025)):
#0  0x00007ff6cd91275d in read () at /lib64/libc.so.6
#1  0x00007ff6c2fc7ae0 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f83325 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f83814 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff68c0008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#6  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff695152c80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#7  0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#8  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xe672a0) at
thread/qthread_unix.cpp:341
#9  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#10 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 4 (Thread 0x7ff695fe5700 (LWP 12024)):
#0  0x00007ff6ce453d2f in QTimerInfoList::timerWait(timespec&amp;) (t=3D&lt=
;synthetic
pointer&gt;) at ../../src/corelib/kernel/qcore_unix_p.h:85
#1  0x00007ff6ce453d2f in QTimerInfoList::timerWait(timespec&amp;) (t2=3D&l=
t;synthetic
pointer&gt;, t1=3D...) at ../../src/corelib/kernel/qcore_unix_p.h:115
#2  0x00007ff6ce453d2f in QTimerInfoList::timerWait(timespec&amp;)
(this=3D0x7ff688002cd0, tm=3D...) at kernel/qtimerinfo_unix.cpp:398
#3  0x00007ff6ce454f9e in timerSourcePrepare(GSource*, gint*)
(timeout=3D0x7ff695fe4ab4, src=3D&lt;optimized out&gt;) at
kernel/qeventdispatcher_glib.cpp:126
#4  0x00007ff6ce454f9e in timerSourcePrepare(GSource*, gint*)
(source=3D&lt;optimized out&gt;, timeout=3D0x7ff695fe4ab4) at
kernel/qeventdispatcher_glib.cpp:159
#5  0x00007ff6c2f82d79 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#6  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#7  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#8  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff6880008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#9  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff695fe4c80, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#10 0x00007ff6ce2233c3 in QThread::exec() (this=3D&lt;optimized out&gt;) at
thread/qthread.cpp:500
#11 0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xdcb090) at
thread/qthread_unix.cpp:341
#12 0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#13 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 3 (Thread 0x7ff6971f6700 (LWP 12023)):
#0  0x00007ff6c2fc8e89 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007ff6c2f82d85 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007ff6c2f8379b in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007ff6ce455aab in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0x7ff6900008c0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:419
#5  0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7ff6971f5c50, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#6  0x00007ff6ce2233c3 in QThread::exec() (this=3Dthis&#64;entry=3D0x7ff6cc=
afbd20
&lt;(anonymous namespace)::Q_QGS__q_manager::innerFunction()::holder&gt;) at
thread/qthread.cpp:500
#7  0x00007ff6cc888985 in QDBusConnectionManager::run() (this=3D0x7ff6ccafb=
d20
&lt;(anonymous namespace)::Q_QGS__q_manager::innerFunction()::holder&gt;) at
qdbusconnection.cpp:189
#8  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0x7ff6ccafbd20
&lt;(anonymous namespace)::Q_QGS__q_manager::innerFunction()::holder&gt;) at
thread/qthread_unix.cpp:341
#9  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#10 0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 2 (Thread 0x7ff6a4789700 (LWP 12022)):
#0  0x00007ff6cd9166ed in poll () at /lib64/libc.so.6
#1  0x00007ff6c0bc03f0 in  () at /usr/lib64/libxcb.so.1
#2  0x00007ff6c0bc2189 in xcb_wait_for_event () at /usr/lib64/libxcb.so.1
#3  0x00007ff6a62727a9 in QXcbEventReader::run() (this=3D0xc00b10) at
qxcbconnection.cpp:1325
#4  0x00007ff6ce2282e8 in QThreadPrivate::start(void*) (arg=3D0xc00b10) at
thread/qthread_unix.cpp:341
#5  0x00007ff6c37a9454 in start_thread () at /lib64/libpthread.so.0
#6  0x00007ff6cd91f3ff in clone () at /lib64/libc.so.6

Thread 1 (Thread 0x7ff6d0b6a940 (LWP 12021)):
[KCrash Handler]
#6  0x00007ff6cd86a5ef in raise () at /lib64/libc.so.6
#7  0x00007ff6cd86b9ea in abort () at /lib64/libc.so.6
#8  0x00007ff6cd8a8190 in __libc_message () at /lib64/libc.so.6
#9  0x00007ff6cd8ae546 in malloc_printerr () at /lib64/libc.so.6
#10 0x00007ff6cd8aed3e in _int_free () at /lib64/libc.so.6
#11 0x00007ff6a2bafe9f in nouveau_fence_trigger_work
(fence=3Dfence&#64;entry=3D0x2ed01b0) at nouveau_fence.c:58
#12 0x00007ff6a2bb00de in nouveau_fence_update (screen=3Dscreen&#64;entry=
=3D0xcc0980,
flushed=3Dflushed&#64;entry=3Dfalse) at nouveau_fence.c:132
#13 0x00007ff6a2bb0403 in nouveau_fence_wait (fence=3D0x7ff62415f980, debug=
=3D0x0)
at nouveau_fence.c:223
#14 0x00007ff6a2921d1b in st_finish (st=3Dst&#64;entry=3D0x1586210) at
state_tracker/st_cb_flush.c:101
#15 0x00007ff6a2921d60 in st_glFinish (ctx=3D&lt;optimized out&gt;) at
state_tracker/st_cb_flush.c:136
#16 0x00007ff6cf1ab4a9 in QOpenGLWidgetPrivate::beginCompose() (this=3D0x11=
42940)
at kernel/qopenglwidget.cpp:721
#17 0x00007ff6cf1794c1 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12180
#18 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#19 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#20 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#21 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#22 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#23 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#24 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#25 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#26 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#27 0x00007ff6cf179487 in QWidgetPrivate::sendComposeStatus(QWidget*, bool)
(w=3D&lt;optimized out&gt;, end=3Dend&#64;entry=3Dfalse) at kernel/qwidget.=
cpp:12184
#28 0x00007ff6cf150782 in QWidgetBackingStore::qt_flush(QWidget*, QRegion
const&amp;, QBackingStore*, QWidget*, QPoint const&amp;, QPlatformTextureLi=
st*,
QWidgetBackingStore*) (widget=3D0xe924a0, region=3D..., backingStore=3D0x11=
e2330,
tlw=3D0xe924a0, tlwOffset=3D..., widgetTextures=3D0xc00af0,
widgetBackingStore=3D0x12266f0) at kernel/qwidgetbackingstore.cpp:108
#29 0x00007ff6cf1517e5 in QWidgetBackingStore::flush(QWidget*)
(this=3Dthis&#64;entry=3D0x12266f0, widget=3Dwidget&#64;entry=3D0x0) at
kernel/qwidgetbackingstore.cpp:1387
#30 0x00007ff6cf1534e2 in QWidgetBackingStore::doSync()
(this=3Dthis&#64;entry=3D0x12266f0) at kernel/qwidgetbackingstore.cpp:1279
#31 0x00007ff6cf153fe9 in QWidgetBackingStore::sync() (this=3D0x12266f0) at
kernel/qwidgetbackingstore.cpp:1145
#32 0x00007ff6cf17395f in QWidgetPrivate::syncBackingStore() (this=3D0xe9a3=
d0) at
kernel/qwidget.cpp:1942
#33 0x00007ff6cf18b678 in QWidget::event(QEvent*) (this=3Dthis&#64;entry=3D=
0xe924a0,
event=3Devent&#64;entry=3D0x239a7f0) at kernel/qwidget.cpp:9053
#34 0x00007ff6cf2a4b5b in QMainWindow::event(QEvent*)
(this=3Dthis&#64;entry=3D0xe924a0, event=3Devent&#64;entry=3D0x239a7f0) at
widgets/qmainwindow.cpp:1543
#35 0x00007ff6cd3436a7 in KMainWindow::event(QEvent*)
(this=3Dthis&#64;entry=3D0xe924a0, ev=3Dev&#64;entry=3D0x239a7f0) at
/usr/src/debug/kxmlgui-5.26.0/src/kmainwindow.cpp:867
#36 0x00007ff6cd3885b5 in KXmlGuiWindow::event(QEvent*) (this=3D0xe924a0,
ev=3D0x239a7f0) at /usr/src/debug/kxmlgui-5.26.0/src/kxmlguiwindow.cpp:118
#37 0x00007ff6cf145acc in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
(this=3D&lt;optimized out&gt;, receiver=3D0xe924a0, e=3D0x239a7f0) at
kernel/qapplication.cpp:3804
#38 0x00007ff6cf14af6f in QApplication::notify(QObject*, QEvent*)
(this=3D0x7fffcd1f3eb0, receiver=3D0xe924a0, e=3D0x239a7f0) at
kernel/qapplication.cpp:3561
#39 0x00007ff6ce3ff9b0 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
(receiver=3D0xe924a0, event=3Devent&#64;entry=3D0x239a7f0) at
kernel/qcoreapplication.cpp:1015
#40 0x00007ff6ce40193c in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) (event=3D0x239a7f0, receiver=3D&lt;optimized out&gt;) at
kernel/qcoreapplication.h:225
#41 0x00007ff6ce40193c in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) (receiver=3Dreceiver&#64;entry=3D0x0, event_type=3Devent=
_type&#64;entry=3D0,
data=3D0xbd8a40) at kernel/qcoreapplication.cpp:1650
#42 0x00007ff6ce401df8 in QCoreApplication::sendPostedEvents(QObject*, int)
(receiver=3Dreceiver&#64;entry=3D0x0, event_type=3Devent_type&#64;entry=3D0=
) at
kernel/qcoreapplication.cpp:1508
#43 0x00007ff6ce455683 in postEventSourceDispatch(GSource*, GSourceFunc,
gpointer) (s=3D0xc51720) at kernel/qeventdispatcher_glib.cpp:270
#44 0x00007ff6c2f83677 in g_main_context_dispatch () at
/usr/lib64/libglib-2.0.so.0
#45 0x00007ff6c2f838e0 in  () at /usr/lib64/libglib-2.0.so.0
#46 0x00007ff6c2f8398c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#47 0x00007ff6ce455a8f in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;)
(this=3D0xc3d8a0, flags=3D...) at kernel/qeventdispatcher_glib.cpp:417
#48 0x00007ff6ce3fd6fa in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;)
(this=3Dthis&#64;entry=3D0x7fffcd1f3840, flags=3D..., flags&#64;entry=3D...=
) at
kernel/qeventloop.cpp:204
#49 0x00007ff6ce405f0c in QCoreApplication::exec() () at
kernel/qcoreapplication.cpp:1285
#50 0x00007ff6ce94eb5c in QGuiApplication::exec() () at
kernel/qguiapplication.cpp:1607
#51 0x00007ff6cf142b05 in QApplication::exec() () at
kernel/qapplication.cpp:2979
#52 0x0000000000403cbf in main(int, char**) (argc=3D&lt;optimized out&gt;,
argv=3D&lt;optimized out&gt;) at /usr/src/debug/kdepim-16.08.1/kmail/src/ma=
in.cpp:161

Reported using DrKonqi</pre>
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

--14755674341.4cbfDe.31251--

--===============0881848269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0881848269==--
