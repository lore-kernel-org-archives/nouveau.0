From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99799] Civilization VI makes nouveau crash on
 register allocation
Date: Thu, 16 Feb 2017 02:57:38 +0000
Message-ID: <bug-99799-8800-HgHcT9U2cq@http.bugs.freedesktop.org/>
References: <bug-99799-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0554043877=="
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


--===============0554043877==
Content-Type: multipart/alternative; boundary="14872138582.CCC72AD.3802";
 charset="UTF-8"


--14872138582.CCC72AD.3802
Date: Thu, 16 Feb 2017 02:57:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99799

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 129659
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129659&action=3Dedit
patch that works around the issue

The attached patch should work around the issue of spilling a value into it=
self
without invoking the wrath of the underlying bug that caused the whole thin=
g to
go south in the first place.

I'm not entirely convinced of this patch's correctness, so it will need some
careful testing.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14872138582.CCC72AD.3802
Date: Thu, 16 Feb 2017 02:57:38 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799#c3">Comment=
 # 3</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129659=
" name=3D"attach_129659" title=3D"patch that works around the issue">attach=
ment 129659</a> <a href=3D"attachment.cgi?id=3D129659&amp;action=3Dedit" ti=
tle=3D"patch that works around the issue">[details]</a></span> <a href=3D'p=
age.cgi?id=3Dsplinter.html&amp;bug=3D99799&amp;attachment=3D129659'>[review=
]</a>
patch that works around the issue

The attached patch should work around the issue of spilling a value into it=
self
without invoking the wrath of the underlying bug that caused the whole thin=
g to
go south in the first place.

I'm not entirely convinced of this patch's correctness, so it will need some
careful testing.</pre>
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

--14872138582.CCC72AD.3802--

--===============0554043877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0554043877==--
