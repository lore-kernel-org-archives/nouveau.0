From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93670] Reverse PRIME using two external screens on
 Nvidia card leads to "Configure crtc 5 failed" since xorg-server 1.18.0
Date: Thu, 14 Jan 2016 03:33:26 +0000
Message-ID: <bug-93670-8800-jIeaEu9ByF@http.bugs.freedesktop.org/>
References: <bug-93670-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1867767016=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93670-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1867767016==
Content-Type: multipart/alternative; boundary="1452742406.B2EBD2.3098"; charset="UTF-8"


--1452742406.B2EBD2.3098
Date: Thu, 14 Jan 2016 03:33:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D93670

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Michel D=C3=A4nzer from comment #8)
> The xf86-video-nouveau needs a port of
> http://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/
> ?id=3Dff9a6b6f079a8419f4e6fadfee778060618bf735 .

This is done:
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3Db824d36=
c28124955eda4aced5e637aa75eea4d6c

Thomas, please reopen if the issue persists if you use xf86-video-nouveau f=
rom
git with xorg-server 1.18.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1452742406.B2EBD2.3098
Date: Thu, 14 Jan 2016 03:33:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Reverse PRIME using two external screens on Nv=
idia card leads to &quot;Configure crtc 5 failed&quot; since xorg-server 1.=
18.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93670">bug 93670<=
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
   title=3D"RESOLVED FIXED - Reverse PRIME using two external screens on Nv=
idia card leads to &quot;Configure crtc 5 failed&quot; since xorg-server 1.=
18.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93670#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Reverse PRIME using two external screens on Nv=
idia card leads to &quot;Configure crtc 5 failed&quot; since xorg-server 1.=
18.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93670">bug 93670<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D93670#c8">comment #8</a>)
<span class=3D"quote">&gt; The xf86-video-nouveau needs a port of
&gt; <a href=3D"http://cgit.freedesktop.org/xorg/driver/xf86-video-ati/comm=
it/">http://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/</a>
&gt; ?id=3Dff9a6b6f079a8419f4e6fadfee778060618bf735 .</span >

This is done:
<a href=3D"http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?i=
d=3Db824d36c28124955eda4aced5e637aa75eea4d6c">http://cgit.freedesktop.org/n=
ouveau/xf86-video-nouveau/commit/?id=3Db824d36c28124955eda4aced5e637aa75eea=
4d6c</a>

Thomas, please reopen if the issue persists if you use xf86-video-nouveau f=
rom
git with xorg-server 1.18.</pre>
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

--1452742406.B2EBD2.3098--

--===============1867767016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1867767016==--
