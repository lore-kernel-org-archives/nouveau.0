From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Wed, 12 Oct 2016 14:11:00 +0000
Message-ID: <bug-70972-8800-l4lZ9lpPki@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0451052222=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0451052222==
Content-Type: multipart/alternative; boundary="14762814603.Ab255F52.17399";
 charset="UTF-8"


--14762814603.Ab255F52.17399
Date: Wed, 12 Oct 2016 14:11:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70972

--- Comment #22 from Nerijus Bali=C5=ABnas <nerijus-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> =
---
I have GeForce 7150M / nForce 630M and it shows garbled screen with 1280x800
resolution. 1024x768 works OK, as well as proprietary nvidia driver.
I tried a few modelines generated with cvt 1280 800, cvt 1280 800 59, cvt 1=
280
800 57, cvt 1280 800 50 - does not help, still the garbled screen. Adding
nouveau.config=3DNvMSI=3D0 to kernel boot line did not help neither.
Fedora 25 beta, xorg-x11-drv-nouveau-1.0.13-1.fc25.x86_64.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14762814603.Ab255F52.17399
Date: Wed, 12 Oct 2016 14:11:00 +0000
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
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972#c22">Commen=
t # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972">bug 70972<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nerijus&#64;users.sourceforge.net" title=3D"Nerijus Bali=C5=ABnas &lt;nerij=
us&#64;users.sourceforge.net&gt;"> <span class=3D"fn">Nerijus Bali=C5=ABnas=
</span></a>
</span></b>
        <pre>I have GeForce 7150M / nForce 630M and it shows garbled screen=
 with 1280x800
resolution. 1024x768 works OK, as well as proprietary nvidia driver.
I tried a few modelines generated with cvt 1280 800, cvt 1280 800 59, cvt 1=
280
800 57, cvt 1280 800 50 - does not help, still the garbled screen. Adding
nouveau.config=3DNvMSI=3D0 to kernel boot line did not help neither.
Fedora 25 beta, xorg-x11-drv-nouveau-1.0.13-1.fc25.x86_64.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14762814603.Ab255F52.17399--

--===============0451052222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0451052222==--
