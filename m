From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] drm/nouveau: optimize code emission of inline
	functions
Date: Mon, 10 Aug 2009 20:14:16 -0400
Message-ID: <586c2acd0908101714raa93f59w47fb327c8e6d062e@mail.gmail.com>
References: <20090810204025.66a72124@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090810204025.66a72124-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Aug 10, 2009 at 1:40 PM, Pekka Paalanen<pq-X3B1VOXEql0@public.gmane.org> wrote:
> Before this patch:
>
> $ objdump -t nouveau.ko --section=.text | cut -f2 | sort -k2 | uniq -d -c
>      4
>      9 0000000000000010 BEGIN_RING
>      5 0000000000000051 FIRE_RING
>      2 00000000000000b3 NVLockVgaCrtcs
>      4 000000000000008b NVReadVgaCrtc
>      2 000000000000008c NVReadVgaCrtc
>      2 0000000000000011 NVVgaSeqReset
>      2 000000000000006b NVWriteCRTC
>      2 0000000000000066 NVWriteRAMDAC
>      4 0000000000000081 NVWriteVgaCrtc
>      3 0000000000000082 NVWriteVgaCrtc
>     11 000000000000001a OUT_RING
>      9 0000000000000028 RING_SPACE
>      2 0000000000000019 crtc_wr_cio_state
>      3 0000000000000012 drm_gem_object_unreference
>      2 0000000000000005 kmalloc
>      3 000000000000000b kzalloc
>      4 0000000000000051 nouveau_bo_ref
>      2 0000000000000050 nvReadMC
>      2 0000000000000052 nvWriteMC
>      3 0000000000000029 nv_gf4_disp_arch
>      4 000000000000001b nv_rd08
>      3 000000000000001c nv_rd08
>     29 0000000000000012 nv_rd32
>      2 0000000000000012 nv_ri32
>      5 000000000000001c nv_ro32
>      4 000000000000008b nv_two_heads
>     11 0000000000000022 nv_wo32
>      8 0000000000000015 nv_wr08
>     29 0000000000000014 nv_wr32
>      2 0000000000000013 pci_read_config_dword
>
> After this patch:
>
> $ objdump -t nouveau.ko --section=.text | cut -f2 | sort -k2 | uniq -d -c
>      4
>      9 0000000000000010 BEGIN_RING
>      5 0000000000000051 FIRE_RING
>      2 00000000000000b3 NVLockVgaCrtcs
>      5 00000000000000a7 NVReadVgaCrtc
>      2 0000000000000011 NVVgaSeqReset
>      2 0000000000000073 NVWriteCRTC
>      3 0000000000000072 NVWriteRAMDAC
>      4 0000000000000091 NVWriteVgaCrtc
>      3 0000000000000092 NVWriteVgaCrtc
>     11 000000000000001a OUT_RING
>      9 0000000000000028 RING_SPACE
>      2 0000000000000019 crtc_wr_cio_state
>      3 0000000000000012 drm_gem_object_unreference
>      2 0000000000000005 kmalloc
>      3 000000000000000b kzalloc
>      3 0000000000000051 nouveau_bo_ref
>      2 0000000000000052 nouveau_bo_ref
>      3 000000000000005d nvReadMC
>      2 000000000000005c nvWriteMC
>      3 0000000000000029 nv_gf4_disp_arch
>      4 000000000000008b nv_two_heads
>      2 0000000000000013 pci_read_config_dword
>
> As you can see, the static inline functions changed to extern
> inline functions no longer appear many times in the final kernel
> module. But, at the same time nouveau.ko file size
> before: 583683 B (.text size 0x000312c8)
> after:  681075 B (.text size 0x00039474)
> That's .text size increase by 32 kB.
>
> So something is definitely inlined a lot more. This was tested on
> x86_64, gcc 4.1.2, CONFIG_OPTIMIZE_INLINING=y,
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y.
>
> Now, I'm not sure if this patch would be a good thing or not.
> Comments?

Well if the goal is a small module then I guess it's not a good idea,
but then we should be disabling some other optimizations that
excessively bloat the module. I don't think it's a bad idea, but I'd
be curious where all the extra text comes from. I'm guessing more
inlining and/or loop unrolling.
