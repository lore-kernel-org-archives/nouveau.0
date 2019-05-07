From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109407] GTX 1050 fails to initialise acceleration
Date: Tue, 07 May 2019 22:11:33 +0000
Message-ID: <bug-109407-8800-C3V2fdlEVl@http.bugs.freedesktop.org/>
References: <bug-109407-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0468687432=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109407-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0468687432==
Content-Type: multipart/alternative; boundary="15572670930.BDc042B1.23476"
Content-Transfer-Encoding: 7bit


--15572670930.BDc042B1.23476
Date: Tue, 7 May 2019 22:11:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109407

--- Comment #5 from John Connett <jrc-okwXFwuUDgyHCRyBVyKX4rVCufUGDwFn@public.gmane.org> ---
Seeing similar behaviour with a PNY Quadro P620 card in a Supermicro X11SPM=
-TF
motherboard running openSUSE Tumbleweed (VERSION=3D"20190505").  Slightly
different BIOS version:

    nouveau 0000:65:00.0: NVIDIA GP107 (137000a1)
    nouveau 0000:65:00.0: bios: version 86.07.51.00.04
    nouveau 0000:65:00.0: fb: 2048 MiB GDDR5
    [...]
    nouveau 0000:65:00.0: secboot: SEC2 failed to start
    nouveau 0000:65:00.0: sec2: unhandled intr 00000010
    nouveau 0000:65:00.0: gr: init failed, -22

Might be some further confusion as this motherboard has an onboard ASPEED A=
ST
2500, a Server Management Processor which also provides a 2D Video Graphics
Adapter.

Please let me know if I might be able to provide more information to identi=
fy
the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572670930.BDc042B1.23476
Date: Tue, 7 May 2019 22:11:33 +0000
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
   title=3D"NEW - GTX 1050 fails to initialise acceleration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109407#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 1050 fails to initialise acceleration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109407">bug 10940=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jrc&#64;skylon.demon.co.uk" title=3D"John Connett &lt;jrc&#64;skylon.demon.=
co.uk&gt;"> <span class=3D"fn">John Connett</span></a>
</span></b>
        <pre>Seeing similar behaviour with a PNY Quadro P620 card in a Supe=
rmicro X11SPM-TF
motherboard running openSUSE Tumbleweed (VERSION=3D&quot;20190505&quot;).  =
Slightly
different BIOS version:

    nouveau 0000:65:00.0: NVIDIA GP107 (137000a1)
    nouveau 0000:65:00.0: bios: version 86.07.51.00.04
    nouveau 0000:65:00.0: fb: 2048 MiB GDDR5
    [...]
    nouveau 0000:65:00.0: secboot: SEC2 failed to start
    nouveau 0000:65:00.0: sec2: unhandled intr 00000010
    nouveau 0000:65:00.0: gr: init failed, -22

Might be some further confusion as this motherboard has an onboard ASPEED A=
ST
2500, a Server Management Processor which also provides a 2D Video Graphics
Adapter.

Please let me know if I might be able to provide more information to identi=
fy
the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15572670930.BDc042B1.23476--

--===============0468687432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0468687432==--
