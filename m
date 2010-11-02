From: Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Subject: Re: nouveau exposes backlight controls in presence of	ACPI
Date: Tue, 2 Nov 2010 20:28:02 +0100
Message-ID: <20101102192802.GA4197@aeneby.se>
References: <20101029154934.GA2076@aeneby.se> <1288670315.6477.2.camel@nisroch>
	<1288715822.11373.6.camel@ayu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1498065090=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1288715822.11373.6.camel@ayu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1498065090==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> It was my understanding that the future direction the kernel was going
> to go with this is that all detected backlight devices would be
> exported, with a tag in sysfs describing the type of interface
> (platform, firmware, direct hardware, whichever). Then it would be up to
> userspace to pick the correct backlight device to use based on the tags.
> Nothing stopping a user from manipulating a different one directly, with
> possible interesting side-effects, of course.

Interesting. I guess this would be the best long-term solution, but short-term we can't proceed based on speculation. Nor can we really trust userspace to make the correct decisions at the moment, as the controls don't normally provide enough information to be able to do that reliably.

> Note that the thinkpad-acpi module at the moment is also checking for
> the ACPI video device to be loaded, and will disable itself in that
> case. So the case that causes problems right now is if you have e.g.
> both thinkpad-acpi and nouveau, but no ACPI video device?

The problem in my case is when both ACPI and nouveau controls are exposed - gnome-power-manager prioritises the nouveau control over ACPI (I've raised a bug for this too) and because my card isn't supported properly by the driver, I get a range of approximately useless brightness levels. As I see it, we have 3 related issues when it comes to backlight control:

0) Fixing NV50 backlight support in nouveau for those chipsets with max_brightness > 1025
1) Determining under which circumstances we should expose kernel-level controls (IMHO only when no better alternatives are available)
2) Determining how userspace should select an appropriate control when more than one is available

Matthew Garrett addresses some of those issues in a fairly decent rant here:
http://mjg59.livejournal.com/127103.html

/Aaron

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAEBAgAGBQJM0GZCAAoJECw8YUUfeQL99dkH/jSiLht7xI+DKxnAlop5MINb
0anaHqHUGe/9Xz27SHkXo3nn2HmBkV4vd3p2nhqQ26popzRg48JMQiY7ruh96Dzl
EXuAUeamngE/GSNQlUrtk0Il1BLieXimOivFydxUC4Z6oWdiBeWAadjqbnrK1s1e
YjxuTZd5vn8S86SdezT4TY8FfdXr2mXl0VWQHKjndcXnO7/nQTSSGf3tkQfkYPHt
SGDmu3UcJHbX0cPLQh6dSRGci1cn6pwWKMuYlBhub4MydoUKCJ0Ajg+/UbOV598g
RuuhOirSvddDUXMbWyhuzd5rjqQIXf5j57xv1ygTTwKDg6/K4BW6NthbpMLyeSY=
=DSeh
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

--===============1498065090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1498065090==--
