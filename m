From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Kernel patch: validate nouveau_channel_get id argument
Date: Sun, 26 Dec 2010 12:00:46 +0100
Message-ID: <87oc88x0gx.fsf@riseup.net>
References: <AANLkTikRCm19--tRgjAJqcLgb1f_hWcWJpRvgAqGKfQw@mail.gmail.com>
	<87r5d6yngq.fsf@riseup.net>
	<AANLkTi=cy3Mm4U3zk6-6WXBCPJXqyh4Q8SV_UOBQFNbU@mail.gmail.com>
	<AANLkTikQP2DtprBkFr0z1q5vdb=FwDLc5R-Zeuv7ypz1@mail.gmail.com>
	<87sjxlwvjr.fsf@riseup.net>
	<AANLkTin54dTRksN8JfThwS7-zi3Na+j=HdEfyxm=tav1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0135922591=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTin54dTRksN8JfThwS7-zi3Na+j=HdEfyxm=tav1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michel Hermier's message of "Sun, 26 Dec 2010 11:37:54 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0135922591==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> For my culture, why did you not changed the type to uint32_t like in
> my original patch ?
As I told you before, those changes went over the 80 column limit so I
just left them out.  I hope you don't mind, the modified patch should do
the same thing as the original one for all practical purposes.

> Also looking at include/drm/nouveau_drm.h, I see some inconsistant
> type for channel in ioctls structures ?
>
Right, explicitly sized integers are usually the preferred choice in the
IOCTL API.

> 2010/12/25 Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>:
>> Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> Second try ^^ I'm not used at all at preparing patch for kernel
>>
>> Thanks. I've pushed it with a couple of minor fixes.
>>

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0XIF8ACgkQg5k4nX1Sv1spngD9HNCWd8zZSW5/YlvzOuZ/PImD
6khppApoRm95Gjv/nTcBAJWcC3Pmy9+6ZR4FAPfL4YppC/cgQhkAZ+sx2c0QnESh
=5TfQ
-----END PGP SIGNATURE-----
--==-=-=--

--===============0135922591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0135922591==--
