From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] dri2: Fixes to swap scheduling,
	especially for copy-swaps.
Date: Wed, 21 Sep 2011 03:39:26 +0200
Message-ID: <8739fqptbl.fsf@riseup.net>
References: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1314984801-12029-4-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<87wrdkufec.fsf@riseup.net>
	<103D9770-D3B1-4E14-A177-645C19798057@tuebingen.mpg.de>
	<8739g5to4b.fsf@riseup.net> <4E76A349.70103@tuebingen.mpg.de>
	<878vpipxdz.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1514585437=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <878vpipxdz.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> (Francisco Jerez's message of "Wed,
	21 Sep 2011 02:11:36 +0200")
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

--===============1514585437==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> writes:

> Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> writes:
>
>> On 09/09/2011 11:14 PM, Francisco Jerez wrote:
>>> Mario Kleiner<mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>  writes:
>>>
>>>>[...]
>>>> Is the blip operation started at leading edge of the vblank interval?
>>>> Or anywhere inside the vblank interval (level triggered)? Are such
>>>> blits submitted on a separate fifo (or even dma engine?) in the gpu to
>>>> avoid stalling the rest of the command stream until vblank?
>>>
>>> It depends, right now we have two completely different implementations
>>> and we use one or the other depending on the card generation:
>>>
>>> On nv11-nv4x, we use the PGRAPH vsync methods (0x120-0x134), that means
>>> it's the drawing engine that waits. Basically you have a counter that's
>>> incremented by a CRTC of your choice when it reaches a scanline range of
>>> your choice, wrapping around at a configurable value; you can put the
>>> drawing engine to sleep until the counter reaches a given value. Right
>>> now we make it wait until somewhere between vdisplay-3 and vdisplay-1
>>> before going on with the swap.
>>>
>>
>> Interesting, thanks for the explanation. Maybe that counter could also
>> be used to implement a hardware vblank counter on pre-NV50?

I forgot to answer to this question... Not really, these counters are
(IIRC) only 3 bits wide, and they need PGRAPH intervention to get
incremented, so they're quite useless for anything more sophisticated
than what we're doing right now.

>>[...]

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk55QE8ACgkQg5k4nX1Sv1to3AEAisv0YNPWnNS7VF288k245H+s
HlfeceLhreTKDeEC5MQA/0nX5e4J7RksgQOOvY1eq/0ySLAyxN2RFq9ellOWrW1A
=49uh
-----END PGP SIGNATURE-----
--==-=-=--

--===============1514585437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1514585437==--
