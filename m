From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [patch V3 05/37] asm-generic: Provide kmap_size.h
Date: Tue, 3 Nov 2020 13:25:27 +0100
Message-ID: <CAK8P3a3q1O=vTLHpjkufNhspj+OJFn0BkMD6XaPZvN_0D+=FFQ@mail.gmail.com>
References: <20201103092712.714480842@linutronix.de> <20201103095857.078043987@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20201103095857.078043987@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Paul McKenney <paulmck@kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Benjamin LaHaise <bcrl@kvack.org>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, linux-aio <linux-aio@kvack.org>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs <linux-btrfs@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Vineet Gupta <vgupta@synopsys.com>"open list:SYNOPSYS ARC ARCHITECTURE" <linux->
List-Id: nouveau.vger.kernel.org

On Tue, Nov 3, 2020 at 10:27 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> kmap_types.h is a misnomer because the old atomic MAP based array does not
> exist anymore and the whole indirection of architectures including
> kmap_types.h is inconinstent and does not allow to provide guard page
> debugging for this misfeature.
>
> Add a common header file which defines the mapping stack size for all
> architectures. Will be used when converting architectures over to a
> generic kmap_local/atomic implementation.
>
> The array size is chosen with the following constraints in mind:
>
>     - The deepest nest level in one context is 3 according to code
>       inspection.
>
>     - The worst case nesting for the upcoming reemptible version would be:
>
>       2 maps in task context and a fault inside
>       2 maps in the fault handler
>       3 maps in softirq
>       2 maps in interrupt
>
> So a total of 16 is sufficient and probably overestimated.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
