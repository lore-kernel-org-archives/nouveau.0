From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98852] Nvidia graphics card fan not running or to
 slow, danger of overheating
Date: Thu, 08 Dec 2016 10:28:00 +0000
Message-ID: <bug-98852-8800-UtG4yMZprX@http.bugs.freedesktop.org/>
References: <bug-98852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2134891421=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98852-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2134891421==
Content-Type: multipart/alternative; boundary="14811928791.cdcCDb8Cd.19887";
 charset="UTF-8"


--14811928791.cdcCDb8Cd.19887
Date: Thu, 8 Dec 2016 10:27:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98852

--- Comment #18 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to Egon Niessner from comment #17)
> Thanks for your help!
> With `cmake -G"Unix Makefiles" .
> I could translate the envytools Package.
>=20
> Here the Output with the nouveau driver and not runnung fan:
> nvapeek e114 10
> 0000e114: 00000001 00000000 00000000 80000000
>=20
>=20
> Here the Output with the original nvidia driver
> (Installed is the original NVIDIA Package
> NVIDIA-Linux-x86_64-340.96.run)
>=20
> nvapeek e114 120
> 0000e114: 00000001 00000000 00000020 00000003

Exactly what I did not want to see :s

Could you attach here your vbios? You can get it by running: nvagetbios -s =
prom
> vbios.rom

Please also add the output of: nvapeek 101000

Thanks in advance, you uncovered a deeper bug!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14811928791.cdcCDb8Cd.19887
Date: Thu, 8 Dec 2016 10:27:59 +0000
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
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia graphics card fan not running or to slow, danger o=
f overheating"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852">bug 98852<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to Egon Niessner from <a href=3D"show_bug.cgi?id=3D9=
8852#c17">comment #17</a>)
<span class=3D"quote">&gt; Thanks for your help!
&gt; With `cmake -G&quot;Unix Makefiles&quot; .
&gt; I could translate the envytools Package.
&gt;=20
&gt; Here the Output with the nouveau driver and not runnung fan:
&gt; nvapeek e114 10
&gt; 0000e114: 00000001 00000000 00000000 80000000
&gt;=20
&gt;=20
&gt; Here the Output with the original nvidia driver
&gt; (Installed is the original NVIDIA Package
&gt; NVIDIA-Linux-x86_64-340.96.run)
&gt;=20
&gt; nvapeek e114 120
&gt; 0000e114: 00000001 00000000 00000020 00000003</span >

Exactly what I did not want to see :s

Could you attach here your vbios? You can get it by running: nvagetbios -s =
prom
<span class=3D"quote">&gt; vbios.rom</span >

Please also add the output of: nvapeek 101000

Thanks in advance, you uncovered a deeper bug!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14811928791.cdcCDb8Cd.19887--

--===============2134891421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2134891421==--
