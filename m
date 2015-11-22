From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] [GF110] KDE plasma locks randomly due to
 crash of nouveau driver
Date: Sun, 22 Nov 2015 07:56:46 +0000
Message-ID: <bug-92971-8800-Sj50BdKtg4@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1695749519=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1695749519==
Content-Type: multipart/alternative; boundary="1448179006.B5a57d01.2843"; charset="UTF-8"


--1448179006.B5a57d01.2843
Date: Sun, 22 Nov 2015 07:56:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92971

Philippe Cond=C3=A9 <conde.philippe-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #9 from Philippe Cond=C3=A9 <conde.philippe-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> ---
Hello,

I have reinstalled the full system with the last snapchot of Opensuse
tumbleweed:
20151118 "Linux hpprol2 4.3.0-2-xen #1 SMP Sat Nov 14 16:19:19 UTC 2015
(734b32c) x86_64 x86_64 x86_64 GNU/Linux"=20
and the problem seems to have been solved. No more problem with corrupted
screen or locking.

So this  bug can be closed
Thanks for your help
Philippe

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448179006.B5a57d01.2843
Date: Sun, 22 Nov 2015 07:56:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:conde.phi=
lippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philippe&#64;sk=
ynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GF110] KDE plasma locks randomly due to crash=
 of nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971">bug 92971<=
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
   title=3D"RESOLVED FIXED - [GF110] KDE plasma locks randomly due to crash=
 of nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GF110] KDE plasma locks randomly due to crash=
 of nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971">bug 92971<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
conde.philippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philip=
pe&#64;skynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span></b>
        <pre>Hello,

I have reinstalled the full system with the last snapchot of Opensuse
tumbleweed:
20151118 &quot;Linux hpprol2 4.3.0-2-xen #1 SMP Sat Nov 14 16:19:19 UTC 2015
(734b32c) x86_64 x86_64 x86_64 GNU/Linux&quot;=20
and the problem seems to have been solved. No more problem with corrupted
screen or locking.

So this  bug can be closed
Thanks for your help
Philippe</pre>
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

--1448179006.B5a57d01.2843--

--===============1695749519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1695749519==--
