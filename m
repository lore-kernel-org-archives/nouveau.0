From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104161] refcount_t: increment on 0; use-after-free.
Date: Thu, 07 Dec 2017 11:32:52 +0000
Message-ID: <bug-104161-8800-E70BUPj9QZ@http.bugs.freedesktop.org/>
References: <bug-104161-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284412277=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104161-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1284412277==
Content-Type: multipart/alternative; boundary="15126463720.faDe0.21771";
 charset="UTF-8"


--15126463720.faDe0.21771
Date: Thu, 7 Dec 2017 11:32:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104161

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I believe this should be fixed by
https://github.com/skeggsb/nouveau/commit/9068f1df2394f0e4ab2b2a28cac06b462=
fe0a0aa.
Could you please try applying it on your kernel (note this is an out-of-tree
module, so you=E2=80=99ll need to prefix all the paths with =E2=80=9Cdriver=
s/gpu/=E2=80=9D when
applying to the mainline tree) and confirm that it resolves the issue for y=
ou?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15126463720.faDe0.21771
Date: Thu, 7 Dec 2017 11:32:52 +0000
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
   title=3D"NEW - refcount_t: increment on 0; use-after-free."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104161#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - refcount_t: increment on 0; use-after-free."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104161">bug 10416=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>I believe this should be fixed by
<a href=3D"https://github.com/skeggsb/nouveau/commit/9068f1df2394f0e4ab2b2a=
28cac06b462fe0a0aa">https://github.com/skeggsb/nouveau/commit/9068f1df2394f=
0e4ab2b2a28cac06b462fe0a0aa</a>.
Could you please try applying it on your kernel (note this is an out-of-tree
module, so you=E2=80=99ll need to prefix all the paths with =E2=80=9Cdriver=
s/gpu/=E2=80=9D when
applying to the mainline tree) and confirm that it resolves the issue for y=
ou?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15126463720.faDe0.21771--

--===============1284412277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1284412277==--
