From: Carl Worth <cworth@cworth.org>
Subject: Re: [PATCH v3 1/4] nvc0/ir: clear subop when folding
	constant expressions
Date: Tue, 24 Jun 2014 12:49:50 -0700
Message-ID: <87tx7agk9t.fsf@yoom.home.cworth.org>
References: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401834950-20257-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <87egyfi4xn.fsf@yoom.home.cworth.org>
 <CAKb7UvgB8tK9OannYow7MX-aAyU7qJgoXSDFcHAjVYfdCrHcQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0251969040=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvgB8tK9OannYow7MX-aAyU7qJgoXSDFcHAjVYfdCrHcQA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============0251969040==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Ilia Mirkin <imirkin@alum.mit.edu> writes:
> Here's a backported patch for 10.1...

Thanks, Ilia!

Comparing that patch to the original, I'm fairly embarrassed that I
didn't come up with that myself.

It's one of those cases where a tiny bit of altered context made the git
conflict display look quite excessive.

=2DCarl

=2D-=20
carl.d.worth@intel.com

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTqdZeAAoJEGACM7qeVNxhuUAQALrOcHfh0J8Q7/k3rZURacDQ
oWVeDk0oN+YyngIx4ap1l9q3y5CO3iSpGfYm2BaXmpf1c8rTNLWBdbRyjt07FoEW
gvphgRZLiSx3G9F1fO7ZFCTj62eiMol6nVjJLsOqzBHj9XQvVjMqTdSMibzSLMWE
Dz+duBDRAmZaieJOwG9MxM2e55vKkbERbjsMmqr0yNP5JfIFvxN6vn5pzpJqKAYq
R6GIySezKYkmUvPTyUUECxnYjsqQcogTVhAQ+dMTnb2nQP5l+fly8fYL0WkJzKl5
ZYDC86SeHV0z1X7aO6IxAQs/OFd5XARiMa8R85pCGH6E2mEWFM8hWllNQBCKEXoQ
h5K3GygIftbAI5pQAWy9Ek4O8Mc54tPuYBlbM5W4lStFBCS06TYiri3fiBfhMyrJ
wLRN8b3ch11fvxf6s+auR0jVWJQghpLuhCuOGmraijhHhzb/Gh6k/UcSpgcNDnuY
MVU0BGyjGKifIg1Rr6oEtFaoLDo6Guecl2M4r//k/R0/5AnJa5xWLFeNJmaZag6J
Ak0OL21zQ8UXqmmofCzybMHXofwcaEmc5ln9jpCFC6SDWkVSX5EEkpICIi94HeUa
8Zyctk69gtyINESV6b4bpCms9J8DsQE+oVSv6SL3sUi8Qa14PIbHFue7Z/mTzkxP
mrGyQ+bi8cMdJYLitCDj
=vFGR
-----END PGP SIGNATURE-----
--=-=-=--

--===============0251969040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============0251969040==--
