From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: TV-Out on a GeForce 2MX supported?
Date: Thu, 06 Mar 2014 00:00:28 +0100
Message-ID: <871tyg6yk3.fsf@riseup.net>
References: <20140303224123.GA5720@reliance.ac-net>
	<CAKb7Uvj2FKoRt2O6YqiamgL=svZqmxjxoqdxySN3Lidu+bWxsQ@mail.gmail.com>
	<20140305110645.GA1972@feanor>
	<CAKb7Uvi97Yn8MOfhMiXLs+=VAd0LWEnmnF7iHyR58eKA_Pk_jg@mail.gmail.com>
	<20140305193410.GA13365@feanor>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1780054891=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140305193410.GA13365@feanor>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>, "nouveau@lists.freedesktop.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1780054891==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org> writes:

>[...]
>> The stuff about overscan/etc are exposed as KMS properties (which in
>> turn appear in xrandr) and not specific to the BT869.=20
>
> The problem is that there's no good way to just say "I want this
> overscan" and then get a valid set of register values, because of
> the timing constraints. Nvtv includes a sort of "calculator" that
> tries to calculate a collection of sets of sensible values as close
> to a desired overscan as possible, but you still have to check (and
> tweak, if necessary) every of those sets to see if it actually works.
>

It's been quite a while since the last time I messed about with this
code, but the TV encoders we already support (chrontel and nvidia's)
have similar limitations, and IIRC we solve it by doing two different
things:

1. We don't actually set the exact mode passed by the user.  Instead,
   the mode (both the CRTC mode and the final output mode) can be
   adjusted to the "closest" supported mode compatible with the
   hardware, given the specified properties.

2. For some properties (e.g. the TV standard) where making small
   adjustments to the "virtual" mode exposed to the user wouldn't work,
   (e.g. because the changes would involve changing the display
   width/height), we change the list of supported modes which is
   returned to userspace in response to a property change.

>> The i2c driver is supposed to expose a ->mode_set() function, which
>> takes a drm_display_mode.
>
> We had this discussion on the xorg mailing list back then, I think
> even before there was kernel mode setting. In short, xrandr properties
> and X-style modelines are just not enough to be able to program the
> BT/CX chip sensibly. You need a different infrastructure.
>
> As I said, as a workaround one can use a number of predefined modes
> baked into the kernel. That's better than no support at all, but not as
> good as being able to program the BT/CX chip freely.
>

The current model doesn't require the encoder driver to have a
predefined list of modes -- it's just highly recommended if you don't
want to force the user to input mode lines manually.  You just need some
means to compute the optimal timings algorithmically given the connector
properties and a rough description of the mode.  Sure, using a fixed
list of modes from which you pick the "closest" to the user's settings
might be the easiest way to achieve that on some chips [ch7006 does
precisely that IIRC], and that might be a slight underuse of the
flexibility of some hardware, but the API doesn't force you to do that.

> And then there's the Philips TV encoder chip, which has a similar freedom
> in programming.
>
> Of course, given that analog TVs are dying out, the question is how
> much effort one should put into this whole thing in the first place.
>
> - Dirk
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlMXrIwACgkQg5k4nX1Sv1vU9wD9EDhEVzizFUreUYIct1wpWQ16
9uigNvmL3tIXiS5glusA/28xL8BKhBzBQtkkMBD/dt6ModjlWYkzwQ7jtwGohCep
=4cKs
-----END PGP SIGNATURE-----
--==-=-=--

--===============1780054891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1780054891==--
