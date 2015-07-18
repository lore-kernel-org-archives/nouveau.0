From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Sat, 18 Jul 2015 15:40:22 +0000
Message-ID: <bug-89969-8800-3zPf9edLDk@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1654675056=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89969-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1654675056==
Content-Type: multipart/alternative; boundary="1437234022.bA63B2.11145"; charset="UTF-8"


--1437234022.bA63B2.11145
Date: Sat, 18 Jul 2015 15:40:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D89969

--- Comment #11 from Christian K=C3=B6nig <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #10)
> Wouldn't it be simpler to just accumulate user buffers and then do all the
> work in end_frame instead? And like Christian said, it'd be easy enough to
> get st/va to do this.

Accumulating all the user buffers in the state tracker is what I initially
suggested as well and I wouldn't mind if it goes into this direction in the
long term.

You would need to add a new type for the bitstream buffer (we currently alr=
eady
abuse vertext buffers in the OMX encoder for this).

For the short term your patch looks like it's going into the right directio=
n.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1437234022.bA63B2.11145
Date: Sat, 18 Jul 2015 15:40:22 +0000
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
   title=3D"NEW - vaDriverInit fails with gallium/nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89969#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vaDriverInit fails with gallium/nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89969">bug 89969<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
deathsimple&#64;vodafone.de" title=3D"Christian K=C3=B6nig &lt;deathsimple&=
#64;vodafone.de&gt;"> <span class=3D"fn">Christian K=C3=B6nig</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D899=
69#c10">comment #10</a>)
<span class=3D"quote">&gt; Wouldn't it be simpler to just accumulate user b=
uffers and then do all the
&gt; work in end_frame instead? And like Christian said, it'd be easy enoug=
h to
&gt; get st/va to do this.</span >

Accumulating all the user buffers in the state tracker is what I initially
suggested as well and I wouldn't mind if it goes into this direction in the
long term.

You would need to add a new type for the bitstream buffer (we currently alr=
eady
abuse vertext buffers in the OMX encoder for this).

For the short term your patch looks like it's going into the right directio=
n.</pre>
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

--1437234022.bA63B2.11145--

--===============1654675056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1654675056==--
