From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
Date: Thu, 12 Nov 2020 12:07:29 +0100
Message-ID: <20201112110729.vx4xebavy6gpzuef@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.582196476@linutronix.de>
 <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com>
 <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <owner-linux-aio@kvack.org>
Content-Disposition: inline
In-Reply-To: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Sender: owner-linux-aio@kvack.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Paul McKenney <paulmck@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vge
List-Id: nouveau.vger.kernel.org

On 2020-11-12 09:10:34 [+0100], Marek Szyprowski wrote:
> I can do more tests to help fixing this issue. Just let me know what to do.

-> https://lkml.kernel.org/r/87y2j6n8mj.fsf@nanos.tec.linutronix.de

Sebastian

--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
