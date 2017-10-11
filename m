From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103132] GTX 1060 6GB corrupts screen drawing in
 Konsole and other apps
Date: Wed, 11 Oct 2017 19:14:42 +0000
Message-ID: <bug-103132-8800-yEk5xvqsYj@http.bugs.freedesktop.org/>
References: <bug-103132-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1493047887=="
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


--===============1493047887==
Content-Type: multipart/alternative; boundary="15077492820.1DBcc7bc.28751";
 charset="UTF-8"


--15077492820.1DBcc7bc.28751
Date: Wed, 11 Oct 2017 19:14:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103132

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
My guess is that the difference is due to enablement of acceleration? Not s=
ure
if that's when GP106 happened though. You could boot with nouveau.noaccel=
=3D1 to
disable it.

I've recently fixed a bug in mesa introduced in 17.2 which could maybe cause
some of these issues. What version of mesa are you using? [commit
b20bccbcacc6170cfc4f18332491131df5bac811 upstream.]

"Overlayed with blobs" generally means either texture corruption or ...
something else.

Are you using the 'modesetting' DDX? If so, I strongly recommend using the
'nouveau' one.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15077492820.1DBcc7bc.28751
Date: Wed, 11 Oct 2017 19:14:42 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103132#c2">Commen=
t # 2</a>
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
        <pre>My guess is that the difference is due to enablement of accele=
ration? Not sure
if that's when GP106 happened though. You could boot with nouveau.noaccel=
=3D1 to
disable it.

I've recently fixed a bug in mesa introduced in 17.2 which could maybe cause
some of these issues. What version of mesa are you using? [commit
b20bccbcacc6170cfc4f18332491131df5bac811 upstream.]

&quot;Overlayed with blobs&quot; generally means either texture corruption =
or ...
something else.

Are you using the 'modesetting' DDX? If so, I strongly recommend using the
'nouveau' one.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15077492820.1DBcc7bc.28751--

--===============1493047887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1493047887==--
