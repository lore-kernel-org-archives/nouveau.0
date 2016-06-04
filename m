From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96355] Performance: extra&costly SSBO validation
 even when SSBO aren't used
Date: Sat, 04 Jun 2016 11:32:44 +0000
Message-ID: <bug-96355-8800-agWSJKjcoF@http.bugs.freedesktop.org/>
References: <bug-96355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1884323022=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96355-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1884323022==
Content-Type: multipart/alternative; boundary="14650399640.e5Cea4f.10016";
 charset="UTF-8"


--14650399640.e5Cea4f.10016
Date: Sat, 4 Jun 2016 11:32:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96355

--- Comment #6 from gregory.hainaut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Thanks you.

I did a quick benchmark of my testcase:

raw GIT=20
   =3D> Mean by frame: 32.083336ms (31.168831fps)

GIT + hack to remove the new program flags from SSBO and images
   =3D> Mean by frame: 21.586538ms (46.325169fps)

Note: testcase uses lots of shader bind, so I guess it is kinds of a worst =
case
for the perf.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14650399640.e5Cea4f.10016
Date: Sat, 4 Jun 2016 11:32:44 +0000
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
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Performance: extra&amp;costly SSBO validation even when S=
SBO aren't used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96355">bug 96355<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gregory.hainaut&#64;gmail.com" title=3D"gregory.hainaut&#64;gmail.com">greg=
ory.hainaut&#64;gmail.com</a>
</span></b>
        <pre>Thanks you.

I did a quick benchmark of my testcase:

raw GIT=20
   =3D&gt; Mean by frame: 32.083336ms (31.168831fps)

GIT + hack to remove the new program flags from SSBO and images
   =3D&gt; Mean by frame: 21.586538ms (46.325169fps)

Note: testcase uses lots of shader bind, so I guess it is kinds of a worst =
case
for the perf.</pre>
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

--14650399640.e5Cea4f.10016--

--===============1884323022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1884323022==--
