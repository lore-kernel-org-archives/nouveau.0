From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Fri, 19 Aug 2016 14:19:02 +0000
Message-ID: <bug-93887-8800-j7ZkGr9QkN@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0018740140=="
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


--===============0018740140==
Content-Type: multipart/alternative; boundary="14716163422.DB0fD1bbd.23496";
 charset="UTF-8"


--14716163422.DB0fD1bbd.23496
Date: Fri, 19 Aug 2016 14:19:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93887

--- Comment #55 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
I have just seen the following in my dmesg:

> dmesg | grep -i -e warn -e error
[    8.350192] ACPI Warning: SystemIO range
0x0000000000000428-0x000000000000042F conflicts with OpRegion
0x0000000000000400-0x000000000000047F (\PMIO) (20160422/utad
[    8.356598] ACPI Warning: SystemIO range
0x00000000000011B0-0x00000000000011BF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20160422/utad
[    8.363088] ACPI Warning: SystemIO range
0x0000000000001180-0x00000000000011AF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20160422/utad

Could it be that some of the s2ram problems are related with this ACPI-GPIO
conflicts?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14716163422.DB0fD1bbd.23496
Date: Fri, 19 Aug 2016 14:19:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93887#c55">Commen=
t # 55</a>
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
        <pre>I have just seen the following in my dmesg:

<span class=3D"quote">&gt; dmesg | grep -i -e warn -e error</span >
[    8.350192] ACPI Warning: SystemIO range
0x0000000000000428-0x000000000000042F conflicts with OpRegion
0x0000000000000400-0x000000000000047F (\PMIO) (20160422/utad
[    8.356598] ACPI Warning: SystemIO range
0x00000000000011B0-0x00000000000011BF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20160422/utad
[    8.363088] ACPI Warning: SystemIO range
0x0000000000001180-0x00000000000011AF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20160422/utad

Could it be that some of the s2ram problems are related with this ACPI-GPIO
conflicts?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14716163422.DB0fD1bbd.23496--

--===============0018740140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0018740140==--
