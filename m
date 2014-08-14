From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Thu, 14 Aug 2014 07:20:07 +0000
Message-ID: <bug-82527-8800-nZBq4BOo3n@http.bugs.freedesktop.org/>
References: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0468718047=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82527-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0468718047==
Content-Type: multipart/alternative; boundary="1408000807.Cbdb5E11.23276"; charset="us-ascii"


--1408000807.Cbdb5E11.23276
Date: Thu, 14 Aug 2014 07:20:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D82527

Martin V=C3=A4th <martin-hvkNLsi7f8w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #104544|0                           |1
        is obsolete|                            |
 Attachment #104594|0                           |1
        is obsolete|                            |

--- Comment #7 from Martin V=C3=A4th <martin-hvkNLsi7f8w@public.gmane.org> ---
Created attachment 104604
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D104604&action=3Dedit
boot.log

Still no output with "xdpms force off" (tried several times).

At a few minutes later (I cannot associate to an action of me) there appear=
ed:

[kernel] nouveau T[   VBIOS][0000:01:00.0] inc() =3D=3D 3
[kernel] nouveau T[   VBIOS][0000:01:00.0] dec() =3D=3D 2

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1408000807.Cbdb5E11.23276
Date: Thu, 14 Aug 2014 07:20:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:martin&#6=
4;mvath.de" title=3D"Martin V=C3=A4th &lt;martin&#64;mvath.de&gt;"> <span c=
lass=3D"fn">Martin V=C3=A4th</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - xset dpms force {off,standby,suspend} returns after ~=
20 seconds (GeForce 8400 GS)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82527">bug 82527<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #104544 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #104594 is obsolete</=
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
   title=3D"NEW --- - xset dpms force {off,standby,suspend} returns after ~=
20 seconds (GeForce 8400 GS)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82527#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - xset dpms force {off,standby,suspend} returns after ~=
20 seconds (GeForce 8400 GS)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82527">bug 82527<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin&#64;mvath.de" title=3D"Martin V=C3=A4th &lt;martin&#64;mvath.de&gt;"=
> <span class=3D"fn">Martin V=C3=A4th</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D104604=
" name=3D"attach_104604" title=3D"boot.log">attachment 104604</a> <a href=
=3D"attachment.cgi?id=3D104604&amp;action=3Dedit" title=3D"boot.log">[detai=
ls]</a></span>
boot.log

Still no output with &quot;xdpms force off&quot; (tried several times).

At a few minutes later (I cannot associate to an action of me) there appear=
ed:

[kernel] nouveau T[   VBIOS][0000:01:00.0] inc() =3D=3D 3
[kernel] nouveau T[   VBIOS][0000:01:00.0] dec() =3D=3D 2</pre>
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

--1408000807.Cbdb5E11.23276--

--===============0468718047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0468718047==--
