From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107628] New: On GeForce 8200M G,
 driver reports wild temperature fluctuations,
 effectively blocking the system at boot
Date: Mon, 20 Aug 2018 18:43:44 +0000
Message-ID: <bug-107628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0867159453=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0867159453==
Content-Type: multipart/alternative; boundary="15347906251.A14C8C5b.14126"
Content-Transfer-Encoding: 7bit


--15347906251.A14C8C5b.14126
Date: Mon, 20 Aug 2018 18:43:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107628

            Bug ID: 107628
           Summary: On GeForce 8200M G, driver reports wild temperature
                    fluctuations, effectively blocking the system at boot
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rbergen-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

First off, I want to state that I'm aware that I am filing a report that
concerns a Compaq Presario CQ60 which a) is close to 10 years old, and b) m=
ay
well have the worst GPU cooling setup in the history of computing. I will
therefore completely understand if everybody here concludes they have better
ways to spend their time than worrying about this.

That said, the CQ60 has an GeForce 8200M G built in and I'm running Gentoo
x86_64 on said laptop with kernel version 4.14.63.=20

When I boot the laptop with nouveau either built into the kernel or as a
module, as soon as the driver loads, the screen is continuously flooded with
messages relating to the GPU temperature either hitting or going below a ra=
nge
of thresholds. The messages have the format:=20

[<timestamp>] nouveau 0000:02:00.0: therm: temperature (<x> C) hit/went bel=
ow
the '<threshold>' threshold

The temperatures reported vary wildly between subsequent messages, as in
literally jumping from between below 0 and well above 150 degrees (and vice
versa).

When this happens I am unable to use Ctrl-Alt-Del to reboot and have to do a
hard power-down for it to stop. I can boot successfully provided I pass
nouveau.modeset=3D0 on the kernel command line.

I am currently unable to provide dmesg output as the problem occurs during =
boot
before a command prompt is presented that I could use to secure the log. I =
do
have a mobile phone video recording available of the laptop screen when the
problem occurs, in case that helps.

Windows 10 runs fine on this laptop with the nVidia drivers it pulls off the
Internet during installation. Under Windows, HWiNFO reports mostly stable G=
PU
temperatures of around 85 C.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15347906251.A14C8C5b.14126
Date: Mon, 20 Aug 2018 18:43:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - On GeForce 8200M G, driver reports wild temperature fluct=
uations, effectively blocking the system at boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107628">107628</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>On GeForce 8200M G, driver reports wild temperature fluctuati=
ons, effectively blocking the system at boot
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>rbergen&#64;xs4all.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>First off, I want to state that I'm aware that I am filing a r=
eport that
concerns a Compaq Presario CQ60 which a) is close to 10 years old, and b) m=
ay
well have the worst GPU cooling setup in the history of computing. I will
therefore completely understand if everybody here concludes they have better
ways to spend their time than worrying about this.

That said, the CQ60 has an GeForce 8200M G built in and I'm running Gentoo
x86_64 on said laptop with kernel version 4.14.63.=20

When I boot the laptop with nouveau either built into the kernel or as a
module, as soon as the driver loads, the screen is continuously flooded with
messages relating to the GPU temperature either hitting or going below a ra=
nge
of thresholds. The messages have the format:=20

[&lt;timestamp&gt;] nouveau 0000:02:00.0: therm: temperature (&lt;x&gt; C) =
hit/went below
the '&lt;threshold&gt;' threshold

The temperatures reported vary wildly between subsequent messages, as in
literally jumping from between below 0 and well above 150 degrees (and vice
versa).

When this happens I am unable to use Ctrl-Alt-Del to reboot and have to do a
hard power-down for it to stop. I can boot successfully provided I pass
nouveau.modeset=3D0 on the kernel command line.

I am currently unable to provide dmesg output as the problem occurs during =
boot
before a command prompt is presented that I could use to secure the log. I =
do
have a mobile phone video recording available of the laptop screen when the
problem occurs, in case that helps.

Windows 10 runs fine on this laptop with the nVidia drivers it pulls off the
Internet during installation. Under Windows, HWiNFO reports mostly stable G=
PU
temperatures of around 85 C.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15347906251.A14C8C5b.14126--

--===============0867159453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0867159453==--
