From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108032] nv50_ir_lowering_gm107.cpp:326: undefined
 reference to
 `nv50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target,
 unsigned int, int, nv50_ir::Value*, bool)'
Date: Sun, 23 Sep 2018 17:03:38 +0000
Message-ID: <bug-108032-8800-jakXfbHVwV@http.bugs.freedesktop.org/>
References: <bug-108032-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1271458982=="
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


--===============1271458982==
Content-Type: multipart/alternative; boundary="15377222180.69C4F9F22.28184"
Content-Transfer-Encoding: 7bit


--15377222180.69C4F9F22.28184
Date: Sun, 23 Sep 2018 17:03:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108032

--- Comment #2 from Rhys Perry <pendingchaos02+fdobugzilla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Seems that although I can't reproduce it with 64-bit targeted Meson, I can =
with
with 32-bit targeted autotools.

Removing the inline does fix the error and I've posted a patch doing that:
https://lists.freedesktop.org/archives/mesa-dev/2018-September/205821.html

It or something similar should be pushed soon.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15377222180.69C4F9F22.28184
Date: Sun, 23 Sep 2018 17:03:38 +0000
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
   title=3D"NEW - nv50_ir_lowering_gm107.cpp:326: undefined reference to `n=
v50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target, =
unsigned int, int, nv50_ir::Value*, bool)'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108032#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv50_ir_lowering_gm107.cpp:326: undefined reference to `n=
v50_ir::NVC0LoweringPass::loadMsAdjInfo32(nv50_ir::TexInstruction::Target, =
unsigned int, int, nv50_ir::Value*, bool)'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108032">bug 10803=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pendingchaos02+fdobugzilla&#64;gmail.com" title=3D"Rhys Perry &lt;pendingch=
aos02+fdobugzilla&#64;gmail.com&gt;"> <span class=3D"fn">Rhys Perry</span><=
/a>
</span></b>
        <pre>Seems that although I can't reproduce it with 64-bit targeted =
Meson, I can with
with 32-bit targeted autotools.

Removing the inline does fix the error and I've posted a patch doing that:
<a href=3D"https://lists.freedesktop.org/archives/mesa-dev/2018-September/2=
05821.html">https://lists.freedesktop.org/archives/mesa-dev/2018-September/=
205821.html</a>

It or something similar should be pushed soon.</pre>
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

--15377222180.69C4F9F22.28184--

--===============1271458982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1271458982==--
