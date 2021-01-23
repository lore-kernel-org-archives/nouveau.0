From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.17
Date: Sat, 23 Jan 2021 14:19:57 -0500
Message-ID: <20210123191957.24443-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: xorg-announce-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xorg-go0+a7rfsptAfugRpC6u6w@public.gmane.org
List-Id: nouveau.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


Carlo Caione (1):
      Don't advertise any PRIME offloading capabilities without acceleration

Ilia Mirkin (8):
      nv4/exa: tiling is unsupported pre-nv10, reduce alignment requirements
      dri2,present: move in pixmap before getting addresses
      make error when failing to allocate surface more descriptive
      drmmode: fix screen resize without acceleration
      present: don't enable if there's no acceleration
      drmmode: make event handler leave a note that there are stuck events
      present: fix handling of drmWaitVBlank failures
      Bump version to 1.0.17

git tag: xf86-video-nouveau-1.0.17

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.bz2
SHA256: 499322e27a55c8183166bf2dd1e47d085eb834143e0d7036baba8427b90c156b  xf86-video-nouveau-1.0.17.tar.bz2
SHA512: adba58ba5298d1a5b3f9f8540f9ef2cb2e10e47bba8e374103ec2e1f92e915f5f4393ed0021168cd649646e12315135a1efcdf77e8fb1648e1295914d87279b2  xf86-video-nouveau-1.0.17.tar.bz2
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.bz2.sig

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.gz
SHA256: 21e9233b2c6304b976c526729ba48660c16976a757a319fa95cc8a8605316105  xf86-video-nouveau-1.0.17.tar.gz
SHA512: 10336f521d39289b214ce640b8b7195f4709ab780a4057ba83d02c2f3b4f7c7b17e37cf5f3224c43bf39aa8939a8836be1ee9eb26901d713cb98d161db2375e9  xf86-video-nouveau-1.0.17.tar.gz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.17.tar.gz.sig

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEv7mwwnbVdnxxAIbvsXi+TqB13gcFAmAMdncACgkQsXi+TqB1
3gdS/Qf+NuLPs8PKUjwyEZNl5pDchnRkqsNVie22oguVUqhI0VgLYjBxPBwvoiZz
iyDJwRSIRgIR5YwIjz/YZ4SBx2TI7pESjxfYAAowOmxMNe3jiQIOC8OChmQFPEtl
a9NdiKJifpex34y+YnXwZjGqUo1aG489DPCjeOKH4WoNB19LlV6sD1bHj2QxLAUc
lqzZ2Hq8Nb6RVb0LRyywEccMA1jRlW0re1W8/3igBznPUunk8hznGpbFDtmUvVqc
sOvkW1iwP8BWt0/pVG2iikIhaQvtrWF5+9XgqjC72RCo4iaGycJCS/GvQV6xWVVk
L3AvL1HjlKLc9xIMQcp/44vkhPKJTw==
=6/s4
-----END PGP SIGNATURE-----
