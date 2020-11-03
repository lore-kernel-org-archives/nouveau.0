From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch V3 28/37] mips/crashdump: Simplify copy_oldmem_page()
Date: Tue, 03 Nov 2020 10:27:40 +0100
Message-ID: <20201103095859.429620021@linutronix.de>
References: <20201103092712.714480842@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>, Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>, Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>, Vincent Guittot <vincent.guittot@linaro.org>, Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, David Airlie <air>
List-Id: nouveau.vger.kernel.org

Replace kmap_atomic_pfn() with kmap_local_pfn() which is preemptible and
can take page faults.

Remove the indirection of the dump page and the related cruft which is not
longer required.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
V3: New patch
---
 arch/mips/kernel/crash_dump.c |   42 +++++++-----------------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

--- a/arch/mips/kernel/crash_dump.c
+++ b/arch/mips/kernel/crash_dump.c
@@ -5,8 +5,6 @@
 #include <linux/uaccess.h>
 #include <linux/slab.h>
 
-static void *kdump_buf_page;
-
 /**
  * copy_oldmem_page - copy one page from "oldmem"
  * @pfn: page frame number to be copied
@@ -17,51 +15,25 @@ static void *kdump_buf_page;
  * @userbuf: if set, @buf is in user address space, use copy_to_user(),
  *	otherwise @buf is in kernel address space, use memcpy().
  *
- * Copy a page from "oldmem". For this page, there is no pte mapped
+ * Copy a page from "oldmem". For this page, there might be no pte mapped
  * in the current kernel.
- *
- * Calling copy_to_user() in atomic context is not desirable. Hence first
- * copying the data to a pre-allocated kernel page and then copying to user
- * space in non-atomic context.
  */
-ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
-			 size_t csize, unsigned long offset, int userbuf)
+ssize_t copy_oldmem_page(unsigned long pfn, char *buf, size_t csize,
+			 unsigned long offset, int userbuf)
 {
 	void  *vaddr;
 
 	if (!csize)
 		return 0;
 
-	vaddr = kmap_atomic_pfn(pfn);
+	vaddr = kmap_local_pfn(pfn);
 
 	if (!userbuf) {
-		memcpy(buf, (vaddr + offset), csize);
-		kunmap_atomic(vaddr);
+		memcpy(buf, vaddr + offset, csize);
 	} else {
-		if (!kdump_buf_page) {
-			pr_warn("Kdump: Kdump buffer page not allocated\n");
-
-			return -EFAULT;
-		}
-		copy_page(kdump_buf_page, vaddr);
-		kunmap_atomic(vaddr);
-		if (copy_to_user(buf, (kdump_buf_page + offset), csize))
-			return -EFAULT;
+		if (copy_to_user(buf, vaddr + offset, csize))
+			csize = -EFAULT;
 	}
 
 	return csize;
 }
-
-static int __init kdump_buf_page_init(void)
-{
-	int ret = 0;
-
-	kdump_buf_page = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!kdump_buf_page) {
-		pr_warn("Kdump: Failed to allocate kdump buffer page\n");
-		ret = -ENOMEM;
-	}
-
-	return ret;
-}
-arch_initcall(kdump_buf_page_init);
