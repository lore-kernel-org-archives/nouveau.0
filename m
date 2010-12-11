From: Giacomo <delleceste-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: vga switcheroo not working / crashing the machine on
 i915/nvidia hybrid. (ASUS U30JC)
Date: Sat, 11 Dec 2010 15:05:14 +0100
Message-ID: <AANLkTimkHLNA_kYKp3P1Qyrass7puqGYzQi3LxQNNV5q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello.

In my double-carded ASUS U30JC (nvidia + intel i915) I do the following:

stop X

This is the output of /sys/kernel/debug/vgaswitcheroo/switch

daphne linux # cat /sys/kernel/debug/vgaswitcheroo/switch
0: :Pwr:0000:01:00.0
1:+:Pwr:0000:00:02.0 (intel graphic card in use, ok)

echo "DDIS" > /sys/kernel/debug/vgaswitcheroo/switch does not change
the output above (intel remains marked as active)

echo "OFF" > /sys/kernel/debug/vgaswitcheroo/switch

seems to switch off Nvidia card, because the output above becomes:
0: :Off:0000:01:00.0
1:+:Pwr:0000:00:02.0

restarting X completely freezes the machine, black screen (need to power do=
wn
by
pressing the power button).


ASUS U30JC Nvidia (nouveau) + intel i915.

Kernel 2.6.35
x11-base/xorg-server 1.9.2.902
x11-drivers/xf86-video-nouveau 0.0.16_pre20101010

Shutting down the Nvidia graphic card via acpi_call
https://github.com/mkottman/acpi_call
produces the same freeze after trying to restart X.

Same problem with kernel 2.6.36 and acpi_call.
Did not try vga switcheroo on 2.6.36 due to problems with that kernel

https://bugzilla.kernel.org/show_bug.cgi?id=3D24542

echo "OFF" > /sys/kernel/debug/vgaswitcheroo/switch

produces in dmesg:

Dec  8 00:06:18 daphne kernel: VGA switcheroo: switched nouveau off
Dec  8 00:06:18 daphne kernel: [drm] nouveau 0000:01:00.0: Disabling fbcon
acceleration...
Dec  8 00:06:18 daphne kernel: [drm] nouveau 0000:01:00.0: Unpinning
framebuffer(s)...
Dec  8 00:06:18 daphne kernel: [drm] nouveau 0000:01:00.0: Evicting buffers=
...
Dec  8 00:06:18 daphne kernel: [drm] nouveau 0000:01:00.0: Idling channels.=
..
Dec  8 00:06:18 daphne kernel: [drm] nouveau 0000:01:00.0: Suspending GPU
objects...
Dec  8 00:06:19 daphne kernel: [drm] nouveau 0000:01:00.0: And we're gone!
Dec  8 00:06:19 daphne kernel: nouveau 0000:01:00.0: PCI INT A disabled
Dec  8 00:06:19 daphne kernel: nouveau 0000:01:00.0: power state changed by
ACPI to D3

which seems to be correct.

The crash taking place when restarting X does not leave any trace on dmesg.

Thanks in advance.

Giacomo.
Elettra Synchrotron Radiation Facility
Trieste, IT.

-- =

Giacomo S.
http://www.giacomos.it

- - - - - - - - - - - - - - - - - - - - - -

* iqfire-wall, un progetto
=A0 open source che implementa un
=A0 filtro di pacchetti di rete per Linux,
=A0 e` disponibile per il download qui:
=A0 http://sourceforge.net/projects/ipfire-wall

* Informazioni e pagina web ufficiale:
=A0 http://www.giacomos.it/iqfire/index.html

- - - - - - - - - - - - - - - - - - - - - -

=A0. ''=A0 `.
:=A0=A0 :'=A0 =A0 :
=A0`.=A0 ` '
=A0 =A0 `- Debian GNU/Linux -- The power of freedom
=A0 =A0 =A0 =A0 http://www.debian.org
