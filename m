From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] instmem/gk20a: fix race conditions
Date: Wed, 11 Nov 2015 15:18:58 +1000
Message-ID: <5642CFC2.7030601@gmail.com>
References: <1447054673-1500-1-git-send-email-acourbot@nvidia.com>
 <5642897B.3060104@gmail.com>
 <CAAVeFuLzVci58-vvw7jm5O01RbLxzVmBxV4Avq7J_SMM8fP-ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0771162959=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuLzVci58-vvw7jm5O01RbLxzVmBxV4Avq7J_SMM8fP-ZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0771162959==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FG6QVhsB9FDSfl9r5N46s2PsWDvLAHmsB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FG6QVhsB9FDSfl9r5N46s2PsWDvLAHmsB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/11/2015 03:08 PM, Alexandre Courbot wrote:
> On Wed, Nov 11, 2015 at 9:19 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 11/09/2015 05:37 PM, Alexandre Courbot wrote:
>>> The LRU list used for recycling CPU mappings was handling concurrency=

>>> very poorly. For instance, if an instobj was acquired twice before be=
ing
>>> released once, it would end up into the LRU list even though there is=

>>> still a client accessing it.
>>>
>>> This patch fixes this by properly counting how many clients are
>>> currently using a given instobj.
>> Out of curiosity, which instobjs are being accessed concurrently?
>=20
> PGTs it seems - at least this is what dumping a stack when detecting a
> concurrent usage on an instobj indicates:
Ah, of course.  That makes sense, as the mmu code has its own methods of
dealing with concurrent access to particular areas of a page table.

I'll merge your fix shortly, after another quick eyeball.

Thanks,
Ben.

>=20
> [  270.547052] [<bf0618dc>] (gk20a_instobj_acquire [nouveau]) from
> [<bf066358>] (gf100_vm_map_sg+0x58/0x124 [nouveau])
> [  270.557568] [<bf066358>] (gf100_vm_map_sg [nouveau]) from
> [<bf0641b0>] (nvkm_vm_map+0x300/0x3bc [nouveau])
> [  270.567333] [<bf0641b0>] (nvkm_vm_map [nouveau]) from [<bf0bcbd4>]
> (nouveau_bo_vma_add+0x74/0xa0 [nouveau])
> [  270.577189] [<bf0bcbd4>] (nouveau_bo_vma_add [nouveau]) from
> [<bf0bdbd0>] (nouveau_gem_object_open+0x124/0x158 [nouveau])
> [  270.588196] [<bf0bdbd0>] (nouveau_gem_object_open [nouveau]) from
> [<c02da62c>] (drm_gem_handle_create_tail+0x104/0x19c)
> [  270.599025] [<c02da62c>] (drm_gem_handle_create_tail) from
> [<bf0be138>] (nouveau_gem_ioctl_new+0x90/0x18c [nouveau])
> [  270.609594] [<bf0be138>] (nouveau_gem_ioctl_new [nouveau]) from
> [<c02db3b8>] (drm_ioctl+0x284/0x440)
> [  270.618777] [<c02db3b8>] (drm_ioctl) from [<bf0b6bfc>]
> (nouveau_drm_ioctl+0x54/0x98 [nouveau])
> [  270.627441] [<bf0b6bfc>] (nouveau_drm_ioctl [nouveau]) from
> [<c0103860>] (do_vfs_ioctl+0x458/0x6dc)
> [  270.636471] [<c0103860>] (do_vfs_ioctl) from [<c0103b18>]
> (SyS_ioctl+0x34/0x5c)
> [  270.643767] [<c0103b18>] (SyS_ioctl) from [<c000f5c0>]
> (ret_fast_syscall+0x0/0x3c)
>=20


--FG6QVhsB9FDSfl9r5N46s2PsWDvLAHmsB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWQs/CAAoJEHYLnGJQkpH7zNYP/19FHds3mVkaS2tHQtIvGOk5
W70OZ1DumM8wU0C8GkU25AISbjdsobSnuwmtVFDBLl7EVESEIBwlRAfxO7Zi8nsK
r8bQudOuxD6qBsClizPP6sbJ4e9UAwL7sUyMfgmj1f1X/kZUT31meDa/09ENAQFF
c7o+BPHM9Xp+qGHzy436PCRalo3ziv0aQDCfukTJwmBF+QdGQKsZu5EEawi+oI79
7CZgsKrWjqGete5iJmm+wHIWcBPi8DzRE9ODN066ZQrS1hbILCzzswMKm7XnPB+8
wSbHyqZkqe7o1JWPeRH+pTOWYiPKs9MgjhsHQWATz/4iMhSDtzxRWfCnj54NGQxg
1D/mOzHrVYjz+ft7INBGrhJmOOGvkO643R+usDGx0v9o1gKwKDhmKoc7ldRRfaAK
cztTBms1k2oONwQCN8PWARSMs4iwDEGk2yM7ifORBCk/YgRj8wuLdyinea9YqNzQ
KfGElpKfzHy8JgOiko+15fU3SC4iQA2dOyDPZJlEnPPEI6ezOPEGN5gE8F76hSYp
CW/xk0dvXvwes58O4w1x0X/8aeWpWPoEy9zWxFoJVxeTcV0ZtrgBoXPRCWzi+Oy+
omJAwtEC9IfahU7sdcOeaR+yepUPoxxoTSDssbPSnDOKo9LNb/7FeQAdfw6PUN8B
a2A6C47sOAWr4pLJl/pZ
=xFEa
-----END PGP SIGNATURE-----

--FG6QVhsB9FDSfl9r5N46s2PsWDvLAHmsB--

--===============0771162959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0771162959==--
