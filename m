From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101764] [regression] eaa2c988033b breaks GTX1050TI
 (GP107 / NV137)
Date: Wed, 12 Jul 2017 10:22:05 +0000
Message-ID: <bug-101764-8800-rgsF2HPFLi@http.bugs.freedesktop.org/>
References: <bug-101764-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0065823338=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101764-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0065823338==
Content-Type: multipart/alternative; boundary="14998549250.1cEcD9b.22354";
 charset="UTF-8"


--14998549250.1cEcD9b.22354
Date: Wed, 12 Jul 2017 10:22:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101764

--- Comment #1 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Carlo Caione from comment #0)
> Created attachment 132629 [details]
> GP107_regression_oops_log
>=20
> Hi,
> we have verified that commit eaa2c988033b ("drm/nouveau/gr/gp107: initial
> support") is actually breaking the GTX1050TI on an Acer laptop.
> It's not possible to reach Xorg anymore and the journal is filled with Oo=
ps
> as shown in the attachment.
>=20
> Thanks,

in that commit initial acceleration support for GP107 GPUs were added which
means there are more places to mess up. As a workaround you can boot with
nouveau.modeset=3D0 or nouveau.noaccel=3D1.

The real issue is something else, but this should give you at least a worki=
ng
setup again.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14998549250.1cEcD9b.22354
Date: Wed, 12 Jul 2017 10:22:05 +0000
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
   title=3D"NEW - [regression] eaa2c988033b breaks GTX1050TI (GP107 / NV137=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101764#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression] eaa2c988033b breaks GTX1050TI (GP107 / NV137=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101764">bug 10176=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Carlo Caione from <a href=3D"show_bug.cgi?id=3D10=
1764#c0">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D132629" name=3D"attach_132629" title=3D"GP107_regression_oops_log">=
attachment 132629</a> <a href=3D"attachment.cgi?id=3D132629&amp;action=3Ded=
it" title=3D"GP107_regression_oops_log">[details]</a></span>
&gt; GP107_regression_oops_log
&gt;=20
&gt; Hi,
&gt; we have verified that commit eaa2c988033b (&quot;drm/nouveau/gr/gp107:=
 initial
&gt; support&quot;) is actually breaking the GTX1050TI on an Acer laptop.
&gt; It's not possible to reach Xorg anymore and the journal is filled with=
 Oops
&gt; as shown in the attachment.
&gt;=20
&gt; Thanks,</span >

in that commit initial acceleration support for GP107 GPUs were added which
means there are more places to mess up. As a workaround you can boot with
nouveau.modeset=3D0 or nouveau.noaccel=3D1.

The real issue is something else, but this should give you at least a worki=
ng
setup again.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14998549250.1cEcD9b.22354--

--===============0065823338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0065823338==--
