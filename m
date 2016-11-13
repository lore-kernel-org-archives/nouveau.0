From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: Atomic modesetting + DisplayPort MST
Date: Sun, 13 Nov 2016 21:17:29 +0100
Message-ID: <20161113201729.76ibuakzvhludjqs@Thessia>
References: <41c72634-4886-0028-93e5-317e3b437092@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1563566382=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <41c72634-4886-0028-93e5-317e3b437092-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1563566382==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dxu3efrirhv5462t"
Content-Disposition: inline


--dxu3efrirhv5462t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ben,

You can find below my results; there is a slight over-representation of 1st=
 gen
Tesla cards, but=E2=80=A6 that=E2=80=99s what I have. :-D No regressions ob=
served, apart from:

* screen rotation on G80, MCP79
* resuming on G86

I=E2=80=99ll retest those cards with your linux-4.10 branch but without the=
 atomic + DP
serie.

Pierre


Tested: linux-4.10 (HEAD at b27add13f "drm/nouveau/fifo/gf100-: protect cha=
nnel preempt with subdev mutex)
Against: 4.8.7
Fullscreen game: Portal
(FAIL is: it is not working, but neither did it before.)


G80:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: REGRESSION (disp: ERROR 5 [INVALID_STATE]
* Suspend:           OK
* Hotplugging:       -
* Fullscreen game:   FAIL (fail ttm_validate, vaildate: -12) (different on =
4.8.7, but still failing)

G84:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           FAIL (DRM: base-0: timeout)
* Hotplugging:       OK
* Fullscreen game:   OK

G86:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           REGRESSION (PGRAPH TLB flush idle timeout fail)
* Hotplugging:       -
* Fullscreen game:   FAIL (gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Add=
ress 004bed0000) (does not work im 4.8.7 either, though there was no trap, =
just FAIL ttm_validate & cie)

G92:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       -
* Fullscreen game:   OK

G94:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       -
* Fullscreen game:   OK

G96:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       -
* Fullscreen game:   OK

G98:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       OK
* Fullscreen game:   FAIL (fail ttm_validate, vaildate: -12)

MCP79:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: REGRESSION (no freeze, no errors, cursor was correctly=
 updated, but screen does not update though switching to TTY works just fin=
e)
* Suspend:           OK
* Hotplugging:       -
* Fullscreen game:   OK

GT200:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           FAIL (PGRAPH TLB idle timeout fail)
* Hotplugging:       -
* Fullscreen game:   OK

GF100:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       -
* Fullscreen game:   OK

GF114:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       -
* Fullscreen game:   OK

GK208:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       OK
* Fullscreen game:   OK

GM206:
* Basic modesetting: OK
* VT switching:      OK
* Changing rotation: OK
* Suspend:           OK
* Hotplugging:       OK
* Fullscreen game:   OK



On 07:41 pm - Nov 04 2016, Ben Skeggs wrote:
> Hey all,
>=20
> I've just pushed out the initial Nouveau support for $subject \o/
>=20
> As the atomic modesetting transition is basically a rewrite of the KMS
> portion of the driver, I would be very grateful for any additional
> testing that people could provide (even as simple as just booting and
> making sure you get a display is valuable).
>=20
> There's a Linux tree at
> https://github.com/skeggsb/linux/tree/linux-4.10, and the code also
> exists in my usual development tree[1] on the master branch (which is
> currently based on Dave's drm-next tree for Linux 4.10).
>=20
> There's another branch (devel-kms) in the same repository, which is the
> same code on top of what's currently Linux 4.9.  If you have problems
> with the 4.10 code, I'd definitely be interested in seeing if they exist
> on the 4.9 branch too.
>=20
> Thanks in advance!
> Ben.
>=20
> [1] https://github.com/skeggsb/nouveau
>=20




> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--dxu3efrirhv5462t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYKMpRAAoJEI7uMhYTPh3wFfoQAIEo/y+s0nbm1CEen2mua1EJ
DRpEKpV/edol5HDdUjtz5q0pRzPa6sQ8oJO/c4WaLiiscT4yyaEgOH/DzWaI8BcB
qbZhdcfR3UGJkUTJmePclqi+49/X/h23KHqhFttWD3zAlFXBomijvRoKRHZViWeM
HtbuSBPglQyoIrOw9hFNXIGKvmhaS/l0wKWhEj/jsLGAtGSyNmLNHTtvAALQHKni
WRmS0OO4ZoO2Nixu96X3VjkmFiQWFPcpKm+hCAd7+w04V2jVLziRs7b+GG5IaMzX
zc9cGti5bpa0olU5vH+PcVfINIMZ9mU1PhVfcAU2kZ0+6vKvHYE2l4CXtcr+af38
t0N0GcV8K1nCyIAUUUw4gU8A+V8uKEbpxWCr2I7brJgqshwR04oloKxx7QDgYfTf
67BDh/CjOUWSWVeaHLAab6E+MD3rmlEvaB2K1L12OmaludVxAxVboCoLngs1r/Wl
dTGbgdf+InRM3muXaEXSeqlaXPVnxguAcKSbT/w56wWcoI7viHrrQ4CX/CudTKPU
juCIhbTv+1VPDuXWeDHXDSjq2BzkE2BpJNtgh+a/a2UjoRTzykzE0K8IR83/8Lzh
q1R9x+phpaGQ/op6SaA8pz5zbd0mv3BCiF51zGG2R8icQ+DhTiZdahZZYSB/VKdV
nwEg7Lywa9VluMp6GrOX
=NUaV
-----END PGP SIGNATURE-----

--dxu3efrirhv5462t--

--===============1563566382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1563566382==--
