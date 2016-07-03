From: thierry DeTheGeek <dethegeek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Displays goes in standby mode on boot when HDMI/DVI used
	(VM + PCI passthrough)
Date: Sun, 3 Jul 2016 20:19:24 +0200
Message-ID: <CANv3NVff18DoQh6UJ096+8Qp1XrniRkm3wAqZWHj6KJUHLQS7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1182332200=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

--===============1182332200==
Content-Type: multipart/alternative; boundary=001a1146f2b4c27ec10536bf44f5

--001a1146f2b4c27ec10536bf44f5
Content-Type: text/plain; charset=UTF-8

Hi

I have an issue with a Nvidia GeForce 710 graphic card since several weeks,
probably related to a bug in Nouveau.

Here is my setup :
A Computer based on X58 chipset running Proxmox VE 4.x. The graphic card is
used by a qemu-kvm virtual machine running Debian 9 testing thanks to PCI
passthrough.

The issue : the graphic card has 1 VGA, 1 DVI, 1 HDMI outputs. If a DVI or
HDMI monitor is plugged when the guest OS boots, all connected displays
switch to standby mode, but the guest VM is alive. I can open a ssh session)

I found several workarounds :
- disable framebuffer in the guest OS (therefore disabling Nouveau)
- plug the HDMI or DVI monitor after the guest is ready, and detect the
monitors in XFCE
- install nvidia-driver package (and disable Nouveau)

- disabling framebuffer is not an acceptable option for me.
- unpluging / repluging a monitor est quite annoying, the not an option.
- the nvidia-driver is a non-free package, the I wish to find a better
solution is possible.

Is there an other know orkaround ?

If it is a bug, I need help to gather useful data for developers and fill a
bug report

Thank you very much in advance.

--001a1146f2b4c27ec10536bf44f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>I have an issue with a Nvidia GeForc=
e 710 graphic card since several weeks, probably related to a bug in Nouvea=
u.<br></div><div><br></div><div>Here is my setup :</div><div>A Computer bas=
ed on X58 chipset running Proxmox VE 4.x. The graphic card is used by a qem=
u-kvm virtual machine running Debian 9 testing thanks to PCI passthrough.<b=
r></div><div><br></div><div>The issue : the graphic card has 1 VGA, 1 DVI, =
1 HDMI outputs. If a DVI or HDMI monitor is plugged when the guest OS boots=
, all connected displays switch to standby mode, but the guest VM is alive.=
 I can open a ssh session)</div><div><br></div><div>I found several workaro=
unds :</div><div>- disable framebuffer in the guest OS (therefore disabling=
 Nouveau)</div><div>- plug the HDMI or DVI monitor after the guest is ready=
, and detect the monitors in XFCE</div><div>- install nvidia-driver package=
 (and disable Nouveau)</div><div><br></div><div>- disabling framebuffer is =
not an acceptable option for me.</div><div>- unpluging / repluging a monito=
r est quite annoying, the not an option.</div><div>- the nvidia-driver is a=
 non-free package, the I wish to find a better solution is possible.<br></d=
iv><div><br></div><div>Is there an other know orkaround ?</div><div><br></d=
iv><div>If it is a bug, I need help to gather useful data for developers an=
d fill a bug report</div><div><br></div><div>Thank you very much in advance=
.</div></div>

--001a1146f2b4c27ec10536bf44f5--

--===============1182332200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1182332200==--
