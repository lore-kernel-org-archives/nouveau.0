From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Sat, 02 Nov 2019 15:40:04 +0000
Message-ID: <bug-100228-8800-oESJu8Qhrx@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1522317133=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1522317133==
Content-Type: multipart/alternative; boundary="15727092060.bbE4f9.9242"
Content-Transfer-Encoding: 7bit


--15727092060.bbE4f9.9242
Date: Sat, 2 Nov 2019 15:40:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #44 from Andrey Melentyev <andrey+freedesktop-TVrNfIo4idvLoDKTGw+V6w@public.gmane.org> ---
Got some time to test runpm_fixes branch by Karol Herbst:
https://github.com/karolherbst/linux/commits/runpm_fixes

Applying the two latest commits bbb0b9a16c86fc54fe296df73000da3fba4e91b6 and
749a9c843f646ceac39e14601b64e5bbf202a47c from this branch to kernel version
5.3.8 allows me to use nouveau on Thinkpad X1 Extreme Gen 1 laptop with GP1=
07M
[GeForce GTX 1050 Ti Mobile] (rev a1)

What works

- Offloading with DRI_PRIME
- Reverse PRIME: HDMI port wired to the NVIDIA GPU works
- Power management (see note below)
- Suspend and resume

I was testing under X11 with modesetting DDX for both iGPU and dGPU. Haven't
tried Wayland or any sort of video decoding acceleration.

Power management

After loading nouveau module, idle dGPU doesn't power down, albeit power
control is set to "auto" for both the GPU and its audio device via sysfs. T=
his
can be worked around by setting the power to on and then back to auto:

echo -n "on" >/sys/bus/pci/devices/0000:01:00.1/power/control && echo -n "a=
uto"
>/sys/bus/pci/devices/0000:01:00.1/power/control

Once the idle audio device and GPU itself are powered down correctly, I get
power usage similar (same?) to when bbswitch is used.

Not sure if https://bugzilla.kernel.org/show_bug.cgi?id=3D156341 is relevant
here.

Thanks Karol and everyone involved, hope to see it mainlined eventually.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15727092060.bbE4f9.9242
Date: Sat, 2 Nov 2019 15:40:06 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c44">Comme=
nt # 44</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey+freedesktop&#64;psyduck.se" title=3D"Andrey Melentyev &lt;andrey+fre=
edesktop&#64;psyduck.se&gt;"> <span class=3D"fn">Andrey Melentyev</span></a>
</span></b>
        <pre>Got some time to test runpm_fixes branch by Karol Herbst:
<a href=3D"https://github.com/karolherbst/linux/commits/runpm_fixes">https:=
//github.com/karolherbst/linux/commits/runpm_fixes</a>

Applying the two latest commits bbb0b9a16c86fc54fe296df73000da3fba4e91b6 and
749a9c843f646ceac39e14601b64e5bbf202a47c from this branch to kernel version
5.3.8 allows me to use nouveau on Thinkpad X1 Extreme Gen 1 laptop with GP1=
07M
[GeForce GTX 1050 Ti Mobile] (rev a1)

What works

- Offloading with DRI_PRIME
- Reverse PRIME: HDMI port wired to the NVIDIA GPU works
- Power management (see note below)
- Suspend and resume

I was testing under X11 with modesetting DDX for both iGPU and dGPU. Haven't
tried Wayland or any sort of video decoding acceleration.

Power management

After loading nouveau module, idle dGPU doesn't power down, albeit power
control is set to &quot;auto&quot; for both the GPU and its audio device vi=
a sysfs. This
can be worked around by setting the power to on and then back to auto:

echo -n &quot;on&quot; &gt;/sys/bus/pci/devices/0000:01:00.1/power/control =
&amp;&amp; echo -n &quot;auto&quot;
<span class=3D"quote">&gt;/sys/bus/pci/devices/0000:01:00.1/power/control</=
span >

Once the idle audio device and GPU itself are powered down correctly, I get
power usage similar (same?) to when bbswitch is used.

Not sure if <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D156341=
">https://bugzilla.kernel.org/show_bug.cgi?id=3D156341</a> is relevant
here.

Thanks Karol and everyone involved, hope to see it mainlined eventually.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15727092060.bbE4f9.9242--

--===============1522317133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1522317133==--
