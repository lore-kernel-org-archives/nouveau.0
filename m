From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98763] New: Lots of crashes of kontact /kmail5
Date: Thu, 17 Nov 2016 18:32:13 +0000
Message-ID: <bug-98763-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0706034319=="
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


--===============0706034319==
Content-Type: multipart/alternative; boundary="14794075330.f718017C.15132";
 charset="UTF-8"


--14794075330.f718017C.15132
Date: Thu, 17 Nov 2016 18:32:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98763

            Bug ID: 98763
           Summary: Lots of crashes of kontact /kmail5
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: karl.thomas.schmidt-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

contact/kmail often crashes on all kinds of actions related to graphical
operations.

Mesa-dri-nouveau      | package | 11.2.2-155.1 | x86_64 |
openSUSE-Leap-42.2-Update
libdrm_nouveau2       | package | 2.4.68-1.4   | x86_64 |
openSUSE-Leap-42.2-Oss=20=20=20
libdrm_nouveau2-32bit | package | 2.4.68-1.4   | x86_64 |
openSUSE-Leap-42.2-Oss=20=20=20
libvdpau_nouveau      | package | 11.2.2-155.1 | x86_64 |
openSUSE-Leap-42.2-Update
xf86-video-nouveau    | package | 1.0.12-1.5   | x86_64 |
openSUSE-Leap-42.2-Oss=20

Application: kontact (5.3.0 (QtWebEngine))

Qt Version: 5.6.1
Frameworks Version: 5.26.0
Operating System: Linux 4.4.27-2-default x86_64
Distribution: "openSUSE Leap 42.2"

-- Information about the crash:
- What I was doing when the application crashed:
A complete fresh install of LEAP 42.2. First start of cotact resulted in cr=
ash
of app, but assistent still promted for input.=20
After having stopped assistent, started contact new. Now without assistent
entered data for pop access to googlemail.com . It seemed that this was
successful. Even the testing of server settings. After applying all this
settings it crashed

-- Backtrace:
Application: Kontact (kontact), signal: Segmentation fault
Using host libthread_db library "/lib64/libthread_db.so.1".
[Current thread is 1 (Thread 0x7f2a47edd7c0 (LWP 5130))]

Thread 48 (Thread 0x7f28b2a22700 (LWP 5282)):
#0  0x00007f2a3fc158fb in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 47 (Thread 0x7f28b37fe700 (LWP 5273)):
#0  0x00007f2a3fc577d4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc16436 in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#3  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#4  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#7  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 46 (Thread 0x7f28b3fff700 (LWP 5271)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 45 (Thread 0x7f28c0f15700 (LWP 5269)):
#0  0x00007f2a3fc57381 in g_private_get () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc3ae40 in g_thread_self () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1641d in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 44 (Thread 0x7f28c1925700 (LWP 5267)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 43 (Thread 0x7f28c2126700 (LWP 5265)):
#0  0x00007f2a4521840a in QMutex::lock() () at /usr/lib64/libQt5Core.so.5
#1  0x00007f2a45432255 in  () at /usr/lib64/libQt5Core.so.5
#2  0x00007f2a3fc1595d in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 42 (Thread 0x7f28c3150700 (LWP 5263)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 41 (Thread 0x7f28d6ffd700 (LWP 5261)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 40 (Thread 0x7f28d77fe700 (LWP 5231)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0d739 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0defd in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 39 (Thread 0x7f28d7fff700 (LWP 5230)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0d739 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0defd in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 38 (Thread 0x7f28e5dec700 (LWP 5199)):
#0  0x00007f2a3fc15971 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 37 (Thread 0x7f28e65ed700 (LWP 5197)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 36 (Thread 0x7f28e77fe700 (LWP 5195)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 35 (Thread 0x7f28e7fff700 (LWP 5193)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 34 (Thread 0x7f2900da0700 (LWP 5191)):
#0  0x00007f2a3fc577d4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc15950 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 33 (Thread 0x7f29015a1700 (LWP 5189)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 32 (Thread 0x7f2901da2700 (LWP 5187)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 31 (Thread 0x7f29025a3700 (LWP 5184)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 30 (Thread 0x7f2902da4700 (LWP 5180)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 29 (Thread 0x7f290e238700 (LWP 5172)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 28 (Thread 0x7f290ea39700 (LWP 5170)):
#0  0x00007f2a4521840a in QMutex::lock() () at /usr/lib64/libQt5Core.so.5
#1  0x00007f2a45432945 in  () at /usr/lib64/libQt5Core.so.5
#2  0x00007f2a3fc15da1 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 27 (Thread 0x7f29177fe700 (LWP 5168)):
#0  0x00007f2a3fc154c7 in g_main_context_release () at
/usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc162be in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 26 (Thread 0x7f2917fff700 (LWP 5166)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 25 (Thread 0x7f2924a1e700 (LWP 5164)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 24 (Thread 0x7f292521f700 (LWP 5162)):
#0  0x00007f2a3fc577b9 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc162fa in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 23 (Thread 0x7f29260a4700 (LWP 5161)):
#0  0x00007f2a3fc577d4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc15950 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 22 (Thread 0x7f29bbffe700 (LWP 5160)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a323b293b in  () at /usr/lib64/libQt5Script.so.5
#2  0x00007f2a323b2969 in  () at /usr/lib64/libQt5Script.so.5
#3  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#4  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 21 (Thread 0x7f29f0ff9700 (LWP 5153)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37d69280 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37d56d2b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37d56fa5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37d53897 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a395596ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a395599d1 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a39559ac2 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#13 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 20 (Thread 0x7f29f17fa700 (LWP 5152)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0d739 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0defd in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 19 (Thread 0x7f29f1ffb700 (LWP 5151)):
#0  0x00007f2a22c71f83 in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#1  0x00007f2a22c7284a in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#2  0x00007f2a234fea14 in pa_mainloop_dispatch () at /usr/lib64/libpulse.so=
.0
#3  0x00007f2a234fedea in pa_mainloop_iterate () at /usr/lib64/libpulse.so.0
#4  0x00007f2a234fee90 in pa_mainloop_run () at /usr/lib64/libpulse.so.0
#5  0x00007f2a2350d006 in  () at /usr/lib64/libpulse.so.0
#6  0x00007f2a22c82408 in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 18 (Thread 0x7f29f27fc700 (LWP 5150)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#12 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 17 (Thread 0x7f29f2ffd700 (LWP 5149)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 16 (Thread 0x7f29f37fe700 (LWP 5148)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 15 (Thread 0x7f29f8ff9700 (LWP 5147)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a3790a569 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#5  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 14 (Thread 0x7f29f97fa700 (LWP 5146)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 13 (Thread 0x7f29f9ffb700 (LWP 5145)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a3759ce85 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a3759cf9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#14 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 12 (Thread 0x7f29fa7fc700 (LWP 5144)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a3759ce05 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a3759cffb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#14 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 11 (Thread 0x7f29faffd700 (LWP 5143)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a3759cd85 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a3759cfeb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 10 (Thread 0x7f29fb7fe700 (LWP 5142)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a3759cd05 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a3759cfdb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 9 (Thread 0x7f29f3fff700 (LWP 5141)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3e51 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a3759cc85 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a3759cfcb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#14 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 8 (Thread 0x7f29fbfff700 (LWP 5140)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a3759cc05 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a3759cfbb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 7 (Thread 0x7f2a10a22700 (LWP 5139)):
#0  0x00007f2a40858458 in pthread_cond_timedwait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f03b12 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f11556 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f11746 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 6 (Thread 0x7f2a11223700 (LWP 5138)):
#0  0x00007f2a40858458 in pthread_cond_timedwait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f03b12 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f11556 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f11746 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 5 (Thread 0x7f2a11a24700 (LWP 5137)):
#0  0x00007f2a408580af in pthread_cond_wait@@GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 4 (Thread 0x7f2a12432700 (LWP 5136)):
#0  0x00007f2a4491057d in write () at /lib64/libc.so.6
#1  0x00007f2a448a6840 in _IO_new_file_write () at /lib64/libc.so.6
#2  0x00007f2a448a5e63 in new_do_write () at /lib64/libc.so.6
#3  0x00007f2a448a6e46 in __GI__IO_file_xsputn () at /lib64/libc.so.6
#4  0x00007f2a4487db1b in buffered_vfprintf () at /lib64/libc.so.6
#5  0x00007f2a4487ae8e in vfprintf () at /lib64/libc.so.6
#6  0x00007f2a4492ad33 in __fprintf_chk () at /lib64/libc.so.6
#7  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#8  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#9  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#10 0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#11 0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#14 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#15 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#16 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#17 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 3 (Thread 0x7f2a19081700 (LWP 5133)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a43b5b1d5 in  () at /usr/lib64/libQt5DBus.so.5
#9  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 2 (Thread 0x7f2a29a8c700 (LWP 5132)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a403393e2 in  () at /usr/lib64/libxcb.so.1
#2  0x00007f2a4033afcf in xcb_wait_for_event () at /usr/lib64/libxcb.so.1
#3  0x00007f2a2b993839 in  () at /usr/lib64/libQt5XcbQpa.so.5
#4  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 1 (Thread 0x7f2a47edd7c0 (LWP 5130)):
[KCrash Handler]
#6  0x00007f2a201db30a in  () at /usr/lib64/libdrm_nouveau.so.2
#7  0x00007f2a201db8d9 in  () at /usr/lib64/libdrm_nouveau.so.2
#8  0x00007f2a208be45d in  () at /usr/lib64/dri/nouveau_dri.so
#9  0x00007f2a208c0bc1 in  () at /usr/lib64/dri/nouveau_dri.so
#10 0x00007f2a205d90ec in  () at /usr/lib64/dri/nouveau_dri.so
#11 0x00007f2a461483a1 in  () at /usr/lib64/libQt5Widgets.so.5
#12 0x00007f2a46148a10 in  () at /usr/lib64/libQt5Widgets.so.5
#13 0x00007f2a4612a9b7 in QWidget::event(QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#14 0x00007f2a42f75fdc in  () at /usr/lib64/libQt5WebEngineWidgets.so.5
#15 0x00007f2a460e8e3c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() at /usr/lib64/libQt5Widgets.so.5
#16 0x00007f2a460ed49a in QApplication::notify(QObject*, QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#17 0x00007f2a453e1fc5 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib64/libQt5Core.so.5
#18 0x00007f2a46123baa in QWidgetPrivate::sendPaintEvent(QRegion const&) ()=
 at
/usr/lib64/libQt5Widgets.so.5
#19 0x00007f2a460f4a14 in  () at /usr/lib64/libQt5Widgets.so.5
#20 0x00007f2a460f64b9 in  () at /usr/lib64/libQt5Widgets.so.5
#21 0x00007f2a46115e0f in QWidgetPrivate::syncBackingStore() () at
/usr/lib64/libQt5Widgets.so.5
#22 0x00007f2a4612a5f5 in QWidget::event(QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#23 0x00007f2a4623b0cb in QMainWindow::event(QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#24 0x00007f2a472374f7 in KMainWindow::event(QEvent*) () at
/usr/lib64/libKF5XmlGui.so.5
#25 0x00007f2a47273865 in KXmlGuiWindow::event(QEvent*) () at
/usr/lib64/libKF5XmlGui.so.5
#26 0x00007f2a460e8e3c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)=20
() at /usr/lib64/libQt5Widgets.so.5
#27 0x00007f2a460ed49a in QApplication::notify(QObject*, QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#28 0x00007f2a453e1fc5 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib64/libQt5Core.so.5
#29 0x00007f2a453e3daa in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () at /usr/lib64/libQt5Core.so.5
#30 0x00007f2a45432c83 in  () at /usr/lib64/libQt5Core.so.5
#31 0x00007f2a3fc16134 in g_main_context_dispatch () at
/usr/lib64/libglib-2.0.so.0
#32 0x00007f2a3fc16388 in  () at /usr/lib64/libglib-2.0.so.0
#33 0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#34 0x00007f2a4543230c in
QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) =
()
at /usr/lib64/libQt5Core.so.5
#35 0x00007f2a453dffdb in
QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at
/usr/lib64/libQt5Core.so.5
#36 0x00007f2a453e7ec6 in QCoreApplication::exec() () at
/usr/lib64/libQt5Core.so.5
#37 0x00000000004046bb in  ()
#38 0x00007f2a448536e5 in __libc_start_main () at /lib64/libc.so.6
#39 0x0000000000404bf9 in _start ()

Reported using DrKonqi

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14794075330.f718017C.15132
Date: Thu, 17 Nov 2016 18:32:13 +0000
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
   title=3D"NEW - Lots of crashes of kontact /kmail5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98763">98763</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Lots of crashes of kontact /kmail5
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
          <td>major
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
          <td>karl.thomas.schmidt&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>contact/kmail often crashes on all kinds of actions related to=
 graphical
operations.

Mesa-dri-nouveau      | package | 11.2.2-155.1 | x86_64 |
openSUSE-Leap-42.2-Update
libdrm_nouveau2       | package | 2.4.68-1.4   | x86_64 |
openSUSE-Leap-42.2-Oss=20=20=20
libdrm_nouveau2-32bit | package | 2.4.68-1.4   | x86_64 |
openSUSE-Leap-42.2-Oss=20=20=20
libvdpau_nouveau      | package | 11.2.2-155.1 | x86_64 |
openSUSE-Leap-42.2-Update
xf86-video-nouveau    | package | 1.0.12-1.5   | x86_64 |
openSUSE-Leap-42.2-Oss=20

Application: kontact (5.3.0 (QtWebEngine))

Qt Version: 5.6.1
Frameworks Version: 5.26.0
Operating System: Linux 4.4.27-2-default x86_64
Distribution: &quot;openSUSE Leap 42.2&quot;

-- Information about the crash:
- What I was doing when the application crashed:
A complete fresh install of LEAP 42.2. First start of cotact resulted in cr=
ash
of app, but assistent still promted for input.=20
After having stopped assistent, started contact new. Now without assistent
entered data for pop access to googlemail.com . It seemed that this was
successful. Even the testing of server settings. After applying all this
settings it crashed

-- Backtrace:
Application: Kontact (kontact), signal: Segmentation fault
Using host libthread_db library &quot;/lib64/libthread_db.so.1&quot;.
[Current thread is 1 (Thread 0x7f2a47edd7c0 (LWP 5130))]

Thread 48 (Thread 0x7f28b2a22700 (LWP 5282)):
#0  0x00007f2a3fc158fb in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 47 (Thread 0x7f28b37fe700 (LWP 5273)):
#0  0x00007f2a3fc577d4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc16436 in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#3  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#4  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#7  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 46 (Thread 0x7f28b3fff700 (LWP 5271)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 45 (Thread 0x7f28c0f15700 (LWP 5269)):
#0  0x00007f2a3fc57381 in g_private_get () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc3ae40 in g_thread_self () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1641d in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 44 (Thread 0x7f28c1925700 (LWP 5267)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 43 (Thread 0x7f28c2126700 (LWP 5265)):
#0  0x00007f2a4521840a in QMutex::lock() () at /usr/lib64/libQt5Core.so.5
#1  0x00007f2a45432255 in  () at /usr/lib64/libQt5Core.so.5
#2  0x00007f2a3fc1595d in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 42 (Thread 0x7f28c3150700 (LWP 5263)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 41 (Thread 0x7f28d6ffd700 (LWP 5261)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 40 (Thread 0x7f28d77fe700 (LWP 5231)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0d739 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0defd in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 39 (Thread 0x7f28d7fff700 (LWP 5230)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0d739 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0defd in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 38 (Thread 0x7f28e5dec700 (LWP 5199)):
#0  0x00007f2a3fc15971 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 37 (Thread 0x7f28e65ed700 (LWP 5197)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 36 (Thread 0x7f28e77fe700 (LWP 5195)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 35 (Thread 0x7f28e7fff700 (LWP 5193)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 34 (Thread 0x7f2900da0700 (LWP 5191)):
#0  0x00007f2a3fc577d4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc15950 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 33 (Thread 0x7f29015a1700 (LWP 5189)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 32 (Thread 0x7f2901da2700 (LWP 5187)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 31 (Thread 0x7f29025a3700 (LWP 5184)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 30 (Thread 0x7f2902da4700 (LWP 5180)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 29 (Thread 0x7f290e238700 (LWP 5172)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 28 (Thread 0x7f290ea39700 (LWP 5170)):
#0  0x00007f2a4521840a in QMutex::lock() () at /usr/lib64/libQt5Core.so.5
#1  0x00007f2a45432945 in  () at /usr/lib64/libQt5Core.so.5
#2  0x00007f2a3fc15da1 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 27 (Thread 0x7f29177fe700 (LWP 5168)):
#0  0x00007f2a3fc154c7 in g_main_context_release () at
/usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc162be in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 26 (Thread 0x7f2917fff700 (LWP 5166)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#9  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#10 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 25 (Thread 0x7f2924a1e700 (LWP 5164)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a3fc16314 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 24 (Thread 0x7f292521f700 (LWP 5162)):
#0  0x00007f2a3fc577b9 in g_mutex_lock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc162fa in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#4  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#5  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 23 (Thread 0x7f29260a4700 (LWP 5161)):
#0  0x00007f2a3fc577d4 in g_mutex_unlock () at /usr/lib64/libglib-2.0.so.0
#1  0x00007f2a3fc15950 in g_main_context_prepare () at
/usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc16230 in  () at /usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#4  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#6  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 22 (Thread 0x7f29bbffe700 (LWP 5160)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a323b293b in  () at /usr/lib64/libQt5Script.so.5
#2  0x00007f2a323b2969 in  () at /usr/lib64/libQt5Script.so.5
#3  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#4  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 21 (Thread 0x7f29f0ff9700 (LWP 5153)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37d69280 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37d56d2b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37d56fa5 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37d53897 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a395596ba in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a395599d1 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a39559ac2 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#13 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 20 (Thread 0x7f29f17fa700 (LWP 5152)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0d739 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0defd in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 19 (Thread 0x7f29f1ffb700 (LWP 5151)):
#0  0x00007f2a22c71f83 in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#1  0x00007f2a22c7284a in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#2  0x00007f2a234fea14 in pa_mainloop_dispatch () at /usr/lib64/libpulse.so=
.0
#3  0x00007f2a234fedea in pa_mainloop_iterate () at /usr/lib64/libpulse.so.0
#4  0x00007f2a234fee90 in pa_mainloop_run () at /usr/lib64/libpulse.so.0
#5  0x00007f2a2350d006 in  () at /usr/lib64/libpulse.so.0
#6  0x00007f2a22c82408 in  () at /usr/lib64/pulseaudio/libpulsecommon-9.0.so
#7  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#8  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 18 (Thread 0x7f29f27fc700 (LWP 5150)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#12 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 17 (Thread 0x7f29f2ffd700 (LWP 5149)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 16 (Thread 0x7f29f37fe700 (LWP 5148)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 15 (Thread 0x7f29f8ff9700 (LWP 5147)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a3790a569 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f0e720 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#5  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 14 (Thread 0x7f29f97fa700 (LWP 5146)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 13 (Thread 0x7f29f9ffb700 (LWP 5145)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a3759ce85 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a3759cf9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#14 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 12 (Thread 0x7f29fa7fc700 (LWP 5144)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a3759ce05 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a3759cffb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#14 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 11 (Thread 0x7f29faffd700 (LWP 5143)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a3759cd85 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a3759cfeb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 10 (Thread 0x7f29fb7fe700 (LWP 5142)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a3759cd05 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a3759cfdb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 9 (Thread 0x7f29f3fff700 (LWP 5141)):
#0  0x00007f2a4492913b in __lll_lock_wait_private () at /lib64/libc.so.6
#1  0x00007f2a4492acd6 in __fprintf_chk () at /lib64/libc.so.6
#2  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#3  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#4  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#5  0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#6  0x00007f2a37ec3e51 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a3759cc85 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a3759cfcb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#11 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#14 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 8 (Thread 0x7f29fbfff700 (LWP 5140)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a3759cc05 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a3759cfbb in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#9  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 7 (Thread 0x7f2a10a22700 (LWP 5139)):
#0  0x00007f2a40858458 in pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f03b12 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f11556 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f11746 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 6 (Thread 0x7f2a11223700 (LWP 5138)):
#0  0x00007f2a40858458 in pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f03b12 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f11556 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37f11746 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 5 (Thread 0x7f2a11a24700 (LWP 5137)):
#0  0x00007f2a408580af in pthread_cond_wait&#64;&#64;GLIBC_2.3.2 () at
/lib64/libpthread.so.0
#1  0x00007f2a37f0426f in  () at /usr/lib64/libQt5WebEngineCore.so.5
#2  0x00007f2a37f04344 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#3  0x00007f2a37ee6b9b in  () at /usr/lib64/libQt5WebEngineCore.so.5
#4  0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#5  0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#6  0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#7  0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#8  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#9  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 4 (Thread 0x7f2a12432700 (LWP 5136)):
#0  0x00007f2a4491057d in write () at /lib64/libc.so.6
#1  0x00007f2a448a6840 in _IO_new_file_write () at /lib64/libc.so.6
#2  0x00007f2a448a5e63 in new_do_write () at /lib64/libc.so.6
#3  0x00007f2a448a6e46 in __GI__IO_file_xsputn () at /lib64/libc.so.6
#4  0x00007f2a4487db1b in buffered_vfprintf () at /lib64/libc.so.6
#5  0x00007f2a4487ae8e in vfprintf () at /lib64/libc.so.6
#6  0x00007f2a4492ad33 in __fprintf_chk () at /lib64/libc.so.6
#7  0x00007f2a30d39fdf in  () at /usr/lib64/libevent-2.0.so.5
#8  0x00007f2a30d3a1b7 in event_warn () at /usr/lib64/libevent-2.0.so.5
#9  0x00007f2a30d3e468 in  () at /usr/lib64/libevent-2.0.so.5
#10 0x00007f2a30d2a477 in event_base_loop () at /usr/lib64/libevent-2.0.so.5
#11 0x00007f2a37ec3dbe in  () at /usr/lib64/libQt5WebEngineCore.so.5
#12 0x00007f2a37ef7182 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#13 0x00007f2a37ee2c25 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#14 0x00007f2a37f0eaa0 in  () at /usr/lib64/libQt5WebEngineCore.so.5
#15 0x00007f2a37f0b47e in  () at /usr/lib64/libQt5WebEngineCore.so.5
#16 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#17 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 3 (Thread 0x7f2a19081700 (LWP 5133)):
#0  0x00007f2a4491051d in read () at /lib64/libc.so.6
#1  0x00007f2a3fc56670 in  () at /usr/lib64/libglib-2.0.so.0
#2  0x00007f2a3fc15e49 in g_main_context_check () at
/usr/lib64/libglib-2.0.so.0
#3  0x00007f2a3fc162a8 in  () at /usr/lib64/libglib-2.0.so.0
#4  0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#5  0x00007f2a4543232b in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#6  0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#7  0x00007f2a4521af1a in QThread::exec() () at /usr/lib64/libQt5Core.so.5
#8  0x00007f2a43b5b1d5 in  () at /usr/lib64/libQt5DBus.so.5
#9  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#10 0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#11 0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 2 (Thread 0x7f2a29a8c700 (LWP 5132)):
#0  0x00007f2a4491449d in poll () at /lib64/libc.so.6
#1  0x00007f2a403393e2 in  () at /usr/lib64/libxcb.so.1
#2  0x00007f2a4033afcf in xcb_wait_for_event () at /usr/lib64/libxcb.so.1
#3  0x00007f2a2b993839 in  () at /usr/lib64/libQt5XcbQpa.so.5
#4  0x00007f2a4521f9e9 in  () at /usr/lib64/libQt5Core.so.5
#5  0x00007f2a40853734 in start_thread () at /lib64/libpthread.so.0
#6  0x00007f2a4491cd3d in clone () at /lib64/libc.so.6

Thread 1 (Thread 0x7f2a47edd7c0 (LWP 5130)):
[KCrash Handler]
#6  0x00007f2a201db30a in  () at /usr/lib64/libdrm_nouveau.so.2
#7  0x00007f2a201db8d9 in  () at /usr/lib64/libdrm_nouveau.so.2
#8  0x00007f2a208be45d in  () at /usr/lib64/dri/nouveau_dri.so
#9  0x00007f2a208c0bc1 in  () at /usr/lib64/dri/nouveau_dri.so
#10 0x00007f2a205d90ec in  () at /usr/lib64/dri/nouveau_dri.so
#11 0x00007f2a461483a1 in  () at /usr/lib64/libQt5Widgets.so.5
#12 0x00007f2a46148a10 in  () at /usr/lib64/libQt5Widgets.so.5
#13 0x00007f2a4612a9b7 in QWidget::event(QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#14 0x00007f2a42f75fdc in  () at /usr/lib64/libQt5WebEngineWidgets.so.5
#15 0x00007f2a460e8e3c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)
() at /usr/lib64/libQt5Widgets.so.5
#16 0x00007f2a460ed49a in QApplication::notify(QObject*, QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#17 0x00007f2a453e1fc5 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib64/libQt5Core.so.5
#18 0x00007f2a46123baa in QWidgetPrivate::sendPaintEvent(QRegion const&amp;=
) () at
/usr/lib64/libQt5Widgets.so.5
#19 0x00007f2a460f4a14 in  () at /usr/lib64/libQt5Widgets.so.5
#20 0x00007f2a460f64b9 in  () at /usr/lib64/libQt5Widgets.so.5
#21 0x00007f2a46115e0f in QWidgetPrivate::syncBackingStore() () at
/usr/lib64/libQt5Widgets.so.5
#22 0x00007f2a4612a5f5 in QWidget::event(QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#23 0x00007f2a4623b0cb in QMainWindow::event(QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#24 0x00007f2a472374f7 in KMainWindow::event(QEvent*) () at
/usr/lib64/libKF5XmlGui.so.5
#25 0x00007f2a47273865 in KXmlGuiWindow::event(QEvent*) () at
/usr/lib64/libKF5XmlGui.so.5
#26 0x00007f2a460e8e3c in QApplicationPrivate::notify_helper(QObject*, QEve=
nt*)=20
() at /usr/lib64/libQt5Widgets.so.5
#27 0x00007f2a460ed49a in QApplication::notify(QObject*, QEvent*) () at
/usr/lib64/libQt5Widgets.so.5
#28 0x00007f2a453e1fc5 in QCoreApplication::notifyInternal2(QObject*, QEven=
t*)
() at /usr/lib64/libQt5Core.so.5
#29 0x00007f2a453e3daa in QCoreApplicationPrivate::sendPostedEvents(QObject=
*,
int, QThreadData*) () at /usr/lib64/libQt5Core.so.5
#30 0x00007f2a45432c83 in  () at /usr/lib64/libQt5Core.so.5
#31 0x00007f2a3fc16134 in g_main_context_dispatch () at
/usr/lib64/libglib-2.0.so.0
#32 0x00007f2a3fc16388 in  () at /usr/lib64/libglib-2.0.so.0
#33 0x00007f2a3fc1642c in g_main_context_iteration () at
/usr/lib64/libglib-2.0.so.0
#34 0x00007f2a4543230c in
QEventDispatcherGlib::processEvents(QFlags&lt;QEventLoop::ProcessEventsFlag=
&gt;) ()
at /usr/lib64/libQt5Core.so.5
#35 0x00007f2a453dffdb in
QEventLoop::exec(QFlags&lt;QEventLoop::ProcessEventsFlag&gt;) () at
/usr/lib64/libQt5Core.so.5
#36 0x00007f2a453e7ec6 in QCoreApplication::exec() () at
/usr/lib64/libQt5Core.so.5
#37 0x00000000004046bb in  ()
#38 0x00007f2a448536e5 in __libc_start_main () at /lib64/libc.so.6
#39 0x0000000000404bf9 in _start ()

Reported using DrKonqi</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14794075330.f718017C.15132--

--===============0706034319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0706034319==--
