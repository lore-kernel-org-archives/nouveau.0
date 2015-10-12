From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] New: Segfault in pushbuf_kref when running
 the android emulator (qemu) on nv50
Date: Mon, 12 Oct 2015 12:59:46 +0000
Message-ID: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1622621063=="
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


--===============1622621063==
Content-Type: multipart/alternative; boundary="1444654786.b6e5AB0.31466"; charset="UTF-8"


--1444654786.b6e5AB0.31466
Date: Mon, 12 Oct 2015 12:59:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

            Bug ID: 92438
           Summary: Segfault in pushbuf_kref when running the android
                    emulator (qemu) on nv50
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gabriele.svelto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118838
  --> https://bugs.freedesktop.org/attachment.cgi?id=118838&action=edit
kernel log

I've encountered an easily reproducible segfault using the Firefox OS emulator
while I was hacking the said operating. The Firefox OS emulator [1] is a fork
of the Android emulator which is in turn a fork of qemu. In both cases the
graphics part is untouched so it might be possible to reproduce the same issue
in qemu even though I didn't have the time to try it.

Here's my full STR:

1) Build the Firefox OS emulator using the emulator-x86-kk target device ( git
clone https://github.com/mozilla-b2g/B2G.git ; cd B2G ; ./config.sh
emulator-x86-kk ; ./build.sh )
2) Launch it from the tree using the run-emulator.sh script
3) Once Firefox OS has started quickly click on any application and keep
clicking on buttons / input boxes / etc... The segfault will normally happen in
a matter of seconds

I've reproduced the bug both on Fedora 22 and Gentoo so it doesn't look like
distro-specific, these are the versions number taken from my Gentoo
installation:

xf86-video-nouveau 1.0.11
libdrm 2.4.59
mesa 10.3.7
xorg-server 1.16.4
kernel 4.0.5

I've captured a stack trace of the segfault with gdb:

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0xc3dfeb40 (LWP 9387)]
0xf689a323 in pushbuf_kref () from /usr/lib32/libdrm_nouveau.so.2
(gdb) bt
#0  0xf689a323 in pushbuf_kref () from /usr/lib32/libdrm_nouveau.so.2
#1  0xf689ab9f in pushbuf_validate () from /usr/lib32/libdrm_nouveau.so.2
#2  0xf6ce47e8 in nv50_state_validate () from /usr/lib32/dri/nouveau_dri.so
#3  0xf6cf0a49 in nv50_draw_vbo () from /usr/lib32/dri/nouveau_dri.so
#4  0xf6b3846d in cso_draw_vbo () from /usr/lib32/dri/nouveau_dri.so
#5  0xf6a5f29e in st_draw_vbo () from /usr/lib32/dri/nouveau_dri.so
#6  0xf6a30cd3 in vbo_draw_arrays () from /usr/lib32/dri/nouveau_dri.so
#7  0xf6a30f37 in vbo_exec_DrawArrays () from /usr/lib32/dri/nouveau_dri.so
#8  0xf72ca52b in glDrawArrays (mode=4, first=0, count=6) at
sdk/emulator/opengl/host/libs/Translator/GLES_V2/GLESv2Imp.cpp:576
#9  0xf74b9965 in gl2_decoder_context_t::decode (this=0xc3dfdfd4,
buf=0xc47ff008, len=5452, stream=0xc6400768)
    at
out/host/linux-x86/obj/STATIC_LIBRARIES/libGLESv2_dec_intermediates/gl2_dec.cpp:565
#10 0xf74b662c in RenderThread::Main (this=0xc6400788) at
sdk/emulator/opengl/host/libs/libOpenglRender/RenderThread.cpp:128
#11 0xf74cdc3d in osUtils::Thread::thread_main (p_arg=0xc6400788) at
sdk/emulator/opengl/shared/OpenglOsUtils/osThreadUnix.cpp:83
#12 0xf7f9711f in start_thread () from /lib32/libpthread.so.0
#13 0xf7d5f79e in clone () from /lib32/libc.so.6

I'm attaching the kernel log and the X log. Those may be "polluted" by other
stuff as my machine has been running for some time since I've hit the bug. I'll
try to provide cleaner ones right after I hit the bug. If more detailed
information is needed (e.g. a backtrace with finer-grained debug information,
etc...) I can provide it given some time to gather it.

[1]
https://developer.mozilla.org/en-US/docs/Mozilla/Firefox_OS/Using_the_B2G_emulators

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444654786.b6e5AB0.31466
Date: Mon, 12 Oct 2015 12:59:46 +0000
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
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">92438</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segfault in pushbuf_kref when running the android emulator (qemu) on nv50
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
          <td>gabriele.svelto&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118838" name="attach_118838" title="kernel log">attachment 118838</a> <a href="attachment.cgi?id=118838&amp;action=edit" title="kernel log">[details]</a></span>
kernel log

I've encountered an easily reproducible segfault using the Firefox OS emulator
while I was hacking the said operating. The Firefox OS emulator [1] is a fork
of the Android emulator which is in turn a fork of qemu. In both cases the
graphics part is untouched so it might be possible to reproduce the same issue
in qemu even though I didn't have the time to try it.

Here's my full STR:

1) Build the Firefox OS emulator using the emulator-x86-kk target device ( git
clone <a href="https://github.com/mozilla-b2g/B2G.git">https://github.com/mozilla-b2g/B2G.git</a> ; cd B2G ; ./config.sh
emulator-x86-kk ; ./build.sh )
2) Launch it from the tree using the run-emulator.sh script
3) Once Firefox OS has started quickly click on any application and keep
clicking on buttons / input boxes / etc... The segfault will normally happen in
a matter of seconds

I've reproduced the bug both on Fedora 22 and Gentoo so it doesn't look like
distro-specific, these are the versions number taken from my Gentoo
installation:

xf86-video-nouveau 1.0.11
libdrm 2.4.59
mesa 10.3.7
xorg-server 1.16.4
kernel 4.0.5

I've captured a stack trace of the segfault with gdb:

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0xc3dfeb40 (LWP 9387)]
0xf689a323 in pushbuf_kref () from /usr/lib32/libdrm_nouveau.so.2
(gdb) bt
#0  0xf689a323 in pushbuf_kref () from /usr/lib32/libdrm_nouveau.so.2
#1  0xf689ab9f in pushbuf_validate () from /usr/lib32/libdrm_nouveau.so.2
#2  0xf6ce47e8 in nv50_state_validate () from /usr/lib32/dri/nouveau_dri.so
#3  0xf6cf0a49 in nv50_draw_vbo () from /usr/lib32/dri/nouveau_dri.so
#4  0xf6b3846d in cso_draw_vbo () from /usr/lib32/dri/nouveau_dri.so
#5  0xf6a5f29e in st_draw_vbo () from /usr/lib32/dri/nouveau_dri.so
#6  0xf6a30cd3 in vbo_draw_arrays () from /usr/lib32/dri/nouveau_dri.so
#7  0xf6a30f37 in vbo_exec_DrawArrays () from /usr/lib32/dri/nouveau_dri.so
#8  0xf72ca52b in glDrawArrays (mode=4, first=0, count=6) at
sdk/emulator/opengl/host/libs/Translator/GLES_V2/GLESv2Imp.cpp:576
#9  0xf74b9965 in gl2_decoder_context_t::decode (this=0xc3dfdfd4,
buf=0xc47ff008, len=5452, stream=0xc6400768)
    at
out/host/linux-x86/obj/STATIC_LIBRARIES/libGLESv2_dec_intermediates/gl2_dec.cpp:565
#10 0xf74b662c in RenderThread::Main (this=0xc6400788) at
sdk/emulator/opengl/host/libs/libOpenglRender/RenderThread.cpp:128
#11 0xf74cdc3d in osUtils::Thread::thread_main (p_arg=0xc6400788) at
sdk/emulator/opengl/shared/OpenglOsUtils/osThreadUnix.cpp:83
#12 0xf7f9711f in start_thread () from /lib32/libpthread.so.0
#13 0xf7d5f79e in clone () from /lib32/libc.so.6

I'm attaching the kernel log and the X log. Those may be &quot;polluted&quot; by other
stuff as my machine has been running for some time since I've hit the bug. I'll
try to provide cleaner ones right after I hit the bug. If more detailed
information is needed (e.g. a backtrace with finer-grained debug information,
etc...) I can provide it given some time to gather it.

[1]
<a href="https://developer.mozilla.org/en-US/docs/Mozilla/Firefox_OS/Using_the_B2G_emulators">https://developer.mozilla.org/en-US/docs/Mozilla/Firefox_OS/Using_the_B2G_emulators</a></pre>
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

--1444654786.b6e5AB0.31466--

--===============1622621063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1622621063==--
