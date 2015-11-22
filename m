From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Sun, 22 Nov 2015 04:27:07 +0000
Message-ID: <bug-71659-8800-H4cwoYIm8E@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0176141800=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0176141800==
Content-Type: multipart/alternative; boundary="1448166427.cfcb1.8534"; charset="UTF-8"


--1448166427.cfcb1.8534
Date: Sun, 22 Nov 2015 04:27:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D71659

Viorel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu <rapiteanu.catalin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |high
           Severity|normal                      |major

--- Comment #29 from Viorel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu <rapitean=
u.catalin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Downgrading libdrm from 2.4.65 to 2.4.64, the kernel to 4.2.3 and xorg-serv=
er
to 1.17.2 hasn't changed the behaviour. If there is anything else I should =
try,
leave a message.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1448166427.cfcb1.8534
Date: Sun, 22 Nov 2015 04:27:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:rapiteanu=
.catalin&#64;gmail.com" title=3D"Viorel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Bea=
nu &lt;rapiteanu.catalin&#64;gmail.com&gt;"> <span class=3D"fn">Viorel-C=C4=
=83t=C4=83lin R=C4=83pi=C8=9Beanu</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659">bug 71659<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>high
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>normal
           </td>
           <td>major
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659#c29">Commen=
t # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71659">bug 71659<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rapiteanu.catalin&#64;gmail.com" title=3D"Viorel-C=C4=83t=C4=83lin R=C4=83p=
i=C8=9Beanu &lt;rapiteanu.catalin&#64;gmail.com&gt;"> <span class=3D"fn">Vi=
orel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu</span></a>
</span></b>
        <pre>Downgrading libdrm from 2.4.65 to 2.4.64, the kernel to 4.2.3 =
and xorg-server
to 1.17.2 hasn't changed the behaviour. If there is anything else I should =
try,
leave a message.</pre>
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

--1448166427.cfcb1.8534--

--===============0176141800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0176141800==--
