From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107325] Reported temperature of nvidia card with
 nouveau driver is wrong
Date: Sun, 22 Jul 2018 19:14:07 +0000
Message-ID: <bug-107325-8800-2Q0leFQMZb@http.bugs.freedesktop.org/>
References: <bug-107325-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0032966466=="
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


--===============0032966466==
Content-Type: multipart/alternative; boundary="15322868472.8b2a27E2.19072"
Content-Transfer-Encoding: 7bit


--15322868472.8b2a27E2.19072
Date: Sun, 22 Jul 2018 19:14:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107325

--- Comment #4 from Jirka Novak <j.novak-yL21p0u6sjaEIYLD/85Ykw@public.gmane.org> ---
Hi,

> Perhaps when it's runtime-suspended, the readings return all 1's, and we =
report
> 511 (0x1ff). Or some variation thereof.
>=20
> Jirka - if you boot with nouveau.runpm=3D0, I suspect the temperature wil=
l be
> fine -- good to check though.

yes, you are correct. It then returns 49-50 degrees.

                                                Best regards,

                                                        Jirka Novak

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15322868472.8b2a27E2.19072
Date: Sun, 22 Jul 2018 19:14:07 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107325#c4">Commen=
t # 4</a>
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

<span class=3D"quote">&gt; Perhaps when it's runtime-suspended, the reading=
s return all 1's, and we report
&gt; 511 (0x1ff). Or some variation thereof.
&gt;=20
&gt; Jirka - if you boot with nouveau.runpm=3D0, I suspect the temperature =
will be
&gt; fine -- good to check though.</span >

yes, you are correct. It then returns 49-50 degrees.

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

--15322868472.8b2a27E2.19072--

--===============0032966466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0032966466==--
