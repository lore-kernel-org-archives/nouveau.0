From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Sat, 31 Oct 2015 15:37:19 +0000
Message-ID: <bug-92438-8800-FfQ61bItFo@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0235085146=="
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


--===============0235085146==
Content-Type: multipart/alternative; boundary="1446305839.13D3f8d1.23355"; charset="UTF-8"


--1446305839.13D3f8d1.23355
Date: Sat, 31 Oct 2015 15:37:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #21 from Jim Blandy <jimb-bqtBzms/kfRWk0Htik3J/w@public.gmane.org> ---
I have no idea what this code is supposed to be doing, but here's what I can
infer:

The call to pushbuf_kref crashes because the `struct nouveau_bo *bo` argument
is NULL, and cli_push_get tries to use it. The caller of pushbuf_kref,
pushbuf_validate, is iterating over a list of brefs; the current bref's bo
field is NULL.

This bref was created by nouveau_bufctx_refn, which was passed a NULL `bo`
argument. Its caller is nvc0_add_resident, which was passed a `struct
nv04_resource *` whose `bo` field is NULL.

This nv04_resource was created by a call to nouveau_buffer_create in which
buffer->domain is never set to anything other than 0. Looking at
nouveau_buffer_allocate, it seems like a domain of zero is a legitimate value;
the last branch of the if-else chain asserts that this is the case. Since that
path doesn't set buf->bo, it seems it's legitimate for buf->bo to be NULL.

pushbuf_kref seems adamant that bo should be non-NULL; both cli_push_get and
cli_kref_get require it. At this point I'm lost: should nouveau_bufctx_refn
never be passed a NULL bo? Should such a bufref never make it onto the list
that pushbuf_validate sees? I'm not sure.

Here's the stack trace at the call to nouveau_bufctx_refn:

#0  nouveau_bufctx_refn (bctx=0x555555b3eea0, bin=bin@entry=1, bo=0x0,
flags=256) at bufctx.c:126
#1  0x00007ffff0c33154 in nvc0_add_resident (flags=256, res=0x555555bf4800,
bin=1, bufctx=<optimized out>) at nvc0/nvc0_winsys.h:29
#2  nvc0_validate_vertex_buffers_shared (nvc0=0x555555b3cf30) at
nvc0/nvc0_vbo.c:407
#3  nvc0_vertex_arrays_validate (nvc0=0x555555b3cf30) at nvc0/nvc0_vbo.c:504
#4  0x00007ffff0c28e8e in nvc0_state_validate (nvc0=nvc0@entry=0x555555b3cf30,
mask=mask@entry=4294967295, words=words@entry=8) at
nvc0/nvc0_state_validate.c:651
#5  0x00007ffff0c33670 in nvc0_draw_vbo (pipe=0x555555b3cf30,
info=0x7fffffffb9f0) at nvc0/nvc0_vbo.c:893
#6  0x00007ffff08ec867 in st_draw_vbo (ctx=<optimized out>,
prims=0x7fffffffbab0, nr_prims=1, ib=0x0, index_bounds_valid=<optimized out>,
min_index=0, max_index=2, tfb_vertcount=0x0, indirect=0x0) at
state_tracker/st_draw.c:286
#7  0x00007ffff08be81c in vbo_draw_arrays (ctx=0x7ffff7f22010, mode=4, start=0,
count=3, numInstances=1, baseInstance=0) at vbo/vbo_exec_array.c:645
#8  0x00005555555b21b7 in tutorial_02::gl::Gl::DrawArrays (self=0x7ffff6868010,
mode=4, first=0, count=3) at
target/debug/build/glium-e8f4c0a69cec8d2d/out/gl_bindings.rs:11032
#9  0x00005555555acee9 in
tutorial_02::ops::draw::draw<glium::uniforms::uniforms::EmptyUniforms,&glium::vertex::buffer::VertexBuffer<tutorial_02::main::Vertex>>
(context=0x7ffff6868010, framebuffer=..., vertex_buffers=0x7fffffffdc08,
indices=..., program=0x7fffffffd6f8, uniforms=0x5555557fc297 <const16333>,
draw_parameters=0x7fffffffd370, dimensions=...) at src/ops/draw.rs:320
#10 0x00005555555aa751 in
tutorial_02::Frame.Surface::draw<&glium::vertex::buffer::VertexBuffer<tutorial_02::main::Vertex>,&glium::index::NoIndices,glium::uniforms::uniforms::EmptyUniforms>
(self=0x7fffffffd508, vertex_buffer=0x7fffffffdc08,
index_buffer=0x7fffffffd8d0, program=0x7fffffffd6f8, uniforms=0x5555557fc297
<const16333>, draw_parameters=0x7fffffffd370) at src/lib.rs:1083
#11 0x0000555555576f84 in tutorial_02::main () at examples/tutorial-02.rs:48
#12 0x00005555557ccf85 in
sys_common::unwind::try::try_fn::h13449604025847140769 ()
#13 0x00005555557ca969 in __rust_try ()
#14 0x00005555557ccc20 in rt::lang_start::h426b3aba4736785fsbx ()
#15 0x00005555555b31da in main ()
(gdb)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1446305839.13D3f8d1.23355
Date: Sat, 31 Oct 2015 15:37:19 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:jimb&#64;red-bean.com" title="Jim Blandy &lt;jimb&#64;red-bean.com&gt;"> <span class="fn">Jim Blandy</span></a>
</span></b>
        <pre>I have no idea what this code is supposed to be doing, but here's what I can
infer:

The call to pushbuf_kref crashes because the `struct nouveau_bo *bo` argument
is NULL, and cli_push_get tries to use it. The caller of pushbuf_kref,
pushbuf_validate, is iterating over a list of brefs; the current bref's bo
field is NULL.

This bref was created by nouveau_bufctx_refn, which was passed a NULL `bo`
argument. Its caller is nvc0_add_resident, which was passed a `struct
nv04_resource *` whose `bo` field is NULL.

This nv04_resource was created by a call to nouveau_buffer_create in which
buffer-&gt;domain is never set to anything other than 0. Looking at
nouveau_buffer_allocate, it seems like a domain of zero is a legitimate value;
the last branch of the if-else chain asserts that this is the case. Since that
path doesn't set buf-&gt;bo, it seems it's legitimate for buf-&gt;bo to be NULL.

pushbuf_kref seems adamant that bo should be non-NULL; both cli_push_get and
cli_kref_get require it. At this point I'm lost: should nouveau_bufctx_refn
never be passed a NULL bo? Should such a bufref never make it onto the list
that pushbuf_validate sees? I'm not sure.

Here's the stack trace at the call to nouveau_bufctx_refn:

#0  nouveau_bufctx_refn (bctx=0x555555b3eea0, bin=bin&#64;entry=1, bo=0x0,
flags=256) at bufctx.c:126
#1  0x00007ffff0c33154 in nvc0_add_resident (flags=256, res=0x555555bf4800,
bin=1, bufctx=&lt;optimized out&gt;) at nvc0/nvc0_winsys.h:29
#2  nvc0_validate_vertex_buffers_shared (nvc0=0x555555b3cf30) at
nvc0/nvc0_vbo.c:407
#3  nvc0_vertex_arrays_validate (nvc0=0x555555b3cf30) at nvc0/nvc0_vbo.c:504
#4  0x00007ffff0c28e8e in nvc0_state_validate (nvc0=nvc0&#64;entry=0x555555b3cf30,
mask=mask&#64;entry=4294967295, words=words&#64;entry=8) at
nvc0/nvc0_state_validate.c:651
#5  0x00007ffff0c33670 in nvc0_draw_vbo (pipe=0x555555b3cf30,
info=0x7fffffffb9f0) at nvc0/nvc0_vbo.c:893
#6  0x00007ffff08ec867 in st_draw_vbo (ctx=&lt;optimized out&gt;,
prims=0x7fffffffbab0, nr_prims=1, ib=0x0, index_bounds_valid=&lt;optimized out&gt;,
min_index=0, max_index=2, tfb_vertcount=0x0, indirect=0x0) at
state_tracker/st_draw.c:286
#7  0x00007ffff08be81c in vbo_draw_arrays (ctx=0x7ffff7f22010, mode=4, start=0,
count=3, numInstances=1, baseInstance=0) at vbo/vbo_exec_array.c:645
#8  0x00005555555b21b7 in tutorial_02::gl::Gl::DrawArrays (self=0x7ffff6868010,
mode=4, first=0, count=3) at
target/debug/build/glium-e8f4c0a69cec8d2d/out/gl_bindings.rs:11032
#9  0x00005555555acee9 in
tutorial_02::ops::draw::draw&lt;glium::uniforms::uniforms::EmptyUniforms,&amp;glium::vertex::buffer::VertexBuffer&lt;tutorial_02::main::Vertex&gt;&gt;
(context=0x7ffff6868010, framebuffer=..., vertex_buffers=0x7fffffffdc08,
indices=..., program=0x7fffffffd6f8, uniforms=0x5555557fc297 &lt;const16333&gt;,
draw_parameters=0x7fffffffd370, dimensions=...) at src/ops/draw.rs:320
#10 0x00005555555aa751 in
tutorial_02::Frame.Surface::draw&lt;&amp;glium::vertex::buffer::VertexBuffer&lt;tutorial_02::main::Vertex&gt;,&amp;glium::index::NoIndices,glium::uniforms::uniforms::EmptyUniforms&gt;
(self=0x7fffffffd508, vertex_buffer=0x7fffffffdc08,
index_buffer=0x7fffffffd8d0, program=0x7fffffffd6f8, uniforms=0x5555557fc297
&lt;const16333&gt;, draw_parameters=0x7fffffffd370) at src/lib.rs:1083
#11 0x0000555555576f84 in tutorial_02::main () at examples/tutorial-02.rs:48
#12 0x00005555557ccf85 in
sys_common::unwind::try::try_fn::h13449604025847140769 ()
#13 0x00005555557ca969 in __rust_try ()
#14 0x00005555557ccc20 in rt::lang_start::h426b3aba4736785fsbx ()
#15 0x00005555555b31da in main ()
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

--1446305839.13D3f8d1.23355--

--===============0235085146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0235085146==--
