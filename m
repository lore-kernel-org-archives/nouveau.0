From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Fri, 19 Aug 2016 04:41:09 +0000
Message-ID: <bug-93887-8800-1zg8RSaOge@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1445468605=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1445468605==
Content-Type: multipart/alternative; boundary="14715816692.439ae.31653";
 charset="UTF-8"


--14715816692.439ae.31653
Date: Fri, 19 Aug 2016 04:41:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93887

--- Comment #54 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
 nvapeek 0x610000 0x20000 - without nouveau module loaded (63.03 KB,
text/plain)
2016-08-18 19:01 UTC,: taken directly before s2ram

 nvapeek 0x610000 0x20000 - after plain blackscreening s2ram - without nouv=
eau
module loaded (67.57 KB, text/plain)
2016-08-18 19:05 UTC,: the same bootup, directly after s2ram; taken blindly
with systemctl suspend; sleep 1; nvapeek ...

 nvapeek 0x610000 0x20000 - with nouveau module loaded, LVDS came up well
(kernel 4.7.0) (66.11 KB, text/plain)
2016-08-18 20:04 UTC,: another bootup (all three were tested with the same
kernel) into Xorg + graphics mode with nouveau; snapshot taken after s2ram,
integrated LVDS was o.k.; exterenal HDMI stayed black as always

> However, my G96 can now display an image on the external screen (miniDP -=
> HDMI through an adapter)

  Nice to hear; I hope that will help you forth!; - concerning adapters I o=
nly
have one for the other way round: UHD HDMI output -> DP input of one of my
monitors. The first adapter I ordered had blackscreened but after returning
that item I got a working one.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14715816692.439ae.31653
Date: Fri, 19 Aug 2016 04:41:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monit=
or stays black after s2ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93887#c54">Commen=
t # 54</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monit=
or stays black after s2ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93887">bug 93887<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
estellnb&#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elste=
l.org&gt;"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span></b>
        <pre> nvapeek 0x610000 0x20000 - without nouveau module loaded (63.=
03 KB,
text/plain)
2016-08-18 19:01 UTC,: taken directly before s2ram

 nvapeek 0x610000 0x20000 - after plain blackscreening s2ram - without nouv=
eau
module loaded (67.57 KB, text/plain)
2016-08-18 19:05 UTC,: the same bootup, directly after s2ram; taken blindly
with systemctl suspend; sleep 1; nvapeek ...

 nvapeek 0x610000 0x20000 - with nouveau module loaded, LVDS came up well
(kernel 4.7.0) (66.11 KB, text/plain)
2016-08-18 20:04 UTC,: another bootup (all three were tested with the same
kernel) into Xorg + graphics mode with nouveau; snapshot taken after s2ram,
integrated LVDS was o.k.; exterenal HDMI stayed black as always

<span class=3D"quote">&gt; However, my G96 can now display an image on the =
external screen (miniDP -&gt; HDMI through an adapter)</span >

  Nice to hear; I hope that will help you forth!; - concerning adapters I o=
nly
have one for the other way round: UHD HDMI output -&gt; DP input of one of =
my
monitors. The first adapter I ordered had blackscreened but after returning
that item I got a working one.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14715816692.439ae.31653--

--===============1445468605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1445468605==--
