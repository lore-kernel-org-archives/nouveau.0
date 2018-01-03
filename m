From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104441] drm/nouveau: drm_hwcomposer cannot get
 rotation property/does not work
Date: Wed, 03 Jan 2018 00:37:27 +0000
Message-ID: <bug-104441-8800-FfYQFkSET7@http.bugs.freedesktop.org/>
References: <bug-104441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084366271=="
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


--===============1084366271==
Content-Type: multipart/alternative; boundary="15149398471.A1A8df69.18639";
 charset="UTF-8"


--15149398471.A1A8df69.18639
Date: Wed, 3 Jan 2018 00:37:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104441

--- Comment #5 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,


Thanks for your feedbacks, rotation property is unessential,
so drm_hwcomposer error is "informative"

I could boot oreo-x86 with GT610 with some changes in drm_hwcomposer,
i.e. adding some drm mode connector types which were missing (DVID, DVII and
VGA)
and considering only connected ones

I'll write an email to Robert Foss and Rob Herring in Cc:
Please close as Not-Your-Bug

Cheers

Mauro

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15149398471.A1A8df69.18639
Date: Wed, 3 Jan 2018 00:37:27 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104441#c5">Commen=
t # 5</a>
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


Thanks for your feedbacks, rotation property is unessential,
so drm_hwcomposer error is &quot;informative&quot;

I could boot oreo-x86 with GT610 with some changes in drm_hwcomposer,
i.e. adding some drm mode connector types which were missing (DVID, DVII and
VGA)
and considering only connected ones

I'll write an email to Robert Foss and Rob Herring in Cc:
Please close as Not-Your-Bug

Cheers

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

--15149398471.A1A8df69.18639--

--===============1084366271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1084366271==--
