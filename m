From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102352] nv4x fan run whole time at 100%,
 stable patch existing since about 1 year, please merge
Date: Wed, 23 Aug 2017 22:51:41 +0000
Message-ID: <bug-102352-8800-7S5yZ7SMix@http.bugs.freedesktop.org/>
References: <bug-102352-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0296814524=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102352-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0296814524==
Content-Type: multipart/alternative; boundary="15035287011.B67CB9.23886";
 charset="UTF-8"


--15035287011.B67CB9.23886
Date: Wed, 23 Aug 2017 22:51:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102352

--- Comment #2 from caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org ---
I saw after your report that the patch is been merged into the kernel since
4.11-rc1. Every later kernel should not let the gpu-fan run at 100%.
I tested now a fresh linux live iso with kernel 4.12 and have 100% gpu-fan =
the
whole time. The fan speed did not change from the 100% when the computer is
been turned on. NV43 and NV42 GPUs are been tested and none of those slows
down.
If there is some other live linux iso i should test, i would do that.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15035287011.B67CB9.23886
Date: Wed, 23 Aug 2017 22:51:41 +0000
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
   title=3D"NEW - nv4x fan run whole time at 100%, stable patch existing si=
nce about 1 year, please merge"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102352#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x fan run whole time at 100%, stable patch existing si=
nce about 1 year, please merge"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102352">bug 10235=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
caguduzexi&#64;go2vpn.net" title=3D"caguduzexi&#64;go2vpn.net">caguduzexi&#=
64;go2vpn.net</a>
</span></b>
        <pre>I saw after your report that the patch is been merged into the=
 kernel since
4.11-rc1. Every later kernel should not let the gpu-fan run at 100%.
I tested now a fresh linux live iso with kernel 4.12 and have 100% gpu-fan =
the
whole time. The fan speed did not change from the 100% when the computer is
been turned on. NV43 and NV42 GPUs are been tested and none of those slows
down.
If there is some other live linux iso i should test, i would do that.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15035287011.B67CB9.23886--

--===============0296814524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0296814524==--
