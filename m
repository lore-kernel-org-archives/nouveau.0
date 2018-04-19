From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106132] New: bar.sync encoding incorrect for GM107
Date: Thu, 19 Apr 2018 06:39:11 +0000
Message-ID: <bug-106132-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2139150307=="
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


--===============2139150307==
Content-Type: multipart/alternative; boundary="15241199510.3dFAdC345.31660"
Content-Transfer-Encoding: 7bit


--15241199510.3dFAdC345.31660
Date: Thu, 19 Apr 2018 06:39:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106132

            Bug ID: 106132
           Summary: bar.sync encoding incorrect for GM107
           Product: Mesa
           Version: git
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vriestj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

[ Quoted text copied from
https://lists.freedesktop.org/archives/mesa-dev/2016-March/108926.html ]

I've been playing around with bar.sync in ptx, JIT-compiling it to GM107 (my
quadro m1200 card), and disassembling with cuobjdump -sass.

I looked at nv50_ir_emit_gm107.cpp to understand the instruction encoding.

> [Mesa-dev] [PATCH] gm107/ir: add emission for BAR
> Samuel Pitoiset samuel.pitoiset at gmail.com
> Tue Mar 1 17:44:42 UTC 2016
>
> +   // barrier id
> +   if (insn->src(0).getFile() =3D=3D FILE_GPR) {
> +      emitGPR(0x08, insn->src(0));
> +   } else {
> +      ImmediateValue *imm =3D insn->getSrc(0)->asImm();
> +      assert(imm);
> +      emitField(0x08, 8, imm->reg.data.u32);
> +      emitField(0x2b, 1, 1);
> +   }
> +
> +   // thread count
> +   if (insn->src(1).getFile() =3D=3D FILE_GPR) {
> +      emitGPR(0x14, insn->src(1));
> +   } else {
> +      ImmediateValue *imm =3D insn->getSrc(0)->asImm();

This should probably be using getSrc(1) ?

> +      assert(imm);
> +      emitField(0x14, 12, imm->reg.data.u32);
> +      emitField(0x2c, 1, 1);
> +   }

From these examples:
...
                                x        x
BAR.SYNC 0x0;          /* 0xf0a81b8000070000 */
BAR.SYNC 0xf;          /* 0xf0a81b8000070f00 */
BAR.SYNC R0;           /* 0xf0a80b8000070000 */
BAR.SYNC R2;           /* 0xf0a80b8000070200 */
...
I derive these offsets:
- barrier id           : 0x08
- barrier id imm vs reg: 0x2c

and from these examples:
...
                                 x    x
BAR.SYNC 0x0;          /* 0xf0a81b8000070000 */
BAR.SYNC 0x0, R2;      /* 0xf0a8138000270000 */
...
I derive these offsets:
- thread count           : 0x14
- thread count imm vs reg: 0x2b


But when looking at the code snippet above, the roles seem reversed: 0x2b is
used for barrier id, and 0x2c is used for the thread count.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15241199510.3dFAdC345.31660
Date: Thu, 19 Apr 2018 06:39:11 +0000
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
   title=3D"NEW - bar.sync encoding incorrect for GM107"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106132">106132</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>bar.sync encoding incorrect for GM107
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
          <td>All
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
          <td>vriestj&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>[ Quoted text copied from
<a href=3D"https://lists.freedesktop.org/archives/mesa-dev/2016-March/10892=
6.html">https://lists.freedesktop.org/archives/mesa-dev/2016-March/108926.h=
tml</a> ]

I've been playing around with bar.sync in ptx, JIT-compiling it to GM107 (my
quadro m1200 card), and disassembling with cuobjdump -sass.

I looked at nv50_ir_emit_gm107.cpp to understand the instruction encoding.

<span class=3D"quote">&gt; [Mesa-dev] [PATCH] gm107/ir: add emission for BAR
&gt; Samuel Pitoiset samuel.pitoiset at gmail.com
&gt; Tue Mar 1 17:44:42 UTC 2016</span >
&gt;
<span class=3D"quote">&gt; +   // barrier id
&gt; +   if (insn-&gt;src(0).getFile() =3D=3D FILE_GPR) {
&gt; +      emitGPR(0x08, insn-&gt;src(0));
&gt; +   } else {
&gt; +      ImmediateValue *imm =3D insn-&gt;getSrc(0)-&gt;asImm();
&gt; +      assert(imm);
&gt; +      emitField(0x08, 8, imm-&gt;reg.data.u32);
&gt; +      emitField(0x2b, 1, 1);
&gt; +   }
&gt; +
&gt; +   // thread count
&gt; +   if (insn-&gt;src(1).getFile() =3D=3D FILE_GPR) {
&gt; +      emitGPR(0x14, insn-&gt;src(1));
&gt; +   } else {
&gt; +      ImmediateValue *imm =3D insn-&gt;getSrc(0)-&gt;asImm();</span >

This should probably be using getSrc(1) ?

<span class=3D"quote">&gt; +      assert(imm);
&gt; +      emitField(0x14, 12, imm-&gt;reg.data.u32);
&gt; +      emitField(0x2c, 1, 1);
&gt; +   }</span >

From these examples:
...
                                x        x
BAR.SYNC 0x0;          /* 0xf0a81b8000070000 */
BAR.SYNC 0xf;          /* 0xf0a81b8000070f00 */
BAR.SYNC R0;           /* 0xf0a80b8000070000 */
BAR.SYNC R2;           /* 0xf0a80b8000070200 */
...
I derive these offsets:
- barrier id           : 0x08
- barrier id imm vs reg: 0x2c

and from these examples:
...
                                 x    x
BAR.SYNC 0x0;          /* 0xf0a81b8000070000 */
BAR.SYNC 0x0, R2;      /* 0xf0a8138000270000 */
...
I derive these offsets:
- thread count           : 0x14
- thread count imm vs reg: 0x2b


But when looking at the code snippet above, the roles seem reversed: 0x2b is
used for barrier id, and 0x2c is used for the thread count.</pre>
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

--15241199510.3dFAdC345.31660--

--===============2139150307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2139150307==--
