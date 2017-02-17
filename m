From: Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/35] x86: Convert remaining uses of
 pr_warning to pr_warn
Date: Fri, 17 Feb 2017 09:46:27 +0200
Message-ID: <20170217094627.61844e29@eldfell>
References: <cover.1487314666.git.joe@perches.com>
 <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0266507944=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <be5fd9c52a11473a52e317b28cc32d2845def094.1487314667.git.joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Juergen Gross <jgross-IBi9RG/b67k@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ning Sun <ning.sun-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, tboot-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, oprofile-list-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org, "H.
 Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Boris Ostrovsky <boris.ostrovsky-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, sfi-devel-yLnuTTp1/kvcsJTPyzm5gB2eb7JE58TQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0266507944==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oUJh19ME=QXTHyyEJia/ZSD"; protocol="application/pgp-signature"

--Sig_/oUJh19ME=QXTHyyEJia/ZSD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Feb 2017 23:11:22 -0800
Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:

> To enable eventual removal of pr_warning
>=20
> This makes pr_warn use consistent for arch/x86
>=20
> Prior to this patch, there were 46 uses of pr_warning and
> 122 uses of pr_warn in arch/x86
>=20
> Miscellanea:
>=20
> o Coalesce a few formats and realign arguments
> o Convert a couple of multiple line printks to single line
>=20
> Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/x86/kernel/amd_gart_64.c          | 12 +++------
>  arch/x86/kernel/apic/apic.c            | 46 ++++++++++++++++------------=
------
>  arch/x86/kernel/apic/apic_noop.c       |  2 +-
>  arch/x86/kernel/setup_percpu.c         |  4 +--
>  arch/x86/kernel/tboot.c                | 15 ++++++-----
>  arch/x86/kernel/tsc_sync.c             |  8 +++---
>  arch/x86/mm/kmmio.c                    |  8 +++---
>  arch/x86/mm/mmio-mod.c                 |  5 ++--
>  arch/x86/mm/numa.c                     | 12 ++++-----
>  arch/x86/mm/numa_emulation.c           |  6 ++---
>  arch/x86/mm/testmmiotrace.c            |  5 ++--
>  arch/x86/oprofile/op_x86_model.h       |  6 ++---
>  arch/x86/platform/olpc/olpc-xo15-sci.c |  2 +-
>  arch/x86/platform/sfi/sfi.c            |  3 +--
>  arch/x86/xen/debugfs.c                 |  2 +-
>  arch/x86/xen/setup.c                   |  2 +-
>  16 files changed, 63 insertions(+), 75 deletions(-)
>=20

Hi,

seems fine to me, even though I haven't been involved in the kernel
side for years.

For the hunks quoted below *only*:
Reviewed-by: Pekka Paalanen <pekka.paalanen-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

> diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
> index afc47f5c9531..ad70518cdcc7 100644
> --- a/arch/x86/mm/kmmio.c
> +++ b/arch/x86/mm/kmmio.c
> @@ -187,8 +187,8 @@ static int arm_kmmio_fault_page(struct kmmio_fault_pa=
ge *f)
>  	int ret;
>  	WARN_ONCE(f->armed, KERN_ERR pr_fmt("kmmio page already armed.\n"));
>  	if (f->armed) {
> -		pr_warning("double-arm: addr 0x%08lx, ref %d, old %d\n",
> -			   f->addr, f->count, !!f->old_presence);
> +		pr_warn("double-arm: addr 0x%08lx, ref %d, old %d\n",
> +			f->addr, f->count, !!f->old_presence);
>  	}
>  	ret =3D clear_page_presence(f, true);
>  	WARN_ONCE(ret < 0, KERN_ERR pr_fmt("arming at 0x%08lx failed.\n"),
> @@ -335,8 +335,8 @@ static int post_kmmio_handler(unsigned long condition=
, struct pt_regs *regs)
>  		 * something external causing them (f.e. using a debugger while
>  		 * mmio tracing enabled), or erroneous behaviour
>  		 */
> -		pr_warning("unexpected debug trap on CPU %d.\n",
> -			   smp_processor_id());
> +		pr_warn("unexpected debug trap on CPU %d\n",
> +			smp_processor_id());
>  		goto out;
>  	}
> =20
> diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> index bef36622e408..706ae44d1af7 100644
> --- a/arch/x86/mm/mmio-mod.c
> +++ b/arch/x86/mm/mmio-mod.c
> @@ -407,7 +407,7 @@ static void enter_uniprocessor(void)
>  	}
>  out:
>  	if (num_online_cpus() > 1)
> -		pr_warning("multiple CPUs still online, may miss events.\n");
> +		pr_warn("multiple CPUs still online, may miss events\n");
>  }
> =20
>  static void leave_uniprocessor(void)
> @@ -431,8 +431,7 @@ static void leave_uniprocessor(void)
>  static void enter_uniprocessor(void)
>  {
>  	if (num_online_cpus() > 1)
> -		pr_warning("multiple CPUs are online, may miss events. "
> -			   "Suggest booting with maxcpus=3D1 kernel argument.\n");
> +		pr_warn("multiple CPUs are online, may miss events. Suggest booting wi=
th maxcpus=3D1 kernel argument.\n");
>  }
> =20
>  static void leave_uniprocessor(void)

> diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
> index 38868adf07ea..4a55e453296d 100644
> --- a/arch/x86/mm/testmmiotrace.c
> +++ b/arch/x86/mm/testmmiotrace.c
> @@ -121,9 +121,8 @@ static int __init init(void)
>  		return -ENXIO;
>  	}
> =20
> -	pr_warning("WARNING: mapping %lu kB @ 0x%08lx in PCI address space, "
> -		   "and writing 16 kB of rubbish in there.\n",
> -		   size >> 10, mmio_address);
> +	pr_warn("WARNING: mapping %lu kB @ 0x%08lx in PCI address space, and wr=
iting 16 kB of rubbish in there\n",
> +		size >> 10, mmio_address);
>  	do_test(size);
>  	do_test_bulk_ioremapping();
>  	pr_info("All done.\n");


Thanks,
pq

--Sig_/oUJh19ME=QXTHyyEJia/ZSD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpqpTAAoJECNf5bQRqqqnay4P/2+5AsH0XAKQryKNaQVYVrRF
XMxwMBJ2jqvd2S5aNpf+Qgc0wbBM97H5Ix8NJeJ5DYNWlaM+L9KuOnG78rZOfnun
wJTxVlWAEenZY9XhW7fX5P9B9Q6ASvHewEYwEG98Q4NQcwIt7Ovi2mJ++WApeqYt
7yWp/NiCQ9Q5Z0X/VSZhqYawIq5q+vxu5nu5qojj5rXiIDjv6YRKaHmupyckNtxB
d1DjkWsB8OQltdQBLkebyveRrdprGmSUHg/85EnJmxO+193jxXpGHn+YtcN+qldS
ig8I4zfDY34Ji4b0gYgXHcJrB1nIOsuBnROQ9nKpOrxj6PhyYG1BbrfPwIy7Fa8m
1wdjlmR7rM5rpJTwPBTHLPhF87U4URAiH+SvXFEhaUshJAejOgW4BEe4YuxJ20qe
NOkYCiHHbjV90ym2MuhGg2P9cEH1qBHckEEmcmAyukC4sliaEqhzzZ0OIXX0FOAm
UcT58+m0CRLESpRGO6Gzfp1KggJpvBSawuKt9qh7XWffWfo40YRQM8gWmyD4Hv8E
v3ubZWySe+lgUIWmFisbgAkVQSsNeL2C+WKlIfDYbuWLbgdkcGY222qBgT8XaIEy
O8m61hN9VFJxy4DcQ9AgNg1WNAzOAco1LPC4isoXkzwGg/bAYz+iJb4vvfLLB3QZ
ge2RuTMqaBF9Lu/AybG1
=DDNC
-----END PGP SIGNATURE-----

--Sig_/oUJh19ME=QXTHyyEJia/ZSD--

--===============0266507944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0266507944==--
