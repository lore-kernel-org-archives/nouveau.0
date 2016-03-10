From: Pierre Moreau <pierre.morrow@free.fr>
Subject: Re: [Nouveau] [PATCH mesa 3/3] nouveau: Add support for
 clover / OpenCL kernel input parameters
Date: Thu, 10 Mar 2016 17:03:01 +0100
Message-ID: <20160310160301.GA1073@pmoreau.org>
References: <1457622887-19328-1-git-send-email-hdegoede@redhat.com>
 <1457622887-19328-4-git-send-email-hdegoede@redhat.com>
 <CAKb7UvhNCiRQ6XXfVNzS3WkE+Bf4x4w-Bv2JfYm5-owUrEKoLw@mail.gmail.com>
 <56E19271.7070704@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0397372777=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <56E19271.7070704@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Samuel Pitoiset <samuel.pitoiset@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org


--===============0397372777==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04:27 PM - Mar 10 2016, Samuel Pitoiset wrote:
>=20
>=20
> On 03/10/2016 04:23 PM, Ilia Mirkin wrote:
> >On Thu, Mar 10, 2016 at 10:14 AM, Hans de Goede <hdegoede@redhat.com> wr=
ote:
> >>Add support for clover / OpenCL kernel input parameters.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>---
> >>  .../drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp      | 18 +++++++++=
++++++---
> >>  1 file changed, 15 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp =
b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> >>index a8258af..de0c72b 100644
> >>--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> >>+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> >>@@ -1523,9 +1523,21 @@ Converter::makeSym(uint tgsiFile, int fileIdx, i=
nt idx, int c, uint32_t address)
> >>
> >>     sym->reg.fileIndex =3D fileIdx;
> >>
> >>-   if (tgsiFile =3D=3D TGSI_FILE_MEMORY &&
> >>-       code->memoryFiles[fileIdx].mem_type =3D=3D TGSI_MEMORY_TYPE_SHA=
RED)
> >>-      sym->setFile(FILE_MEMORY_SHARED);
> >>+   if (tgsiFile =3D=3D TGSI_FILE_MEMORY) {
> >>+      switch (code->memoryFiles[fileIdx].mem_type) {
> >>+      case TGSI_MEMORY_TYPE_SHARED:
> >>+         sym->setFile(FILE_MEMORY_SHARED);

You might want to increment the address by at least
`info->prop.cp.inputOffset`, and if inputs still end up in shared on Tesla,
then increment further by the input size. This input offset of 0x10 (or is =
it
0x20?) is due to the card sticking the size of a block and of the grid insi=
de
`s[0x0..0x10]` (or maybe Nouveau is doing that, but I doubt it.). So even if
the user inputs end up somewhere else in memory, you most likely still don't
want to overwrite the grid information. This should be necessary only for T=
esla
cards.

> >>+         break;
> >>+      case TGSI_MEMORY_TYPE_INPUT:
> >>+         assert(prog->getType() =3D=3D Program::TYPE_COMPUTE);
> >>+         assert(idx =3D=3D -1);
> >>+         sym->setFile(FILE_SHADER_INPUT);
> >>+         address +=3D info->prop.cp.inputOffset;
> >
> >What's the idea here? i.e. what is the inputOffset, how is it set, and w=
hy?
>=20
> I don't get the idea too, btw.
>=20
> But prop.cp.inputOffset is only defined for compute on Kepler. It's the
> offset of input parameters in the screen->parm BO but as you already know,
> it is going to be removed because the idea is to use screen->uniform_bo
> instead. I'll do this change *after* the compute shaders support on Keple=
r.

If I understand correctly, the goal is to have user inputs in a
`screen->uniform_bo`, and so for all generations?

Pierre


>=20
> >
> >   -ilia
> >
> >>+         break;
> >>+      default:
> >>+         assert(0); /* TODO: Add support for global and local memory */
> >>+      }
> >>+   }
> >>
> >>     if (idx >=3D 0) {
> >>        if (sym->reg.file =3D=3D FILE_SHADER_INPUT)
> >>--
> >>2.7.2
> >>
>=20
> --=20
> -Samuel
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW4ZqjAAoJEI7uMhYTPh3wxjAQAK9xDPH/FxS1U/28YHAEGbYX
3Bj+ik/ZSAIHq7lfUWG1hZ3108l9Mkw4hx2jH3iPQgBsv7t+OgTJcY5crIw3/HMw
Al7rPb3Bql22Q34W8hSKsgHtEPZxv1YmkSkFfv041DuhCHCYTy/TbPyCp0UxAbDM
CTxbXDuLRz8EQIRhJYH7FrKQgmvdYbMzZamv8IYh9rGCNeNtPKUGWANrn/oIOvtB
nJlkMUN4HnLhfG/OnxXc39G+P2jBBg7JDSoZUkpBvTVDZbNBZadD3naaAaVaiWzA
kkj+pDpISzCLDO4VZLdFOLvzmAJr788iS2HuE39pOSswQOL0oCAwTvp6opdEfTfW
T+IEmE9032wyo6ZMIwllv4U2GeEyDTm/Y6yChyQxKRYZbaxv7KRKl/Bu198zBFFK
TTBIiRuEDmCG/QC7SH/6MKj0Bc4AaPUh8Er89wo+FJUvhpaOgJ+rcmmOBnpi0OVk
XRFCq+aqHs4h+ntfJ3fS8bLi8jSswlm0eldzu/Z2uflKfDLdlzYrX2x9nq7BNiqp
PcQrKmV0NzDwIhAlGlukyp6iulU9V1zVLnqGpVvuYV0x4raNOtano+YOSwGMvoOe
0ITSJKHOkXEOL1vvT725HrUOxgjtmdY0y0MmAUfslHj5i1sxFj1suySQTIoDRA3x
hy6X+4HIn3UF7CzTMcc0
=V4nX
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--

--===============0397372777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==

--===============0397372777==--
