From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103132] GTX 1060 6GB corrupts screen drawing in
 Konsole and other apps
Date: Sun, 15 Oct 2017 13:44:57 +0000
Message-ID: <bug-103132-8800-Be0L1OFu9F@http.bugs.freedesktop.org/>
References: <bug-103132-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0588600906=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103132-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0588600906==
Content-Type: multipart/alternative; boundary="15080750971.5fcE491.22505";
 charset="UTF-8"


--15080750971.5fcE491.22505
Date: Sun, 15 Oct 2017 13:44:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103132

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to barry from comment #4)
> The problems are all gone.
>=20
> Please chalk this up to user error
> - did not configure Xorg to use the nouveau driver.

More like "distro error" -- "listened to the cacophony of people saying
modesetting is the way to go".

The real issue is that there's some issue in the GL, hence the display issu=
es.
Now they will be limited to applications that use GL [which sadly is "a lot"
these days].

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15080750971.5fcE491.22505
Date: Sun, 15 Oct 2017 13:44:57 +0000
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
   title=3D"NEW - GTX 1060 6GB corrupts screen drawing in Konsole and other=
 apps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103132#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 1060 6GB corrupts screen drawing in Konsole and other=
 apps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103132">bug 10313=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to barry from <a href=3D"show_bug.cgi?id=3D103132#c4=
">comment #4</a>)
<span class=3D"quote">&gt; The problems are all gone.
&gt;=20
&gt; Please chalk this up to user error
&gt; - did not configure Xorg to use the nouveau driver.</span >

More like &quot;distro error&quot; -- &quot;listened to the cacophony of pe=
ople saying
modesetting is the way to go&quot;.

The real issue is that there's some issue in the GL, hence the display issu=
es.
Now they will be limited to applications that use GL [which sadly is &quot;=
a lot&quot;
these days].</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15080750971.5fcE491.22505--

--===============0588600906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0588600906==--
