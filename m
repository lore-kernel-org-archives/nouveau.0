From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Thu, 22 Dec 2016 23:05:03 +0000
Message-ID: <bug-75985-8800-LLmS6BS5y2@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284725344=="
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


--===============1284725344==
Content-Type: multipart/alternative; boundary="14824479031.AFFcDfF.30357";
 charset="UTF-8"


--14824479031.AFFcDfF.30357
Date: Thu, 22 Dec 2016 23:05:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #10 from zigarrre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Any updates?

I can confirm this bug on my Lenovo Thinkpad T520 (4242-PT2). For testing I
used a FHD TV connected via a DP to HDMI connector. The hardware setup was
tested and confirmed to work as expected with Windows 7 so a hardware cause=
 can
be ruled out.

uname -a
Linux t520 4.8.13-1-ARCH #1 SMP PREEMPT Fri Dec 9 07:24:34 CET 2016 x86_64
GNU/Linux

I am using the optimus implementation provided by nouveau together with the
intel graphics driver.

xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x8c cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
3 outputs: 3 associated providers: 0 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 5 associated providers: 0 name:nouveau

'lspci' doesn't show the audio device but 'lspci -H1' does:
01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 42=
00M]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GF119 HDMI Audio Controller (rev a=
1)

Even 'lspci -H1' shows the audio device only when the discrete GPU is power=
ed
up (e.g. by doing 'lspci; lspci -H1').

I am not using a DM or a DE but bspwm launched via startx from the tty.

The procedure I used:
1) boot and login (x not yet started)
2) modprobe nouveau
3) echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove
4) echo 1 > /sys/bus/pci/rescan
5) lspci now shows the audio device
6) startx
7) open pavucontrol (to trigger launch of pulseaudio via rtkit)

It made no difference when, or even if a device is connected to the DP Port.
The output wasn't usable even with this workaround as pulseaudio showed it
always as unplugged. On one single attempt it did show as connected and wor=
ked
ok but even though following procedure exactly and trying many times I was =
not
able to reproduce this.

After starting pulseaudio multiple errors of the form 'kernel:
snd_hda_codec_hdmi hdaudioC2D0: out of range cmd 0:5:707:ffffffff' showed u=
p.

The usage of this workaround also lead to a very unstable system till the n=
ext
boot. I experienced cpu soft locks multiple times (though found no way to
reliably reproduce them) from which no recovery except hard resetting the
computer was possible.

Attached is a dmesg log where I follow the above procedure (connecting the
display between steps 3 and 4) and activating/deactivating the display with
xrandr once in the end.
I could also provide a syslog from boot till shutdown recorded with journal=
d if
required.

If I can help fixing this by providing more information or testing things l=
et
me know.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14824479031.AFFcDfF.30357
Date: Thu, 22 Dec 2016 23:05:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
zigarrre&#64;gmail.com" title=3D"zigarrre&#64;gmail.com">zigarrre&#64;gmail=
.com</a>
</span></b>
        <pre>Any updates?

I can confirm this bug on my Lenovo Thinkpad T520 (4242-PT2). For testing I
used a FHD TV connected via a DP to HDMI connector. The hardware setup was
tested and confirmed to work as expected with Windows 7 so a hardware cause=
 can
be ruled out.

uname -a
Linux t520 4.8.13-1-ARCH #1 SMP PREEMPT Fri Dec 9 07:24:34 CET 2016 x86_64
GNU/Linux

I am using the optimus implementation provided by nouveau together with the
intel graphics driver.

xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x8c cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
3 outputs: 3 associated providers: 0 name:Intel
Provider 1: id: 0x66 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 5 associated providers: 0 name:nouveau

'lspci' doesn't show the audio device but 'lspci -H1' does:
01:00.0 VGA compatible controller: NVIDIA Corporation GF119M [Quadro NVS 42=
00M]
(rev a1)
01:00.1 Audio device: NVIDIA Corporation GF119 HDMI Audio Controller (rev a=
1)

Even 'lspci -H1' shows the audio device only when the discrete GPU is power=
ed
up (e.g. by doing 'lspci; lspci -H1').

I am not using a DM or a DE but bspwm launched via startx from the tty.

The procedure I used:
1) boot and login (x not yet started)
2) modprobe nouveau
3) echo 1 &gt; /sys/bus/pci/devices/0000:01:00.0/remove
4) echo 1 &gt; /sys/bus/pci/rescan
5) lspci now shows the audio device
6) startx
7) open pavucontrol (to trigger launch of pulseaudio via rtkit)

It made no difference when, or even if a device is connected to the DP Port.
The output wasn't usable even with this workaround as pulseaudio showed it
always as unplugged. On one single attempt it did show as connected and wor=
ked
ok but even though following procedure exactly and trying many times I was =
not
able to reproduce this.

After starting pulseaudio multiple errors of the form 'kernel:
snd_hda_codec_hdmi hdaudioC2D0: out of range cmd 0:5:707:ffffffff' showed u=
p.

The usage of this workaround also lead to a very unstable system till the n=
ext
boot. I experienced cpu soft locks multiple times (though found no way to
reliably reproduce them) from which no recovery except hard resetting the
computer was possible.

Attached is a dmesg log where I follow the above procedure (connecting the
display between steps 3 and 4) and activating/deactivating the display with
xrandr once in the end.
I could also provide a syslog from boot till shutdown recorded with journal=
d if
required.

If I can help fixing this by providing more information or testing things l=
et
me know.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14824479031.AFFcDfF.30357--

--===============1284725344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1284725344==--
