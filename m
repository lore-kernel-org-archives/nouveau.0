From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94832] Reverse Prime corruption with nouveau using
 radeon outputs
Date: Fri, 10 Nov 2017 23:25:46 +0000
Message-ID: <bug-94832-8800-GgIXdhv7s1@http.bugs.freedesktop.org/>
References: <bug-94832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0485625277=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94832-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0485625277==
Content-Type: multipart/alternative; boundary="15103563461.f5bC5d6F.8493";
 charset="UTF-8"


--15103563461.f5bC5d6F.8493
Date: Fri, 10 Nov 2017 23:25:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94832

--- Comment #9 from danon-Mmb7MZpHnFY@public.gmane.org ---
Same problem here, try build a multi monitor setup with a 6600 LE (nouveau)=
 and
a Radeon 2400 Pro (radeon). Xinemara works fine, but Reverse PRIME does not.

When i try to render nouveau -> radeon i get a segfault.
When i try to render radeon -> nouveau i get glitches, similar to the one
Christoph Haag posted.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15103563461.f5bC5d6F.8493
Date: Fri, 10 Nov 2017 23:25:46 +0000
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
   title=3D"NEW - Reverse Prime corruption with nouveau using radeon output=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94832#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Reverse Prime corruption with nouveau using radeon output=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94832">bug 94832<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
danon&#64;gmx.de" title=3D"danon&#64;gmx.de">danon&#64;gmx.de</a>
</span></b>
        <pre>Same problem here, try build a multi monitor setup with a 6600=
 LE (nouveau) and
a Radeon 2400 Pro (radeon). Xinemara works fine, but Reverse PRIME does not.

When i try to render nouveau -&gt; radeon i get a segfault.
When i try to render radeon -&gt; nouveau i get glitches, similar to the one
Christoph Haag posted.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15103563461.f5bC5d6F.8493--

--===============0485625277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0485625277==--
