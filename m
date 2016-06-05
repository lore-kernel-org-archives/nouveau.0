From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Sun, 05 Jun 2016 12:37:17 +0000
Message-ID: <bug-94725-8800-bI408r9bgY@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1996126535=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1996126535==
Content-Type: multipart/alternative; boundary="14651302370.ABDBBD3ff.32607";
 charset="UTF-8"


--14651302370.ABDBBD3ff.32607
Date: Sun, 5 Jun 2016 12:37:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94725

--- Comment #19 from Tobias Jakobi <liquid.acid-hi6Y0CQ0nG0@public.gmane.org> ---
I think I'm seeing the same issue here on a Schenker XMG A506 notebook. The=
 NV
GPU is the dedicated one. AFAIK all display hardware is connected to the In=
tel
iGPU.

Kernel is vanilla 4.6.1. Actually this is the first kernel (and the first t=
ime)
that I try to use the dedicated GPU.

lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GM107M [GeForce GTX 9=
60M]
(rev a2)

Without runpm=3D0 even just calling DRI_PRIME=3D1 glxinfo leaves the system
unresponsive shortly afterwards. SysRq still works though.

Going to attach the part of the log in a second.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14651302370.ABDBBD3ff.32607
Date: Sun, 5 Jun 2016 12:37:17 +0000
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
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725">bug 94725<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liquid.acid&#64;gmx.net" title=3D"Tobias Jakobi &lt;liquid.acid&#64;gmx.net=
&gt;"> <span class=3D"fn">Tobias Jakobi</span></a>
</span></b>
        <pre>I think I'm seeing the same issue here on a Schenker XMG A506 =
notebook. The NV
GPU is the dedicated one. AFAIK all display hardware is connected to the In=
tel
iGPU.

Kernel is vanilla 4.6.1. Actually this is the first kernel (and the first t=
ime)
that I try to use the dedicated GPU.

lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GM107M [GeForce GTX 9=
60M]
(rev a2)

Without runpm=3D0 even just calling DRI_PRIME=3D1 glxinfo leaves the system
unresponsive shortly afterwards. SysRq still works though.

Going to attach the part of the log in a second.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14651302370.ABDBBD3ff.32607--

--===============1996126535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1996126535==--
