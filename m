From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
Date: Thu, 12 Nov 2020 12:03:20 +0100
Message-ID: <87v9ean8g7.fsf@nanos.tec.linutronix.de>
References: <20201103092712.714480842@linutronix.de> <20201103095857.582196476@linutronix.de> <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com> <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-aio@kvack.org>
In-Reply-To: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Sender: owner-linux-aio@kvack.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Paul McKenney <paulmck@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Christian
List-Id: nouveau.vger.kernel.org

Marek,

On Thu, Nov 12 2020 at 09:10, Marek Szyprowski wrote:
> On 03.11.2020 10:27, Thomas Gleixner wrote:
>
> I can do more tests to help fixing this issue. Just let me know what to do.

Just sent out the fix before I saw your report.

     https://lore.kernel.org/r/87y2j6n8mj.fsf@nanos.tec.linutronix.de

Thanks,

        tglx

--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
