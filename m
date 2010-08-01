From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] x86,
	mmiotrace: add support for tracing STOS instruction
Date: Sun, 1 Aug 2010 11:23:03 +0300
Message-ID: <20100801112303.3e9bea3e@daedalus.pq.iki.fi>
References: <20100731205101.GA5860@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100731205101.GA5860-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 31 Jul 2010 22:51:01 +0200
Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>

I have not checked the correctness of this patch, but otherwise:
Acked-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>

> ---
>  arch/x86/mm/pf_in.c |   30 +++++++++++++++++-------------
>  1 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/mm/pf_in.c b/arch/x86/mm/pf_in.c
> index 308e325..38e6d17 100644
> --- a/arch/x86/mm/pf_in.c
> +++ b/arch/x86/mm/pf_in.c
> @@ -40,16 +40,16 @@ static unsigned char prefix_codes[] = {
>  static unsigned int reg_rop[] = {
>  	0x8A, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
>  };
> -static unsigned int reg_wop[] = { 0x88, 0x89 };
> +static unsigned int reg_wop[] = { 0x88, 0x89, 0xAA, 0xAB };
>  static unsigned int imm_wop[] = { 0xC6, 0xC7 };
>  /* IA32 Manual 3, 3-432*/
> -static unsigned int rw8[] = { 0x88, 0x8A, 0xC6 };
> +static unsigned int rw8[] = { 0x88, 0x8A, 0xC6, 0xAA };
>  static unsigned int rw32[] = {
> -	0x89, 0x8B, 0xC7, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
> +	0x89, 0x8B, 0xC7, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F, 0xAB
>  };
> -static unsigned int mw8[] = { 0x88, 0x8A, 0xC6, 0xB60F, 0xBE0F };
> +static unsigned int mw8[] = { 0x88, 0x8A, 0xC6, 0xB60F, 0xBE0F,
> 0xAA }; static unsigned int mw16[] = { 0xB70F, 0xBF0F };
> -static unsigned int mw32[] = { 0x89, 0x8B, 0xC7 };
> +static unsigned int mw32[] = { 0x89, 0x8B, 0xC7, 0xAB };
>  static unsigned int mw64[] = {};
>  #else /* not __i386__ */
>  static unsigned char prefix_codes[] = {
> @@ -63,20 +63,20 @@ static unsigned char prefix_codes[] = {
>  static unsigned int reg_rop[] = {
>  	0x8A, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
>  };
> -static unsigned int reg_wop[] = { 0x88, 0x89 };
> +static unsigned int reg_wop[] = { 0x88, 0x89, 0xAA, 0xAB };
>  static unsigned int imm_wop[] = { 0xC6, 0xC7 };
> -static unsigned int rw8[] = { 0xC6, 0x88, 0x8A };
> +static unsigned int rw8[] = { 0xC6, 0x88, 0x8A, 0xAA };
>  static unsigned int rw32[] = {
> -	0xC7, 0x89, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F
> +	0xC7, 0x89, 0x8B, 0xB60F, 0xB70F, 0xBE0F, 0xBF0F, 0xAB
>  };
>  /* 8 bit only */
> -static unsigned int mw8[] = { 0xC6, 0x88, 0x8A, 0xB60F, 0xBE0F };
> +static unsigned int mw8[] = { 0xC6, 0x88, 0x8A, 0xB60F, 0xBE0F,
> 0xAA }; /* 16 bit only */
>  static unsigned int mw16[] = { 0xB70F, 0xBF0F };
>  /* 16 or 32 bit */
>  static unsigned int mw32[] = { 0xC7 };
>  /* 16, 32 or 64 bit */
> -static unsigned int mw64[] = { 0x89, 0x8B };
> +static unsigned int mw64[] = { 0x89, 0x8B, 0xAB };
>  #endif /* not __i386__ */
>  
>  struct prefix_bits {
> @@ -410,7 +410,6 @@ static unsigned long *get_reg_w32(int no,
> struct pt_regs *regs) unsigned long get_ins_reg_val(unsigned long
> ins_addr, struct pt_regs *regs) {
>  	unsigned int opcode;
> -	unsigned char mod_rm;
>  	int reg;
>  	unsigned char *p;
>  	struct prefix_bits prf;
> @@ -437,8 +436,13 @@ unsigned long get_ins_reg_val(unsigned long
> ins_addr, struct pt_regs *regs) goto err;
>  
>  do_work:
> -	mod_rm = *p;
> -	reg = ((mod_rm >> 3) & 0x7) | (prf.rexr << 3);
> +	/* for STOS, source register is fixed */
> +	if (opcode == 0xAA || opcode == 0xAB) {
> +		reg = arg_AX;
> +	} else {
> +		unsigned char mod_rm = *p;
> +		reg = ((mod_rm >> 3) & 0x7) | (prf.rexr << 3);
> +	}
>  	switch (get_ins_reg_width(ins_addr)) {
>  	case 1:
>  		return *get_reg_w8(reg, prf.rex, regs);
> -- 
> 1.7.1.1

-- 
Pekka Paalanen
http://www.iki.fi/pq/
