From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102368] Since Archlinux testing migrate to mesa
 17.1.7, I got a pink overlay in webcam software.
Date: Wed, 23 Aug 2017 10:56:02 +0000
Message-ID: <bug-102368-8800-maOjRPxmIp@http.bugs.freedesktop.org/>
References: <bug-102368-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1841196676=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102368-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1841196676==
Content-Type: multipart/alternative; boundary="15034857610.560FB458.15402";
 charset="UTF-8"


--15034857610.560FB458.15402
Date: Wed, 23 Aug 2017 10:56:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102368

--- Comment #1 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Frederic Bezies from comment #0)
> Created attachment 133714 [details]
> Pink overlay in webcam software
>=20
> I reported a bug on archlinux tracker : https://bugs.archlinux.org/task/5=
5243
>=20
> But I noticed that if I installed nvidia-340xx for my old GeForce G210
> graphic card, this pink overlay is no more alive.
>=20
> Here is my card :=20
>=20
> 02:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210]
> (rev a2)
>=20
> I noticed reverting to Mesa 17.1.6 fixed the bug, but it is not a long te=
rm
> solution.

would you be able to git bisect mesa to figure out the exact commit breaking
it? I fear it is my saturation patch, but you never know for sure before
trying.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15034857610.560FB458.15402
Date: Wed, 23 Aug 2017 10:56:01 +0000
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
   title=3D"NEW - Since Archlinux testing migrate to mesa 17.1.7, I got a p=
ink overlay in webcam software."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102368#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Since Archlinux testing migrate to mesa 17.1.7, I got a p=
ink overlay in webcam software."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102368">bug 10236=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Frederic Bezies from <a href=3D"show_bug.cgi?id=
=3D102368#c0">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D133714" name=3D"attach_133714" title=3D"Pink overlay in webcam soft=
ware">attachment 133714</a> <a href=3D"attachment.cgi?id=3D133714&amp;actio=
n=3Dedit" title=3D"Pink overlay in webcam software">[details]</a></span>
&gt; Pink overlay in webcam software
&gt;=20
&gt; I reported a bug on archlinux tracker : <a href=3D"https://bugs.archli=
nux.org/task/55243">https://bugs.archlinux.org/task/55243</a>
&gt;=20
&gt; But I noticed that if I installed nvidia-340xx for my old GeForce G210
&gt; graphic card, this pink overlay is no more alive.
&gt;=20
&gt; Here is my card :=20
&gt;=20
&gt; 02:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 2=
10]
&gt; (rev a2)
&gt;=20
&gt; I noticed reverting to Mesa 17.1.6 fixed the bug, but it is not a long=
 term
&gt; solution.</span >

would you be able to git bisect mesa to figure out the exact commit breaking
it? I fear it is my saturation patch, but you never know for sure before
trying.</pre>
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

--15034857610.560FB458.15402--

--===============1841196676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1841196676==--
