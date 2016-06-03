From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96355] Performance: extra&costly SSBO validation
 even when SSBO aren't used
Date: Fri, 03 Jun 2016 15:15:23 +0000
Message-ID: <bug-96355-8800-2Oncl9DPhr@http.bugs.freedesktop.org/>
References: <bug-96355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0265190966=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96355-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0265190966==
Content-Type: multipart/alternative; boundary="14649669220.C6DA6f.25048";
 charset="UTF-8"


--14649669220.C6DA6f.25048
Date: Fri, 3 Jun 2016 15:15:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96355

--- Comment #3 from gregory.hainaut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi Samuel,

> Thanks for profiling Nouveau with perf, that's very nice. :-)

Well it is nice that I can do profiling :)

> Well, if your application doesn't use SSBO's, nvc0_validate_buffers()=20
> should not be called yeah. But this might happen when we switch between
>  different contexts. Anyway, improving the validation path is on our todo=
list. :)

Yes, I'm sure. I don't know how to use SSBO.

> I wonder why it's called if you are sure that your application doesn't use
> any SSBO's...

src/mesa/state_tracker/st_atom_storagebuf.c
st_bind_*_ssbos struct contains the ST_NEW_*_PROGRAM flags.

So every time, you call glUseProgram (or the 4.1 pipeline equivalent), flags
will be asserted and a validation will be triggered. It is the same for the
image in st_bind_*_images struct in st_atom_image.c. It is nice for the
performance.

> Can you extract some shaders from your application to make sure no SSBO's=
=20
> are used? You can use NV50_PROG_DEBUG=3D1 for example (this will dump the=
 TGSI code).

All my shader could be found in glsl format (bit a mess of ifdef but no SSBO
;))
https://github.com/PCSX2/pcsx2/tree/master/plugins/GSdx/res/glsl

Here an example (I'm not sure if it is the TGSI format).

FRAG
DCL IN[0], GENERIC[0], PERSPECTIVE
DCL IN[1], GENERIC[3], PERSPECTIVE
DCL OUT[0], COLOR
DCL OUT[1], COLOR[1]
DCL SAMP[0]
DCL SAMP[1]
DCL SVIEW[0], 2D, FLOAT
DCL SVIEW[1], 2D, FLOAT
DCL CONST[1][0]
DCL CONST[2][0..1]
DCL CONST[3][0..1]
DCL CONST[4][0]
DCL CONST[5][0..1]
DCL CONST[6][0..7]
DCL CONST[7][0]
DCL TEMP[0..1], LOCAL
IMM[0] FLT32 {    0.0000,   255.0000,     0.0500,     0.0078}
IMM[1] FLT32 {    0.0039,     0.0000,     0.0000,     0.0000}
  0: MOV TEMP[0].xy, IN[1].xyyy
  1: TEX TEMP[0].w, TEMP[0], SAMP[0], 2D
  2: MOV TEMP[1].y, IMM[0].xxxx
  3: MOV TEMP[1].x, TEMP[0].wwww
  4: TRUNC TEMP[0], IN[0]
  5: MOV TEMP[1].xy, TEMP[1].xyyy
  6: TEX TEMP[1], TEMP[1], SAMP[1], 2D
  7: MAD TEMP[1], TEMP[1], IMM[0].yyyy, IMM[0].zzzz
  8: TRUNC TEMP[1], TEMP[1]
  9: MUL TEMP[0], TEMP[0], TEMP[1]
 10: MUL TEMP[0], TEMP[0], IMM[0].wwww
 11: TRUNC TEMP[0], TEMP[0]
 12: MIN TEMP[0], TEMP[0], IMM[0].yyyy
 13: MUL TEMP[1], TEMP[0], IMM[1].xxxx
 14: MUL TEMP[0].x, TEMP[0].wwww, IMM[0].wwww
 15: MOV OUT[0], TEMP[1]
 16: MOV OUT[1], TEMP[0].xxxx
 17: END

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14649669220.C6DA6f.25048
Date: Fri, 3 Jun 2016 15:15:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355">bug 96355<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gregory.hainaut&#64;gmail.com" title=3D"gregory.hainaut&#64;gmail.com">greg=
ory.hainaut&#64;gmail.com</a>
</span></b>
        <pre>Hi Samuel,

<span class=3D"quote">&gt; Thanks for profiling Nouveau with perf, that's v=
ery nice. :-)</span >

Well it is nice that I can do profiling :)

<span class=3D"quote">&gt; Well, if your application doesn't use SSBO's, nv=
c0_validate_buffers()=20
&gt; should not be called yeah. But this might happen when we switch between
&gt;  different contexts. Anyway, improving the validation path is on our t=
odolist. :)</span >

Yes, I'm sure. I don't know how to use SSBO.

<span class=3D"quote">&gt; I wonder why it's called if you are sure that yo=
ur application doesn't use
&gt; any SSBO's...</span >

src/mesa/state_tracker/st_atom_storagebuf.c
st_bind_*_ssbos struct contains the ST_NEW_*_PROGRAM flags.

So every time, you call glUseProgram (or the 4.1 pipeline equivalent), flags
will be asserted and a validation will be triggered. It is the same for the
image in st_bind_*_images struct in st_atom_image.c. It is nice for the
performance.

<span class=3D"quote">&gt; Can you extract some shaders from your applicati=
on to make sure no SSBO's=20
&gt; are used? You can use NV50_PROG_DEBUG=3D1 for example (this will dump =
the TGSI code).</span >

All my shader could be found in glsl format (bit a mess of ifdef but no SSBO
;))
<a href=3D"https://github.com/PCSX2/pcsx2/tree/master/plugins/GSdx/res/glsl=
">https://github.com/PCSX2/pcsx2/tree/master/plugins/GSdx/res/glsl</a>

Here an example (I'm not sure if it is the TGSI format).

FRAG
DCL IN[0], GENERIC[0], PERSPECTIVE
DCL IN[1], GENERIC[3], PERSPECTIVE
DCL OUT[0], COLOR
DCL OUT[1], COLOR[1]
DCL SAMP[0]
DCL SAMP[1]
DCL SVIEW[0], 2D, FLOAT
DCL SVIEW[1], 2D, FLOAT
DCL CONST[1][0]
DCL CONST[2][0..1]
DCL CONST[3][0..1]
DCL CONST[4][0]
DCL CONST[5][0..1]
DCL CONST[6][0..7]
DCL CONST[7][0]
DCL TEMP[0..1], LOCAL
IMM[0] FLT32 {    0.0000,   255.0000,     0.0500,     0.0078}
IMM[1] FLT32 {    0.0039,     0.0000,     0.0000,     0.0000}
  0: MOV TEMP[0].xy, IN[1].xyyy
  1: TEX TEMP[0].w, TEMP[0], SAMP[0], 2D
  2: MOV TEMP[1].y, IMM[0].xxxx
  3: MOV TEMP[1].x, TEMP[0].wwww
  4: TRUNC TEMP[0], IN[0]
  5: MOV TEMP[1].xy, TEMP[1].xyyy
  6: TEX TEMP[1], TEMP[1], SAMP[1], 2D
  7: MAD TEMP[1], TEMP[1], IMM[0].yyyy, IMM[0].zzzz
  8: TRUNC TEMP[1], TEMP[1]
  9: MUL TEMP[0], TEMP[0], TEMP[1]
 10: MUL TEMP[0], TEMP[0], IMM[0].wwww
 11: TRUNC TEMP[0], TEMP[0]
 12: MIN TEMP[0], TEMP[0], IMM[0].yyyy
 13: MUL TEMP[1], TEMP[0], IMM[1].xxxx
 14: MUL TEMP[0].x, TEMP[0].wwww, IMM[0].wwww
 15: MOV OUT[0], TEMP[1]
 16: MOV OUT[1], TEMP[0].xxxx
 17: END</pre>
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

--14649669220.C6DA6f.25048--

--===============0265190966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0265190966==--
