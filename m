From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101322] GM108/NV118: 0 MiB DDR3 and boot crash in
 gf100_ltc_oneinit_tag_ram
Date: Wed, 18 Oct 2017 08:00:04 +0000
Message-ID: <bug-101322-8800-OCUhO2P19G@http.bugs.freedesktop.org/>
References: <bug-101322-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1154061610=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101322-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1154061610==
Content-Type: multipart/alternative; boundary="15083136040.D9EbA739c.22861";
 charset="UTF-8"


--15083136040.D9EbA739c.22861
Date: Wed, 18 Oct 2017 08:00:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101322

--- Comment #11 from Daniel Drake <dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org> ---
Sent partial dump from nvidia proprietary driver to mmio.dumps address:


I loaded the module and then started an empty X session.
Unfortunately with tracing enabled, this results in an instant hard hang
upon starting X, before it has rendered the black screen.

However I managed to capture these messages over the network up until
the point of hang.

Captured on Linux 4.13. No external displays connected. The all-in-one PC
has one internal LCD display.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15083136040.D9EbA739c.22861
Date: Wed, 18 Oct 2017 08:00:04 +0000
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
   title=3D"NEW - GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_onein=
it_tag_ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101322#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_onein=
it_tag_ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101322">bug 10132=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>Sent partial dump from nvidia proprietary driver to mmio.dumps=
 address:


I loaded the module and then started an empty X session.
Unfortunately with tracing enabled, this results in an instant hard hang
upon starting X, before it has rendered the black screen.

However I managed to capture these messages over the network up until
the point of hang.

Captured on Linux 4.13. No external displays connected. The all-in-one PC
has one internal LCD display.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15083136040.D9EbA739c.22861--

--===============1154061610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1154061610==--
