From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sun, 31 Mar 2019 09:57:59 +0000
Message-ID: <bug-75985-8800-XBZnriTS0u@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0584646592=="
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


--===============0584646592==
Content-Type: multipart/alternative; boundary="15540262807.E25C8.4818"
Content-Transfer-Encoding: 7bit


--15540262807.E25C8.4818
Date: Sun, 31 Mar 2019 09:58:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #74 from Eugene Medvedev <rn3aoh.g-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Maik Freudenberg from comment #27)
> Created attachment 136418 [details]
> Kernel module to toggle audio function

I have a somewhat strange variation on the bug when using your kernel module
workaround.

MSI GE63 Raider 8RF looks like this when everything's working:

00:00.0 Host bridge: Intel Corporation 8th Gen Core Processor Host Bridge/D=
RAM
Registers (rev 07)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Co=
re
Processor PCIe Controller (x16) (rev 07)
00:02.0 VGA compatible controller: Intel Corporation Device 3e9b
00:12.0 Signal processing controller: Intel Corporation Cannon Lake PCH The=
rmal
Controller (rev 10)
00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host
Controller (rev 10)
00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 10)
00:14.3 Network controller: Intel Corporation Wireless-AC 9560 [Jefferson P=
eak]
(rev 10)
00:16.0 Communication controller: Intel Corporation Cannon Lake PCH HECI
Controller (rev 10)
00:17.0 SATA controller: Intel Corporation Device a353 (rev 10)
00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port=
 9
(rev f0)
00:1d.6 PCI bridge: Intel Corporation Device a336 (rev f0)
00:1f.0 ISA bridge: Intel Corporation Device a30d (rev 10)
00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH SPI
Controller (rev 10)
01:00.0 VGA compatible controller: NVIDIA Corporation GP104M [GeForce GTX 1=
070
Mobile] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Contro=
ller
(rev a1)
02:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc.
Device 5008 (rev 01)
03:00.0 Ethernet controller: Qualcomm Atheros Killer E2500 Gigabit Ethernet
Controller (rev 10)

What's strange is that upon cold boot -- using the proprietary driver -- the
audio subdevice is missing entirely -- even from "lspci -H1" and can't be
enabled:

[    3.214369] nvhda: version 0.01
[    3.214373] nvhda: Found nv VGA device 0000:01:00.0
[    3.214377] nvhda: enabling audio
[    3.214378] nvhda: Not multifunction, no audio
[    3.214380] nvhda: Succesfully loaded. Audio 0000:01:00.0 is off

Unloading and reloading the module after the boot has completed makes no
difference, it doesn't work. Upon suspending and resuming once, however, the
device is there on "lspci -H1", and the module can enable it. I ended up
setting the module up to unload on suspend and load on resume, so that I can
just do a suspend/resume when I need to use HDMI output, which isn't that
often.

I can supply further data and experiment a bit if needed, but my understand=
ing
of this area of hardware is essentially nil.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15540262807.E25C8.4818
Date: Sun, 31 Mar 2019 09:58:00 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c74">Commen=
t # 74</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rn3aoh.g&#64;gmail.com" title=3D"Eugene Medvedev &lt;rn3aoh.g&#64;gmail.com=
&gt;"> <span class=3D"fn">Eugene Medvedev</span></a>
</span></b>
        <pre>(In reply to Maik Freudenberg from <a href=3D"show_bug.cgi?id=
=3D75985#c27">comment #27</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D136418" name=3D"attach_136418" title=3D"Kernel module to toggle aud=
io function">attachment 136418</a> <a href=3D"attachment.cgi?id=3D136418&am=
p;action=3Dedit" title=3D"Kernel module to toggle audio function">[details]=
</a></span>
&gt; Kernel module to toggle audio function</span >

I have a somewhat strange variation on the bug when using your kernel module
workaround.

MSI GE63 Raider 8RF looks like this when everything's working:

00:00.0 Host bridge: Intel Corporation 8th Gen Core Processor Host Bridge/D=
RAM
Registers (rev 07)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Co=
re
Processor PCIe Controller (x16) (rev 07)
00:02.0 VGA compatible controller: Intel Corporation Device 3e9b
00:12.0 Signal processing controller: Intel Corporation Cannon Lake PCH The=
rmal
Controller (rev 10)
00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host
Controller (rev 10)
00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 10)
00:14.3 Network controller: Intel Corporation Wireless-AC 9560 [Jefferson P=
eak]
(rev 10)
00:16.0 Communication controller: Intel Corporation Cannon Lake PCH HECI
Controller (rev 10)
00:17.0 SATA controller: Intel Corporation Device a353 (rev 10)
00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port=
 9
(rev f0)
00:1d.6 PCI bridge: Intel Corporation Device a336 (rev f0)
00:1f.0 ISA bridge: Intel Corporation Device a30d (rev 10)
00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH SPI
Controller (rev 10)
01:00.0 VGA compatible controller: NVIDIA Corporation GP104M [GeForce GTX 1=
070
Mobile] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Contro=
ller
(rev a1)
02:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc.
Device 5008 (rev 01)
03:00.0 Ethernet controller: Qualcomm Atheros Killer E2500 Gigabit Ethernet
Controller (rev 10)

What's strange is that upon cold boot -- using the proprietary driver -- the
audio subdevice is missing entirely -- even from &quot;lspci -H1&quot; and =
can't be
enabled:

[    3.214369] nvhda: version 0.01
[    3.214373] nvhda: Found nv VGA device 0000:01:00.0
[    3.214377] nvhda: enabling audio
[    3.214378] nvhda: Not multifunction, no audio
[    3.214380] nvhda: Succesfully loaded. Audio 0000:01:00.0 is off

Unloading and reloading the module after the boot has completed makes no
difference, it doesn't work. Upon suspending and resuming once, however, the
device is there on &quot;lspci -H1&quot;, and the module can enable it. I e=
nded up
setting the module up to unload on suspend and load on resume, so that I can
just do a suspend/resume when I need to use HDMI output, which isn't that
often.

I can supply further data and experiment a bit if needed, but my understand=
ing
of this area of hardware is essentially nil.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15540262807.E25C8.4818--

--===============0584646592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0584646592==--
