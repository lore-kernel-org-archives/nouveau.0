From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110830] [nouveau] GeForce GTX 1660 Ti (mobile) not
 supported (NV168/TU116)
Date: Tue, 09 Jul 2019 18:39:51 +0000
Message-ID: <bug-110830-8800-mklHTDDqaR@http.bugs.freedesktop.org/>
References: <bug-110830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1656905743=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1656905743==
Content-Type: multipart/alternative; boundary="15626975910.b0Ffb.19395"
Content-Transfer-Encoding: 7bit


--15626975910.b0Ffb.19395
Date: Tue, 9 Jul 2019 18:39:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110830

--- Comment #14 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
To summarize the things. The offloading problem still needs to be examined =
at
the software level (it works only in Wayland). However, there is a workarou=
nd.
In the end, it turned out and in a model with GTX 1660 Ti, the mDP port is
connected to the Intel card. The external monitor works fine with a mDP->HD=
MI
adapter (with the NVidia card reported as DynOff).

@Ilia, thanks for your assistance!

Btw, it's too late for 5.2, but maybe GTX 1660 Ti will be natively supported
with nouveau (although "nouveau.config=3DNvChipset=3D0x167" works fine as a
workaround - probably the same stable as with GTX 1650 :) ).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15626975910.b0Ffb.19395
Date: Tue, 9 Jul 2019 18:39:51 +0000
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
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] GeForce GTX 1660 Ti (mobile) not supported (NV1=
68/TU116)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110830">bug 11083=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mszpak&#64;wp.pl" title=3D"Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <=
span class=3D"fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>To summarize the things. The offloading problem still needs to=
 be examined at
the software level (it works only in Wayland). However, there is a workarou=
nd.
In the end, it turned out and in a model with GTX 1660 Ti, the mDP port is
connected to the Intel card. The external monitor works fine with a mDP-&gt=
;HDMI
adapter (with the NVidia card reported as DynOff).

&#64;Ilia, thanks for your assistance!

Btw, it's too late for 5.2, but maybe GTX 1660 Ti will be natively supported
with nouveau (although &quot;nouveau.config=3DNvChipset=3D0x167&quot; works=
 fine as a
workaround - probably the same stable as with GTX 1650 :) ).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15626975910.b0Ffb.19395--

--===============1656905743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1656905743==--
