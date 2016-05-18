From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94342] Nvidia G96GLM 3840x2160@30 not functional
	with nouveau
Date: Wed, 18 May 2016 12:35:41 +0000
Message-ID: <bug-94342-8800-xN4UhZIhmp@http.bugs.freedesktop.org/>
References: <bug-94342-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0383591007=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94342-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0383591007==
Content-Type: multipart/alternative; boundary="14635749410.Cc93f.24450";
 charset="UTF-8"


--14635749410.Cc93f.24450
Date: Wed, 18 May 2016 12:35:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94342

Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #9 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
  As it turned out a refresh rate of 30Hz can be achieved with the OSS-driv=
er
and the right modeline:

  Modeline "3840x2160_30.00"  268.06  3840 3992 4080 4112  2160 2161 2164 2=
173
+hsync -vsync

  It is a trick to set nouveau.hdmimhz=3D296 instead of 297 in order to pre=
vent
the automatic mode requiring a higher TMDS frequency to appear automatically
which blackens the screen. Once a mode with too high frequency has been set=
 the
external monitor will stay without signal until I reboot. In a practice the
TMDS limit may neither be 225 nor 297 but somewhere in between.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14635749410.Cc93f.24450
Date: Wed, 18 May 2016 12:35:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:estellnb&=
#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;=
"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Nvidia G96GLM 3840x2160&#64;30 not functi=
onal with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94342">bug 94342<=
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
           <td>WORKSFORME
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Nvidia G96GLM 3840x2160&#64;30 not functi=
onal with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94342#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Nvidia G96GLM 3840x2160&#64;30 not functi=
onal with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94342">bug 94342<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
estellnb&#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elste=
l.org&gt;"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>  As it turned out a refresh rate of 30Hz can be achieved with=
 the OSS-driver
and the right modeline:

  Modeline &quot;3840x2160_30.00&quot;  268.06  3840 3992 4080 4112  2160 2=
161 2164 2173
+hsync -vsync

  It is a trick to set nouveau.hdmimhz=3D296 instead of 297 in order to pre=
vent
the automatic mode requiring a higher TMDS frequency to appear automatically
which blackens the screen. Once a mode with too high frequency has been set=
 the
external monitor will stay without signal until I reboot. In a practice the
TMDS limit may neither be 225 nor 297 but somewhere in between.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14635749410.Cc93f.24450--

--===============0383591007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0383591007==--
