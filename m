From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Thu, 04 Jan 2018 07:51:32 +0000
Message-ID: <bug-75985-8800-HMAZjqDzC6@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0847200783=="
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


--===============0847200783==
Content-Type: multipart/alternative; boundary="15150522921.0b03.8289";
 charset="UTF-8"


--15150522921.0b03.8289
Date: Thu, 4 Jan 2018 07:51:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #32 from Martin Lopat=C3=A1=C5=99 <lopin-vkOr6uFwhzftwjQa/ONI9g@public.gmane.org> ---
Hello.
I have Dell XPS 17 L702X with discrete GPU GF106M [GeForce GT 555M]
[10de:0dcd].
I'm trying to investigate the HDMI audio issue for some time, but I'm compl=
ete
novice in all - kernel development, power management, PCI, ACPI.
On Windows, the audio device appears/disappears as I plug/unplug the HDMI c=
able
and MF (multi-functional) bit in PCI config space is changing corresponding=
 it.
Linux boots without audio device detected and MF bit not set, but my ntb has
ACPI _DSM function for enabling/disabling discrete GPU including audio devi=
ce.
To be precise, the enabling/disabling is not done using _DSM function, but
using _DSM combined with _PS0 and _PS3.
So I was able to get HDMI audio working using the ACPI _DSM and remove+resc=
an
via sysfs workaround. Since I modified kernel to ignore cached value of
boot-time MF bit when doing rescan, removing the device via sysfs was not
needed anymore (only rescan after enabling using ACPI _DSM).
Using _DSM I was able to disable/enable GPU+audio together, but not
individually like Windows can. I was curious what is the magic the Windows =
do,
and in the best case I want to be able to contribute to Linux by implementi=
ng
this missing feature using the same approach as Windows use. I have just fo=
und
this thread and saw that someone is working on it so I can provide at least
some information about behavior in my environment so far.

Laptop model: Dell XPS 17 L702X
lspci output relevant lines:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF106M [GeForc=
e GT
555M] [10de:0dcd] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GF106 High Definition Audio
Controller [10de:0be9] (rev a1)

"setpci -s 01:00.0 0x488.l=3D0x2000000:0x2000000" is working - sets the MF =
bit in
01:00.0 and 01:00.1 PCI devices config space.
I went through ACPI AML code and see that _DSM,_PS0,_PS3 functions on
\_SB.PCI0.PEG0.PEGP do this as well (writing to 01:00.0 0x488).
I had an idea to do this in GRUB too (hoping that everything will work with=
out
need of any additional steps or kernel changing :)),
but like Maik Freudenberg [Comment 17], I found that in grub the extended
config space is not accessible.
But because it is memory-mapped, I tried to do the same (as 'setpci'), but
using 'write_dword' grub command and succeeded!

Calling "write_dword 0xf8100488 0x02000000 0x02000000" (in my case) in grub
results in MF bit set so both GPU and audio functions are discovered at boot
time without any kernel change needed, so enabling audio function in grub IS
POSSIBLE!

Although everything looked fine at the first sight, no sound can be heard w=
hen
I tested it. After another investigation I found that HDMI audio works - but
only until the first runtime_pm suspend (in my case it happened just before=
 X
starts :( ). I use nouveau driver and I have not tried it with proprietary
nvidia driver yet.
It looks like the problem is that the audio device is not correctly enabled=
 by
kernel after power state resumed to D0 - it has no irq and memory resources
associated.
I have now intended to read something about PCI PM and Device Links just be=
fore
I found this thread, but now I'm going to try the patch found here before t=
hat
to know if it doesn't solve this as well.

Does someone else face same issues with nouveau driver and runtime_pm ?

Please let me know if I can help somehow.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15150522921.0b03.8289
Date: Thu, 4 Jan 2018 07:51:32 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c32">Commen=
t # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lopin&#64;dataplex.cz" title=3D"Martin Lopat=C3=A1=C5=99 &lt;lopin&#64;data=
plex.cz&gt;"> <span class=3D"fn">Martin Lopat=C3=A1=C5=99</span></a>
</span></b>
        <pre>Hello.
I have Dell XPS 17 L702X with discrete GPU GF106M [GeForce GT 555M]
[10de:0dcd].
I'm trying to investigate the HDMI audio issue for some time, but I'm compl=
ete
novice in all - kernel development, power management, PCI, ACPI.
On Windows, the audio device appears/disappears as I plug/unplug the HDMI c=
able
and MF (multi-functional) bit in PCI config space is changing corresponding=
 it.
Linux boots without audio device detected and MF bit not set, but my ntb has
ACPI _DSM function for enabling/disabling discrete GPU including audio devi=
ce.
To be precise, the enabling/disabling is not done using _DSM function, but
using _DSM combined with _PS0 and _PS3.
So I was able to get HDMI audio working using the ACPI _DSM and remove+resc=
an
via sysfs workaround. Since I modified kernel to ignore cached value of
boot-time MF bit when doing rescan, removing the device via sysfs was not
needed anymore (only rescan after enabling using ACPI _DSM).
Using _DSM I was able to disable/enable GPU+audio together, but not
individually like Windows can. I was curious what is the magic the Windows =
do,
and in the best case I want to be able to contribute to Linux by implementi=
ng
this missing feature using the same approach as Windows use. I have just fo=
und
this thread and saw that someone is working on it so I can provide at least
some information about behavior in my environment so far.

Laptop model: Dell XPS 17 L702X
lspci output relevant lines:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF106M [GeForc=
e GT
555M] [10de:0dcd] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GF106 High Definition Audio
Controller [10de:0be9] (rev a1)

&quot;setpci -s 01:00.0 0x488.l=3D0x2000000:0x2000000&quot; is working - se=
ts the MF bit in
01:00.0 and 01:00.1 PCI devices config space.
I went through ACPI AML code and see that _DSM,_PS0,_PS3 functions on
\_SB.PCI0.PEG0.PEGP do this as well (writing to 01:00.0 0x488).
I had an idea to do this in GRUB too (hoping that everything will work with=
out
need of any additional steps or kernel changing :)),
but like Maik Freudenberg [<a href=3D"show_bug.cgi?id=3D75985#c17">Comment =
17</a>], I found that in grub the extended
config space is not accessible.
But because it is memory-mapped, I tried to do the same (as 'setpci'), but
using 'write_dword' grub command and succeeded!

Calling &quot;write_dword 0xf8100488 0x02000000 0x02000000&quot; (in my cas=
e) in grub
results in MF bit set so both GPU and audio functions are discovered at boot
time without any kernel change needed, so enabling audio function in grub IS
POSSIBLE!

Although everything looked fine at the first sight, no sound can be heard w=
hen
I tested it. After another investigation I found that HDMI audio works - but
only until the first runtime_pm suspend (in my case it happened just before=
 X
starts :( ). I use nouveau driver and I have not tried it with proprietary
nvidia driver yet.
It looks like the problem is that the audio device is not correctly enabled=
 by
kernel after power state resumed to D0 - it has no irq and memory resources
associated.
I have now intended to read something about PCI PM and Device Links just be=
fore
I found this thread, but now I'm going to try the patch found here before t=
hat
to know if it doesn't solve this as well.

Does someone else face same issues with nouveau driver and runtime_pm ?

Please let me know if I can help somehow.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15150522921.0b03.8289--

--===============0847200783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0847200783==--
