From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV_PMC_BOOT_0 architecture field
Date: Sat, 28 Sep 2013 07:07:58 +1000
Message-ID: <CACAvsv4NDa3a7j6eZ6TgcUR86zKDQpSNL9PFp6j6Onheg8EsAQ@mail.gmail.com>
References: <20130927180335.GB5577@parker.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130927180335.GB5577-4K9zQNqW3/fFT5IIyIEb6QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Sep 28, 2013 at 4:03 AM, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Ben,
Hey Andy,

>
> At XDC you asked about the architecture field in NV_PMC_BOOT_0, and how
> to correctly determine the GPU architecture.
>
> It looks like Nouveau is getting the architecture from bits 20-27
> in NV_PMC_BOOT_0 (though masking off bits 20-23).  For >= NV10, the
> architecture field in NV_PMC_BOOT_0 is bits 24-28.  E.g., the GK2xx
> architecture has architecture value 0x10, while GK11x has value 0xF and
> GK10x has value 0xE.
That helps a great deal.  Knowing the bitfield was 28:24 right back to
when you guys switched from the NV04 layout of NV_PMC_BOOT_0 means
it'll be safe for us to trivially fix.

Thanks a lot!
Ben.

>
> I hope that helps,
> - Andy
>
>
