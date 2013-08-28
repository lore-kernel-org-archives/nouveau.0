From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: =?utf-8?q?=22Stuttering=22_display=2C_NVA0_chipset=2E?=
Date: Wed, 28 Aug 2013 18:03:53 -0400
Message-ID: <cone.1377727433.415855.3656.1000@monster.email-scan.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1572742780=="
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
List-Id: nouveau.vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--===============1572742780==
Content-Type: multipart/signed;
    boundary="=_monster.email-scan.com-3656-1377727433-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_monster.email-scan.com-3656-1377727433-0001
Content-Type: text/plain; format=flowed; delsp=yes; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

I'm running xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64 and xorg-x11-server- 
Xorg-1.14.2-9.fc19.x86_64

On the following chipset, the display suffers from "stuttering":

06:00.0 VGA compatible controller: NVIDIA Corporation GT200b [GeForce GTX  
285] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd Device 34c9
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+  
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-  
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 256 bytes
        Interrupt: pin A routed to IRQ 24
        Region 0: Memory at f7000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
        Region 5: I/O ports at dc00 [size=128]
        Expansion ROM at f6f80000 [disabled] [size=512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau

[   531.742] (--) NOUVEAU(0): Chipset: "NVIDIA NVA0"

By "stutters" I mean that at random intervals, at least several times a  
minute, the entire display completely freezes, for an interval ranging  
between about quarter of a second, to sometimes as long as 5-6 seconds.

By "freezes" I mean that it just stops updating. No artifacts, just a frozen  
display.

When the display eventually becomes unstuck, it's completely up to date.  
Everything that should be rendered, to that point, is rendered. It's as if  
the framebuffer continues to get updated normally, but the display is not  
being refreshed. Except for the mouse pointer! When the display is not  
refreshing, the mouse pointer continues to be responsive.

Basically, if I'm playing some video, the audio keeps going, the video stops  
for 1-6 seconds, then continues running, synchronized with the audio. Or, if  
I'm typing something on the terminal, after the display unsticks itself,  
everything that was typed in the interim, is where it should be. That's the  
best way I can describe it.

I see no complaints in /var/log/messages, nor in Xorg.0.log

I have the same kernel, nouveau, and Xorg version running on different  
hardware with an NVC1 chipset, no issues there. That display is smooth as  
butter.

I'm fairly certain that this is a recent regression. I've had this hardware  
for at least three years, and this problem is fairly recent. Can't quite  
recall at which kernel/Xorg/nouveau version this started happening.

I don't think it's a bad DVI cable. If I drop out of X, and to som work on  
the console terminal (VESA framebuffer display only), the display does not  
appear to stutter at all.


--=_monster.email-scan.com-3656-1377727433-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAABAgAGBQJSHnPJAAoJEGs6Yr4nnb8lxNIQAOkRDyrg9mFG5vRQFOuFZrxW
SBMeV6s/O/rtXr2ZV5el6C2ycCCBDO+AghTDY8XZs7+SozzSdJcNaamrcr8OZGn3
Con/sH1L0KV9V2aufDa0FoxWNbF1t1MecbZJ+xHAcYyQJkgvmQES3Pj/1eoZTsVy
LGfSpNUv7dq4bA78iXKRIlyao2jYEUsUwhrt804KnmhocYaiQPpQHknAyGAkdtQM
uX8AvtQsbiWPJAtiye6yVWMV3LcKgh/NUyFde0Un9ICmzbu2a7ZrYplzyrsgyM0u
1h2+FIgZjUzQRgBEgdSgvAicz+1/JjsJT3fElKjeVSlbvvSERKx5WAMliZ3TU9rz
VwQK7GXYwy4SBCMN3K6c4t5OZ+30T/vnIeftLR9atJkyOWTAAhQD/EYKZTAUgLkD
cmlEY3eKHnW5gJQHzlVJi5LbJ0DkVjPEkJFVqs3t387u325lfJNZGjI0jSZzTuLH
0KLHLFr9pD3TpNDRMKSjokreQgTvEnEV2Z8Nmv3slDxyl3koF7c2rP9jtphEyMdv
Rn8HCWOsyG80y9l6L8XBKRdE1TujKmElYYp4uzNItHYxeEzvRCXt+tX+XVz+Zx7u
hHDI1wnmmboAhiYmfHAywi543XcVi1XzBzJfA+qCUOqndmrKG3id+hK86Kl1JTmd
b+eBeIafdmiBfrgPfdE9
=X9hF
-----END PGP SIGNATURE-----

--=_monster.email-scan.com-3656-1377727433-0001--

--===============1572742780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1572742780==--
