From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98852] Nvidia graphics card fan not running or to
 slow, danger of overheating
Date: Fri, 25 Nov 2016 18:54:06 +0000
Message-ID: <bug-98852-8800-2VQiwcSRH0@http.bugs.freedesktop.org/>
References: <bug-98852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1325511091=="
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


--===============1325511091==
Content-Type: multipart/alternative; boundary="14801000460.2cD03.14718";
 charset="UTF-8"


--14801000460.2cD03.14718
Date: Fri, 25 Nov 2016 18:54:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98852

--- Comment #9 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to Martin Peres from comment #8)
> The documentation on how to set the fan speed is located here:
> https://www.kernel.org/doc/Documentation/thermal/nouveau_thermal
>=20
> However, it is quite likely that we do not configure the PWM controler
> properly. Looking at your vbios, I see that the expected frequency is 42k=
Hz
> which is quite high and may be the reason why your fan would not rotate
> properly (unless it is set to 100%).
>=20
> What would be really useful, would be for you to try to force the fan to
> 100%, by following the guide I sent you.

I guess you should also try other fan speeds too, report back when you have
tried.
The expected result would be for the fan to barely spin at 10% and gradually
spin up until reaching 100%. At 100%, the noise should be quite loud.

If this is the behaviour you see, then I would like you to set the fan mode=
 to
automatic (mode 2) and monitor the fan speed set by Nouveau by reading pwm1.

If the fan speed does not change with temperature, it would be useful to pa=
ste
here kernel logs with nouveau.debug=3D"ptherm=3Ddebug" set in your kernel c=
ommand
line (you can edit this from grub directly, when booting up).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14801000460.2cD03.14718
Date: Fri, 25 Nov 2016 18:54:06 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98852#c9">Comment=
 # 9</a>
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
        <pre>(In reply to Martin Peres from <a href=3D"show_bug.cgi?id=3D98=
852#c8">comment #8</a>)
<span class=3D"quote">&gt; The documentation on how to set the fan speed is=
 located here:
&gt; <a href=3D"https://www.kernel.org/doc/Documentation/thermal/nouveau_th=
ermal">https://www.kernel.org/doc/Documentation/thermal/nouveau_thermal</a>
&gt;=20
&gt; However, it is quite likely that we do not configure the PWM controler
&gt; properly. Looking at your vbios, I see that the expected frequency is =
42kHz
&gt; which is quite high and may be the reason why your fan would not rotate
&gt; properly (unless it is set to 100%).
&gt;=20
&gt; What would be really useful, would be for you to try to force the fan =
to
&gt; 100%, by following the guide I sent you.</span >

I guess you should also try other fan speeds too, report back when you have
tried.
The expected result would be for the fan to barely spin at 10% and gradually
spin up until reaching 100%. At 100%, the noise should be quite loud.

If this is the behaviour you see, then I would like you to set the fan mode=
 to
automatic (mode 2) and monitor the fan speed set by Nouveau by reading pwm1.

If the fan speed does not change with temperature, it would be useful to pa=
ste
here kernel logs with nouveau.debug=3D&quot;ptherm=3Ddebug&quot; set in you=
r kernel command
line (you can edit this from grub directly, when booting up).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14801000460.2cD03.14718--

--===============1325511091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1325511091==--
