From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104441] drm/nouveau: drm_hwcomposer cannot get
 rotation property/does not work
Date: Tue, 02 Jan 2018 09:53:24 +0000
Message-ID: <bug-104441-8800-hLJgTLgXWZ@http.bugs.freedesktop.org/>
References: <bug-104441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0190304991=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0190304991==
Content-Type: multipart/alternative; boundary="15148868040.1BA3bF5A6.21213";
 charset="UTF-8"


--15148868040.1BA3bF5A6.21213
Date: Tue, 2 Jan 2018 09:53:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104441

--- Comment #4 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

thanks for your responses.

Also in my understanding, which is not professional but more of an hobbyist,
the drm planes model considered in drm_hwcomposer may have considered rotat=
ion
property as available in its first implementations/test cases.

IMHO since having no rotation is equivalent to having 0 rotation only,
I don't see the reason for drm_hwcomposer to throw the error in
drmplane.cpp:123, unless being born as an hwcomposer HAL and having a strong
requirement for it (or to "fake it").

Also I wanted to get your feedback, which is in line with KMS documentation,
that rotation property can be optional.

Thanks for your hint, drm_hwcomposer is now part of freedesktop.org

https://cgit.freedesktop.org/drm_hwcomposer

but I could not find how to submit a bug for drm_hwcomposer in bugzilla.
I think it should not be in 'DRI' section and it should not be in 'Mesa'

Mauro

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15148868040.1BA3bF5A6.21213
Date: Tue, 2 Jan 2018 09:53:24 +0000
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
   title=3D"NEW - drm/nouveau: drm_hwcomposer cannot get rotation property/=
does not work"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104441#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm/nouveau: drm_hwcomposer cannot get rotation property/=
does not work"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104441">bug 10444=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
issor.oruam&#64;gmail.com" title=3D"Mauro Rossi &lt;issor.oruam&#64;gmail.c=
om&gt;"> <span class=3D"fn">Mauro Rossi</span></a>
</span></b>
        <pre>Hi Ilia,

thanks for your responses.

Also in my understanding, which is not professional but more of an hobbyist,
the drm planes model considered in drm_hwcomposer may have considered rotat=
ion
property as available in its first implementations/test cases.

IMHO since having no rotation is equivalent to having 0 rotation only,
I don't see the reason for drm_hwcomposer to throw the error in
drmplane.cpp:123, unless being born as an hwcomposer HAL and having a strong
requirement for it (or to &quot;fake it&quot;).

Also I wanted to get your feedback, which is in line with KMS documentation,
that rotation property can be optional.

Thanks for your hint, drm_hwcomposer is now part of freedesktop.org

<a href=3D"https://cgit.freedesktop.org/drm_hwcomposer">https://cgit.freede=
sktop.org/drm_hwcomposer</a>

but I could not find how to submit a bug for drm_hwcomposer in bugzilla.
I think it should not be in 'DRI' section and it should not be in 'Mesa'

Mauro</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15148868040.1BA3bF5A6.21213--

--===============0190304991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0190304991==--
