From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sat, 31 Oct 2015 14:15:59 +0000
Message-ID: <bug-92438-8800-tUkFPw0aoT@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0762726053=="
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


--===============0762726053==
Content-Type: multipart/alternative; boundary="1446300959.365021.30607"; charset="UTF-8"


--1446300959.365021.30607
Date: Sat, 31 Oct 2015 14:15:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #20 from Jim Blandy <jimb-bqtBzms/kfRWk0Htik3J/w@public.gmane.org> ---
I'm able to reproduce a crash with a very similar stack on Fedora 22, using the
glium Rust OpenGL bindings: https://github.com/tomaka/glium

Here's the stack trace I get:

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff02f66fc in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
Missing separate debuginfos, use: dnf debuginfo-install
bzip2-libs-1.0.6-14.fc22.x86_64 elfutils-libelf-0.163-4.fc22.x86_64
elfutils-libs-0.163-4.fc22.x86_64 expat-2.1.0-10.fc22.x86_64
libattr-2.4.47-10.fc22.x86_64 libcap-2.24-7.fc22.x86_64
libdrm-2.4.61-3.fc22.x86_64 libedit-3.1-12.20150325cvs.fc22.x86_64
libffi-3.1-7.fc22.x86_64 libgcc-5.1.1-4.fc22.x86_64
libpciaccess-0.13.3-0.3.fc22.x86_64 libselinux-2.3-10.fc22.x86_64
libstdc++-5.1.1-4.fc22.x86_64 libwayland-client-1.7.0-1.fc22.x86_64
libwayland-server-1.7.0-1.fc22.x86_64 libX11-1.6.3-1.fc22.x86_64
libX11-devel-1.6.3-1.fc22.x86_64 libXau-1.0.8-4.fc22.x86_64
libxcb-1.11-8.fc22.x86_64 libXcursor-devel-1.1.14-4.fc22.x86_64
libXdamage-1.1.4-6.fc22.x86_64 libXext-1.3.3-2.fc22.x86_64
libXfixes-5.0.1-4.fc22.x86_64 libXi-devel-1.7.4-2.fc22.x86_64
libXrender-0.9.9-1.fc22.x86_64 libxshmfence-1.2-1.fc22.x86_64
libXxf86vm-devel-1.1.4-1.fc22.x86_64 llvm-libs-3.5.0-9.fc22.x86_64
mesa-dri-drivers-10.6.9-1.20151008.fc22.x86_64
mesa-libEGL-10.6.9-1.20151008.fc22.x86_64
mesa-libgbm-10.6.9-1.20151008.fc22.x86_64
mesa-libGL-10.6.9-1.20151008.fc22.x86_64
mesa-libglapi-10.6.9-1.20151008.fc22.x86_64
ncurses-libs-5.9-18.20150214.fc22.x86_64 pcre-8.37-5.fc22.x86_64
systemd-libs-219-25.fc22.x86_64 xz-libs-5.2.0-2.fc22.x86_64
zlib-1.2.8-7.fc22.x86_64
(gdb) where
#0  0x00007ffff02f66fc in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
#1  0x00007ffff02f6db9 in pushbuf_validate () from /lib64/libdrm_nouveau.so.2
#2  0x00007ffff0c28ecd in nvc0_state_validate () from
/usr/lib64/dri/nouveau_dri.so
#3  0x00007ffff0c33670 in nvc0_draw_vbo () from /usr/lib64/dri/nouveau_dri.so
#4  0x00007ffff08ec867 in st_draw_vbo () from /usr/lib64/dri/nouveau_dri.so
#5  0x00007ffff08be81c in vbo_draw_arrays () from /usr/lib64/dri/nouveau_dri.so
#6  0x00005555555b21b7 in tutorial_02::gl::Gl::DrawArrays (self=0x7ffff6868010,
mode=4, first=0, count=3) at
target/debug/build/glium-e8f4c0a69cec8d2d/out/gl_bindings.rs:11032
#7  0x00005555555acee9 in
tutorial_02::ops::draw::draw<glium::uniforms::uniforms::EmptyUniforms,&glium::vertex::buffer::VertexBuffer<tutorial_02::main::Vertex>>
(context=0x7ffff6868010, framebuffer=..., vertex_buffers=0x7fffffffd548,
indices=..., program=0x7fffffffd038, uniforms=0x5555557fc297 <const16333>,
draw_parameters=0x7fffffffccb0, dimensions=...) at src/ops/draw.rs:320
#8  0x00005555555aa751 in
tutorial_02::Frame.Surface::draw<&glium::vertex::buffer::VertexBuffer<tutorial_02::main::Vertex>,&glium::index::NoIndices,glium::uniforms::uniforms::EmptyUniforms>
(self=0x7fffffffce48, vertex_buffer=0x7fffffffd548,
index_buffer=0x7fffffffd210, program=0x7fffffffd038, uniforms=0x5555557fc297
<const16333>, draw_parameters=0x7fffffffccb0) at src/lib.rs:1083
#9  0x0000555555576f84 in tutorial_02::main () at examples/tutorial-02.rs:48
#10 0x00005555557ccf85 in
sys_common::unwind::try::try_fn::h13449604025847140769 ()
#11 0x00005555557ca969 in __rust_try ()
#12 0x00005555557ccc20 in rt::lang_start::h426b3aba4736785fsbx ()
#13 0x00005555555b31da in main ()
(gdb)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446300959.365021.30607
Date: Sat, 31 Oct 2015 14:15:59 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:jimb&#64;red-bean.com" title="Jim Blandy &lt;jimb&#64;red-bean.com&gt;"> <span class="fn">Jim Blandy</span></a>
</span></b>
        <pre>I'm able to reproduce a crash with a very similar stack on Fedora 22, using the
glium Rust OpenGL bindings: <a href="https://github.com/tomaka/glium">https://github.com/tomaka/glium</a>

Here's the stack trace I get:

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff02f66fc in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
Missing separate debuginfos, use: dnf debuginfo-install
bzip2-libs-1.0.6-14.fc22.x86_64 elfutils-libelf-0.163-4.fc22.x86_64
elfutils-libs-0.163-4.fc22.x86_64 expat-2.1.0-10.fc22.x86_64
libattr-2.4.47-10.fc22.x86_64 libcap-2.24-7.fc22.x86_64
libdrm-2.4.61-3.fc22.x86_64 libedit-3.1-12.20150325cvs.fc22.x86_64
libffi-3.1-7.fc22.x86_64 libgcc-5.1.1-4.fc22.x86_64
libpciaccess-0.13.3-0.3.fc22.x86_64 libselinux-2.3-10.fc22.x86_64
libstdc++-5.1.1-4.fc22.x86_64 libwayland-client-1.7.0-1.fc22.x86_64
libwayland-server-1.7.0-1.fc22.x86_64 libX11-1.6.3-1.fc22.x86_64
libX11-devel-1.6.3-1.fc22.x86_64 libXau-1.0.8-4.fc22.x86_64
libxcb-1.11-8.fc22.x86_64 libXcursor-devel-1.1.14-4.fc22.x86_64
libXdamage-1.1.4-6.fc22.x86_64 libXext-1.3.3-2.fc22.x86_64
libXfixes-5.0.1-4.fc22.x86_64 libXi-devel-1.7.4-2.fc22.x86_64
libXrender-0.9.9-1.fc22.x86_64 libxshmfence-1.2-1.fc22.x86_64
libXxf86vm-devel-1.1.4-1.fc22.x86_64 llvm-libs-3.5.0-9.fc22.x86_64
mesa-dri-drivers-10.6.9-1.20151008.fc22.x86_64
mesa-libEGL-10.6.9-1.20151008.fc22.x86_64
mesa-libgbm-10.6.9-1.20151008.fc22.x86_64
mesa-libGL-10.6.9-1.20151008.fc22.x86_64
mesa-libglapi-10.6.9-1.20151008.fc22.x86_64
ncurses-libs-5.9-18.20150214.fc22.x86_64 pcre-8.37-5.fc22.x86_64
systemd-libs-219-25.fc22.x86_64 xz-libs-5.2.0-2.fc22.x86_64
zlib-1.2.8-7.fc22.x86_64
(gdb) where
#0  0x00007ffff02f66fc in pushbuf_kref () from /lib64/libdrm_nouveau.so.2
#1  0x00007ffff02f6db9 in pushbuf_validate () from /lib64/libdrm_nouveau.so.2
#2  0x00007ffff0c28ecd in nvc0_state_validate () from
/usr/lib64/dri/nouveau_dri.so
#3  0x00007ffff0c33670 in nvc0_draw_vbo () from /usr/lib64/dri/nouveau_dri.so
#4  0x00007ffff08ec867 in st_draw_vbo () from /usr/lib64/dri/nouveau_dri.so
#5  0x00007ffff08be81c in vbo_draw_arrays () from /usr/lib64/dri/nouveau_dri.so
#6  0x00005555555b21b7 in tutorial_02::gl::Gl::DrawArrays (self=0x7ffff6868010,
mode=4, first=0, count=3) at
target/debug/build/glium-e8f4c0a69cec8d2d/out/gl_bindings.rs:11032
#7  0x00005555555acee9 in
tutorial_02::ops::draw::draw&lt;glium::uniforms::uniforms::EmptyUniforms,&amp;glium::vertex::buffer::VertexBuffer&lt;tutorial_02::main::Vertex&gt;&gt;
(context=0x7ffff6868010, framebuffer=..., vertex_buffers=0x7fffffffd548,
indices=..., program=0x7fffffffd038, uniforms=0x5555557fc297 &lt;const16333&gt;,
draw_parameters=0x7fffffffccb0, dimensions=...) at src/ops/draw.rs:320
#8  0x00005555555aa751 in
tutorial_02::Frame.Surface::draw&lt;&amp;glium::vertex::buffer::VertexBuffer&lt;tutorial_02::main::Vertex&gt;,&amp;glium::index::NoIndices,glium::uniforms::uniforms::EmptyUniforms&gt;
(self=0x7fffffffce48, vertex_buffer=0x7fffffffd548,
index_buffer=0x7fffffffd210, program=0x7fffffffd038, uniforms=0x5555557fc297
&lt;const16333&gt;, draw_parameters=0x7fffffffccb0) at src/lib.rs:1083
#9  0x0000555555576f84 in tutorial_02::main () at examples/tutorial-02.rs:48
#10 0x00005555557ccf85 in
sys_common::unwind::try::try_fn::h13449604025847140769 ()
#11 0x00005555557ca969 in __rust_try ()
#12 0x00005555557ccc20 in rt::lang_start::h426b3aba4736785fsbx ()
#13 0x00005555555b31da in main ()
(gdb)</pre>
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

--1446300959.365021.30607--

--===============0762726053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0762726053==--
