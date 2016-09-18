From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION] KMS having issues after kernel
 upgrade (4.5.1-1 to 4.6.4-1)
Date: Sun, 18 Sep 2016 23:55:56 +0000
Message-ID: <bug-97620-8800-XN9JmkJHRY@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1166538364=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1166538364==
Content-Type: multipart/alternative; boundary="14742429551.2Abebf.2792";
 charset="UTF-8"


--14742429551.2Abebf.2792
Date: Sun, 18 Sep 2016 23:55:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #11 from Luke Tidd <lukeisgreat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
You are right, sorry new to git bisect. Was thrown off by "0 more steps to =
do".



git bisect start '--' 'drivers/gpu/drm/nouveau'
# good: [b562e44f507e863c6792946e4e1b1449fbbac85d] Linux 4.5
git bisect good b562e44f507e863c6792946e4e1b1449fbbac85d
# bad: [523d939ef98fd712632d93a5a2b588e477a7565e] Linux 4.7
git bisect bad 523d939ef98fd712632d93a5a2b588e477a7565e
# bad: [3a91b9c5efd27729767edfde9df069aa61c4816f] drm/nouveau/clk/gk20a: fix
VCO bit mask
git bisect bad 3a91b9c5efd27729767edfde9df069aa61c4816f
# bad: [a2e435a1b0a3c2bc766d40356151610cc54b8772] drm/nouveau/fifo/gk104: t=
ake
runlist target into account
git bisect bad a2e435a1b0a3c2bc766d40356151610cc54b8772
# bad: [18cd5bc8ea587dc2fc0c07d2a4bf3cfe9ed2ef53] drm/nouveau/gr/gf100: load
firmware in outer function
git bisect bad 18cd5bc8ea587dc2fc0c07d2a4bf3cfe9ed2ef53
# good: [1b82111faebc24427c76b83738566bda7f315225] drm/nouveau/device/tegra:
fix uninitialized IRQ number
git bisect good 1b82111faebc24427c76b83738566bda7f315225
# bad: [989f57847396d1d042204747985d6aacf5399c8a] drm/nouveau/bios/devinit:
rename INIT_DP_CONDITION to INIT_GENERIC_CONDITION
git bisect bad 989f57847396d1d042204747985d6aacf5399c8a
# good: [8fb1240a7152d450d57402b5b85ba46d8610d443] drm/nouveau/devinit/nv50:
remove unneeded variable
git bisect good 8fb1240a7152d450d57402b5b85ba46d8610d443
# bad: [96aedd0ba9122a13fd0f756e022856ce7f05f086] drm/nouveau/ltc/gm107: fix
slice intr offset
git bisect bad 96aedd0ba9122a13fd0f756e022856ce7f05f086
# bad: [a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816] drm/nouveau/devinit/gf100=
-:
detect if BIOS invoked devinit
git bisect bad a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816
# first bad commit: [a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816]
drm/nouveau/devinit/gf100-: detect if BIOS invoked devinit

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14742429551.2Abebf.2792
Date: Sun, 18 Sep 2016 23:55:55 +0000
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
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukeisgreat&#64;gmail.com" title=3D"Luke Tidd &lt;lukeisgreat&#64;gmail.com=
&gt;"> <span class=3D"fn">Luke Tidd</span></a>
</span></b>
        <pre>You are right, sorry new to git bisect. Was thrown off by &quo=
t;0 more steps to do&quot;.



git bisect start '--' 'drivers/gpu/drm/nouveau'
# good: [b562e44f507e863c6792946e4e1b1449fbbac85d] Linux 4.5
git bisect good b562e44f507e863c6792946e4e1b1449fbbac85d
# bad: [523d939ef98fd712632d93a5a2b588e477a7565e] Linux 4.7
git bisect bad 523d939ef98fd712632d93a5a2b588e477a7565e
# bad: [3a91b9c5efd27729767edfde9df069aa61c4816f] drm/nouveau/clk/gk20a: fix
VCO bit mask
git bisect bad 3a91b9c5efd27729767edfde9df069aa61c4816f
# bad: [a2e435a1b0a3c2bc766d40356151610cc54b8772] drm/nouveau/fifo/gk104: t=
ake
runlist target into account
git bisect bad a2e435a1b0a3c2bc766d40356151610cc54b8772
# bad: [18cd5bc8ea587dc2fc0c07d2a4bf3cfe9ed2ef53] drm/nouveau/gr/gf100: load
firmware in outer function
git bisect bad 18cd5bc8ea587dc2fc0c07d2a4bf3cfe9ed2ef53
# good: [1b82111faebc24427c76b83738566bda7f315225] drm/nouveau/device/tegra:
fix uninitialized IRQ number
git bisect good 1b82111faebc24427c76b83738566bda7f315225
# bad: [989f57847396d1d042204747985d6aacf5399c8a] drm/nouveau/bios/devinit:
rename INIT_DP_CONDITION to INIT_GENERIC_CONDITION
git bisect bad 989f57847396d1d042204747985d6aacf5399c8a
# good: [8fb1240a7152d450d57402b5b85ba46d8610d443] drm/nouveau/devinit/nv50:
remove unneeded variable
git bisect good 8fb1240a7152d450d57402b5b85ba46d8610d443
# bad: [96aedd0ba9122a13fd0f756e022856ce7f05f086] drm/nouveau/ltc/gm107: fix
slice intr offset
git bisect bad 96aedd0ba9122a13fd0f756e022856ce7f05f086
# bad: [a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816] drm/nouveau/devinit/gf100=
-:
detect if BIOS invoked devinit
git bisect bad a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816
# first bad commit: [a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816]
drm/nouveau/devinit/gf100-: detect if BIOS invoked devinit</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14742429551.2Abebf.2792--

--===============1166538364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1166538364==--
