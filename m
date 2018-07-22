From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107325] Reported temperature of nvidia card with
 nouveau driver is wrong
Date: Sun, 22 Jul 2018 19:12:19 +0000
Message-ID: <bug-107325-8800-ZjWxUUp5hp@http.bugs.freedesktop.org/>
References: <bug-107325-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1661486609=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107325-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1661486609==
Content-Type: multipart/alternative; boundary="15322867392.DAde.18617"
Content-Transfer-Encoding: 7bit


--15322867392.DAde.18617
Date: Sun, 22 Jul 2018 19:12:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107325

--- Comment #3 from Jirka Novak <j.novak-yL21p0u6sjaEIYLD/85Ykw@public.gmane.org> ---
Hi,

> It would be helpful if you could download and build a nouveau-related deb=
ug
> toolkit, envytools [0], and run the following commands (inside the nva/
> subfolder):
>=20
> $ ./nvapeek 0x020460
>=20
> $ ./nvapeek 0x020400

Output is there, but I see different output for subsequent calls:

# nvapeek 0x020460
00020460: 20003170
# nvapeek 0x020460
00020460: 20003180
# nvapeek 0x020460
00020460: 200031a8
# nvapeek 0x020460
00020460: 200031a0
# nvapeek 0x020460
00020460: 200031e8

# nvapeek 0x020400
00020400: 00000030
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000032

> It would also be helpful to see a copy of your GPU's VBIOS attached here.=
 This
> can be produced by running the below command:
>=20
> $ cat /sys/kernel/debug/dri/0/vbios.rom > vbios.rom

File is attached.

                                        Best regards,

                                                        Jirka Novak

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15322867392.DAde.18617
Date: Sun, 22 Jul 2018 19:12:19 +0000
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
   title=3D"NEW - Reported temperature of nvidia card with nouveau driver i=
s wrong"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107325#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Reported temperature of nvidia card with nouveau driver i=
s wrong"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107325">bug 10732=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
j.novak&#64;netsystem.cz" title=3D"Jirka Novak &lt;j.novak&#64;netsystem.cz=
&gt;"> <span class=3D"fn">Jirka Novak</span></a>
</span></b>
        <pre>Hi,

<span class=3D"quote">&gt; It would be helpful if you could download and bu=
ild a nouveau-related debug
&gt; toolkit, envytools [0], and run the following commands (inside the nva/
&gt; subfolder):
&gt;=20
&gt; $ ./nvapeek 0x020460
&gt;=20
&gt; $ ./nvapeek 0x020400</span >

Output is there, but I see different output for subsequent calls:

# nvapeek 0x020460
00020460: 20003170
# nvapeek 0x020460
00020460: 20003180
# nvapeek 0x020460
00020460: 200031a8
# nvapeek 0x020460
00020460: 200031a0
# nvapeek 0x020460
00020460: 200031e8

# nvapeek 0x020400
00020400: 00000030
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000031
# nvapeek 0x020400
00020400: 00000032

<span class=3D"quote">&gt; It would also be helpful to see a copy of your G=
PU's VBIOS attached here. This
&gt; can be produced by running the below command:
&gt;=20
&gt; $ cat /sys/kernel/debug/dri/0/vbios.rom &gt; vbios.rom</span >

File is attached.

                                        Best regards,

                                                        Jirka Novak</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15322867392.DAde.18617--

--===============1661486609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1661486609==--
