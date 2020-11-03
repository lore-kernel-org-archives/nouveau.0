From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V3 22/37] highmem: High implementation details and
 document API
Date: Tue, 3 Nov 2020 09:48:10 -0800
Message-ID: <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
References: <20201103092712.714480842@linutronix.de> <20201103095858.827582066@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201103095858.827582066@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Paul McKenney <paulmck@kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Benjamin LaHaise <bcrl@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-aio@kvack.org, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs <linux-btrfs@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Vineet Gupta <vgupta@synopsys.com>, "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, Russell King <linux@armlinux.org.uk>
List-Id: nouveau.vger.kernel.org

On Tue, Nov 3, 2020 at 2:33 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> +static inline void *kmap(struct page *page)
> +{
> +       void *addr;
> +
> +       might_sleep();
> +       if (!PageHighMem(page))
> +               addr = page_address(page);
> +       else
> +               addr = kmap_high(page);
> +       kmap_flush_tlb((unsigned long)addr);
> +       return addr;
> +}
> +
> +static inline void kunmap(struct page *page)
> +{
> +       might_sleep();
> +       if (!PageHighMem(page))
> +               return;
> +       kunmap_high(page);
> +}

I have no complaints about the patch, but it strikes me that if people
want to actually have much better debug coverage, this is where it
should be (I like the "every other address" thing too, don't get me
wrong).

In particular, instead of these PageHighMem(page) tests, I think
something like this would be better:

   #ifdef CONFIG_DEBUG_HIGHMEM
     #define page_use_kmap(page) ((page),1)
   #else
     #define page_use_kmap(page) PageHighMem(page)
   #endif

adn then replace those "if (!PageHighMem(page))" tests with "if
(!page_use_kmap())" instead.

IOW, in debug mode, it would _always_ remap the page, whether it's
highmem or not. That would really stress the highmem code and find any
fragilities.

No?

Anyway, this is all sepatrate from the series, which still looks fine
to me. Just a reaction to seeing the patch, and Thomas' earlier
mention that the highmem debugging doesn't actually do much.

               Linus
