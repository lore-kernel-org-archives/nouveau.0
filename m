From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.11
Date: Wed, 03 Sep 2014 22:16:26 +0200
Message-ID: <5407771A.1050806@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: xorg-announce-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Highlights:    
  - Support for server managed fd's.
  - Glamor support.
  - Maxwell support.
  - DRI3 and initial Present support.
  - vsync'ed kms pageflip performance fixes when running on Linux 3.13+
  - Multi-display vsync, vblank, swap scheduling, timestamping fixes.
  - Multi x-screen support fixes.
  - ZaphodHead support on for multiple outputs per x-screen.
  - EXA nv-10 fixes.
  - Enable sync of swaps to vblank by default (Option GLXVblank "on").
  - Disable pseudo-triplebuffering by default (Option SwapLimit "1").

Ben Skeggs (22):
      silence a warning
      replace NoAccel with AccelMethod in preparation for glamor support
      dri2: move "is supported" checks out of nv_driver.c
      exa: move module load into nouveau_exa_init
      pull copy engine handling into one place, a place that isn't also exa
      merge nv_dma.c into nv_accel_common.c
      50/c0/e0 -> tesla/fermi/kepler
      add support for maxwell, minus Xv/renderaccel
      glamor: initial support (no dri)
      glamor: provide dri3 support when enabled
      default to glamor on maxwell
      sync: fix build against DRI3-less server
      glamor: fix randr resize
      dri2: shuffle some functions around
      dri2: move away from directly touching drmmode on page flips
      dri2: move page flip handling out of drmmode
      kms: implement a more generic event mechanism
      present: initial support
      another build fix...
      fix a harmless typo
      present: use drmmode_head() where it's appropriate
      fix glamor header check

Dave Airlie (1):
      autogen: add support for gnome autobuilder

Emil Velikov (1):
      xorg_list: define the xorg_list* symbols

Hans de Goede (3):
      Add a NVOpenNouveauDevice helper function
      Add support for server managed fds
      Fix building on older servers without xf86platformBus.h

Ilia Mirkin (5):
      update man page with new chips, AccelMethod option
      exa/nv10: use same clip settings as mesa driver
      exa/nv10: use color 0 when the pict format has no RGB component
      exa/nv10: fix blend function setup to check the correct mask
      exa/nv10: src ops should use the SF macro

Marcin Slusarz (2):
      glamor: fix build without glamor.h
      present: build only when glamor is enabled

Mario Kleiner (15):
      Fix nouveau_copy_init()
      dri2: Fix double-sync of pageflips on Linux 3.13+ - Part I
      Add kernel async_flip cap detection. Part II of double-sync fix.
      dri2: Fix kms pageflip completion timestamping.
      dri2: Enable sync of bufferswaps to Vblank by default.
      dri2: Add support for handling more than 2 crtc's
      dri2: Fix drmWaitVblank on multi-x-screen configs.
      Allow/Fix use of multiple ZaphodHead outputs per x-screen.
      dri2 and xv: Fix NVxxSyncToVBlank() for multi-x-screen's.
      Make new ZaphodHeads work across server regenerations.
      Fix event handling on multi-x-screen configs.
      Add file "compile" to .gitignore
      xv/dri2/dri3: Switch to optimized crtc selection for drawables.
      dri2: Set default SwapLimit to 1 for double-buffering.
      Bump version to 1.0.11 for release.

git tag: xf86-video-nouveau-1.0.11

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.11.tar.bz2
MD5:  a0d2932d84ba10c4933c8332c9afe157  xf86-video-nouveau-1.0.11.tar.bz2
SHA1: ea94037f8dd05c223dd89c79a2e655ff58425892  xf86-video-nouveau-1.0.11.tar.bz2
SHA256: f84fe2b2787f3ea9419eac3aa86462b929a551b3dbc4de550cc83b67f3216848  xf86-video-nouveau-1.0.11.tar.bz2
PGP:  http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.11.tar.bz2.sig

http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.11.tar.gz
MD5:  250a0332f0e74e837de039a100d3c957  xf86-video-nouveau-1.0.11.tar.gz
SHA1: 6c0d93bfde32b14ff0b81f4b659be2770cca87c7  xf86-video-nouveau-1.0.11.tar.gz
SHA256: b2c32fe9c839f5c5b111ddffe2698717c5d9cf15174dd9112d0bbd751afadbd2  xf86-video-nouveau-1.0.11.tar.gz
PGP:  http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.11.tar.gz.sig

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUB3Z9AAoJEP5VjHKmcBPD+PUQALrM7GQ0vLE49jyDy03nSGnN
PlXFw/bLiV1VQ/nKG5QBFZf+fYY2SDOWpo2mEnmM/D3cDVarIl0CMp/K2dPHjqWi
i3ew5/AY3LykjcBjKgDmpZmmnrkIFIL8f+43RzyWRcF0++a575Rx4zaDMLhwFMor
5knZmYIqkBE7VFMX2gr6G6OI8ykJj5BGiHQFxgjeL/8QAUlKJ4i1kScz0PjybO37
1NCEmKN1SNWw9yfOX+McRk5pr18b/w090g3htB+uLykd5Rb7FHT/6By1svMLElui
oQwb/4uBjJW/AgBd01/jnC9RqFurwhfTkCgxPZsB0LfoliluXC97NjtQ0eSrxUVv
06tQ0PbdDAfUBPupKN1a8Blahvb35d46Jju/XeSMN8gAjYxZSWEzjCSHHJYA4nYZ
5RMd3y8lKnqUv97GQwAYNnfxZp0ut6gNIYetJm/VbyYV/76b9mAlM6IC43orUOlQ
796I+xpNS6pGbCJaB1bv3yS9gfgxA3KAIJBtOxm1CPWqnB4uV0n/tNHMbOaSt+eh
8ehEQ5gM7RAPSS3aqbkn2F8e1DuoYoWT2+BPH829tqOXDi9eUZh73MHsWfQb0nQN
VzU/4bDFne6pREamX8qqOTkAlVehWTkn8Jn17NHYcrnTIzo7zOvAg8MjGgHtys87
MeWdKKIjQK/oTGvUaAZT
=9pbW
-----END PGP SIGNATURE-----
