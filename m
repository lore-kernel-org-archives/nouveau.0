From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69882] [NVE6] GPU lockups
Date: Sun, 08 Nov 2015 11:33:12 +0000
Message-ID: <bug-69882-8800-EhIUEuTtuI@http.bugs.freedesktop.org/>
References: <bug-69882-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0798720849=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69882-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0798720849==
Content-Type: multipart/alternative; boundary="1446982392.dA0ECB82.26465"; charset="UTF-8"


--1446982392.dA0ECB82.26465
Date: Sun, 8 Nov 2015 11:33:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69882

Dainius Masili=C5=ABnas <pastas4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
                URL|https://bugzilla.novell.com |
                   |/show_bug.cgi?id=3D842838     |
           See Also|                            |https://bugzilla.novell.com
                   |                            |/show_bug.cgi?id=3D842838,
                   |                            |https://bugzilla.redhat.com
                   |                            |/show_bug.cgi?id=3D918732
         Resolution|DUPLICATE                   |---

--- Comment #14 from Dainius Masili=C5=ABnas <pastas4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Reopened as per bug #72180 suggestions.

To make it clear, this is about random GPU lockups of GTX 660 (mine's
Gainward), where using PGRAPH firmware from the blob does not fix the issue.

Interestingly enough, looks like there is an equivalent (albeit also messy)=
 bug
opened for Fedora (see See Also), and it appears to be a race condition. So
trying the patch in that bug might be a good idea. Alternatively they sugge=
st
booting with nouveau.noaccel=3D1. I'll see if I can test this.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1446982392.dA0ECB82.26465
Date: Sun, 8 Nov 2015 11:33:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pastas4&#=
64;gmail.com" title=3D"Dainius Masili=C5=ABnas &lt;pastas4&#64;gmail.com&gt=
;"> <span class=3D"fn">Dainius Masili=C5=ABnas</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882">bug 69882<=
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
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">URL</td>
           <td>https://bugzilla.novell.com/show_bug.cgi?id=3D842838
           </td>
           <td>
               &nbsp;
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugzilla.novell.com/show_bug.cgi?id=3D842838, https:=
//bugzilla.redhat.com/show_bug.cgi?id=3D918732
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>DUPLICATE
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882">bug 69882<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pastas4&#64;gmail.com" title=3D"Dainius Masili=C5=ABnas &lt;pastas4&#64;gma=
il.com&gt;"> <span class=3D"fn">Dainius Masili=C5=ABnas</span></a>
</span></b>
        <pre>Reopened as per <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [NVE6] Random GPU Lockups, works with blob P=
GRAPH fw"
   href=3D"show_bug.cgi?id=3D72180">bug #72180</a> suggestions.

To make it clear, this is about random GPU lockups of GTX 660 (mine's
Gainward), where using PGRAPH firmware from the blob does not fix the issue.

Interestingly enough, looks like there is an equivalent (albeit also messy)=
 bug
opened for Fedora (see See Also), and it appears to be a race condition. So
trying the patch in that bug might be a good idea. Alternatively they sugge=
st
booting with nouveau.noaccel=3D1. I'll see if I can test this.</pre>
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

--1446982392.dA0ECB82.26465--

--===============0798720849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0798720849==--
