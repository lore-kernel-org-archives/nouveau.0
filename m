From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch V3 02/37] highmem: Remove unused functions
Date: Tue, 03 Nov 2020 10:27:14 +0100
Message-ID: <20201103095856.732891880@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8-bit
Return-path: <sparclinux-owner@vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Paul McKenney <paulmck@kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>, Benjamin LaHaise <bcrl@kvack.org>, linux-fsdevel@vger.kernel.org, linux-aio@kvack.org, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, x86@kernel.org, Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, Michal Simek <monstr@mon>
List-Id: nouveau.vger.kernel.org

Nothing uses totalhigh_pages_dec() and totalhigh_pages_set().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 include/linux/highmem.h |   10 ----------
 1 file changed, 10 deletions(-)

--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -104,21 +104,11 @@ static inline void totalhigh_pages_inc(v
 	atomic_long_inc(&_totalhigh_pages);
 }
 
-static inline void totalhigh_pages_dec(void)
-{
-	atomic_long_dec(&_totalhigh_pages);
-}
-
 static inline void totalhigh_pages_add(long count)
 {
 	atomic_long_add(count, &_totalhigh_pages);
 }
 
-static inline void totalhigh_pages_set(long val)
-{
-	atomic_long_set(&_totalhigh_pages, val);
-}
-
 void kmap_flush_unused(void);
 
 struct page *kmap_to_page(void *addr);
