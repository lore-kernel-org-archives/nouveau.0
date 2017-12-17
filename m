From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99799] Civilization VI makes nouveau crash on
 register allocation
Date: Sun, 17 Dec 2017 11:03:05 +0000
Message-ID: <bug-99799-8800-RP38Xv4V2J@http.bugs.freedesktop.org/>
References: <bug-99799-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0221844907=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99799-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0221844907==
Content-Type: multipart/alternative; boundary="15135085851.Ec2c3087B.27624";
 charset="UTF-8"


--15135085851.Ec2c3087B.27624
Date: Sun, 17 Dec 2017 11:03:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99799

--- Comment #6 from Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As an update, the latest Civ6 (v1.0.0.167) doesn't experience a crash in ga=
me
with either of the two following graphics stack combinations on GP107M for =
me:

Mesa 17.2.2 / libdrm 2.4.83 / Kernel 4.15-rc1
Mesa 17.4.0-devel (git-546633dce2) / libdrm 2.4.83 / Kernel 4.15-rc1

I ran both the benchmark mode and also the 'Play Now' option.

Note: Visual corruptions remain - a number of blocks of blue colour and
incorrectly clipped visual elements.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15135085851.Ec2c3087B.27624
Date: Sun, 17 Dec 2017 11:03:05 +0000
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
   title=3D"NEW - Civilization VI makes nouveau crash on register allocatio=
n"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Civilization VI makes nouveau crash on register allocatio=
n"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799">bug 99799<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rhyskidd&#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;">=
 <span class=3D"fn">Rhys Kidd</span></a>
</span></b>
        <pre>As an update, the latest Civ6 (v1.0.0.167) doesn't experience =
a crash in game
with either of the two following graphics stack combinations on GP107M for =
me:

Mesa 17.2.2 / libdrm 2.4.83 / Kernel 4.15-rc1
Mesa 17.4.0-devel (git-546633dce2) / libdrm 2.4.83 / Kernel 4.15-rc1

I ran both the benchmark mode and also the 'Play Now' option.

Note: Visual corruptions remain - a number of blocks of blue colour and
incorrectly clipped visual elements.</pre>
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

--15135085851.Ec2c3087B.27624--

--===============0221844907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0221844907==--
