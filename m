From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Mon, 24 Jun 2019 09:56:03 +0000
Message-ID: <bug-75985-8800-zor389w3TL@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0968679350=="
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


--===============0968679350==
Content-Type: multipart/alternative; boundary="15613701639.Ba3b030.22867"
Content-Transfer-Encoding: 7bit


--15613701639.Ba3b030.22867
Date: Mon, 24 Jun 2019 09:56:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #79 from Daniel Drake <dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org> ---
Thanks, you're right, the value changes based on HDMI connector status.

So for this platform, \_SB.PCI0.PEG0 has a PG00 PowerResource that will set=
 the
magic bit in _ON, and likewise \_SB.PCI0.PEG0.PEGP has a _PS0 that will set=
 the
bit too.

This all sounds like it should set the appropriate state at boot time, but I
wouldn't expect these methods to be called when the HDMI connector is
hotplugged. And I can't see any linkage to anything more dynamic like _DSM.

Indeed booting Linux with HDMI already connected, the HDMI audio PCI device
appears. Same on Windows, testing without the nvidia driver installed.

I used the Clover UEFI bootloader to boot windows with a custom DSDT, modif=
ied
the GGIV() function to always return zero (disconnected) for this GPIO. Then
booting Windows with HDMI connected, the PCI device no longer appears.

Then I installed the Nvidia windows driver. Connecting HDMI either at boot =
or
later, the HDMI audio device appears on the PCI bus.

Conclusion: The nvidia windows driver directly controls the magic bit here,
triggering a PCI bus rescan too, without relying on ACPI.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15613701639.Ba3b030.22867
Date: Mon, 24 Jun 2019 09:56:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c79">Commen=
t # 79</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>Thanks, you're right, the value changes based on HDMI connecto=
r status.

So for this platform, \_SB.PCI0.PEG0 has a PG00 PowerResource that will set=
 the
magic bit in _ON, and likewise \_SB.PCI0.PEG0.PEGP has a _PS0 that will set=
 the
bit too.

This all sounds like it should set the appropriate state at boot time, but I
wouldn't expect these methods to be called when the HDMI connector is
hotplugged. And I can't see any linkage to anything more dynamic like _DSM.

Indeed booting Linux with HDMI already connected, the HDMI audio PCI device
appears. Same on Windows, testing without the nvidia driver installed.

I used the Clover UEFI bootloader to boot windows with a custom DSDT, modif=
ied
the GGIV() function to always return zero (disconnected) for this GPIO. Then
booting Windows with HDMI connected, the PCI device no longer appears.

Then I installed the Nvidia windows driver. Connecting HDMI either at boot =
or
later, the HDMI audio device appears on the PCI bus.

Conclusion: The nvidia windows driver directly controls the magic bit here,
triggering a PCI bus rescan too, without relying on ACPI.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15613701639.Ba3b030.22867--

--===============0968679350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0968679350==--
