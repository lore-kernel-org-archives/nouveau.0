From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101404] GTX 970M (GM204-A) not powered off when not
 in use (DynPwr in stead of DynOff)
Date: Thu, 06 Jul 2017 10:42:54 +0000
Message-ID: <bug-101404-8800-Mj8gstxqoP@http.bugs.freedesktop.org/>
References: <bug-101404-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1558137189=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101404-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1558137189==
Content-Type: multipart/alternative; boundary="14993377742.1E5cbb3.24219";
 charset="UTF-8"


--14993377742.1E5cbb3.24219
Date: Thu, 6 Jul 2017 10:42:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101404

--- Comment #5 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
(In reply to Benny Ammitzb=C3=B8ll from comment #4)
> (In reply to Peter Wu from comment #3)
> > When the nouveau driver is loaded, runtime PM for the Nvidia PCI device
> > (01:00.0 in your case) should be enabled.
>=20
> Yes, I agree. Why is the Nvidia card not going to DynOff when on AC and n=
ot
> being used then? I can force it by using powertop, but why does this not
> happen automatically?

Please show the output of "lspci -nn". If you boot your laptop with an exte=
rnal
display plugged in, you will additionally have a HDMI audio function (01:00=
.1)
which must also have runtime PM enabled for the whole thing to power down.

In powertop, what are the states for the Nvidia PCI device(s) and its root
parent port before you change anything?

> Ok, but then I don't understand why without pcie_port_pm=3Doff I get a hi=
gher
> power consumption? I mean, the parent device should power down the entire
> PCIe port incl. the Nvidia card?

See above, if there are other children, then these must also have runtime PM
enabled or the parent will refuse to enter suspend.

> And before linux kernel 4.8 (I think) pcie_port_pm=3Doff was not needed,
> so what happened?

Currently there are two methods to turn off the power on modern Nvidia devi=
ces:
 - ACPI "DSM". The nouveau driver will call a special device-specific ACPI
method  during runtime PM transitions.
 - ACPI Power Resources (since Linux 4.8). This means that when all devices
(PCI root port and its children) are idle, the power resources can be turned
off. This is a standard method that does not require a specific video drive=
r,
hence if you do not load nouveau but enable runtime PM, it will also work.

Why is the second method preferred? The second method is the standard one s=
ince
Windows 8 and vendors might not test the former method. The former method is
known to result in memory corruption issues on some models (bug 78530) and =
in
other cases it will not fully reduce power consumption (resulting in increa=
sed
heat, more fan noise and lower battery life).

> > Any reason why you boot with acpi_osi=3D! acpi_osi=3DLinux? If you want=
 to
> > prevent a lockup that occurs with Clevo P6xxRx models, try
> > acpi_osi=3D"!Windows 2015"
> > (see https://bugzilla.kernel.org/show_bug.cgi?id=3D156341)
>=20
> Because while acpi_osi=3D"!Windows 2015" does prevent the lockup, I still=
 have
> some Fn keys that are not working (notably those that adjust screen
> brightness, but others as well). With acpi_osi=3D! acpi_osi=3DLinux all o=
f my Fn
> keys are working, incl. no lockup.

Upgrade to kernel 4.10 or newer, then your brightness keys should work with=
out
forcing acpi_osi=3DLinux. See https://bugzilla.kernel.org/show_bug.cgi?id=
=3D123651

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14993377742.1E5cbb3.24219
Date: Thu, 6 Jul 2017 10:42:54 +0000
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
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 970M (GM204-A) not powered off when not in use (DynPw=
r in stead of DynOff)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101404">bug 10140=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>(In reply to Benny Ammitzb=C3=B8ll from <a href=3D"show_bug.cg=
i?id=3D101404#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to Peter Wu from <a href=3D"show_bug.c=
gi?id=3D101404#c3">comment #3</a>)
&gt; &gt; When the nouveau driver is loaded, runtime PM for the Nvidia PCI =
device
&gt; &gt; (01:00.0 in your case) should be enabled.
&gt;=20
&gt; Yes, I agree. Why is the Nvidia card not going to DynOff when on AC an=
d not
&gt; being used then? I can force it by using powertop, but why does this n=
ot
&gt; happen automatically?</span >

Please show the output of &quot;lspci -nn&quot;. If you boot your laptop wi=
th an external
display plugged in, you will additionally have a HDMI audio function (01:00=
.1)
which must also have runtime PM enabled for the whole thing to power down.

In powertop, what are the states for the Nvidia PCI device(s) and its root
parent port before you change anything?

<span class=3D"quote">&gt; Ok, but then I don't understand why without pcie=
_port_pm=3Doff I get a higher
&gt; power consumption? I mean, the parent device should power down the ent=
ire
&gt; PCIe port incl. the Nvidia card?</span >

See above, if there are other children, then these must also have runtime PM
enabled or the parent will refuse to enter suspend.

<span class=3D"quote">&gt; And before linux kernel 4.8 (I think) pcie_port_=
pm=3Doff was not needed,
&gt; so what happened?</span >

Currently there are two methods to turn off the power on modern Nvidia devi=
ces:
 - ACPI &quot;DSM&quot;. The nouveau driver will call a special device-spec=
ific ACPI
method  during runtime PM transitions.
 - ACPI Power Resources (since Linux 4.8). This means that when all devices
(PCI root port and its children) are idle, the power resources can be turned
off. This is a standard method that does not require a specific video drive=
r,
hence if you do not load nouveau but enable runtime PM, it will also work.

Why is the second method preferred? The second method is the standard one s=
ince
Windows 8 and vendors might not test the former method. The former method is
known to result in memory corruption issues on some models (<a class=3D"bz_=
bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Memory corruption on Lenovo t440p with runpm"
   href=3D"show_bug.cgi?id=3D78530">bug 78530</a>) and in
other cases it will not fully reduce power consumption (resulting in increa=
sed
heat, more fan noise and lower battery life).

<span class=3D"quote">&gt; &gt; Any reason why you boot with acpi_osi=3D! a=
cpi_osi=3DLinux? If you want to
&gt; &gt; prevent a lockup that occurs with Clevo P6xxRx models, try
&gt; &gt; acpi_osi=3D&quot;!Windows 2015&quot;
&gt; &gt; (see <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D156=
341">https://bugzilla.kernel.org/show_bug.cgi?id=3D156341</a>)
&gt;=20
&gt; Because while acpi_osi=3D&quot;!Windows 2015&quot; does prevent the lo=
ckup, I still have
&gt; some Fn keys that are not working (notably those that adjust screen
&gt; brightness, but others as well). With acpi_osi=3D! acpi_osi=3DLinux al=
l of my Fn
&gt; keys are working, incl. no lockup.</span >

Upgrade to kernel 4.10 or newer, then your brightness keys should work with=
out
forcing acpi_osi=3DLinux. See <a href=3D"https://bugzilla.kernel.org/show_b=
ug.cgi?id=3D123651">https://bugzilla.kernel.org/show_bug.cgi?id=3D123651</a=
></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14993377742.1E5cbb3.24219--

--===============1558137189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1558137189==--
