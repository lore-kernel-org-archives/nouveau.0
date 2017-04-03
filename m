From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98383] X server is crashing/eats 100% cpu when
 turning on monitor
Date: Mon, 03 Apr 2017 15:42:36 +0000
Message-ID: <bug-98383-8800-4FUTwmJdxb@http.bugs.freedesktop.org/>
References: <bug-98383-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0084169574=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98383-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0084169574==
Content-Type: multipart/alternative; boundary="14912341562.52D2.20312";
 charset="UTF-8"


--14912341562.52D2.20312
Date: Mon, 3 Apr 2017 15:42:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98383

Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #9 from Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> ---
Fixed with:
https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3De9418e=
434311336e905b70553a5ed740838d90ad

As for the 100% cpu endless loop - I cannot reproduce it anymore, so maybe =
it
is now fixed with some other unknown commit, besides it has its own bug rep=
ort:
https://bugs.freedesktop.org/show_bug.cgi?id=3D90482, so don't mix it up.

Thank you, Ilia!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14912341562.52D2.20312
Date: Mon, 3 Apr 2017 15:42:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:manio&#64=
;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;skyboo.net=
&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - X server is crashing/eats 100% cpu when turnin=
g on monitor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98383">bug 98383<=
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
   title=3D"RESOLVED FIXED - X server is crashing/eats 100% cpu when turnin=
g on monitor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98383#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - X server is crashing/eats 100% cpu when turnin=
g on monitor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98383">bug 98383<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
manio&#64;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;s=
kyboo.net&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span></b>
        <pre>Fixed with:
<a href=3D"https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?=
id=3De9418e434311336e905b70553a5ed740838d90ad">https://cgit.freedesktop.org=
/nouveau/xf86-video-nouveau/commit/?id=3De9418e434311336e905b70553a5ed74083=
8d90ad</a>

As for the 100% cpu endless loop - I cannot reproduce it anymore, so maybe =
it
is now fixed with some other unknown commit, besides it has its own bug rep=
ort:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg take 100% CPU when using multiple independent screen=
 configuration"
   href=3D"show_bug.cgi?id=3D90482">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D90482</a>, so don't mix it up.

Thank you, Ilia!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14912341562.52D2.20312--

--===============0084169574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0084169574==--
