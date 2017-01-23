From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GP107 chipset][PATCH] Recognise GP107 chipset (GTX
 1050/1050ti)
Date: Tue, 24 Jan 2017 07:43:51 +1000
Message-ID: <cd0bbf6d-b8f0-36d2-dd72-08b512280a1d@gmail.com>
References: <CAPO+gU+K9dXFXs6L4Wd4HK-Uv9npsfFG=+ogB0FpiTb_8BfXDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0814024589=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPO+gU+K9dXFXs6L4Wd4HK-Uv9npsfFG=+ogB0FpiTb_8BfXDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0814024589==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9lq70MTLBhGW6jdNXegr8lVkCG0O4kLTD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9lq70MTLBhGW6jdNXegr8lVkCG0O4kLTD
Content-Type: multipart/mixed; boundary="rcKh0ie1Eu50dN79OL1LpvP2IEINRgLKA"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <cd0bbf6d-b8f0-36d2-dd72-08b512280a1d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [GP107 chipset][PATCH] Recognise GP107 chipset (GTX
 1050/1050ti)
References: <CAPO+gU+K9dXFXs6L4Wd4HK-Uv9npsfFG=+ogB0FpiTb_8BfXDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAPO+gU+K9dXFXs6L4Wd4HK-Uv9npsfFG=+ogB0FpiTb_8BfXDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--rcKh0ie1Eu50dN79OL1LpvP2IEINRgLKA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/23/2017 03:00 AM, Stefano Belli wrote:
> Hello everyone, I would like to submit a simple patch to let nouveau
> able to detect GTX 1050 / 1050ti cards. TESTED and WORKING on my
> computer with my GPU (Gigabyte GTX 1050ti OC edition).
>=20
> drivers/gpu/drm/nouveau/nvkm/engine/device/
> base.c
Are you able to get a mmiotrace[1] of the binary driver, so I can take a
quick look to ensure that nothing subtle has changed that needs to be
handled?

Thanks,
Ben.

[1] https://nouveau.freedesktop.org/wiki/MmioTrace/

>=20
> gpu_nouveau_gp107.patch
>=20
> 2272a2273,2301
>> static const struct nvkm_device_chip
>> nv137_chipset =3D {
>>     .name =3D "GP107",
>>     .bar =3D gf100_bar_new,
>>     .bios =3D nvkm_bios_new,
>>     .bus =3D gf100_bus_new,
>>     .devinit =3D gm200_devinit_new,
>>     .fb =3D gp102_fb_new,
>>     .fuse =3D gm107_fuse_new,
>>     .gpio =3D gk104_gpio_new,
>>     .i2c =3D gm200_i2c_new,
>>     .ibus =3D gm200_ibus_new,
>>     .imem =3D nv50_instmem_new,
>>     .ltc =3D gp100_ltc_new,
>>     .mc =3D gp100_mc_new,
>>     .mmu =3D gf100_mmu_new,
>>     .pci =3D gp100_pci_new,
>>     .pmu =3D gp102_pmu_new,
>>     .timer =3D gk20a_timer_new,
>>     .top =3D gk104_top_new,
>>     .ce[0] =3D gp102_ce_new,
>>     .ce[1] =3D gp102_ce_new,
>>     .ce[2] =3D gp102_ce_new,
>>     .ce[3] =3D gp102_ce_new,
>>     .disp =3D gp102_disp_new,
>>     .dma =3D gf119_dma_new,
>>     .fifo =3D gp100_fifo_new,
>> };
>>
> 2709a2739
>>         case 0x137: device->chip =3D &nv137_chipset; break;
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--rcKh0ie1Eu50dN79OL1LpvP2IEINRgLKA--

--9lq70MTLBhGW6jdNXegr8lVkCG0O4kLTD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAliGeRcACgkQdgucYlCS
kfviYxAAshNa4OQqDIBeJ64fllGhw2E2PCD3qNmtCUEnTLn/kgAVYxFGFqF+cNl9
bAdDlY87o8Wb2Q0sW2P1qzCBBa4wtVnooh7GKAz8hp3Rl0gy157JckOWp1g13kIP
41oGGOv+pRFKat//vMUe3T193YGqsabeJscg+dBtNaNLMf4oUz+F8YA6vSUn3UrA
I781KsPpn7xMXndCfKCzyVM1m2EPUIw/WLiM2hHTexQ2Qwkuv9upg9eQr0qAhR0J
Z8Dr7VBPPbJr9bTLjbAWhYfsPd4W5pfc2Y74UzNka05oaIawDPEBMq6aHd6EgU4z
fJxX1KH8jWzsP50u06HG/V6urWsqByv48ouX3xSwuWN+9iokXAZoE2PTlX8JXffl
aoIyR8tKkxOaOKBUdmjkO33SX8t5iWDt/BujmMCaC6BzEfXgPoAjUsGchz91fdvH
DOTEU/zUISK91hl8RMg150z1k9kpxbvrJCne7ARMWFQAqg8zaGwcprBIjK880JrI
m56rTjT1NHZK41Dbu2tkwzDBWkl455KwrTUe7bBaOsPl1or7MWX45q4MFA6w5a/E
b98ofIQyJ8EAMl2dvUuuBtrLt9LNLgl5mfH7PmkVOfplrgrrj+8kspeOq+n6Lape
IK+QD6pZGpZwjaTuyTuFjhCGDEYf8zsrAngZXbS+7IGkFZF7sM4=
=95QG
-----END PGP SIGNATURE-----

--9lq70MTLBhGW6jdNXegr8lVkCG0O4kLTD--

--===============0814024589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0814024589==--
