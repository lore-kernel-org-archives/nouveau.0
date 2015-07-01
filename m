From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91124] Civilization V (in Wine) has rendering
 issues: text missing, menu bar corrupted
Date: Wed, 01 Jul 2015 06:47:56 +0000
Message-ID: <bug-91124-8800-NOOknhrJ7z@http.bugs.freedesktop.org/>
References: <bug-91124-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0790318489=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91124-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0790318489==
Content-Type: multipart/alternative; boundary="1435733276.51CC70a51.9024"; charset="UTF-8"


--1435733276.51CC70a51.9024
Date: Wed, 1 Jul 2015 06:47:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91124

--- Comment #3 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> I believe the following patch resolves the issue:
>=20
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
> b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
> index 51b9225..fa8ee07 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
> @@ -332,6 +332,9 @@ BasicBlock::splitBefore(Instruction *insn, bool attac=
h)
>     BasicBlock *bb =3D new BasicBlock(func);
>     assert(!insn || insn->op !=3D OP_PHI);
>=20=20
> +   bb->joinAt =3D joinAt;
> +   joinAt =3D NULL;
> +
>     splitCommon(insn, bb, attach);
>     return bb;
>  }

The patch works very well, it fixes the reported issues in the game, thank =
you.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435733276.51CC70a51.9024
Date: Wed, 1 Jul 2015 06:47:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Civilization V (in Wine) has rendering issues: text missi=
ng, menu bar corrupted"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91124#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Civilization V (in Wine) has rendering issues: text missi=
ng, menu bar corrupted"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91124">bug 91124<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D911=
24#c2">comment #2</a>)
<span class=3D"quote">&gt; I believe the following patch resolves the issue:
&gt;=20
&gt; diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
&gt; b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
&gt; index 51b9225..fa8ee07 100644
&gt; --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
&gt; +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_bb.cpp
&gt; &#64;&#64; -332,6 +332,9 &#64;&#64; BasicBlock::splitBefore(Instructio=
n *insn, bool attach)
&gt;     BasicBlock *bb =3D new BasicBlock(func);
&gt;     assert(!insn || insn-&gt;op !=3D OP_PHI);
&gt;=20=20
&gt; +   bb-&gt;joinAt =3D joinAt;
&gt; +   joinAt =3D NULL;
&gt; +
&gt;     splitCommon(insn, bb, attach);
&gt;     return bb;
&gt;  }</span >

The patch works very well, it fixes the reported issues in the game, thank =
you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435733276.51CC70a51.9024--

--===============0790318489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0790318489==--
