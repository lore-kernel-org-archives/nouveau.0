From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: CRTC video scanout position for high precision vblank
	timestamping?
Date: Wed, 29 Dec 2010 13:26:20 +0100
Message-ID: <871v50ojdf.fsf@riseup.net>
References: <4D1AF8F4.6020707@tuebingen.mpg.de>
	<AANLkTi=9FagJJYP148Zsc26mm+BCvRCNTqD4jsLT7os6@mail.gmail.com>
	<AANLkTimBropE8C8uxnwkuQKdM-yNByY2a=EQQfGZNVCf@mail.gmail.com>
	<1293615882.4523.1.camel@nisroch> <4D1B0B62.3040107@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1587908909=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D1B0B62.3040107-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> (Mario Kleiner's message of
	"Wed, 29 Dec 2010 11:20:18 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1587908909==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> writes:

> On 12/29/2010 10:44 AM, Ben Skeggs wrote:
>> On Wed, 2010-12-29 at 10:37 +0100, Maarten Maathuis wrote:
>>[...]
>>>
>>> In my infinite wisdom i swapped the vertical and horizontal regs,
>>> these are the right ones:
>>>
>>> 0x616340: CRTC0 horizontal scanline (lower 16 bits, upper 16 bits is a
>>> counter that increments every display cycle)
>>> 0x616344: CRTC0 vertical scanline (lower 16 bits, upper 16 bits empty)
>>>
>>> 0x616B40: CRTC1 horizontal scanline
>>> 0x616B44: CRTC1 vertical scanline
>> Ah, I should've waited 10 minutes before doing the same here.  Ah well,
>> I can confirm at least on NV84, I can't imagine it differs at all on any
>> nv50+ board either.
>>

I can confirm those registers are still there on NVA8.

>> Ben.
>>>
>
> Wow, that was fast! Thanks! I'll get some good sleep now and then give
> it a try on my GF-8800. This is probably also useful to implement the
> .get_vblank_counter() hook properly. Currently it hooks up to
> drm_vblank_count() which is problematic, as .get_vblank_counter() is
> meant to query the hardware for the purpose of reinitializing
> drm_vblank_count() after a long vblank irq off period.
>
> I'll let you know how it goes, hopefully with some nice patches asap.
>
> If somebody knows about similar NV40 and earlier registers, keep it
> coming :-)
>
On nv04-nv4x class hardware there's a scanline counter in the lower 12
bits of 0x600808 (0x602808 for the second CRTC), bit 16 lights up during
the vblank period.

I don't think I've ever seen a hardware frame counter there, but they
might have one. Tracing what the nvidia blob does for SGI_video_sync and
friends would be your best bet I guess.

> Is the range from NV_PCRTC0_OFFSET to NV_PCRTC0_OFFSET +
> NV_PCRTC0_SIZE a good starting point for a search on NV40 and earlier?
>
> thanks,
> -mario
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0bKO0ACgkQg5k4nX1Sv1vvzwEAmjYtL2W8SMzpy3x3PJJAIO9r
X95neeBi7h0gnAHp+uwBAIzUpmPYdQdff8aEDKUp8tjarDNKS+WEqgRN4zykgACF
=sr7H
-----END PGP SIGNATURE-----
--==-=-=--

--===============1587908909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1587908909==--
