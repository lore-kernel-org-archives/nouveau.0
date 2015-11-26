From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93110] [NVE4] textureSize() and textureQueryLevels()
 uses a texture bound during the previous draw call
Date: Thu, 26 Nov 2015 08:09:21 +0000
Message-ID: <bug-93110-8800-AKyWUA3wBZ@http.bugs.freedesktop.org/>
References: <bug-93110-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1374659979=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93110-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1374659979==
Content-Type: multipart/alternative; boundary="1448525360.ACa4E00.16201"; charset="UTF-8"


--1448525360.ACa4E00.16201
Date: Thu, 26 Nov 2015 08:09:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D93110

J=C3=B3zef Kucia <joseph.kucia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from J=C3=B3zef Kucia <joseph.kucia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It works correctly in 11.2.0-devel (git-63b49e1). I guess it was fixed
meanwhile.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448525360.ACa4E00.16201
Date: Thu, 26 Nov 2015 08:09:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:joseph.ku=
cia&#64;gmail.com" title=3D"J=C3=B3zef Kucia &lt;joseph.kucia&#64;gmail.com=
&gt;"> <span class=3D"fn">J=C3=B3zef Kucia</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE4] textureSize() and textureQueryLevels() =
uses a texture bound during the previous draw call"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93110">bug 93110<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE4] textureSize() and textureQueryLevels() =
uses a texture bound during the previous draw call"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93110#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE4] textureSize() and textureQueryLevels() =
uses a texture bound during the previous draw call"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93110">bug 93110<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
joseph.kucia&#64;gmail.com" title=3D"J=C3=B3zef Kucia &lt;joseph.kucia&#64;=
gmail.com&gt;"> <span class=3D"fn">J=C3=B3zef Kucia</span></a>
</span></b>
        <pre>It works correctly in 11.2.0-devel (git-63b49e1). I guess it w=
as fixed
meanwhile.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448525360.ACa4E00.16201--

--===============1374659979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1374659979==--
