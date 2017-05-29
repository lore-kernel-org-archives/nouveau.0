From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101184] [NVE6] [bisected] Panic on boot with GK106
Date: Mon, 29 May 2017 10:57:02 +0000
Message-ID: <bug-101184-8800-hBKBHB4Z6h@http.bugs.freedesktop.org/>
References: <bug-101184-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0048742179=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101184-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0048742179==
Content-Type: multipart/alternative; boundary="14960554220.a7e9b.1222";
 charset="UTF-8"


--14960554220.a7e9b.1222
Date: Mon, 29 May 2017 10:57:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101184

--- Comment #3 from S. Gilles <sgilles-8yXg+M/94Z32fBVCVOL8/A@public.gmane.org> ---
It certainly feels reproducible.  I've tested ~20 boots past the listed com=
mit,
and ~10 from very close to before it, and if that commit isn't the dividing
line, it's doing a very good job of pretending to be. (I agree with you tha=
t it
looks pretty harmless, though.)

I'm about to attach a dmesg from a working kernel (4.11.0-rc4) with
"nouveau.modeset=3D1 nouveau.config=3DNvGrUseFW=3D1 nouveau.debug=3Ddebug" =
(my standard
command line has "nouveau.modeset=3D1 nouveau.config=3DNvGrUseFW=3D1" if it=
 matters).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14960554220.a7e9b.1222
Date: Mon, 29 May 2017 10:57:02 +0000
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
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184">bug 10118=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sgilles&#64;math.umd.edu" title=3D"S. Gilles &lt;sgilles&#64;math.umd.edu&g=
t;"> <span class=3D"fn">S. Gilles</span></a>
</span></b>
        <pre>It certainly feels reproducible.  I've tested ~20 boots past t=
he listed commit,
and ~10 from very close to before it, and if that commit isn't the dividing
line, it's doing a very good job of pretending to be. (I agree with you tha=
t it
looks pretty harmless, though.)

I'm about to attach a dmesg from a working kernel (4.11.0-rc4) with
&quot;nouveau.modeset=3D1 nouveau.config=3DNvGrUseFW=3D1 nouveau.debug=3Dde=
bug&quot; (my standard
command line has &quot;nouveau.modeset=3D1 nouveau.config=3DNvGrUseFW=3D1&q=
uot; if it matters).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14960554220.a7e9b.1222--

--===============0048742179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0048742179==--
