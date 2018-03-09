From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Fri, 09 Mar 2018 16:10:06 +0000
Message-ID: <bug-75985-8800-ORJPyF23DV@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1422795107=="
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


--===============1422795107==
Content-Type: multipart/alternative; boundary="15206118061.cCAbb1.31513"
Content-Transfer-Encoding: 7bit


--15206118061.cCAbb1.31513
Date: Fri, 9 Mar 2018 16:10:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #63 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Peter Wu from comment #59)
> (In reply to Lukas Wunner from comment #51)
> > On my GK107 I do not see any change in power consumption regardless whe=
ther
> > bit 25 at config space offset 0x488 is set or cleared, which is somewhat
> > disappointing. I also do not see a change in power consumption between =
PCI
> > power state D0 and D3hot.
>=20
> Was this your macbook or a regular laptop? The Kepler family still used an
> ACPI _DSM method to remove power, setting the PM bit in the PCI config sp=
ace
> did not do anything (this was at least true for my older Fermi card).

This was on my MacBook Pro. (Is that not a regular laptop? ;-) ) Power to t=
he
GK107 GPU is cut and reinstated by the GMUX controller rather than a _DSM. I
can hide and expose the audio device by clearing or setting bit 25 at offset
0x488, but this does not change power consumption in any way. Only cutting
power to the GPU via GMUX does.

That the audio device is powergated on newer GPUs was only a theory. Becaus=
e,
why would laptop vendors hide the audio device if nothing is connected? One
possible explanation is that it saves power. Someone needs to confirm or de=
bunk
this theory by clearing and setting the bit and comparing power consumption=
 in
powertop.


> Possibly relevant for this bug: I tested Lukas devlink_v2 patches but fou=
nd
> some issues when the HDMI/DP cable was disconnected on a GTX 965M (where =
by
> default the audio function would not be visible):
> https://lists.freedesktop.org/archives/nouveau/2018-March/029988.html
>=20
> Do you also experience issues after these steps:
> 1. remove+rescan to make audio function appear
> 2. remove GPU power (runtime PM or system sleep)
> 3. remove HDMI/DP cable
> 4. restore power
> 5. check dmesg or try to access audio function (e.g. read PCI regs)

I've had a look at the acpidump of your machine:
https://github.com/Lekensteyn/acpi-stuff/tree/master/dsl/Clevo_P651RA

Bit 25 at offset 0x488 is named NHDA. In two places (in the _ON method of t=
he
root port's power resource and in _PS0 of the GPU device), the AML code pro=
bes
three GPIO pins and exposes the HDA controller if any of them are high, or =
else
hides the GPU. These GPIO pins are probably wired to HPD of the external
connectors.

I think what happens in the scenario you've described above is: On runtime
suspend or system suspend, the state of the HDA is saved (BARs etc). Because
the cable is disconnected, the HDA will be hidden on resume. Now the kernel
tries to wake the HDA device to D0 and will fail (you should see "Refused to
change power state, currently in D3" in dmesg). It will then restore the sa=
ved
state, which will also fail because the device is inaccessible. Also, the s=
aved
state is invalidated and cannot be restored again. So the HDA's BARs are bl=
ank
until you remove+rescan.

I've just attached three patches, please try those on top of my
switcheroo_devlink_v2 series, they should fix the issue.

Crucially, patch [1/3] now also applies the PCI quirk during the resume_noi=
rq
and runtime_resume phase. This means that in the scenario you've given abov=
e,
even though the BIOS may have hidden the HDA, that change will be undone by=
 the
quirk. The quirk is executed for the GPU device. We know that the HDA device
will resume *after* the GPU device because of the device link.

I cannot test these patches myself because the HDA is never hidden on my
machine. So the patches are compile-tested only.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15206118061.cCAbb1.31513
Date: Fri, 9 Mar 2018 16:10:06 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c63">Commen=
t # 63</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D75985#=
c59">comment #59</a>)
<span class=3D"quote">&gt; (In reply to Lukas Wunner from <a href=3D"show_b=
ug.cgi?id=3D75985#c51">comment #51</a>)
&gt; &gt; On my GK107 I do not see any change in power consumption regardle=
ss whether
&gt; &gt; bit 25 at config space offset 0x488 is set or cleared, which is s=
omewhat
&gt; &gt; disappointing. I also do not see a change in power consumption be=
tween PCI
&gt; &gt; power state D0 and D3hot.
&gt;=20
&gt; Was this your macbook or a regular laptop? The Kepler family still use=
d an
&gt; ACPI _DSM method to remove power, setting the PM bit in the PCI config=
 space
&gt; did not do anything (this was at least true for my older Fermi card).<=
/span >

This was on my MacBook Pro. (Is that not a regular laptop? ;-) ) Power to t=
he
GK107 GPU is cut and reinstated by the GMUX controller rather than a _DSM. I
can hide and expose the audio device by clearing or setting bit 25 at offset
0x488, but this does not change power consumption in any way. Only cutting
power to the GPU via GMUX does.

That the audio device is powergated on newer GPUs was only a theory. Becaus=
e,
why would laptop vendors hide the audio device if nothing is connected? One
possible explanation is that it saves power. Someone needs to confirm or de=
bunk
this theory by clearing and setting the bit and comparing power consumption=
 in
powertop.


<span class=3D"quote">&gt; Possibly relevant for this bug: I tested Lukas d=
evlink_v2 patches but found
&gt; some issues when the HDMI/DP cable was disconnected on a GTX 965M (whe=
re by
&gt; default the audio function would not be visible):
&gt; <a href=3D"https://lists.freedesktop.org/archives/nouveau/2018-March/0=
29988.html">https://lists.freedesktop.org/archives/nouveau/2018-March/02998=
8.html</a>
&gt;=20
&gt; Do you also experience issues after these steps:
&gt; 1. remove+rescan to make audio function appear
&gt; 2. remove GPU power (runtime PM or system sleep)
&gt; 3. remove HDMI/DP cable
&gt; 4. restore power
&gt; 5. check dmesg or try to access audio function (e.g. read PCI regs)</s=
pan >

I've had a look at the acpidump of your machine:
<a href=3D"https://github.com/Lekensteyn/acpi-stuff/tree/master/dsl/Clevo_P=
651RA">https://github.com/Lekensteyn/acpi-stuff/tree/master/dsl/Clevo_P651R=
A</a>

Bit 25 at offset 0x488 is named NHDA. In two places (in the _ON method of t=
he
root port's power resource and in _PS0 of the GPU device), the AML code pro=
bes
three GPIO pins and exposes the HDA controller if any of them are high, or =
else
hides the GPU. These GPIO pins are probably wired to HPD of the external
connectors.

I think what happens in the scenario you've described above is: On runtime
suspend or system suspend, the state of the HDA is saved (BARs etc). Because
the cable is disconnected, the HDA will be hidden on resume. Now the kernel
tries to wake the HDA device to D0 and will fail (you should see &quot;Refu=
sed to
change power state, currently in D3&quot; in dmesg). It will then restore t=
he saved
state, which will also fail because the device is inaccessible. Also, the s=
aved
state is invalidated and cannot be restored again. So the HDA's BARs are bl=
ank
until you remove+rescan.

I've just attached three patches, please try those on top of my
switcheroo_devlink_v2 series, they should fix the issue.

Crucially, patch [1/3] now also applies the PCI quirk during the resume_noi=
rq
and runtime_resume phase. This means that in the scenario you've given abov=
e,
even though the BIOS may have hidden the HDA, that change will be undone by=
 the
quirk. The quirk is executed for the GPU device. We know that the HDA device
will resume *after* the GPU device because of the device link.

I cannot test these patches myself because the HDA is never hidden on my
machine. So the patches are compile-tested only.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15206118061.cCAbb1.31513--

--===============1422795107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1422795107==--
