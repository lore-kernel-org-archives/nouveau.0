From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Mon, 02 Nov 2015 08:45:52 +0000
Message-ID: <bug-90626-8800-x75adb5WZy@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1883770995=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1883770995==
Content-Type: multipart/alternative; boundary="1446453953.30783.1139"; charset="UTF-8"


--1446453953.30783.1139
Date: Mon, 2 Nov 2015 08:45:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

Ortwin Gl=C3=BCck <odi-L693kI9kcNY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #119333|0                           |1
        is obsolete|                            |

--- Comment #23 from Ortwin Gl=C3=BCck <odi-L693kI9kcNY@public.gmane.org> ---
Created attachment 119336
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D119336&action=3Dedit
acpidump (HP ZBook 15, nVidia GK106GLM [Quadro K2100M], BIOS v08/13/2014)

OK, here hexdump version. Slightly different hardware than Ren=C3=A9's.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1446453953.30783.1139
Date: Mon, 2 Nov 2015 08:45:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:odi&#64;o=
di.ch" title=3D"Ortwin Gl=C3=BCck &lt;odi&#64;odi.ch&gt;"> <span class=3D"f=
n">Ortwin Gl=C3=BCck</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #119333 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c23">Commen=
t # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
odi&#64;odi.ch" title=3D"Ortwin Gl=C3=BCck &lt;odi&#64;odi.ch&gt;"> <span c=
lass=3D"fn">Ortwin Gl=C3=BCck</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D119336=
" name=3D"attach_119336" title=3D"acpidump (HP ZBook 15, nVidia GK106GLM [Q=
uadro K2100M], BIOS v08/13/2014)">attachment 119336</a> <a href=3D"attachme=
nt.cgi?id=3D119336&amp;action=3Dedit" title=3D"acpidump (HP ZBook 15, nVidi=
a GK106GLM [Quadro K2100M], BIOS v08/13/2014)">[details]</a></span>
acpidump (HP ZBook 15, nVidia GK106GLM [Quadro K2100M], BIOS v08/13/2014)

OK, here hexdump version. Slightly different hardware than Ren=C3=A9's.</pr=
e>
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

--1446453953.30783.1139--

--===============1883770995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1883770995==--
