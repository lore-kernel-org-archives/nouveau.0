From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101184] [NVE6] [bisected] Panic on boot with GK106
Date: Wed, 07 Jun 2017 17:46:33 +0000
Message-ID: <bug-101184-8800-uR2P9QOEI8@http.bugs.freedesktop.org/>
References: <bug-101184-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2035918448=="
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


--===============2035918448==
Content-Type: multipart/alternative; boundary="14968575922.dAB33.29533";
 charset="UTF-8"


--14968575922.dAB33.29533
Date: Wed, 7 Jun 2017 17:46:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101184

--- Comment #10 from ingo66 <ingo.rybaczyk-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org> ---
Hello,

I have test the patch for linux 4.11.3 with the driver xf86-video-nouveau
1.0.15 and now my system starts without a kernel panic.

Without the patch only linux < 4.11.3 start correct.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14968575922.dAB33.29533
Date: Wed, 7 Jun 2017 17:46:32 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184">bug 10118=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ingo.rybaczyk&#64;t-online.de" title=3D"ingo66 &lt;ingo.rybaczyk&#64;t-onli=
ne.de&gt;"> <span class=3D"fn">ingo66</span></a>
</span></b>
        <pre>Hello,

I have test the patch for linux 4.11.3 with the driver xf86-video-nouveau
1.0.15 and now my system starts without a kernel panic.

Without the patch only linux &lt; 4.11.3 start correct.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14968575922.dAB33.29533--

--===============2035918448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2035918448==--
