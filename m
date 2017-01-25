From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99532] Compute shader doesn't give right result
 under some circumstances
Date: Wed, 25 Jan 2017 13:47:56 +0000
Message-ID: <bug-99532-8800-dumTq9Ijk8@http.bugs.freedesktop.org/>
References: <bug-99532-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1760660272=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99532-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1760660272==
Content-Type: multipart/alternative; boundary="14853520760.c0f2afaD.15616";
 charset="UTF-8"


--14853520760.c0f2afaD.15616
Date: Wed, 25 Jan 2017 13:47:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99532

--- Comment #8 from Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A missing OP_CCTL maybe? I have something which could help (but it's defini=
tely
not the right thing to do).

The possible fix is here:
https://cgit.freedesktop.org/~hakzsam/mesa/commit/?h=3Datomic_fixes&id=3Dd3=
a1158acde83d9d7a2a58e431623dd89e59ca65

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14853520760.c0f2afaD.15616
Date: Wed, 25 Jan 2017 13:47:56 +0000
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
   title=3D"NEW - Compute shader doesn't give right result under some circu=
mstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Compute shader doesn't give right result under some circu=
mstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532">bug 99532<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samuel.pitoiset&#64;gmail.com" title=3D"Samuel Pitoiset &lt;samuel.pitoiset=
&#64;gmail.com&gt;"> <span class=3D"fn">Samuel Pitoiset</span></a>
</span></b>
        <pre>A missing OP_CCTL maybe? I have something which could help (bu=
t it's definitely
not the right thing to do).

The possible fix is here:
<a href=3D"https://cgit.freedesktop.org/~hakzsam/mesa/commit/?h=3Datomic_fi=
xes&amp;id=3Dd3a1158acde83d9d7a2a58e431623dd89e59ca65">https://cgit.freedes=
ktop.org/~hakzsam/mesa/commit/?h=3Datomic_fixes&amp;id=3Dd3a1158acde83d9d7a=
2a58e431623dd89e59ca65</a></pre>
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

--14853520760.c0f2afaD.15616--

--===============1760660272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1760660272==--
