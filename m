From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99372] Nvidia 640M devinit fails
Date: Thu, 12 Jan 2017 00:20:24 +0000
Message-ID: <bug-99372-8800-yzw5YGPw24@http.bugs.freedesktop.org/>
References: <bug-99372-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0063038301=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99372-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0063038301==
Content-Type: multipart/alternative; boundary="14841804241.56F7.32617";
 charset="UTF-8"


--14841804241.56F7.32617
Date: Thu, 12 Jan 2017 00:20:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99372

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so ... similar issue as before - it creates a temporary buffer sized to=
 the
incoming argument's size, and THEN truncates the size argument. Great.... s=
o we
just get the first 4K back with the "fast acpi" method. However at that poi=
nt,
the checksum really oughtn't match. But I don't see the "checksum failed"
message. So it does match? Or somehow the second bogus image increases the
score to 4? Not sure...

Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
{
    Local0 =3D Arg0
    Local1 =3D Arg1
    Name (VROM, Buffer (Local1)
    {
         0x00                                             /* . */
    })
    If (Local1 > 0x1000)
    {
        Local1 =3D 0x1000
    }

    If (Arg0 > RVBS)
    {
        Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
    }

    Local2 =3D (Arg0 + Arg1)
    If (Local2 > RVBS)
    {
        Local1 =3D (RVBS - Local0)
    }

    If (Local0 < 0x8000)
    {
        Mid (VBS1, Local0, Local1, VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM =
*/
    }
    Else
    {
        Local0 -=3D 0x8000
        If (Local0 < 0x8000)
        {
            Mid (VBS2, Local0, Local1, VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.V=
ROM
*/
        }
        Else
        {
            Local0 -=3D 0x8000
            If (Local0 < 0x8000)
            {
                Mid (VBS3, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            }
            Else
            {
                Local0 -=3D 0x8000
                If (Local0 < 0x8000)
                {
                    Mid (VBS4, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                }
            }
        }
    }

    Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
}

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14841804241.56F7.32617
Date: Thu, 12 Jan 2017 00:20:24 +0000
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
   title=3D"NEW - Nvidia 640M devinit fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99372#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia 640M devinit fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99372">bug 99372<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so ... similar issue as before - it creates a temporary bu=
ffer sized to the
incoming argument's size, and THEN truncates the size argument. Great.... s=
o we
just get the first 4K back with the &quot;fast acpi&quot; method. However a=
t that point,
the checksum really oughtn't match. But I don't see the &quot;checksum fail=
ed&quot;
message. So it does match? Or somehow the second bogus image increases the
score to 4? Not sure...

Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
{
    Local0 =3D Arg0
    Local1 =3D Arg1
    Name (VROM, Buffer (Local1)
    {
         0x00                                             /* . */
    })
    If (Local1 &gt; 0x1000)
    {
        Local1 =3D 0x1000
    }

    If (Arg0 &gt; RVBS)
    {
        Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
    }

    Local2 =3D (Arg0 + Arg1)
    If (Local2 &gt; RVBS)
    {
        Local1 =3D (RVBS - Local0)
    }

    If (Local0 &lt; 0x8000)
    {
        Mid (VBS1, Local0, Local1, VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM =
*/
    }
    Else
    {
        Local0 -=3D 0x8000
        If (Local0 &lt; 0x8000)
        {
            Mid (VBS2, Local0, Local1, VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.V=
ROM
*/
        }
        Else
        {
            Local0 -=3D 0x8000
            If (Local0 &lt; 0x8000)
            {
                Mid (VBS3, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            }
            Else
            {
                Local0 -=3D 0x8000
                If (Local0 &lt; 0x8000)
                {
                    Mid (VBS4, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                }
            }
        }
    }

    Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
}</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14841804241.56F7.32617--

--===============0063038301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0063038301==--
