From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100446] Backlight control not working on Pascal /
 GP106 using nouveau drivers
Date: Thu, 05 Apr 2018 22:59:54 +0000
Message-ID: <bug-100446-8800-cjCuz0FJ3z@http.bugs.freedesktop.org/>
References: <bug-100446-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1550770460=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100446-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1550770460==
Content-Type: multipart/alternative; boundary="15229691941.a183de.5747"
Content-Transfer-Encoding: 7bit


--15229691941.a183de.5747
Date: Thu, 5 Apr 2018 22:59:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100446

--- Comment #9 from Bernhard Rosenkraenzer <bero-Qev7zP1q8vftRgLqZ5aouw@public.gmane.org> ---
Still happens with 4.16.0 final on an hp omen 17-an0xx laptop.

GPU details from lspci:
01:00.0 0300: 10de:1be1 (rev a1) (prog-if 00 [VGA controller])
        Subsystem: 103c:8393
        Flags: bus master, fast devsel, latency 0, IRQ 132
        Memory at db000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at dc000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

Additionally, the display doesn't turn on again after an "xset dpms force o=
ff"
(bug #103383); this may well be related.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15229691941.a183de.5747
Date: Thu, 5 Apr 2018 22:59:54 +0000
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
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446">bug 10044=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bero&#64;lindev.ch" title=3D"Bernhard Rosenkraenzer &lt;bero&#64;lindev.ch&=
gt;"> <span class=3D"fn">Bernhard Rosenkraenzer</span></a>
</span></b>
        <pre>Still happens with 4.16.0 final on an hp omen 17-an0xx laptop.

GPU details from lspci:
01:00.0 0300: 10de:1be1 (rev a1) (prog-if 00 [VGA controller])
        Subsystem: 103c:8393
        Flags: bus master, fast devsel, latency 0, IRQ 132
        Memory at db000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at dc000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

Additionally, the display doesn't turn on again after an &quot;xset dpms fo=
rce off&quot;
(<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;xset dpms force on&quot; does not unblank laptop sc=
reen after &quot;xset dpms force off&quot; is run (or system enters sleep m=
ode)"
   href=3D"show_bug.cgi?id=3D103383">bug #103383</a>); this may well be rel=
ated.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15229691941.a183de.5747--

--===============1550770460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1550770460==--
