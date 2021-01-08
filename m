From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Date: Fri, 08 Jan 2021 20:20:43 +0000
Message-ID: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-aio@kvack.org>
Sender: owner-linux-aio@kvack.org
To: tglx@linutronix.de
Cc: airlied@linux.ie, airlied@redhat.com, akpm@linux-foundation.org, arnd@arndb.de, bcrl@kvack.org, bigeasy@linutronix.de, bristot@redhat.com, bsegall@google.com, bskeggs@redhat.com, chris@zankel.net, christian.koenig@amd.com, clm@fb.com, davem@davemloft.net, deanbo422@gmail.com, dietmar.eggemann@arm.com, dri-devel@lists.freedesktop.org, dsterba@suse.com, green.hu@gmail.com, hch@lst.de, intel-gfx@lists.freedesktop.org, jcmvbkbc@gmail.com, josef@toxicpanda.com, juri.lelli@redhat.com, kraxel@redhat.com, linux-aio@kvack.org, linux-arm-kernel@lists.infradead.org, linux-btrfs@vger.kernel.org, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.o
List-Id: nouveau.vger.kernel.org

Hi Thomas,

5.11 does not boot anymore on Ingenic SoCs, I bisected it to this 
commit.

Any idea what could be happening?

Cheers,
-Paul



--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
