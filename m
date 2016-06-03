From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96355] New: Performance: extra&costly SSBO
 validation even when SSBO aren't used
Date: Fri, 03 Jun 2016 07:53:01 +0000
Message-ID: <bug-96355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1902649715=="
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


--===============1902649715==
Content-Type: multipart/alternative; boundary="14649403820.dBE7c.7797";
 charset="UTF-8"


--14649403820.dBE7c.7797
Date: Fri, 3 Jun 2016 07:53:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96355

            Bug ID: 96355
           Summary: Performance: extra&costly SSBO validation even when
                    SSBO aren't used
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gregory.hainaut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hello,

I'm currently trying to profile my application (PCSX2) with Mesa. I don't k=
now
if my GPU (GTX760) is properly reclocked but my app is often CPU limited. It
could just be the IO operation that are very slow.

Anyway, Perf-Event shows that nvc0_validate_buffers is (too) often called.
+    8.78%     7.98%  pcsx2_GSReplayL  nouveau_dri.so  nvc0_validate_buffers

My understanding of the code is that every time we switch a shader program,=
 a
full SSBO bind/validation is called. nvc0_set_shader_buffers will dirty buf=
fer
state (NVC0_NEW_3D_BUFFERS). The trick is that my application doesn't use S=
SBO
(only UBO). Is it expected to call SSBO validation code when the shader pro=
gram
doesn't use them? If not, a validation shortcut will be nice.

If it can help, here the backtrace from nvc0_set_shader_buffers=20

#0  nvc0_set_shader_buffers (pipe=3D0x87c51e0, shader=3D0, start=3D16, nr=
=3D16,
buffers=3D0x0) at nvc0/nvc0_state.c:1331
#1  0xf464acc4 in st_bind_ssbos (shader=3D0x8b106bc, shader_type=3D0, st=3D=
0x877ca38,
st=3D0x877ca38) at state_tracker/st_atom_storagebuf.c:86
#2  0xf464ad0d in bind_vs_ssbos (st=3D0x877ca38) at
state_tracker/st_atom_storagebuf.c:101
#3  0xf4647411 in st_validate_state (st=3D0x877ca38, pipeline=3DST_PIPELINE=
_RENDER)
at state_tracker/st_atom.c:289
#4  0xf46638ef in st_draw_vbo (ctx=3D0x8801f60, prims=3D0xffffa990, nr_prim=
s=3D1,
ib=3D0xffffa980, index_bounds_valid=3D0 '\000', min_index=3D4294967295,
max_index=3D4294967295, tfb_vertcount=3D0x0,=20
    stream=3D0, indirect=3D0x0) at state_tracker/st_draw.c:176
#5  0xf46270f9 in vbo_validated_drawrangeelements (ctx=3Dctx@entry=3D0x8801=
f60,
mode=3Dmode@entry=3D4, index_bounds_valid=3D0 '\000', start=3D4294967295,
end=3D4294967295, count=3D6, type=3D5125,=20
    indices=3D0x25258, basevertex=3D19047, numInstances=3D1, baseInstance=
=3D0) at
vbo/vbo_exec_array.c:849
#6  0xf46274bc in vbo_exec_DrawElementsBaseVertex (mode=3D4, count=3D6, typ=
e=3D5125,
indices=3D0x25258, basevertex=3D19047) at vbo/vbo_exec_array.c:1007
#7  0xf6ddf422 in shared_dispatch_stub_702 (mode=3D4, count=3D6, type=3D512=
5,
indices=3D0x25258, basevertex=3D19047) at shared-glapi/glapi_mapi_tmp.h:212=
35
#8  0xf6362e0a in Draw (this=3D<optimized out>, this=3D<optimized out>,
basevertex=3D<optimized out>, mode=3D<optimized out>)

Feel free to ask trace/debug info.

Best regards

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14649403820.dBE7c.7797
Date: Fri, 3 Jun 2016 07:53:02 +0000
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
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355">96355</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Performance: extra&amp;costly SSBO validation even when SSBO =
aren't used
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
          <td>gregory.hainaut&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,

I'm currently trying to profile my application (PCSX2) with Mesa. I don't k=
now
if my GPU (GTX760) is properly reclocked but my app is often CPU limited. It
could just be the IO operation that are very slow.

Anyway, Perf-Event shows that nvc0_validate_buffers is (too) often called.
+    8.78%     7.98%  pcsx2_GSReplayL  nouveau_dri.so  nvc0_validate_buffers

My understanding of the code is that every time we switch a shader program,=
 a
full SSBO bind/validation is called. nvc0_set_shader_buffers will dirty buf=
fer
state (NVC0_NEW_3D_BUFFERS). The trick is that my application doesn't use S=
SBO
(only UBO). Is it expected to call SSBO validation code when the shader pro=
gram
doesn't use them? If not, a validation shortcut will be nice.

If it can help, here the backtrace from nvc0_set_shader_buffers=20

#0  nvc0_set_shader_buffers (pipe=3D0x87c51e0, shader=3D0, start=3D16, nr=
=3D16,
buffers=3D0x0) at nvc0/nvc0_state.c:1331
#1  0xf464acc4 in st_bind_ssbos (shader=3D0x8b106bc, shader_type=3D0, st=3D=
0x877ca38,
st=3D0x877ca38) at state_tracker/st_atom_storagebuf.c:86
#2  0xf464ad0d in bind_vs_ssbos (st=3D0x877ca38) at
state_tracker/st_atom_storagebuf.c:101
#3  0xf4647411 in st_validate_state (st=3D0x877ca38, pipeline=3DST_PIPELINE=
_RENDER)
at state_tracker/st_atom.c:289
#4  0xf46638ef in st_draw_vbo (ctx=3D0x8801f60, prims=3D0xffffa990, nr_prim=
s=3D1,
ib=3D0xffffa980, index_bounds_valid=3D0 '\000', min_index=3D4294967295,
max_index=3D4294967295, tfb_vertcount=3D0x0,=20
    stream=3D0, indirect=3D0x0) at state_tracker/st_draw.c:176
#5  0xf46270f9 in vbo_validated_drawrangeelements (ctx=3Dctx&#64;entry=3D0x=
8801f60,
mode=3Dmode&#64;entry=3D4, index_bounds_valid=3D0 '\000', start=3D429496729=
5,
end=3D4294967295, count=3D6, type=3D5125,=20
    indices=3D0x25258, basevertex=3D19047, numInstances=3D1, baseInstance=
=3D0) at
vbo/vbo_exec_array.c:849
#6  0xf46274bc in vbo_exec_DrawElementsBaseVertex (mode=3D4, count=3D6, typ=
e=3D5125,
indices=3D0x25258, basevertex=3D19047) at vbo/vbo_exec_array.c:1007
#7  0xf6ddf422 in shared_dispatch_stub_702 (mode=3D4, count=3D6, type=3D512=
5,
indices=3D0x25258, basevertex=3D19047) at shared-glapi/glapi_mapi_tmp.h:212=
35
#8  0xf6362e0a in Draw (this=3D&lt;optimized out&gt;, this=3D&lt;optimized =
out&gt;,
basevertex=3D&lt;optimized out&gt;, mode=3D&lt;optimized out&gt;)

Feel free to ask trace/debug info.

Best regards</pre>
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

--14649403820.dBE7c.7797--

--===============1902649715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1902649715==--
