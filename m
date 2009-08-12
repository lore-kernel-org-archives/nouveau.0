From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 10/12] drm: Import driver for the ch7006 I2C
	TV encoder chip.
Date: Wed, 12 Aug 2009 14:57:15 +0200
Message-ID: <87ab25qjf8.fsf@riseup.net>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
	<1250036108-28655-11-git-send-email-currojerez@riseup.net>
	<20090812110435.1c9628cd@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0475823446=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090812110435.1c9628cd-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org> (Pekka Paalanen's
	message of "Wed\, 12 Aug 2009 11\:04\:35 +0300")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0475823446==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> writes:

> On Wed, 12 Aug 2009 02:15:06 +0200
> Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
>
>>=20
>> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
>> ---
>>  drivers/gpu/drm/Kconfig           |   14 +
>>  drivers/gpu/drm/Makefile          |    1 +
>>  drivers/gpu/drm/i2c/Makefile      |    3 +
>>  drivers/gpu/drm/i2c/ch7006_drv.c  |  479 ++++++++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/drm/i2c/ch7006_mode.c |  470 ++++++++++++++++++++++++++++++=
++++++
>>  drivers/gpu/drm/i2c/ch7006_priv.h |  332 +++++++++++++++++++++++++
>>  include/drm/i2c/ch7006.h          |   86 +++++++
>>  7 files changed, 1385 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i2c/Makefile
>>  create mode 100644 drivers/gpu/drm/i2c/ch7006_drv.c
>>  create mode 100644 drivers/gpu/drm/i2c/ch7006_mode.c
>>  create mode 100644 drivers/gpu/drm/i2c/ch7006_priv.h
>>  create mode 100644 include/drm/i2c/ch7006.h
>
> This patch should probably go in via dri-devel@ and airlied, like
> the other two DRM patches. Would that work?
>
> It would be unused without Nouveau, so it probably won't get to
> Linus' before Nouveau does. Airlied?
>

Right, as nouveau is its only user, I think it's fine for the nouveau
tree to own ch7006.ko for now.=20

> Does Nouveau build and work otherwise without this patch?
>

Yes.

> If we take it to the nouveau/linux-2.6 master branch, we would
> have to remember to revert it when submitting Nouveau upstream.
> OTOH, we could apply it to master-compat branch for testing.
> How's that sound?
>
>
> Thanks.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqCvDIACgkQ196Zy2qEI5c5IQCggjgzAJZf2Q1GRW0Gx6AZWbZG
I4sAoNXYgos7DTSKCo+oUG37bpKmp2Sy
=G3wg
-----END PGP SIGNATURE-----
--==-=-=--

--===============0475823446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0475823446==--
