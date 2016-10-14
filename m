From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] Kernel module fails to load on HP Pavilion
 V3A33AV laptop.
Date: Fri, 14 Oct 2016 02:39:39 +0000
Message-ID: <bug-98240-8800-HUA6e7SkAu@http.bugs.freedesktop.org/>
References: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2090916536=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98240-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2090916536==
Content-Type: multipart/alternative; boundary="14764127791.349D8.29720";
 charset="UTF-8"


--14764127791.349D8.29720
Date: Fri, 14 Oct 2016 02:39:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

--- Comment #11 from Sergey Okhapkin <sos-iE5g+WOE291eeLb3ft/vUmD2FQJk+8+b@public.gmane.org> ---
[ 3234.532656] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 3234.532743] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 3234.532849] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 3234.533890] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[ 3234.533897] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[ 3234.533898] nouveau: detected PR support, will not use DSM
[ 3234.534005] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[ 3234.538042] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
[ 3234.539278] retrieving _ROM off: 0x1000, len: 0xf000, ret: 0xf000
[ 3234.539616] retrieving _ROM off: 0x10000, len: 0x1000, ret: 0x1000
[ 3234.539953] retrieving _ROM off: 0x11000, len: 0xa000, ret: 0xa000
[ 3234.540028] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[ 3234.540294] nouveau 0000:01:00.0: devinit: 0xf152[ ]: unknown opcode 0x00
[ 3234.540315] nouveau 0000:01:00.0: preinit failed with -22
[ 3234.540316] nouveau: DRM:00000000:00000080: init failed with -22
[ 3234.540472] nouveau: probe of 0000:01:00.0 failed with error -22

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764127791.349D8.29720
Date: Fri, 14 Oct 2016 02:39:39 +0000
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
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240">bug 98240<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sos&#64;sokhapkin.dyndns.org" title=3D"Sergey Okhapkin &lt;sos&#64;sokhapki=
n.dyndns.org&gt;"> <span class=3D"fn">Sergey Okhapkin</span></a>
</span></b>
        <pre>[ 3234.532656] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 =
type mismatch -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 3234.532743] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 3234.532849] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 3234.533890] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[ 3234.533897] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[ 3234.533898] nouveau: detected PR support, will not use DSM
[ 3234.534005] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[ 3234.538042] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
[ 3234.539278] retrieving _ROM off: 0x1000, len: 0xf000, ret: 0xf000
[ 3234.539616] retrieving _ROM off: 0x10000, len: 0x1000, ret: 0x1000
[ 3234.539953] retrieving _ROM off: 0x11000, len: 0xa000, ret: 0xa000
[ 3234.540028] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[ 3234.540294] nouveau 0000:01:00.0: devinit: 0xf152[ ]: unknown opcode 0x00
[ 3234.540315] nouveau 0000:01:00.0: preinit failed with -22
[ 3234.540316] nouveau: DRM:00000000:00000080: init failed with -22
[ 3234.540472] nouveau: probe of 0000:01:00.0 failed with error -22</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764127791.349D8.29720--

--===============2090916536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2090916536==--
