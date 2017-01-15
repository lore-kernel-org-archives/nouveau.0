From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91247] Tomb Raider: Underworld renders lots of
 artefacts on models and objects
Date: Sun, 15 Jan 2017 22:36:43 +0000
Message-ID: <bug-91247-8800-vbOv9lkV9o@http.bugs.freedesktop.org/>
References: <bug-91247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2017718432=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2017718432==
Content-Type: multipart/alternative; boundary="14845198021.3Beb2.27853";
 charset="UTF-8"


--14845198021.3Beb2.27853
Date: Sun, 15 Jan 2017 22:36:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91247

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, I did the bisect. It was commit

commit b04ef3c08a288a5857349c9e582ee2718fa562f7
Author: Kenneth Graunke <kenneth-xkhwgxqQjnbNLxjTenLetw@public.gmane.org>
Date:   Fri May 30 23:52:22 2014 -0700

    glsl: Immediately inline built-ins rather than generating calls.

that fixed it. That means that this was some kind of nv50/ir compiler bug w=
hich
has gotten hidden away. Urgh :(

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14845198021.3Beb2.27853
Date: Sun, 15 Jan 2017 22:36:42 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Tomb Raider: Underworld renders lots of artefa=
cts on models and objects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91247#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Tomb Raider: Underworld renders lots of artefa=
cts on models and objects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91247">bug 91247<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, I did the bisect. It was commit

commit b04ef3c08a288a5857349c9e582ee2718fa562f7
Author: Kenneth Graunke &lt;<a href=3D"mailto:kenneth&#64;whitecape.org">ke=
nneth&#64;whitecape.org</a>&gt;
Date:   Fri May 30 23:52:22 2014 -0700

    glsl: Immediately inline built-ins rather than generating calls.

that fixed it. That means that this was some kind of nv50/ir compiler bug w=
hich
has gotten hidden away. Urgh :(</pre>
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

--14845198021.3Beb2.27853--

--===============2017718432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2017718432==--
