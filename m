From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108032] nv50_ir_lowering_gm107.cpp:326: undefined
 reference to
 `nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target,
 unsigned int, int, nv50_ir::Value*, bool)'
Date: Sun, 23 Sep 2018 17:22:41 +0000
Message-ID: <bug-108032-8800-lQXLs0qJ28@http.bugs.freedesktop.org/>
References: <bug-108032-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0711842988=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108032-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0711842988==
Content-Type: multipart/alternative; boundary="15377233611.6BbEC8BD.1121"
Content-Transfer-Encoding: 7bit


--15377233611.6BbEC8BD.1121
Date: Sun, 23 Sep 2018 17:22:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108032

Rhys Perry <pendingchaos02+fdobugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Rhys Perry <pendingchaos02+fdobugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Fixed by:

commit 6ca1402c117856b55d044be1e82224db30ed1b02
Author: Rhys Perry <pendingchaos02-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Sun Sep 23 17:57:08 2018 +0100

    nv50/ir: fix link-time build failure

    Seems this fixes linking problems that occur in some situations.

    Signed-off-by: Rhys Perry <pendingchaos02-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15377233611.6BbEC8BD.1121
Date: Sun, 23 Sep 2018 17:22:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pendingch=
aos02+fdobugzilla&#64;gmail.com" title=3D"Rhys Perry &lt;pendingchaos02+fdo=
bugzilla&#64;gmail.com&gt;"> <span class=3D"fn">Rhys Perry</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - nv50_ir_lowering_gm107.cpp:326: undefined refe=
rence to `nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstructio=
n::Target, unsigned int, int, nv50_ir::Value*, bool)'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108032">bug 10803=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - nv50_ir_lowering_gm107.cpp:326: undefined refe=
rence to `nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstructio=
n::Target, unsigned int, int, nv50_ir::Value*, bool)'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108032#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - nv50_ir_lowering_gm107.cpp:326: undefined refe=
rence to `nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstructio=
n::Target, unsigned int, int, nv50_ir::Value*, bool)'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108032">bug 10803=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pendingchaos02+fdobugzilla&#64;gmail.com" title=3D"Rhys Perry &lt;pendingch=
aos02+fdobugzilla&#64;gmail.com&gt;"> <span class=3D"fn">Rhys Perry</span><=
/a>
</span></b>
        <pre>Fixed by:

commit 6ca1402c117856b55d044be1e82224db30ed1b02
Author: Rhys Perry &lt;<a href=3D"mailto:pendingchaos02&#64;gmail.com">pend=
ingchaos02&#64;gmail.com</a>&gt;
Date:   Sun Sep 23 17:57:08 2018 +0100

    nv50/ir: fix link-time build failure

    Seems this fixes linking problems that occur in some situations.

    Signed-off-by: Rhys Perry &lt;<a href=3D"mailto:pendingchaos02&#64;gmai=
l.com">pendingchaos02&#64;gmail.com</a>&gt;
    Reviewed-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu=
">imirkin&#64;alum.mit.edu</a>&gt;</pre>
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

--15377233611.6BbEC8BD.1121--

--===============0711842988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0711842988==--
