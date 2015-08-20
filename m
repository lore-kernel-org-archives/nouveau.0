From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/2] nvc0/ir: detect AND/SHR pairs and
	convert into EXTBF
Date: Thu, 20 Aug 2015 09:13:49 -0700
Message-ID: <87bne2uede.fsf@eliezer.anholt.net>
References: <1439948992-17738-1-git-send-email-imirkin@alum.mit.edu>
 <CAEdQ38EXBDX8On9822t7brPvr-wcYr0MADnyGpQGbfU7Tce03w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2139617575=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAEdQ38EXBDX8On9822t7brPvr-wcYr0MADnyGpQGbfU7Tce03w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Matt Turner <mattst88@gmail.com>, Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============2139617575==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Matt Turner <mattst88@gmail.com> writes:

> On Tue, Aug 18, 2015 at 6:49 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>> Some shaders appear to extract bits using shift/and combos. Detect
>> (some) of those and convert to EXTBF instead.
>
> What is EXTBF? Extract byte to float?
>
> I ask because Unigine Heaven has shaders that pack 3x byte-integers
> into one component of a vec4 and extracts them with shifts/ands and
> converts them to floats, and i965 could do the extraction and
> conversion in a single instruction. I'm curious if this is the same
> thing you're optimizing.
>
> I thought about adding an extract_byte(src, byte_num) operation, but
> i965's copy propagation caused me some headache and I shelved it.

I could use this one, as int, uint, and unorm unpacks.  Right now for
int/uint I'm recognizing the pattern in vc4_program.c (in a branch).
I'd be interested in writing the NIR bits if others are interested in
having this.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV1fy+AAoJELXWKTbR/J7oI9YP/1dOtnVwD4oiA28Xj8/rL3gE
QevxvaJrXKUU/4WhTPxtnMXdPTpOXl4hHVoTcd9UUYI+puD5MnArOp3uK1cQVefF
xxiDdqbhE+Ivfc1CVMtzc7kmh+Zl9CbqlhDwfBK4HeeYWnO40Qt5iH2+2QNXmuNq
Cz0fbvad6V9I/bdNzm92DkvVWJvdWGd9qHeJLbbeY98+xhqVLsxdDs7NUNogqaU+
vjheBeDkcdIgJTN1aNSqt75Sq9c+hIFa7m1FNsFsulTK/XHNVgD2MZqIxGAxqNYb
3+xb8c/3DlII5DNpBxPXZjtoUssushf2oc+dqnGzfxKWGgnDv6gPHErMkWlWRQiu
4sOzwQPSExG0E54Ms1Nwcfy6CkL5zhmUlNXcLUf0XTNxaP0eAlbboqVEXmBKsr4O
HV2ktZC9d9/IRWYDZVoQ33p8fCNSLoZYnMiVrwTfwKcRRw5dIRZPbtJXKl8klUNG
rxTQObMSNyyxEdzayG5dl8M0SSrtwXoL+Gl8G8ger8tiaPFCVdrCP2GYw2Jq0Rl0
i1IEmSQXypfQGB+8Uuib/3KEaqliLX5dCZ4xAvKTauq69cv2fgSBa96IsCzeAI08
roFqGfpe1Dv11vG2d2+ckJ9z2NHKTy3iO0jxp58GZWaHolNJtMnM1Nz3DknJy2Jj
hLFZNuNPhrcGvzF1B7NI
=sgiB
-----END PGP SIGNATURE-----
--=-=-=--

--===============2139617575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbWVzYS1kZXYK

--===============2139617575==--
