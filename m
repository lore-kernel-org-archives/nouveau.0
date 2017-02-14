From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99799] Civilization VI makes nouveau crash on
 register allocation
Date: Tue, 14 Feb 2017 17:43:50 +0000
Message-ID: <bug-99799-8800-Baxfjm9Ywz@http.bugs.freedesktop.org/>
References: <bug-99799-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1177528541=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99799-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1177528541==
Content-Type: multipart/alternative; boundary="14870942300.9B4c2.9587";
 charset="UTF-8"


--14870942300.9B4c2.9587
Date: Tue, 14 Feb 2017 17:43:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99799

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so this is a previously-known issue. There's another bug filed about it
somewhere... crysis maybe? Anyways, it comes down to a problem with the
delete_Instruction() in the spill code. When deleting the instruction
(Instruction::~Instruction), it clears out its own ValueDef's (ValueDef::se=
t),
which should in turn update the relevant Value's defs lists.

However this happens in the middle of RA, which means that various instruct=
ions
are joined into nodes, and value A's defs list ends up in value B's defs li=
st.

Now this is where I get confused - when I change the logic to also remove t=
he
ValueDef from val->join, this does not help.

Further vexing is the fact that this particular spill shouldn't even be
happening in the first place - it's a move between 2 LValues which I'm pret=
ty
sure are joined to each other.

Valgrind catches the first badness where this happens, which is when buildi=
ng
live sets after spilling happens. Need to add more breaks and poke around m=
ore.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14870942300.9B4c2.9587
Date: Tue, 14 Feb 2017 17:43:50 +0000
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
   title=3D"NEW - Civilization VI makes nouveau crash on register allocatio=
n"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Civilization VI makes nouveau crash on register allocatio=
n"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799">bug 99799<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so this is a previously-known issue. There's another bug f=
iled about it
somewhere... crysis maybe? Anyways, it comes down to a problem with the
delete_Instruction() in the spill code. When deleting the instruction
(Instruction::~Instruction), it clears out its own ValueDef's (ValueDef::se=
t),
which should in turn update the relevant Value's defs lists.

However this happens in the middle of RA, which means that various instruct=
ions
are joined into nodes, and value A's defs list ends up in value B's defs li=
st.

Now this is where I get confused - when I change the logic to also remove t=
he
ValueDef from val-&gt;join, this does not help.

Further vexing is the fact that this particular spill shouldn't even be
happening in the first place - it's a move between 2 LValues which I'm pret=
ty
sure are joined to each other.

Valgrind catches the first badness where this happens, which is when buildi=
ng
live sets after spilling happens. Need to add more breaks and poke around m=
ore.</pre>
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

--14870942300.9B4c2.9587--

--===============1177528541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1177528541==--
