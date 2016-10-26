From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98398] Acer Aspire V7-582PG (Haswell,
 GTX 750M) fails to power off GPU with runtime PM
Date: Wed, 26 Oct 2016 22:42:07 +0000
Message-ID: <bug-98398-8800-66oU1nuK0R@http.bugs.freedesktop.org/>
References: <bug-98398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1337543029=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1337543029==
Content-Type: multipart/alternative; boundary="14775217261.31dcD.13370";
 charset="UTF-8"


--14775217261.31dcD.13370
Date: Wed, 26 Oct 2016 22:42:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98398

--- Comment #11 from Peter Wu <peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org> ---
So 4.7 and before used the "DSM" method on runtime-suspend:
- \_SB.PCI0.RP05.PEGP._DSM would be invoked to enable Optimus
- \_SB.PCI0.RP05.PEGP._PS3 is then invoked which would enter D3cold
(note, this method is still used in 4.8 on older laptops or with the
pcie_pm_port=3Doff kernel option)

Since 4.8, _DSM is not called anymore by nouveau (when support from the PCI
core is detected) and this sequence should instead happen:
- \_SB.PCI0.RP05.PEGP._PS3 (does nothing besides updating _STA)
- PCIe core removes power for the PCIe port since all its children are in
  D3 and are willing to transition to D3cold. It does so by invoking
  \NVP3._OFF (where \NVP3 is the power resource from \_SB.PCI0.RP05._PR3)

That is how I think it should work in theory, but on Ricks laptop running
4.8.4,
/sys/bus/devices/0000:1c.4/firmware_node/ does not have power_resources_D0
devices (which I do have on my own laptop for 0000:01:0).

The SSDT1 of Rick's Acer laptop shows this structure:

    If (\_OSI ("Windows 2013"))
    {
        Scope (\_SB.PCI0.RP05)
        {
        //...
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                NVP3
            })
            Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
            {
                NVP2
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                NVP3
            })
            // ...
            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
            }
        }

        Name (MSD3, Zero)
        PowerResource (NVP3, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            // ...

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                // ...
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                // ...
            }
        }

The dmesg does show "ACPI: Power Resource [NVP3] (on)", so I guess that the
methods are found. It is a mystery to me why the "power_resources_Dx" files=
 are
not created, possibly breaking PM.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14775217261.31dcD.13370
Date: Wed, 26 Oct 2016 22:42:06 +0000
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
   title=3D"NEW - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to power o=
ff GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to power o=
ff GPU with runtime PM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398">bug 98398<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter&#64;lekensteyn.nl" title=3D"Peter Wu &lt;peter&#64;lekensteyn.nl&gt;"=
> <span class=3D"fn">Peter Wu</span></a>
</span></b>
        <pre>So 4.7 and before used the &quot;DSM&quot; method on runtime-s=
uspend:
- \_SB.PCI0.RP05.PEGP._DSM would be invoked to enable Optimus
- \_SB.PCI0.RP05.PEGP._PS3 is then invoked which would enter D3cold
(note, this method is still used in 4.8 on older laptops or with the
pcie_pm_port=3Doff kernel option)

Since 4.8, _DSM is not called anymore by nouveau (when support from the PCI
core is detected) and this sequence should instead happen:
- \_SB.PCI0.RP05.PEGP._PS3 (does nothing besides updating _STA)
- PCIe core removes power for the PCIe port since all its children are in
  D3 and are willing to transition to D3cold. It does so by invoking
  \NVP3._OFF (where \NVP3 is the power resource from \_SB.PCI0.RP05._PR3)

That is how I think it should work in theory, but on Ricks laptop running
4.8.4,
/sys/bus/devices/0000:1c.4/firmware_node/ does not have power_resources_D0
devices (which I do have on my own laptop for 0000:01:0).

The SSDT1 of Rick's Acer laptop shows this structure:

    If (\_OSI (&quot;Windows 2013&quot;))
    {
        Scope (\_SB.PCI0.RP05)
        {
        //...
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                NVP3
            })
            Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
            {
                NVP2
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                NVP3
            })
            // ...
            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
            }
        }

        Name (MSD3, Zero)
        PowerResource (NVP3, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            // ...

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                // ...
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                // ...
            }
        }

The dmesg does show &quot;ACPI: Power Resource [NVP3] (on)&quot;, so I gues=
s that the
methods are found. It is a mystery to me why the &quot;power_resources_Dx&q=
uot; files are
not created, possibly breaking PM.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14775217261.31dcD.13370--

--===============1337543029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1337543029==--
