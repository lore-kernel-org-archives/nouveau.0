From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
Date: Sat, 26 Oct 2019 14:06:28 +0000
Message-ID: <bug-112070-8800-tWLg5A7xTp@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0966772922=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-112070-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0966772922==
Content-Type: multipart/alternative; boundary="15720987880.4eD0bb6.10690"
Content-Transfer-Encoding: 7bit


--15720987880.4eD0bb6.10690
Date: Sat, 26 Oct 2019 14:06:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #24 from Doobz <dooby.dave-J1btbF6uMEmsTnJN9+BGXg@public.gmane.org> ---
Turns out opensuse tumbleweed has mesa 19.1.7 and a packaged glmark2

Framerate much slower than on previous kernel/mesa. Only getting ~130 vs >2=
00
previously.

Identical graphical glitch on laptop and desktop with Suse Welcome window.

The only shared dmesg oddities are
[    0.202564] acpi PNP0A08:00: _OSC failed (AE_NOT_FOUND); disabling ASPM

[            ] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM

..and the hpet warnings on both of them

[ 1670.140263] CE: hpet increased min_delta_ns to 30172 nsec

I will attach both suse dmesg logs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720987880.4eD0bb6.10690
Date: Sat, 26 Oct 2019 14:06:28 +0000
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
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dooby.dave&#64;virgin.net" title=3D"Doobz &lt;dooby.dave&#64;virgin.net&gt;=
"> <span class=3D"fn">Doobz</span></a>
</span></b>
        <pre>Turns out opensuse tumbleweed has mesa 19.1.7 and a packaged g=
lmark2

Framerate much slower than on previous kernel/mesa. Only getting ~130 vs &g=
t;200
previously.

Identical graphical glitch on laptop and desktop with Suse Welcome window.

The only shared dmesg oddities are
[    0.202564] acpi PNP0A08:00: _OSC failed (AE_NOT_FOUND); disabling ASPM

[            ] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM

..and the hpet warnings on both of them

[ 1670.140263] CE: hpet increased min_delta_ns to 30172 nsec

I will attach both suse dmesg logs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720987880.4eD0bb6.10690--

--===============0966772922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0966772922==--
