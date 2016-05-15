From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Sun, 15 May 2016 13:09:35 +0000
Message-ID: <bug-59069-8800-ohyBPUrRyi@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1024483982=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1024483982==
Content-Type: multipart/alternative; boundary="14633177750.f99B.22206";
 charset="UTF-8"


--14633177750.f99B.22206
Date: Sun, 15 May 2016 13:09:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D59069

--- Comment #43 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #39)
> "fail ttm_validate" usually means "you tried to use too much vram at once=
".
> Unfortunately nouveau's mesa driver isn't particularly good at handling t=
hat
> issue, which causes it to get much worse failures down the line.
>=20
> If you have an IGP, please increase the size of the "VRAM" allocation.
>=20
> Realistically, I doubt the plasma5 use-case fits well with nv30/nv40
> hardware. You're taking a 2015 compositor and running it on 2005 hardware.
>=20

Looks like GLX is too much for GPU family <=3D NV50, i.e. NV40, NV30, ...=20
but can go with XRender - the same situation as with Xfwm4 compositing.


> You could (correctly) make the argument that nouveau should do a better j=
ob
> at this -- and you'd be right. However volunteers aren't falling over
> themselves, rushing to fix these issues.

Only volunteers there!? :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14633177750.f99B.22206
Date: Sun, 15 May 2016 13:09:35 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069#c43">Commen=
t # 43</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069">bug 59069<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D590=
69#c39">comment #39</a>)
<span class=3D"quote">&gt; &quot;fail ttm_validate&quot; usually means &quo=
t;you tried to use too much vram at once&quot;.
&gt; Unfortunately nouveau's mesa driver isn't particularly good at handlin=
g that
&gt; issue, which causes it to get much worse failures down the line.
&gt;=20
&gt; If you have an IGP, please increase the size of the &quot;VRAM&quot; a=
llocation.
&gt;=20
&gt; Realistically, I doubt the plasma5 use-case fits well with nv30/nv40
&gt; hardware. You're taking a 2015 compositor and running it on 2005 hardw=
are.
&gt; </span >

Looks like GLX is too much for GPU family &lt;=3D NV50, i.e. NV40, NV30, ..=
.=20
but can go with XRender - the same situation as with Xfwm4 compositing.


<span class=3D"quote">&gt; You could (correctly) make the argument that nou=
veau should do a better job
&gt; at this -- and you'd be right. However volunteers aren't falling over
&gt; themselves, rushing to fix these issues.</span >

Only volunteers there!? :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14633177750.f99B.22206--

--===============1024483982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1024483982==--
