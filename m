From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] NV34 Fx5200 & NVC3/Quadro 2000M
 both fail to resume with commit 'convert to exec engine,
 and improve channel sync'
Date: Mon, 24 Dec 2012 15:03:53 +0000
Message-ID: <bug-50121-8800-kR96y9pFi8@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815242444=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0815242444==
Content-Type: multipart/alternative; boundary="1356361433.Ff4d13.6139"; charset="us-ascii"


--1356361433.Ff4d13.6139
Date: Mon, 24 Dec 2012 15:03:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D50121

--- Comment #30 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Kewl, that means that this regression is spread across several cards if you
purely look at the symptoms.

- NV40 generation card (0x049200a2)
- twice on an NV34 [GeForce FX 5200] (IRC: FX5200 is an 'odd beast' :/)
- NVC3 (2000M)
- EVGA GeForce 450 GTS

From two of these, the regression has been confirmed to be resulting from
commit:

'drm/nouveau/fence: convert to exec engine, and improve channel sync'

as part of the nouveau rework that got upstreamed in kernel 3.5:

- NV34 [GeForce FX 5200] by me
- NVC3 (2000M) by Michael Weirauch

I think it's safe to assume that ppl who are experiencing this regression as
well using a kernel on 3.5 or above are suffering from the same issue.

Francoism is using 3.6, so that is okay.

@Rapha=C3=ABl Droz: What kernel version are you using? And maybe the kernel=
 version
from Mr-4 might be useful as well. Just to confirm.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1356361433.Ff4d13.6139
Date: Mon, 24 Dec 2012 15:03:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both=
 fail to resume with commit 'convert to exec engine, and improve channel sy=
nc'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50121#c30">Commen=
t # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both=
 fail to resume with commit 'convert to exec engine, and improve channel sy=
nc'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50121">bug 50121<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ronald645&#64;gmail.com" title=3D"Ronald &lt;ronald645&#64;gmail.com&gt;"> =
<span class=3D"fn">Ronald</span></a>
</span></b>
        <pre>Kewl, that means that this regression is spread across several=
 cards if you
purely look at the symptoms.

- NV40 generation card (0x049200a2)
- twice on an NV34 [GeForce FX 5200] (IRC: FX5200 is an 'odd beast' :/)
- NVC3 (2000M)
- EVGA GeForce 450 GTS

From two of these, the regression has been confirmed to be resulting from
commit:

'drm/nouveau/fence: convert to exec engine, and improve channel sync'

as part of the nouveau rework that got upstreamed in kernel 3.5:

- NV34 [GeForce FX 5200] by me
- NVC3 (2000M) by Michael Weirauch

I think it's safe to assume that ppl who are experiencing this regression as
well using a kernel on 3.5 or above are suffering from the same issue.

Francoism is using 3.6, so that is okay.

&#64;Rapha=C3=ABl Droz: What kernel version are you using? And maybe the ke=
rnel version
from Mr-4 might be useful as well. Just to confirm.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356361433.Ff4d13.6139--

--===============0815242444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0815242444==--
