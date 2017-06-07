From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101335] build failure: nouveau_screen.c:105:8:
 error:=?UTF-8?Q?=20implicit=20declaration=20of=20function=20=E2=80=98nouveau=5Fdrm=5Fnew=E2=80=99?=;
Date: Wed, 07 Jun 2017 20:36:13 +0000
Message-ID: <bug-101335-8800-ZVRcMEDF03@http.bugs.freedesktop.org/>
References: <bug-101335-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1514235181=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101335-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1514235181==
Content-Type: multipart/alternative; boundary="14968677721.aF889.30903";
 charset="UTF-8"


--14968677721.aF889.30903
Date: Wed, 7 Jun 2017 20:36:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101335

--- Comment #2 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Karol Herbst from comment #1)
> you need to build against drm-next kernel tree or a different tree the
> module is actually based on. Check for the last drm-next commit in the tr=
ee.

Ben=E2=80=99s tree is currently built against v4.12-rc3 from Linus=E2=80=99=
 tree, rather than a
version of drm-next.

However, I think that David is building Mesa here, rather than the kernel. =
It
seems like you do not have the proper version of libdrm.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14968677721.aF889.30903
Date: Wed, 7 Jun 2017 20:36:12 +0000
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
   title=3D"NEW - build failure: nouveau_screen.c:105:8: error: implicit de=
claration of function =E2=80=98nouveau_drm_new=E2=80=99;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101335#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - build failure: nouveau_screen.c:105:8: error: implicit de=
claration of function =E2=80=98nouveau_drm_new=E2=80=99;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101335">bug 10133=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Karol Herbst from <a href=3D"show_bug.cgi?id=3D10=
1335#c1">comment #1</a>)
<span class=3D"quote">&gt; you need to build against drm-next kernel tree o=
r a different tree the
&gt; module is actually based on. Check for the last drm-next commit in the=
 tree.</span >

Ben=E2=80=99s tree is currently built against v4.12-rc3 from Linus=E2=80=99=
 tree, rather than a
version of drm-next.

However, I think that David is building Mesa here, rather than the kernel. =
It
seems like you do not have the proper version of libdrm.</pre>
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

--14968677721.aF889.30903--

--===============1514235181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1514235181==--
