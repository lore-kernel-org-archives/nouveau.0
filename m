From: Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 14/16] mm/thp: add THP allocation helper
Date: Sun, 21 Jun 2020 20:15:45 -0400
Message-ID: <9948121A-CA52-494F-9B68-6C0089E15057@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-15-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1416556052=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200619215649.32297-15-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1416556052==
Content-Type: multipart/signed;
	boundary="=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 19 Jun 2020, at 17:56, Ralph Campbell wrote:

> Transparent huge page allocation policy is controlled by several sysfs
> variables. Rather than expose these to each device driver that needs to=

> allocate THPs, provide a helper function.
>
> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/linux/gfp.h | 10 ++++++++++
>  mm/huge_memory.c    | 16 ++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index 67a0774e080b..1c7d968a27d3 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -562,6 +562,16 @@ extern struct page *alloc_pages_vma(gfp_t gfp_mask=
, int order,
>  	alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id(), false)
>  #define alloc_page_vma_node(gfp_mask, vma, addr, node)		\
>  	alloc_pages_vma(gfp_mask, 0, vma, addr, node, false)
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +extern struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +					unsigned long addr);
> +#else
> +static inline struct page *alloc_transhugepage(struct vm_area_struct *=
vma,
> +						unsigned long addr)
> +{
> +	return NULL;
> +}
> +#endif
>
>  extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int ord=
er);
>  extern unsigned long get_zeroed_page(gfp_t gfp_mask);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 25d95f7b1e98..f749633ed350 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -775,6 +775,22 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fa=
ult *vmf)
>  	return __do_huge_pmd_anonymous_page(vmf, page, gfp);
>  }
>
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +				 unsigned long haddr)
> +{
> +	gfp_t gfp;
> +	struct page *page;
> +
> +	gfp =3D alloc_hugepage_direct_gfpmask(vma);
> +	page =3D alloc_hugepage_vma(gfp, vma, haddr, HPAGE_PMD_ORDER);
> +	if (page)
> +		prep_transhuge_page(page);
> +	return page;
> +}
> +EXPORT_SYMBOL_GPL(alloc_transhugepage);
> +#endif
> +
>  static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long a=
ddr,
>  		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
>  		pgtable_t pgtable)
> -- =

> 2.20.1

Why use CONFIG_ARCH_ENABLE_THP_MIGRATION to guard THP allocator helper?
Shouldn=E2=80=99t CONFIG_TRANSPARENT_HUGEPAGE be used? Also the helper st=
ill allocates
a THP even if transparent_hugepage_enabled(vma) is false, which is wrong,=
 right?


--
Best Regards,
Yan Zi

--=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBAgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl7v+DEPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKQCQP/R4abSW0mnepE+hQxnoAry2FCsgoq4kfwbLS
z61PThcPrmTTEvbT9kRmqtarVtKhK1u0NxFkzhBYEZA4jfrs9JOufIXWBdhEEI+L
Lp0xXMwc4qEugDb2whgdiTWIWfwhDqzYExaaZMuWlpr2H9Uw+qEENzlBvTBnd2Xa
4cj2nAipD6ggJ4qz/h7pt+2JTNKhNBirkfXqYjoXeWZpj/N0AfUs8IziaHyOwqxZ
1p2KvBeqsOB5M67Mr6TVzOHh1EZEbN7VMRHbXEgw6mBt179v67IGmP129Xp/zzFh
U0KDQiMGUh7rt8rScMpv9v9xbvTXA5Ztpe/ExGARRK9cmOWOr3UHK2fDLwl3WSTl
IN7swIwEBTpKPSWpCEi0f4fiQOqOk9PuexRM6ZxI5W/GYPKR99Fn7cHEMjgESOw1
fKCXPMXx95DDabWoRdMmTPEKkReI8k/RWSJhBq5mIUH8kHNilWgbPhUH/l7pbgMB
W636ZixfVK0q7F95lwwU+fEH5BTfMwwk/usVT0ugRoTsiAFOFEZ3GXi6W8mmp8fo
6oaOysR1M3K01IXl8RRlDrWqK3oPsv2MnNTH2adPCxKKXU8PSRgs9Zcc7d9EIIO1
I7bnvmSZ7pTWK0RaHfv/yIbcfqpyyUt9wJy9kc83VXknBsOjJs9QtOBchjzpBWq1
q2tbBUmt
=CvYf
-----END PGP SIGNATURE-----

--=_MailMate_4C36EFB0-847C-4A5D-A41C-B10AE0145101_=--

--===============1416556052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1416556052==--
