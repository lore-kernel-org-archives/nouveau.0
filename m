From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [RESEND PATCH v2 1/9] iomap: Constify ioreadX() iomem
 argument (as in generic implementation)
Date: Thu, 12 Mar 2020 21:55:44 +1100
Message-ID: <87ftedj0zz.fsf__7503.1175556191$1585552961$gmane$org@mpe.ellerman.id.au>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200219175007.13627-2-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Slaby <jirislaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nick Kossifidis <mickflemm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Luis Chamberlain <mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David
 S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> diff --git a/arch/powerpc/kernel/iomap.c b/arch/powerpc/kernel/iomap.c
> index 5ac84efc6ede..9fe4fb3b08aa 100644
> --- a/arch/powerpc/kernel/iomap.c
> +++ b/arch/powerpc/kernel/iomap.c
> @@ -15,23 +15,23 @@
>   * Here comes the ppc64 implementation of the IOMAP 
>   * interfaces.
>   */
> -unsigned int ioread8(void __iomem *addr)
> +unsigned int ioread8(const void __iomem *addr)
>  {
>  	return readb(addr);
>  }
> -unsigned int ioread16(void __iomem *addr)
> +unsigned int ioread16(const void __iomem *addr)
>  {
>  	return readw(addr);
>  }
> -unsigned int ioread16be(void __iomem *addr)
> +unsigned int ioread16be(const void __iomem *addr)
>  {
>  	return readw_be(addr);
>  }
> -unsigned int ioread32(void __iomem *addr)
> +unsigned int ioread32(const void __iomem *addr)
>  {
>  	return readl(addr);
>  }
> -unsigned int ioread32be(void __iomem *addr)
> +unsigned int ioread32be(const void __iomem *addr)
>  {
>  	return readl_be(addr);
>  }
> @@ -41,27 +41,27 @@ EXPORT_SYMBOL(ioread16be);
>  EXPORT_SYMBOL(ioread32);
>  EXPORT_SYMBOL(ioread32be);
>  #ifdef __powerpc64__
> -u64 ioread64(void __iomem *addr)
> +u64 ioread64(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_lo_hi(void __iomem *addr)
> +u64 ioread64_lo_hi(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_hi_lo(void __iomem *addr)
> +u64 ioread64_hi_lo(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64be(void __iomem *addr)
> +u64 ioread64be(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_lo_hi(void __iomem *addr)
> +u64 ioread64be_lo_hi(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_hi_lo(void __iomem *addr)
> +u64 ioread64be_hi_lo(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> @@ -139,15 +139,15 @@ EXPORT_SYMBOL(iowrite64be_hi_lo);
>   * FIXME! We could make these do EEH handling if we really
>   * wanted. Not clear if we do.
>   */
> -void ioread8_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsb(addr, dst, count);
>  }
> -void ioread16_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsw(addr, dst, count);
>  }
> -void ioread32_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsl(addr, dst, count);
>  }

This looks OK to me.

Acked-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> (powerpc)

cheers
