From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93197] New: Warsow 2.0 crashes in
	nouveau_fence_trigger_work
Date: Tue, 01 Dec 2015 20:33:52 +0000
Message-ID: <bug-93197-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2053341587=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2053341587==
Content-Type: multipart/alternative; boundary="1449002032.b62AF8C0.28784"; charset="UTF-8"


--1449002032.b62AF8C0.28784
Date: Tue, 1 Dec 2015 20:33:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93197

            Bug ID: 93197
           Summary: Warsow 2.0 crashes in nouveau_fence_trigger_work
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Warsow can be downloaded from: https://www.warsow.gg/download

gdb session:
Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fffe704a700 (LWP 12680)]
nouveau_fence_trigger_work (fence=fence@entry=0x7fffd0296850) at
nouveau_fence.c:57
57          LIST_DEL(&work->list);
(gdb) bt
#0  nouveau_fence_trigger_work (fence=fence@entry=0x7fffd0296850) at
nouveau_fence.c:57
#1  0x00007fffef9459be in nouveau_fence_update (screen=screen@entry=0xac1060,
flushed=flushed@entry=false) at nouveau_fence.c:132
#2  0x00007fffef945c6e in nouveau_fence_wait (fence=0x7fffd0296850, debug=0x0)
at nouveau_fence.c:223
#3  0x00007fffef68b0cb in st_finish (st=st@entry=0x17d6130) at
state_tracker/st_cb_flush.c:101
#4  0x00007fffef68b110 in st_glFinish (ctx=<optimized out>) at
state_tracker/st_cb_flush.c:136
#5  0x00007fffd72ef731 in ?? () from ./libs/libref_gl_x86_64.so
#6  0x0000000000405af6 in ?? ()
#7  0x0000000000405bc9 in ?? ()
#8  0x00007fffd72eb304 in ?? () from ./libs/libref_gl_x86_64.so
#9  0x00007ffff78bc6aa in start_thread (arg=0x7fffe704a700) at
pthread_create.c:333
#10 0x00007ffff70e1eed in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:109
(gdb) print work
$1 = (struct nouveau_fence_work *) 0x7fffd815fc50
(gdb) print work->list 
$2 = {prev = 0x0, next = 0x7fffd8121510}
(gdb) list
52    {
53       struct nouveau_fence_work *work, *tmp;
54    
55       LIST_FOR_EACH_ENTRY_SAFE(work, tmp, &fence->work, list) {
56          work->func(work->data);
57          LIST_DEL(&work->list);
58          FREE(work);
59       }
60    }
61    
(gdb) i threads
  Id   Target Id         Frame 
  7    Thread 0x7fffe6048700 (LWP 12675) "warsow.x86_64" 0x00007ffff70d8743 in
select () at ../sysdeps/unix/syscall-template.S:81
  6    Thread 0x7fffe6849700 (LWP 12679) "warsow.x86_64" 0x00007ffff70d80b7 in
ioctl () at ../sysdeps/unix/syscall-template.S:81
  5    Thread 0x7fffd72a2700 (LWP 12683) "SDLAudioDev1" 0x00007ffff70d69a1 in
__GI_ppoll (fds=0x7fffe003b060, nfds=2, timeout=<optimized out>, sigmask=0x0)
    at ../sysdeps/unix/sysv/linux/ppoll.c:56
* 4    Thread 0x7fffe704a700 (LWP 12680) "warsow.x86_64"
nouveau_fence_trigger_work (fence=fence@entry=0x7fffd0296850) at
nouveau_fence.c:57
  2    Thread 0x7fffe784b700 (LWP 12681) "warsow.x86_64"
pthread_cond_timedwait@@GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:238
  1    Thread 0x7ffff7fb9780 (LWP 12632) "warsow.x86_64" (Exiting)
0x00007fffd72e62b8 in ?? () from ./libs/libref_gl_x86_64.so
(gdb) print work
work           work_count     worklist_elem  
(gdb) print work->func 
$3 = (void (*)(void *)) 0x7fffef945d20 <nouveau_fence_unref_bo>
(gdb)


This is with Mesa-git from ~2 weeks ago:
OpenGL renderer string: Gallium 0.4 on NVE7
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.1.0-devel
(git-1a18457)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1449002032.b62AF8C0.28784
Date: Tue, 1 Dec 2015 20:33:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Warsow 2.0 crashes in nouveau_fence_trigger_work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93197">93197</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Warsow 2.0 crashes in nouveau_fence_trigger_work
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
          <td>marcin.slusarz&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Warsow can be downloaded from: <a href="https://www.warsow.gg/download">https://www.warsow.gg/download</a>

gdb session:
Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fffe704a700 (LWP 12680)]
nouveau_fence_trigger_work (fence=fence&#64;entry=0x7fffd0296850) at
nouveau_fence.c:57
57          LIST_DEL(&amp;work-&gt;list);
(gdb) bt
#0  nouveau_fence_trigger_work (fence=fence&#64;entry=0x7fffd0296850) at
nouveau_fence.c:57
#1  0x00007fffef9459be in nouveau_fence_update (screen=screen&#64;entry=0xac1060,
flushed=flushed&#64;entry=false) at nouveau_fence.c:132
#2  0x00007fffef945c6e in nouveau_fence_wait (fence=0x7fffd0296850, debug=0x0)
at nouveau_fence.c:223
#3  0x00007fffef68b0cb in st_finish (st=st&#64;entry=0x17d6130) at
state_tracker/st_cb_flush.c:101
#4  0x00007fffef68b110 in st_glFinish (ctx=&lt;optimized out&gt;) at
state_tracker/st_cb_flush.c:136
#5  0x00007fffd72ef731 in ?? () from ./libs/libref_gl_x86_64.so
#6  0x0000000000405af6 in ?? ()
#7  0x0000000000405bc9 in ?? ()
#8  0x00007fffd72eb304 in ?? () from ./libs/libref_gl_x86_64.so
#9  0x00007ffff78bc6aa in start_thread (arg=0x7fffe704a700) at
pthread_create.c:333
#10 0x00007ffff70e1eed in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:109
(gdb) print work
$1 = (struct nouveau_fence_work *) 0x7fffd815fc50
(gdb) print work-&gt;list 
$2 = {prev = 0x0, next = 0x7fffd8121510}
(gdb) list
52    {
53       struct nouveau_fence_work *work, *tmp;
54    
55       LIST_FOR_EACH_ENTRY_SAFE(work, tmp, &amp;fence-&gt;work, list) {
56          work-&gt;func(work-&gt;data);
57          LIST_DEL(&amp;work-&gt;list);
58          FREE(work);
59       }
60    }
61    
(gdb) i threads
  Id   Target Id         Frame 
  7    Thread 0x7fffe6048700 (LWP 12675) &quot;warsow.x86_64&quot; 0x00007ffff70d8743 in
select () at ../sysdeps/unix/syscall-template.S:81
  6    Thread 0x7fffe6849700 (LWP 12679) &quot;warsow.x86_64&quot; 0x00007ffff70d80b7 in
ioctl () at ../sysdeps/unix/syscall-template.S:81
  5    Thread 0x7fffd72a2700 (LWP 12683) &quot;SDLAudioDev1&quot; 0x00007ffff70d69a1 in
__GI_ppoll (fds=0x7fffe003b060, nfds=2, timeout=&lt;optimized out&gt;, sigmask=0x0)
    at ../sysdeps/unix/sysv/linux/ppoll.c:56
* 4    Thread 0x7fffe704a700 (LWP 12680) &quot;warsow.x86_64&quot;
nouveau_fence_trigger_work (fence=fence&#64;entry=0x7fffd0296850) at
nouveau_fence.c:57
  2    Thread 0x7fffe784b700 (LWP 12681) &quot;warsow.x86_64&quot;
pthread_cond_timedwait&#64;&#64;GLIBC_2.3.2 () at
../sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S:238
  1    Thread 0x7ffff7fb9780 (LWP 12632) &quot;warsow.x86_64&quot; (Exiting)
0x00007fffd72e62b8 in ?? () from ./libs/libref_gl_x86_64.so
(gdb) print work
work           work_count     worklist_elem  
(gdb) print work-&gt;func 
$3 = (void (*)(void *)) 0x7fffef945d20 &lt;nouveau_fence_unref_bo&gt;
(gdb)


This is with Mesa-git from ~2 weeks ago:
OpenGL renderer string: Gallium 0.4 on NVE7
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.1.0-devel
(git-1a18457)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449002032.b62AF8C0.28784--

--===============2053341587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2053341587==--
