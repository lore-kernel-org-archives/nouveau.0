From: Carl Worth <cworth@cworth.org>
Subject: Re: [PATCH v3 1/4] nvc0/ir: clear subop when folding
	constant expressions
Date: Mon, 23 Jun 2014 16:25:56 -0700
Message-ID: <87egyfi4xn.fsf@yoom.home.cworth.org>
References: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401834950-20257-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0032437947=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401834950-20257-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>, nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, imirkin@alum.mit.edu
List-Id: nouveau.vger.kernel.org

--===============0032437947==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de> writes:
> Some operations (e.g. OP_MUL/OP_MAD/OP_EXTBF might have a subop set.
> After folding, make sure that it is cleared
>
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.1 10.2" <mesa-stable@lists.freedesktop.org>

Hi Tobias and Ilia,

This patch isn't picking cleanly over to the 10.1 branch.

Can you give me some guidance here? Either of the following replies
would be great:

	Don't worry about this for 10.1 because...

	Here's a backported patch for 10.1...

Thanks!

=2DCarl

=2D-=20
carl.d.worth@intel.com

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTqLeEAAoJEGACM7qeVNxhg40P/0uEEFMnczV3sAAs6HAAegAF
RlY02gRlWVVVwB7EhRxLby/VfRjatuC5emrJ7ZTk7cF6cih9r6zGwP7mrE+xnzsr
6j9hTYzzvZcUZTtvkyNoQ2mBzW/nr9Wsgp2cV+yrV28BZWUCzRxIvlOnbaxOrrPT
QQ4AlveT2ZGnV5iDt9oal05zZlpp14S3LxtKUYhWsYMnWmpXhYiw3jJahWUR1vc0
pzhg1p28bAod9mb1WTaqrYYKmBliP9GWEnPEuoVlTXMSj9t/pGWHK0Don5P/1Q3R
Ga9PHDqVxuz9/vo0sA2XsSFT8L6gXt4HTpe1OHGS1weTkjOfSd+N8/IiUrZ7hbZ+
tUZpLkiQQVD3WTTgQqiDHBPQGdblDU1VdcQFibgNunrI9f9kqsdFdKh1Y9tH2xj3
F5Wma6oK7qTp7Ioh4LIN/uu4qEoz+DAr9C1hpCXOhOedaR9D+iMSciWNCkFNVrv9
uUvoF1KNoZF0cjW3NS36fAFxnGX9fPQ+y4aaUDxIscEQ4nUKgr2R2SGv0KsJafwV
ltik0krK20AAqFCqkLgnamMK6Ec6SyJOVchV2N2EUATkRAacdJrUSSGWS7PSXdVw
KPaU/G2TqDq0DpEShYbK+7pJkccK21u9h38skp6dfaJ/HpJD1TerAIIf33L2ggCW
bVycP54NeO9P7SZ0U5EW
=vi/v
-----END PGP SIGNATURE-----
--=-=-=--

--===============0032437947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============0032437947==--
