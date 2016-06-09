From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/15] Runtime pm ref leak bonanza
Date: Thu, 9 Jun 2016 17:20:30 +1000
Message-ID: <b4e3a8a6-cb44-80bf-8834-419afc2d1cb4@gmail.com>
References: <cover.1465392124.git.lukas@wunner.de>
 <20160609065032.GI3363@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2123908158=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20160609065032.GI3363-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2123908158==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KiK1NULpnNnPawblfcchsdpRpxRTadT4g"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KiK1NULpnNnPawblfcchsdpRpxRTadT4g
Content-Type: multipart/mixed; boundary="anwTP4w1sDPVwERt4ivLFfM42tomPbXGF"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <b4e3a8a6-cb44-80bf-8834-419afc2d1cb4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 00/15] Runtime pm ref leak bonanza
References: <cover.1465392124.git.lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
 <20160609065032.GI3363-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
In-Reply-To: <20160609065032.GI3363-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>

--anwTP4w1sDPVwERt4ivLFfM42tomPbXGF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/09/2016 04:50 PM, Daniel Vetter wrote:
> On Wed, Jun 08, 2016 at 06:47:27PM +0200, Lukas Wunner wrote:
>> Second iteration of my endeavour to rid nouveau, radeon and amdgpu of
>> runtime pm ref leaks.
>>
>> Patches 1 to 8 are identical to v1.
>>
>> Patch 9 of v1 modified the DRM core to turn off all CRTCs on driver
>> unload. Based on feedback by Daniel Vetter, I've replaced this with
>> a helper to turn off all CRTCs, which is called by nouveau, radeon
>> and amdgpu on unload. In other words, this is now opt-in.
>> So patch 9 of v1 is replaced with new patches 9 to 12.
>>
>> A by-product of patch 9 is a helper which turns off a *single* CRTC.
>> This is open coded in three other places in the DRM tree and patches
>> 13 to 15 refactor those to use the new helper.
>=20
> Yeah I think this makes much more sense. Please poke amd/nouveau folks =
for
> reviews/acks, then I can merge.
Looks fine to me.

Ben.

> -Daniel
>=20
>>
>> To ease reviewing, I've pushed this series to GitHub:
>> https://github.com/l1k/linux/commits/drm_runpm_fixes_v2
>>
>> The discussion on v1 is archived here:
>> https://lists.freedesktop.org/archives/dri-devel/2016-May/thread.html#=
108278
>>
>> Thanks,
>>
>> Lukas
>>
>> Lukas Wunner (15):
>>   drm/nouveau: Don't leak runtime pm ref on driver unload
>>   drm/nouveau: Forbid runtime pm on driver unload
>>   drm/radeon: Don't leak runtime pm ref on driver unload
>>   drm/radeon: Don't leak runtime pm ref on driver load
>>   drm/radeon: Forbid runtime pm on driver unload
>>   drm/amdgpu: Don't leak runtime pm ref on driver unload
>>   drm/amdgpu: Don't leak runtime pm ref on driver load
>>   drm/amdgpu: Forbid runtime pm on driver unload
>>   drm: Add helpers to turn off CRTCs
>>   drm/nouveau: Turn off CRTCs on driver unload
>>   drm/radeon: Turn off CRTCs on driver unload
>>   drm/amdgpu: Turn off CRTCs on driver unload
>>   drm: Use helper to turn off CRTC
>>   drm/i2c/ch7006: Use helper to turn off CRTC
>>   drm/nouveau/dispnv04: Use helper to turn off CRTC
>>
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++--
>>  drivers/gpu/drm/drm_crtc.c                 | 53 +++++++++++++++++++++=
+++++----
>>  drivers/gpu/drm/i2c/ch7006_drv.c           |  9 ++---
>>  drivers/gpu/drm/nouveau/dispnv04/disp.c    | 10 ------
>>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c  |  9 ++---
>>  drivers/gpu/drm/nouveau/nouveau_display.c  |  1 +
>>  drivers/gpu/drm/nouveau/nouveau_drm.c      |  6 +++-
>>  drivers/gpu/drm/radeon/radeon_device.c     |  4 +++
>>  drivers/gpu/drm/radeon/radeon_display.c    |  1 +
>>  drivers/gpu/drm/radeon/radeon_kms.c        |  5 ++-
>>  include/drm/drm_crtc.h                     |  2 ++
>>  12 files changed, 77 insertions(+), 36 deletions(-)
>>
>> --=20
>> 2.8.1
>>
>=20


--anwTP4w1sDPVwERt4ivLFfM42tomPbXGF--

--KiK1NULpnNnPawblfcchsdpRpxRTadT4g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXWRjBAAoJEHYLnGJQkpH7ZNAQAL7vj7WldbSN1c1D4QkWC075
9p7QUINuHfWb4apKO95VcN+iDoW6C/m/U9GlIUdEuKsBA8UoSXMXSrB28AF03bIB
ou7PtSiLb0DQCPbJ4ZSsBhOzE//Cm3aY6N97DXrKzLpbNH5Dzbxtrj/VDaK1va+G
y1ZYCUlDWbJdRunXwQgQ/90/YajBH5DLlHtKQEuu4sBlcpuibEzvT+SRrxdkHRRm
bnRRQteBmZgK8n//OTPGFRAQwm15AW2MXPqAz6ICwbXOQAzUn5ypglJzBqkb3/ux
d4rB/TiTjXxz+CTp9e0VRiMTFe5uBC4fT7AbUUA5ypNa9IY34pKwTMVnZor4qb9Y
fx6bOGW+xWvdjEKfeuq1Tx68YBSEGcJTNUsYm9KXgadORJp+l1QzyKcc7Re3i4IY
1DilSQEJSysNNJc/bwYMYjLnCpt7jqPf7uTkKPRsWaTZnwLKxLczTr9cEMLGts3W
1EOfaPj0kPavEnqJ1GKHX81qtR2oYNxL3os+VglBnBrTlb5wbeTASz1gk1eP6f3O
FiaKo8DyJpwbL1SRkmGsKN2/wcWJ1gK9UZSIA+d4geXwrN4ZOQ9sa7ewjLoHobSh
sckizjXAlS/wjM4b69+5FfRoE72MmxYkTVrsepxc88vr12TMjk1AJBfaCrfpPUCX
zfbgHpUnC4tOkcA+UHlR
=9hAF
-----END PGP SIGNATURE-----

--KiK1NULpnNnPawblfcchsdpRpxRTadT4g--

--===============2123908158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2123908158==--
