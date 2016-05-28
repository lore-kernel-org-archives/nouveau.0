From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96258] [NVC0] Hang when running compute program
Date: Sat, 28 May 2016 17:17:29 +0000
Message-ID: <bug-96258-8800-hJ7FgKZQf8@http.bugs.freedesktop.org/>
References: <bug-96258-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1706958948=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96258-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1706958948==
Content-Type: multipart/alternative; boundary="14644558490.fA49.1573";
 charset="UTF-8"


--14644558490.fA49.1573
Date: Sat, 28 May 2016 17:17:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96258

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, I've pushed a fix for the GK208 issue (an issue in unspilling predicate=
s):

commit c7731a07408c5d4169625d4a78962d2887419080
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Sat May 28 13:07:12 2016 -0400

    gk110/ir: fix unspilling of predicates from registers

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D96258
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Cc: "11.2 11.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

However the issue around thread sizes remains for all except the GK10x kepl=
ers.
On fermi we have 32K registers, on kepler+ we have 64K (not counting the
mythical GK210). So we have to tell the RA to restrict the number of regist=
ers
used based on thread size (or use 1024 as the number of threads when that
information is not provided).

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14644558490.fA49.1573
Date: Sat, 28 May 2016 17:17:29 +0000
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
   title=3D"NEW - [NVC0] Hang when running compute program"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96258#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC0] Hang when running compute program"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96258">bug 96258<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, I've pushed a fix for the GK208 issue (an issue in unspill=
ing predicates):

commit c7731a07408c5d4169625d4a78962d2887419080
Author: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu">imirkin=
&#64;alum.mit.edu</a>&gt;
Date:   Sat May 28 13:07:12 2016 -0400

    gk110/ir: fix unspilling of predicates from registers

    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC0] Hang when running compute program"
   href=3D"show_bug.cgi?id=3D96258">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D96258</a>
    Signed-off-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.e=
du">imirkin&#64;alum.mit.edu</a>&gt;
    Cc: &quot;11.2 11.1&quot; &lt;<a href=3D"mailto:mesa-stable&#64;lists.f=
reedesktop.org">mesa-stable&#64;lists.freedesktop.org</a>&gt;

However the issue around thread sizes remains for all except the GK10x kepl=
ers.
On fermi we have 32K registers, on kepler+ we have 64K (not counting the
mythical GK210). So we have to tell the RA to restrict the number of regist=
ers
used based on thread size (or use 1024 as the number of threads when that
information is not provided).</pre>
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

--14644558490.fA49.1573--

--===============1706958948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1706958948==--
