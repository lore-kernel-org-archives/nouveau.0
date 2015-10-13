From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Tue, 13 Oct 2015 20:17:22 +0000
Message-ID: <bug-92438-8800-UAW8ibzAxE@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1835733031=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1835733031==
Content-Type: multipart/alternative; boundary="1444767442.6BF80.7417"; charset="UTF-8"


--1444767442.6BF80.7417
Date: Tue, 13 Oct 2015 20:17:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #8 from Gabriele Svelto <gabriele.svelto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can still reproduce on mesa 11.0.3 / libdrm 2.4.65 though it takes longer to
trigger the bug (a few minutes of usage). This is the backtrace when using
these versions of mesa and libdrm, it's somewhat different than the previous
one but the bottom frames look the same:

#0  0xf67fc403 in pushbuf_kref () from /usr/lib32/libdrm_nouveau.so.2
#1  0xf67fcc7f in pushbuf_validate () from /usr/lib32/libdrm_nouveau.so.2
#2  0xf6c80f9b in nv50_flush () from /usr/lib32/dri/nouveau_dri.so
#3  0xf69c93a4 in st_flush () from /usr/lib32/dri/nouveau_dri.so
#4  0xf69c93f4 in st_glFlush () from /usr/lib32/dri/nouveau_dri.so
#5  0xf6879b76 in _mesa_flush () from /usr/lib32/dri/nouveau_dri.so
#6  0xf6879f19 in _mesa_make_current () from /usr/lib32/dri/nouveau_dri.so
#7  0xf69fab96 in st_api_make_current () from /usr/lib32/dri/nouveau_dri.so
#8  0xf6ac28f6 in dri_unbind_context () from /usr/lib32/dri/nouveau_dri.so
#9  0xf6ac2337 in driUnbindContext () from /usr/lib32/dri/nouveau_dri.so
#10 0xf73ff3b6 in dri2_unbind_context () from /usr/lib32/libGL.so.1
#11 0xf73d89fb in glXMakeCurrentReadSGI () from /usr/lib32/libGL.so.1
#12 0xf747a89c in EglOS::makeCurrent (dpy=0x8c13608, read=0x0, draw=0x0,
ctx=0x0) at sdk/emulator/opengl/host/libs/Translator/EGL/EglX11Api.cpp:263
#13 0xf747eb11 in eglMakeCurrent (display=0x8c20e50, draw=0x0, read=0x0,
context=0x0) at sdk/emulator/opengl/host/libs/Translator/EGL/EglImp.cpp:684
#14 0xf74b0787 in FrameBuffer::unbind_locked (this=0x8c20d68) at
sdk/emulator/opengl/host/libs/libOpenglRender/FrameBuffer.cpp:790
#15 0xf74ad7f6 in ColorBuffer::create (p_width=320, p_height=266,
p_internalFormat=6408) at
sdk/emulator/opengl/host/libs/libOpenglRender/ColorBuffer.cpp:108
#16 0xf74b181f in FrameBuffer::createColorBuffer (this=0x8c20d68, p_width=320,
p_height=266, p_internalFormat=6408)
    at sdk/emulator/opengl/host/libs/libOpenglRender/FrameBuffer.cpp:489
#17 0xf74b7c2d in rcCreateColorBuffer (width=320, height=266,
internalFormat=6408) at
sdk/emulator/opengl/host/libs/libOpenglRender/RenderControl.cpp:215
#18 0xf74b9754 in renderControl_decoder_context_t::decode (this=0xc6301d5c,
buf=0xacee6008, len=20, stream=0xc6300990)
    at
out/host/linux-x86/obj/STATIC_LIBRARIES/lib_renderControl_dec_intermediates/renderControl_dec.cpp:245
#19 0xf74b8655 in RenderThread::Main (this=0xc6301d30) at
sdk/emulator/opengl/host/libs/libOpenglRender/RenderThread.cpp:138
#20 0xf74cfc3d in osUtils::Thread::thread_main (p_arg=0xc6301d30) at
sdk/emulator/opengl/shared/OpenglOsUtils/osThreadUnix.cpp:83
#21 0xf7f9811f in start_thread () from /lib32/libpthread.so.0
#22 0xf7d6079e in clone () from /lib32/libc.so.6

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444767442.6BF80.7417
Date: Tue, 13 Oct 2015 20:17:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:gabriele.svelto&#64;gmail.com" title="Gabriele Svelto &lt;gabriele.svelto&#64;gmail.com&gt;"> <span class="fn">Gabriele Svelto</span></a>
</span></b>
        <pre>I can still reproduce on mesa 11.0.3 / libdrm 2.4.65 though it takes longer to
trigger the bug (a few minutes of usage). This is the backtrace when using
these versions of mesa and libdrm, it's somewhat different than the previous
one but the bottom frames look the same:

#0  0xf67fc403 in pushbuf_kref () from /usr/lib32/libdrm_nouveau.so.2
#1  0xf67fcc7f in pushbuf_validate () from /usr/lib32/libdrm_nouveau.so.2
#2  0xf6c80f9b in nv50_flush () from /usr/lib32/dri/nouveau_dri.so
#3  0xf69c93a4 in st_flush () from /usr/lib32/dri/nouveau_dri.so
#4  0xf69c93f4 in st_glFlush () from /usr/lib32/dri/nouveau_dri.so
#5  0xf6879b76 in _mesa_flush () from /usr/lib32/dri/nouveau_dri.so
#6  0xf6879f19 in _mesa_make_current () from /usr/lib32/dri/nouveau_dri.so
#7  0xf69fab96 in st_api_make_current () from /usr/lib32/dri/nouveau_dri.so
#8  0xf6ac28f6 in dri_unbind_context () from /usr/lib32/dri/nouveau_dri.so
#9  0xf6ac2337 in driUnbindContext () from /usr/lib32/dri/nouveau_dri.so
#10 0xf73ff3b6 in dri2_unbind_context () from /usr/lib32/libGL.so.1
#11 0xf73d89fb in glXMakeCurrentReadSGI () from /usr/lib32/libGL.so.1
#12 0xf747a89c in EglOS::makeCurrent (dpy=0x8c13608, read=0x0, draw=0x0,
ctx=0x0) at sdk/emulator/opengl/host/libs/Translator/EGL/EglX11Api.cpp:263
#13 0xf747eb11 in eglMakeCurrent (display=0x8c20e50, draw=0x0, read=0x0,
context=0x0) at sdk/emulator/opengl/host/libs/Translator/EGL/EglImp.cpp:684
#14 0xf74b0787 in FrameBuffer::unbind_locked (this=0x8c20d68) at
sdk/emulator/opengl/host/libs/libOpenglRender/FrameBuffer.cpp:790
#15 0xf74ad7f6 in ColorBuffer::create (p_width=320, p_height=266,
p_internalFormat=6408) at
sdk/emulator/opengl/host/libs/libOpenglRender/ColorBuffer.cpp:108
#16 0xf74b181f in FrameBuffer::createColorBuffer (this=0x8c20d68, p_width=320,
p_height=266, p_internalFormat=6408)
    at sdk/emulator/opengl/host/libs/libOpenglRender/FrameBuffer.cpp:489
#17 0xf74b7c2d in rcCreateColorBuffer (width=320, height=266,
internalFormat=6408) at
sdk/emulator/opengl/host/libs/libOpenglRender/RenderControl.cpp:215
#18 0xf74b9754 in renderControl_decoder_context_t::decode (this=0xc6301d5c,
buf=0xacee6008, len=20, stream=0xc6300990)
    at
out/host/linux-x86/obj/STATIC_LIBRARIES/lib_renderControl_dec_intermediates/renderControl_dec.cpp:245
#19 0xf74b8655 in RenderThread::Main (this=0xc6301d30) at
sdk/emulator/opengl/host/libs/libOpenglRender/RenderThread.cpp:138
#20 0xf74cfc3d in osUtils::Thread::thread_main (p_arg=0xc6301d30) at
sdk/emulator/opengl/shared/OpenglOsUtils/osThreadUnix.cpp:83
#21 0xf7f9811f in start_thread () from /lib32/libpthread.so.0
#22 0xf7d6079e in clone () from /lib32/libc.so.6</pre>
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

--1444767442.6BF80.7417--

--===============1835733031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1835733031==--
