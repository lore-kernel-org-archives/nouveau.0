From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sun, 11 Mar 2018 12:53:50 +0000
Message-ID: <bug-75985-8800-uSG2frR3ni@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737597479=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1737597479==
Content-Type: multipart/alternative; boundary="15207728310.0Fb8.14688"
Content-Transfer-Encoding: 7bit


--15207728310.0Fb8.14688
Date: Sun, 11 Mar 2018 12:53:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #68 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
Created attachment 137989
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D137989&action=3Dedit
Patch to simulate hidden HDA on systems which normally expose it

This is a quick & dirty hack to hide the HDA controller in the EFI stub. It=
 can
be used to simulate a hidden HDA controller on systems which normally expose
it. Register 0x488 is written for any PCI device that has a ROM. On my mach=
ine
that happens to only be the case for the Nvidia GPU.

If I boot my system with this patch applied, the HDA controller is not
enumerated and invoking lspci on the GPU shows that the multifunction bit is
cleared, as is bit 25 at offset 0x488.

Applying the three other patches I've attached to this bugzilla on top resu=
lts
in the HDA controller being enumerated again. So the patches seem to work as
intended.

One interesting behavior I've noticed though: If I hide the HDA in the EFI =
stub
and do not expose it with a PCI quirk, putting the GPU into D3cold and back
into D0 causes the multifunction bit to be set, same for bit 25 at offset
0x488, even though the bits were cleared before the GPU went into D3cold. I
don't see anything in the ACPI tables that bit 25 is written, I'm rather un=
der
the impression that the GPU has some non-volatile memory where the vendor
preconfigures bits that are restored when the device comes out of power-on
reset. But because the PCI quirk is also executed on resume of the GPU, we
should have that covered.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15207728310.0Fb8.14688
Date: Sun, 11 Mar 2018 12:53:51 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c68">Commen=
t # 68</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D137989=
" name=3D"attach_137989" title=3D"Patch to simulate hidden HDA on systems w=
hich normally expose it">attachment 137989</a> <a href=3D"attachment.cgi?id=
=3D137989&amp;action=3Dedit" title=3D"Patch to simulate hidden HDA on syste=
ms which normally expose it">[details]</a></span> <a href=3D'page.cgi?id=3D=
splinter.html&amp;bug=3D75985&amp;attachment=3D137989'>[review]</a>
Patch to simulate hidden HDA on systems which normally expose it

This is a quick &amp; dirty hack to hide the HDA controller in the EFI stub=
. It can
be used to simulate a hidden HDA controller on systems which normally expose
it. Register 0x488 is written for any PCI device that has a ROM. On my mach=
ine
that happens to only be the case for the Nvidia GPU.

If I boot my system with this patch applied, the HDA controller is not
enumerated and invoking lspci on the GPU shows that the multifunction bit is
cleared, as is bit 25 at offset 0x488.

Applying the three other patches I've attached to this bugzilla on top resu=
lts
in the HDA controller being enumerated again. So the patches seem to work as
intended.

One interesting behavior I've noticed though: If I hide the HDA in the EFI =
stub
and do not expose it with a PCI quirk, putting the GPU into D3cold and back
into D0 causes the multifunction bit to be set, same for bit 25 at offset
0x488, even though the bits were cleared before the GPU went into D3cold. I
don't see anything in the ACPI tables that bit 25 is written, I'm rather un=
der
the impression that the GPU has some non-volatile memory where the vendor
preconfigures bits that are restored when the device comes out of power-on
reset. But because the PCI quirk is also executed on resume of the GPU, we
should have that covered.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15207728310.0Fb8.14688--

--===============1737597479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1737597479==--
