From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] [NVC1] Display corruption when DP connector
 is reattached
Date: Fri, 08 May 2015 18:17:56 +0000
Message-ID: <bug-78439-8800-kVcxtT1S4z@http.bugs.freedesktop.org/>
References: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1530914033=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78439-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1530914033==
Content-Type: multipart/alternative; boundary="1431109076.3C617f6c1.31293"; charset="UTF-8"


--1431109076.3C617f6c1.31293
Date: Fri, 8 May 2015 18:17:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78439

Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #100924|0                           |1
        is obsolete|                            |
 Attachment #101299|0                           |1
        is obsolete|                            |

--- Comment #24 from Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> ---
Created attachment 115643
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D115643&action=3Dedit
dmesg.txt (higher modes)

Ilia asked to create dmesg with the following nouveau_dp_rates[] enabled:

{  648000, 0x06, 4 },
{  324000, 0x06, 2 },
{  162000, 0x06, 1 },

In this 648 mode the whole screen flickers a lot (no reattaching is necessa=
ry
to reproduce it, it happens immediately)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1431109076.3C617f6c1.31293
Date: Fri, 8 May 2015 18:17:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:andrius&#=
64;stikonas.eu" title=3D"Andrius =C5=A0tikonas &lt;andrius&#64;stikonas.eu&=
gt;"> <span class=3D"fn">Andrius =C5=A0tikonas</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] Display corruption when DP connector is reattached"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439">bug 78439<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #100924 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #101299 is obsolete</=
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
   title=3D"NEW - [NVC1] Display corruption when DP connector is reattached"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] Display corruption when DP connector is reattached"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439">bug 78439<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrius&#64;stikonas.eu" title=3D"Andrius =C5=A0tikonas &lt;andrius&#64;sti=
konas.eu&gt;"> <span class=3D"fn">Andrius =C5=A0tikonas</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D115643=
" name=3D"attach_115643" title=3D"dmesg.txt (higher modes)">attachment 1156=
43</a> <a href=3D"attachment.cgi?id=3D115643&amp;action=3Dedit" title=3D"dm=
esg.txt (higher modes)">[details]</a></span>
dmesg.txt (higher modes)

Ilia asked to create dmesg with the following nouveau_dp_rates[] enabled:

{  648000, 0x06, 4 },
{  324000, 0x06, 2 },
{  162000, 0x06, 1 },

In this 648 mode the whole screen flickers a lot (no reattaching is necessa=
ry
to reproduce it, it happens immediately)</pre>
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

--1431109076.3C617f6c1.31293--

--===============1530914033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1530914033==--
