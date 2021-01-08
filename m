From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Date: Sat, 9 Jan 2021 00:58:05 +0100
Message-ID: <20210108235805.GA17543@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-aio@kvack.org>
Content-Disposition: inline
In-Reply-To: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
Sender: owner-linux-aio@kvack.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: tglx@linutronix.de, airlied@linux.ie, airlied@redhat.com, akpm@linux-foundation.org, arnd@arndb.de, bcrl@kvack.org, bigeasy@linutronix.de, bristot@redhat.com, bsegall@google.com, bskeggs@redhat.com, chris@zankel.net, christian.koenig@amd.com, clm@fb.com, davem@davemloft.net, deanbo422@gmail.com, dietmar.eggemann@arm.com, dri-devel@lists.freedesktop.org, dsterba@suse.com, green.hu@gmail.com, hch@lst.de, intel-gfx@lists.freedesktop.org, jcmvbkbc@gmail.com, josef@toxicpanda.com, juri.lelli@redhat.com, kraxel@redhat.com, linux-aio@kvack.org, linux-arm-kernel@lists.infradead.org, linux-btrfs@vger.kernel.org, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux@armlinux.org.uklinux
List-Id: nouveau.vger.kernel.org

On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> Hi Thomas,
> 
> 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> 
> Any idea what could be happening?

not yet, kernel crash log of a Malta QEMU is below.

Thomas.

Kernel bug detected[#1]:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc1-00017-gccb21774863a #2
$ 0   : 00000000 00000001 00000000 00000010
$ 4   : 00000001 000005cf 9e00059f 00000000
$ 8   : 00118173 809e6db8 9e00059f 00000000
$12   : 82023c00 00000001 810da04c 0212422f
$16   : 810da000 00027800 000005cf 80b4bf9c
$20   : 809e968c 82602400 810da000 0000000b
$24   : 021558f9 00000000                  
$28   : 820e0000 820e3928 80b10000 802710d0
Hi    : 0000346c
Lo    : 000002dd
epc   : 80271114 __kmap_local_pfn_prot+0x78/0x1c0
ra    : 802710d0 __kmap_local_pfn_prot+0x34/0x1c0
Status: 1000a403	KERNEL EXL IE 
Cause : 00800034 (ExcCode 0d)
PrId  : 0001a800 (MIPS P5600)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
Stack : 7fffffff 820c2408 820e3990 ffffff04 ffff0a00 80518224 000081a4 810da000
        00000001 000005cf fff64000 8011c77c 820e3b26 ffffff04 ffff0a00 80518440
        80b30000 80b4bf64 9e0005cf 000005cf fff64000 80271188 00000000 820e3a60
        80b10000 80194478 0000005e 80954406 809e0000 810da000 00000001 000005cf
        fff68000 8011c77c 8088fd44 809f6074 000000f4 00000000 00000000 80b4bf68
        ...
Call Trace:
[<80271114>] __kmap_local_pfn_prot+0x78/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<802c49a0>] copy_string_kernel+0x168/0x264
[<802c5d18>] kernel_execve+0xd0/0x164
[<801006cc>] try_to_run_init_process+0x18/0x5c
[<80859e0c>] kernel_init+0xd0/0x120
[<801037f8>] ret_from_kernel_thread+0x14/0x1c

Code: 8c630564  28640010  38840001 <00040336> 8f82000c  2463ffff  00021100  00431021  2403ffbf 

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
