From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Sun, 11 Dec 2016 12:12:24 +0000
Message-ID: <bug-80901-8800-4UH4AHB8rY@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1164961322=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1164961322==
Content-Type: multipart/alternative; boundary="14814583444.5ADb.7532";
 charset="UTF-8"


--14814583444.5ADb.7532
Date: Sun, 11 Dec 2016 12:12:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D80901

--- Comment #53 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to Lars E Pettersson from comment #52)
> Just an update that the bug is still there. Running kernel at the moment:
>=20
> Linux tux.home.rpz 4.8.11-200.fc24.x86_64 #1 SMP Mon Nov 28 19:36:57 UTC
> 2016 x86_64 x86_64 x86_64 GNU/Linux
>=20
> Will this bug be fixed?

Hey,

I have not forgotten you. I found the information in the table to do the ri=
ght
thing for your fan and I sort of managed to make sense of it... but I am
apparently unable to make a model of what the proprietary driver does :s It=
 is
so frustrating because I compute the right value most of the time, but when=
 I
don't the error is quite catastrophic.

I will now swallow my pride and ask for help from Nvidia :s

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14814583444.5ADb.7532
Date: Sun, 11 Dec 2016 12:12:24 +0000
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
   title=3D"NEW - [NVCF] PWM fan speed too high"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901#c53">Commen=
t # 53</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVCF] PWM fan speed too high"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901">bug 80901<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to Lars E Pettersson from <a href=3D"show_bug.cgi?id=
=3D80901#c52">comment #52</a>)
<span class=3D"quote">&gt; Just an update that the bug is still there. Runn=
ing kernel at the moment:
&gt;=20
&gt; Linux tux.home.rpz 4.8.11-200.fc24.x86_64 #1 SMP Mon Nov 28 19:36:57 U=
TC
&gt; 2016 x86_64 x86_64 x86_64 GNU/Linux
&gt;=20
&gt; Will this bug be fixed?</span >

Hey,

I have not forgotten you. I found the information in the table to do the ri=
ght
thing for your fan and I sort of managed to make sense of it... but I am
apparently unable to make a model of what the proprietary driver does :s It=
 is
so frustrating because I compute the right value most of the time, but when=
 I
don't the error is quite catastrophic.

I will now swallow my pride and ask for help from Nvidia :s</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14814583444.5ADb.7532--

--===============1164961322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1164961322==--
