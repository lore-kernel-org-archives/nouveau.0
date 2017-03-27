From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Mon, 27 Mar 2017 17:19:28 +0000
Message-ID: <bug-98386-8800-A8n9yO8Hph@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1480866865=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1480866865==
Content-Type: multipart/alternative; boundary="14906351672.D8DaAEdf.4518";
 charset="UTF-8"


--14906351672.D8DaAEdf.4518
Date: Mon, 27 Mar 2017 17:19:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

Bob Bugzilla <bugzilla-QDUPAvFnyULR7s880joybQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |high
                 CC|                            |bugzilla-QDUPAvFnyULR7s880joybQ@public.gmane.org
           Severity|minor                       |major

--- Comment #4 from Bob Bugzilla <bugzilla-QDUPAvFnyULR7s880joybQ@public.gmane.org> ---
Seeing this same issue in the latest Fedora 25 updates.

Will post dmesg output.

This is for a NVE7 (GK107) GK107GLM [Quadro K1100M] chip.
It is a hybrid solution with an Intel i915 (VGA) in front of the nVidia chi=
p.
The nVidia chips is not usable as a display device, it just handles 3D for =
the
intel chip.

# inxi -Fzx
System:    Host: xyzzy Kernel: 4.9.14-200.fc25.x86_64 x86_64 (64 bit gcc:
6.3.1)
           Desktop: Cinnamon 3.2.8 (Gtk 3.22.10) Distro: Fedora release 25
(Twenty Five)
Machine:   Device: portable System: Dell product: Dell Precision M3800 v: A=
09
           Mobo: Dell model: Dell Precision M3800 v: A09 BIOS: Dell v: A09
date: 01/08/2015
CPU:       Quad core Intel Core i7-4712HQ (-HT-MCP-) cache: 6144 KB
           flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) bmips: 18358
           clock speeds: max: 3300 MHz 1: 799 MHz 2: 799 MHz 3: 799 MHz 4: =
799
MHz 5: 800 MHz 6: 799 MHz
           7: 800 MHz 8: 799 MHz
Graphics:  Card-1: Intel 4th Gen Core Processor Integrated Graphics Control=
ler
bus-ID: 00:02.0
           Card-2: NVIDIA GK107GLM [Quadro K1100M] bus-ID: 02:00.0
           Display Server: Fedora X.org 119.1 drivers: nouveau,intel (unloa=
ded:
modesetting,fbdev,vesa)
           Resolution: 1920x1080-qEAkLYPErqw@public.gmane.org, 2560x1440-UUa59ato0MI@public.gmane.org
           GLX Renderer: Mesa DRI Intel Haswell Mobile GLX Version: 3.0 Mesa
13.0.4 Direct Rendering: Yes

Will post dmesg output.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14906351672.D8DaAEdf.4518
Date: Mon, 27 Mar 2017 17:19:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:bugzilla&=
#64;scrunch.net" title=3D"Bob Bugzilla &lt;bugzilla&#64;scrunch.net&gt;"> <=
span class=3D"fn">Bob Bugzilla</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>high
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>bugzilla&#64;scrunch.net
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>minor
           </td>
           <td>major
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bugzilla&#64;scrunch.net" title=3D"Bob Bugzilla &lt;bugzilla&#64;scrunch.ne=
t&gt;"> <span class=3D"fn">Bob Bugzilla</span></a>
</span></b>
        <pre>Seeing this same issue in the latest Fedora 25 updates.

Will post dmesg output.

This is for a NVE7 (GK107) GK107GLM [Quadro K1100M] chip.
It is a hybrid solution with an Intel i915 (VGA) in front of the nVidia chi=
p.
The nVidia chips is not usable as a display device, it just handles 3D for =
the
intel chip.

# inxi -Fzx
System:    Host: xyzzy Kernel: 4.9.14-200.fc25.x86_64 x86_64 (64 bit gcc:
6.3.1)
           Desktop: Cinnamon 3.2.8 (Gtk 3.22.10) Distro: Fedora release 25
(Twenty Five)
Machine:   Device: portable System: Dell product: Dell Precision M3800 v: A=
09
           Mobo: Dell model: Dell Precision M3800 v: A09 BIOS: Dell v: A09
date: 01/08/2015
CPU:       Quad core Intel Core i7-4712HQ (-HT-MCP-) cache: 6144 KB
           flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) bmips: 18358
           clock speeds: max: 3300 MHz 1: 799 MHz 2: 799 MHz 3: 799 MHz 4: =
799
MHz 5: 800 MHz 6: 799 MHz
           7: 800 MHz 8: 799 MHz
Graphics:  Card-1: Intel 4th Gen Core Processor Integrated Graphics Control=
ler
bus-ID: 00:02.0
           Card-2: NVIDIA GK107GLM [Quadro K1100M] bus-ID: 02:00.0
           Display Server: Fedora X.org 119.1 drivers: nouveau,intel (unloa=
ded:
modesetting,fbdev,vesa)
           Resolution: <a href=3D"mailto:1920x1080&#64;60.00hz">1920x1080&#=
64;60.00hz</a>, <a href=3D"mailto:2560x1440&#64;59.95hz">2560x1440&#64;59.9=
5hz</a>
           GLX Renderer: Mesa DRI Intel Haswell Mobile GLX Version: 3.0 Mesa
13.0.4 Direct Rendering: Yes

Will post dmesg output.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14906351672.D8DaAEdf.4518--

--===============1480866865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1480866865==--
