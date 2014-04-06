From: ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Assistance in tracking a kernel/nouveau error
Date: Sun, 06 Apr 2014 18:16:12 -0500
Message-ID: <5341E03C.7020109@gmail.com>
References: <5339EB75.1080109@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0146195208=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5339EB75.1080109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0146195208==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2SEJSQRTPPQMJOATQQBQB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2SEJSQRTPPQMJOATQQBQB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Greetings,

I am resending this as it doesn't appear in the archives and no one
responded...maybe it got routed to /dev/null or something :-)

I have asked this question the Scientific Linux mailing list (a few
months ago) and got the suggestion I talk to the kernel guys. I pinged a
kernel guy I know, and his suggestion was to ask the Nouveau list. So
here I am. :-)

I have had my work laptop for well over a year now running SL6 and
everything has been fantastic. Never once have I had a kernel
panic/problem. That is until the kernel 2.6.32-400+ series. Rolling back
to the previous kernel 2.6.32-358 works perfectly, which is what I have
been doing. The problem is that I am now getting the same issue on other
laptops with the latest kernel 2.6.32-431.11.2.el6.x86_64. My laptop is
Dell Precision M4600. 80% of the time it is plugged into my Dell PRO2X
laptop dock which has my dual Display Port Dell U2410 monitors (betcha
can't tell what vendor my employer frequently buys from...;-).

My working kernel is: 2.6.32-358.23.2.el6.x86_64 (and anything before).

The problem kernel is: 2.6.32-431.1.2.el6.x86_64 and every revision
up-to the latest 2.6.32-431.11.2.el6.x86_64.

I get horrible color distortions on the secondary display. This happens
every time. At BIOS both monitors display perfect color in a duplicate
view showing the same image on both screens. Grub only shows primary
screen (normal for this setup). When Grub loads the nouveau display
driver the second screen turns on and the display looks like a rainbow
puked glitter. Not even exaggerating. Crazy jumbled colors in warped
patterns that move across the screen. The primary monitor is just fine.
At first I thought it was the monitor, but swapping the monitors shows
they are fine. Other testing showed that the hardware is just fine too
and the final proof was evident by being able to boot into the previous
kernel and not having an issue.

I never have run the NVidia drivers on this laptop. It has always been
Nouveau. (I run NVidia drivers on other systems, but this laptop has
previously always been rock solid with SL+Nouveau so I never bothered).

Today I found that the new batch of Dell Latitudes with a fresh install
do nearly the same thing. The image is viewable, but is horribly color
distorted. The really weird thing with the Latitudes is that I can
disable the screen (via software) and about 4 out of 5 times, when I
re-enable it I get a proper screen again. It always goes bad on a fresh
boot and this trick does not appear to work with my Precision. I dug out
the 2.6.32-358 kernel RPM, installed it on one and bingo...no issues.
Screen is great and works just fine.

So now I am more than ever convinced there is an issue with nouveau in
any of the kernels post 2.6.32-358.23.2.

I have searched around and asked around but haven't found a solution. I
can put the kernel into all kinds of debugging and capture GB's of data,
but I would prefer to capture only what is useful. Any recommendations
on what output I should capture? Any suggestions on narrowing the
problem down to something other then "Its the kernel"?

Thanks! I appreciate the help!

~Stack~




------enig2SEJSQRTPPQMJOATQQBQB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlNB4EUACgkQ4OKTk6qYr2T+UwCgxLVKZpdNcPfIycDpwuEe+br4
d48AoO4uLEYjzmvXkJdqc3w/GxFx272+
=v+qy
-----END PGP SIGNATURE-----

------enig2SEJSQRTPPQMJOATQQBQB--

--===============0146195208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0146195208==--
