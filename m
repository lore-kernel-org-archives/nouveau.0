From: Carl Worth <cworth@cworth.org>
Subject: Re: [Mesa-stable] [PATCH] nv50: fix setting of texture
	ms info to be per-stage
Date: Tue, 13 May 2014 17:44:40 -0700
Message-ID: <87ha4tdw93.fsf@yoom.home.cworth.org>
References: <1399691945-26014-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1283408422=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1399691945-26014-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>, mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Cc: "10.1 10.2" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============1283408422==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Transfer-Encoding: quoted-printable

Ilia Mirkin <imirkin@alum.mit.edu> writes:
> Cc: "10.1 10.2" <mesa-stable@lists.freedesktop.org>
...
>  /* Sample position pairs for the current output MS level */
> -#define NV50_CB_AUX_SAMPLE_OFFSET 0x980
> +#define NV50_CB_AUX_SAMPLE_OFFSET 0x300
>  #define NV50_CB_AUX_SAMPLE_OFFSET_SIZE (4 * 8 * 2)
> -/* next spot: 0x9c0 */
> +/* next spot: 0x340 */
>  /* 4 32-bit floats for the vertex runout, put at the end */
>  #define NV50_CB_AUX_RUNOUT_OFFSET (NV50_CB_AUX_SIZE - 0x10)

This hunk of the patch isn't applying cleanly to 10.1.

I think the conflict resolution should be obvious to an author or
competent reviewer, but I didn't trust myself to get it right.

If one of you can follow up with a patch that applies cleanly to the
10.1 branch, I'll be happy to apply it.

=2DCarl

=2D-=20
carl.d.worth@intel.com

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTcrx4AAoJEGACM7qeVNxhQnAP/2o+bAif+0daOgpWcT/1SOEX
SkxJgm7EyBQEFHjbemGfj2EX7mGgkWDw2EaNqX7rR9qZSDV9N7KGps1diPR9LXE4
8d2IDl+kkrqxlTPvo8NaVQ4exIuBAdicoMrYj9lp46GjH9Wdk4khJ0FJrfJGx97a
OmGGP9Q+NAeaBu338hfBqdvCKDVzRl7TYew/0PgbbANoQCneXaYB0S7dwoLqEZEd
EJ7SUW08yM+dQqD0a+pNb/PJMsRQ5GzjiHDUcz4kSP+BbqPu2T0rtW15aZ19R5fX
leqn4YA2tfEFUa9wPgrvBdRrmskUpOJUk5rFzos0gZO1KkxNhZ/u+sXMOHOkdG9T
aqd/RZNAwtAkhTUMzhYHdfVMGJEGCuuulCFZW68XGZmsxIPVVJooQoneDipYA0B9
vLLa1Dv0AKGJfUSz8WeZdC73VYAxnOxZWVmv4Ve9OQvmZpTZ1EWpkb6nY+e8k076
mNrUz0LUF/XNWGc+5gmswHOYplQUe4H92OGhYxu0Rr3zsDD6Q4OqPCOBnvo4nrzz
P5t3x9L6dhnKvmTZAEwevOIcJe6CtQ6WDtY31JtmAR4HVMquE9MYmdjqF1nDTSQQ
o00qFIIX48i86usCa+WJP1DECZR54ck9cd0zMEVz8R86DZzeDn+yiGLEbofjng00
TxvcJ8pDmoR3gMSKkxiV
=mWHj
-----END PGP SIGNATURE-----
--=-=-=--

--===============1283408422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============1283408422==--
