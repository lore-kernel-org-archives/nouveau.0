From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Thu, 13 Oct 2016 11:22:07 +0000
Message-ID: <bug-94990-8800-48CPtoknq0@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1502608471=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1502608471==
Content-Type: multipart/alternative; boundary="14763577278.2BAbDd759.29384";
 charset="UTF-8"


--14763577278.2BAbDd759.29384
Date: Thu, 13 Oct 2016 11:22:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #72 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Yann Golanski from comment #71)
> Is there a chance that this bug will be fixed before Fedora 25 comes out
> (https://fedoraproject.org/wiki/Releases/25/Schedule)? It would be really
> irritating to not be able to upgrade because of it.
>=20
> Is there anything that we can do to help make this faster?
>=20
> I would offer a patch but my X11 driver skills are weak. However, I am ha=
ppy
> to test a patch if needed.

well, we have an idea how we can fix the issue, but chances are it might br=
eak
other cards as well. Anyway, the fix won't be too difficult and a backport
should be fairly simple.

By the way, this affects the kernel module only.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14763577278.2BAbDd759.29384
Date: Thu, 13 Oct 2016 11:22:07 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c72">Commen=
t # 72</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Yann Golanski from <a href=3D"show_bug.cgi?id=3D9=
4990#c71">comment #71</a>)
<span class=3D"quote">&gt; Is there a chance that this bug will be fixed be=
fore Fedora 25 comes out
&gt; (<a href=3D"https://fedoraproject.org/wiki/Releases/25/Schedule">https=
://fedoraproject.org/wiki/Releases/25/Schedule</a>)? It would be really
&gt; irritating to not be able to upgrade because of it.
&gt;=20
&gt; Is there anything that we can do to help make this faster?
&gt;=20
&gt; I would offer a patch but my X11 driver skills are weak. However, I am=
 happy
&gt; to test a patch if needed.</span >

well, we have an idea how we can fix the issue, but chances are it might br=
eak
other cards as well. Anyway, the fix won't be too difficult and a backport
should be fairly simple.

By the way, this affects the kernel module only.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14763577278.2BAbDd759.29384--

--===============1502608471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1502608471==--
