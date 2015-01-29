From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84721] [NVC1] Nvidia Geforce GT 630 using nouveau on
 3.16 kernel. dangerous Fan speed
Date: Thu, 29 Jan 2015 20:26:01 +0000
Message-ID: <bug-84721-8800-wkov3n1A2k@http.bugs.freedesktop.org/>
References: <bug-84721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0201906426=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0201906426==
Content-Type: multipart/alternative; boundary="1422563161.c1c2C4.19006"; charset="UTF-8"


--1422563161.c1c2C4.19006
Date: Thu, 29 Jan 2015 20:26:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D84721

--- Comment #14 from Krzysztof Katowicz-Kowalewski <vnd-da06O8EuSQE@public.gmane.org> ---
After 7 tries... here's the culprit:

localhost linux # git bisect good
0e994d645627bb67088ae4860e9a0295b123f7b0 is the first bad commit
commit 0e994d645627bb67088ae4860e9a0295b123f7b0
Author: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Date:   Wed Feb 19 01:04:56 2014 +0100

    drm/nouveau/therm: let the vbios decide on the automatic fan management
mode

    This should fix automatic fan management on fermi cards who do not have
    0x46 entries in the thermal table.

    On my nve6, the blob sets the default linear range from 40=C2=B0C to 10=
0=C2=B0C
    but my nvcf's default values are 40=C2=B0C to 85=C2=B0C. Let's keep 85 =
as a default
    for everyone.

    Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
    Tested-by: Timoth=C3=A9e Ravier <tim-m/3gSgDDTkE@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 1a0d1ec08c6ffaf36f923a2b68c9f91e945bb299
96bf5f6667528a22493d3a6d4cec6b11ce09414d M      drivers

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1422563161.c1c2C4.19006
Date: Thu, 29 Jan 2015 20:26:01 +0000
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
   title=3D"NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel=
. dangerous Fan speed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D84721#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel=
. dangerous Fan speed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D84721">bug 84721<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vnd&#64;vndh.net" title=3D"Krzysztof Katowicz-Kowalewski &lt;vnd&#64;vndh.n=
et&gt;"> <span class=3D"fn">Krzysztof Katowicz-Kowalewski</span></a>
</span></b>
        <pre>After 7 tries... here's the culprit:

localhost linux # git bisect good
0e994d645627bb67088ae4860e9a0295b123f7b0 is the first bad commit
commit 0e994d645627bb67088ae4860e9a0295b123f7b0
Author: Martin Peres &lt;<a href=3D"mailto:martin.peres&#64;labri.fr">marti=
n.peres&#64;labri.fr</a>&gt;
Date:   Wed Feb 19 01:04:56 2014 +0100

    drm/nouveau/therm: let the vbios decide on the automatic fan management
mode

    This should fix automatic fan management on fermi cards who do not have
    0x46 entries in the thermal table.

    On my nve6, the blob sets the default linear range from 40=C2=B0C to 10=
0=C2=B0C
    but my nvcf's default values are 40=C2=B0C to 85=C2=B0C. Let's keep 85 =
as a default
    for everyone.

    Signed-off-by: Martin Peres &lt;<a href=3D"mailto:martin.peres&#64;labr=
i.fr">martin.peres&#64;labri.fr</a>&gt;
    Tested-by: Timoth=C3=A9e Ravier &lt;<a href=3D"mailto:tim&#64;siosm.fr"=
>tim&#64;siosm.fr</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com"=
>bskeggs&#64;redhat.com</a>&gt;

:040000 040000 1a0d1ec08c6ffaf36f923a2b68c9f91e945bb299
96bf5f6667528a22493d3a6d4cec6b11ce09414d M      drivers</pre>
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

--1422563161.c1c2C4.19006--

--===============0201906426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0201906426==--
