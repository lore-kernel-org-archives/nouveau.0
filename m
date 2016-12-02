From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Fri, 02 Dec 2016 09:52:40 +0000
Message-ID: <bug-94725-8800-V0FUsTaXtC@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1348890216=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1348890216==
Content-Type: multipart/alternative; boundary="14806723602.dF674.2284";
 charset="UTF-8"


--14806723602.dF674.2284
Date: Fri, 2 Dec 2016 09:52:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94725

--- Comment #26 from Orsiris de Jong <info-3cfOhUhRyghWj0EZb7rXcA@public.gmane.org> ---
I too have a optimus laptop with GM107 / intel graphics card, and I have not
been able to use nouveau driver since I bought the laptop (using kernels 4.=
3.5
up to 4.8.10 on Fedora 23-25 x64).

I have searched for multiple solutions so far, and always finished by
blacklisting nouveau in order to be able to use that laptop.
I could not even able to launch lspci without rendering my system unrespons=
ive
(process then takes 100% cpu and I get cpu softlocks)

I've tried nouveau.runpm=3D0 and well, I can at least boot without having n=
ouveau
totally disabled :)

When not using runpm=3D0, I get the following when launching lspci / or
DRI_PRIME=3D1 glxgears

[ 1470.121123] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[ 1470.193738] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[ 1470.205762] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[ 1470.205766] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[ 1470.205792] nouveau 0000:01:00.0: pci: failed to adjust cap speed
[ 1470.205793] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed

So I guess the nouveau driver cannot send to sleep / wake my nvidia card for
whatever reason.

I am actually trying rely on the discrete graphics in order to reduce power
consumption by default.

I noticed that I can't use vgaswitcheroo in order to chose my primary graph=
ic
card. Also noticed the following error messages on boot.
[    1.795356] [drm] Initialized drm 1.1.0 20060810
[    1.881362] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[    1.881428] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[    1.881552] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[    1.881753] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[    1.881753] nouveau: detected PR support, will not use DSM

So far, when I switch graphic cards, I get the following in dmesg:

[ 1174.921195] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[ 1174.921209] nouveau 0000:01:00.0: DRM: resuming client object trees...
[ 1174.921226] nouveau 0000:01:00.0: fifo: BIND_ERROR 01 [BIND_NOT_UNBOUND]
[ 1317.637168] vga_switcheroo: client 0 refused switch

I guess that nouveau driver does not allow to disable the nvidia card when
runpm=3D0 is passed as argument ?

Anything I could try please ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14806723602.dF674.2284
Date: Fri, 2 Dec 2016 09:52:40 +0000
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
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725#c26">Commen=
t # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725">bug 94725<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
info&#64;netpower.fr" title=3D"Orsiris de Jong &lt;info&#64;netpower.fr&gt;=
"> <span class=3D"fn">Orsiris de Jong</span></a>
</span></b>
        <pre>I too have a optimus laptop with GM107 / intel graphics card, =
and I have not
been able to use nouveau driver since I bought the laptop (using kernels 4.=
3.5
up to 4.8.10 on Fedora 23-25 x64).

I have searched for multiple solutions so far, and always finished by
blacklisting nouveau in order to be able to use that laptop.
I could not even able to launch lspci without rendering my system unrespons=
ive
(process then takes 100% cpu and I get cpu softlocks)

I've tried nouveau.runpm=3D0 and well, I can at least boot without having n=
ouveau
totally disabled :)

When not using runpm=3D0, I get the following when launching lspci / or
DRI_PRIME=3D1 glxgears

[ 1470.121123] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[ 1470.193738] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[ 1470.205762] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[ 1470.205766] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[ 1470.205792] nouveau 0000:01:00.0: pci: failed to adjust cap speed
[ 1470.205793] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed

So I guess the nouveau driver cannot send to sleep / wake my nvidia card for
whatever reason.

I am actually trying rely on the discrete graphics in order to reduce power
consumption by default.

I noticed that I can't use vgaswitcheroo in order to chose my primary graph=
ic
card. Also noticed the following error messages on boot.
[    1.795356] [drm] Initialized drm 1.1.0 20060810
[    1.881362] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[    1.881428] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[    1.881552] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[    1.881753] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[    1.881753] nouveau: detected PR support, will not use DSM

So far, when I switch graphic cards, I get the following in dmesg:

[ 1174.921195] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[ 1174.921209] nouveau 0000:01:00.0: DRM: resuming client object trees...
[ 1174.921226] nouveau 0000:01:00.0: fifo: BIND_ERROR 01 [BIND_NOT_UNBOUND]
[ 1317.637168] vga_switcheroo: client 0 refused switch

I guess that nouveau driver does not allow to disable the nvidia card when
runpm=3D0 is passed as argument ?

Anything I could try please ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14806723602.dF674.2284--

--===============1348890216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1348890216==--
