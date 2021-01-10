From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Date: Sun, 10 Jan 2021 11:35:01 +0000
Message-ID: <DUUPMQ.U53A0W7YJPGM@crapouillou.net>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
	<20210108235805.GA17543@alpha.franken.de>
	<20210109003352.GA18102@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-aio@kvack.org>
In-Reply-To: <20210109003352.GA18102@alpha.franken.de>
Sender: owner-linux-aio@kvack.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: tglx@linutronix.de, airlied@linux.ie, airlied@redhat.com, akpm@linux-foundation.org, arnd@arndb.de, bcrl@kvack.org, bigeasy@linutronix.de, bristot@redhat.com, bsegall@google.com, bskeggs@redhat.com, chris@zankel.net, christian.koenig@amd.com, clm@fb.com, davem@davemloft.net, deanbo422@gmail.com, dietmar.eggemann@arm.com, dri-devel@lists.freedesktop.org, dsterba@suse.com, green.hu@gmail.com, hch@lst.de, intel-gfx@lists.freedesktop.org, jcmvbkbc@gmail.com, josef@toxicpanda.com, juri.lelli@redhat.com, kraxel@redhat.com, linux-aio@kvack.org, linux-arm-kernel@lists.infradead.org, linux-btrfs@vger.kernel.org, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux@armlinux.org.uk, linuxpp
List-Id: nouveau.vger.kernel.org

Hi Thomas,

Le sam. 9 janv. 2021 =E0 1:33, Thomas Bogendoerfer=20
<tsbogend@alpha.franken.de> a =E9crit :
> On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
>>  On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
>>  > Hi Thomas,
>>  >
>>  > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this=20
>> commit.
>>  >
>>  > Any idea what could be happening?
>>=20
>>  not yet, kernel crash log of a Malta QEMU is below.
>=20
> update:
>=20
> This dirty hack lets the Malta QEMU boot again:
>=20
> diff --git a/mm/highmem.c b/mm/highmem.c
> index c3a9ea7875ef..190cdda1149d 100644
> --- a/mm/highmem.c
> +++ b/mm/highmem.c
> @@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn,=20
> pgprot_t prot)
>  	vaddr =3D __fix_to_virt(FIX_KMAP_BEGIN + idx);
>  	BUG_ON(!pte_none(*(kmap_pte - idx)));
>  	pteval =3D pfn_pte(pfn, prot);
> -	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
> +	set_pte(kmap_pte - idx, pteval);
>  	arch_kmap_local_post_map(vaddr, pteval);
>  	current->kmap_ctrl.pteval[kmap_local_idx()] =3D pteval;
>  	preempt_enable();
>=20
> set_pte_at() tries to update cache and could do an kmap_atomic()=20
> there.
> Not sure, if this is allowed at this point.

Yes, I can confirm that your workaround works here too.

Cheers,
-Paul



--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
