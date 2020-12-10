From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 09/20] drm/i915: Remove references to struct
 drm_device.pdev
Date: Thu, 10 Dec 2020 10:24:15 +0100
Message-ID: <48afe494-eab1-7dac-0f8c-ad1acd31cbfe@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-10-tzimmermann@suse.de>
 <7c9b3127-0e79-fd22-0bba-b3e8430d876a@suse.de> <875z5a9gns.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1510891691=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <875z5a9gns.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1510891691==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LHeFyx9QqIlGkEMELLBaAod1WWnnwq7bD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LHeFyx9QqIlGkEMELLBaAod1WWnnwq7bD
Content-Type: multipart/mixed; boundary="UYNLXYvdyqt1LAH6LX9dVWFS9wYsDJzAN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org,
 daniel-/w4YWyX8dFk@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org,
 amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
 spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <48afe494-eab1-7dac-0f8c-ad1acd31cbfe-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 09/20] drm/i915: Remove references to struct
 drm_device.pdev
References: <20201201103542.2182-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20201201103542.2182-10-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <7c9b3127-0e79-fd22-0bba-b3e8430d876a-l3A5Bk7waGM@public.gmane.org> <875z5a9gns.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
In-Reply-To: <875z5a9gns.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

--UYNLXYvdyqt1LAH6LX9dVWFS9wYsDJzAN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.12.20 um 10:03 schrieb Jani Nikula:
> On Tue, 08 Dec 2020, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org> wrote:
>> ping for a review of the i915 patches
>=20
> What did you have in mind regarding merging the series? Should we just
> pick the patches up?

Originally I thought that individual trees would merge their rsp=20
patches. I guess the larger drivers could get some minor conflicts.

Amdgpu/radeon devs suggested to put everything into drm-misc-next at=20
once. I'd prefer that, but ultimately it's up to you.

Best regards
Thomas

>=20
> BR,
> Jani.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--UYNLXYvdyqt1LAH6LX9dVWFS9wYsDJzAN--

--LHeFyx9QqIlGkEMELLBaAod1WWnnwq7bD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/R6T8FAwAAAAAACgkQlh/E3EQov+D+
yBAAkmsb7v4JGw4GBDqZWXkf5yeRsZn3lzy9FuCJ49HPiWArqivWYnYoWu9O070xkrdvcGcbAsTO
L/JtiL8Nd5xwyw9A0lRhxes/adNTLIStoJGT/JfLUHLGXO3CiO2OnKxKnOMihtqlB/dUlvmB2B7J
4mNXjMyo06DEcDvsyFATN3BYRFRj1MFYUkzwXMrLAHQ9QXyvHrBMU6sfBuN/zwnKrXPmy9NevK2w
SAuSBY8kMiimRwWYSF2ZlaC/TVE9S97iEiTU7jo5CkXetNBVNUABRUOvG3JIlISV2GeJ19MBaPPd
KcJUyxuCLT/TJU+DPnfw92YWHbb/LGAEpsSCB0wd1S7Uokf3XDiqYfOn9PXRfsqo+m+lYv9AhPEz
MGpCSuqZFIv4OO9wQsUIeTZlqyNUF0W4jjmGDHvtzkcbQ7laRq+PzxgZ7WiWOxU5N7g2tcHdh7Q7
8mTfXYiOfZCbgakQ8t8DqW8ZvUtB2CqgfcWVbGkcVKnfR8Wmp9eTpFbTzrFd64/1mhC3DA5QtkRI
W6XV4PvCD1wLJetvEAXSo09A8d8NXyMG9NxyQ2ySF5w82dA2kswS7LsRSDFUHE3hEk+7HrJZZQkb
0odsemajAYcKfi5ab5WrszULfTV8IhCxACylTnqyKR4LoFfTk+WjRTwWeV4LYqn8rvmHnc1wXesh
jbo=
=uTJr
-----END PGP SIGNATURE-----

--LHeFyx9QqIlGkEMELLBaAod1WWnnwq7bD--

--===============1510891691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1510891691==--
