From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111167] Dividing zero by a uniform in loop header
 causes segfault in nv50_ir::NVC0LegalizeSSA::handleDIV
Date: Thu, 18 Jul 2019 15:49:27 +0000
Message-ID: <bug-111167-8800-XGC0R2ab1C@http.bugs.freedesktop.org/>
References: <bug-111167-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2049321464=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111167-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2049321464==
Content-Type: multipart/alternative; boundary="15634649660.fF5D.19013"
Content-Transfer-Encoding: 7bit


--15634649660.fF5D.19013
Date: Thu, 18 Jul 2019 15:49:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111167

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Right...

      Instruction *ld =3D i->getSrc(s)->getInsn();
      assert(ld->getSrc(0) !=3D NULL);

We must end up propagating the zero imm directly into DIV's args. This is
generally legal even for ops that don't allow imms because of the RZ thing.
However in this case ... it screws things up, since we have to move the val=
ue
to a fixed reg.

It looks like the assert() is just misplaced there. It should go into the
"else" clause below and all will be well... we handle the "!ld" / "ld is no=
t a
load/mov" cases already just fine.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15634649660.fF5D.19013
Date: Thu, 18 Jul 2019 15:49:26 +0000
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
   title=3D"NEW - Dividing zero by a uniform in loop header causes segfault=
 in nv50_ir::NVC0LegalizeSSA::handleDIV"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111167#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dividing zero by a uniform in loop header causes segfault=
 in nv50_ir::NVC0LegalizeSSA::handleDIV"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111167">bug 11116=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Right...

      Instruction *ld =3D i-&gt;getSrc(s)-&gt;getInsn();
      assert(ld-&gt;getSrc(0) !=3D NULL);

We must end up propagating the zero imm directly into DIV's args. This is
generally legal even for ops that don't allow imms because of the RZ thing.
However in this case ... it screws things up, since we have to move the val=
ue
to a fixed reg.

It looks like the assert() is just misplaced there. It should go into the
&quot;else&quot; clause below and all will be well... we handle the &quot;!=
ld&quot; / &quot;ld is not a
load/mov&quot; cases already just fine.</pre>
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

--15634649660.fF5D.19013--

--===============2049321464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2049321464==--
