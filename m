From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch V3 32/37] drm/vmgfx: Replace kmap_atomic()
Date: Tue, 03 Nov 2020 10:27:44 +0100
Message-ID: <20201103095859.836711767@linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Ben Segall <bsegall@google.com>, linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>, Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>, Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.>
List-Id: nouveau.vger.kernel.org

There is no reason to disable pagefaults and preemption as a side effect of
kmap_atomic_prot().

Use kmap_local_page_prot() instead and document the reasoning for the
mapping usage with the given pgprot.

Remove the NULL pointer check for the map. These functions return a valid
address for valid pages and the return was bogus anyway as it would have
left preemption and pagefaults disabled.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
V3: New patch
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c |   30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -375,12 +375,12 @@ static int vmw_bo_cpu_blit_line(struct v
 		copy_size = min_t(u32, copy_size, PAGE_SIZE - src_page_offset);
 
 		if (unmap_src) {
-			kunmap_atomic(d->src_addr);
+			kunmap_local(d->src_addr);
 			d->src_addr = NULL;
 		}
 
 		if (unmap_dst) {
-			kunmap_atomic(d->dst_addr);
+			kunmap_local(d->dst_addr);
 			d->dst_addr = NULL;
 		}
 
@@ -388,12 +388,8 @@ static int vmw_bo_cpu_blit_line(struct v
 			if (WARN_ON_ONCE(dst_page >= d->dst_num_pages))
 				return -EINVAL;
 
-			d->dst_addr =
-				kmap_atomic_prot(d->dst_pages[dst_page],
-						 d->dst_prot);
-			if (!d->dst_addr)
-				return -ENOMEM;
-
+			d->dst_addr = kmap_local_page_prot(d->dst_pages[dst_page],
+							   d->dst_prot);
 			d->mapped_dst = dst_page;
 		}
 
@@ -401,12 +397,8 @@ static int vmw_bo_cpu_blit_line(struct v
 			if (WARN_ON_ONCE(src_page >= d->src_num_pages))
 				return -EINVAL;
 
-			d->src_addr =
-				kmap_atomic_prot(d->src_pages[src_page],
-						 d->src_prot);
-			if (!d->src_addr)
-				return -ENOMEM;
-
+			d->src_addr = kmap_local_page_prot(d->src_pages[src_page],
+							   d->src_prot);
 			d->mapped_src = src_page;
 		}
 		diff->do_cpy(diff, d->dst_addr + dst_page_offset,
@@ -436,8 +428,10 @@ static int vmw_bo_cpu_blit_line(struct v
  *
  * Performs a CPU blit from one buffer object to another avoiding a full
  * bo vmap which may exhaust- or fragment vmalloc space.
- * On supported architectures (x86), we're using kmap_atomic which avoids
- * cross-processor TLB- and cache flushes and may, on non-HIGHMEM systems
+ *
+ * On supported architectures (x86), we're using kmap_local_prot() which
+ * avoids cross-processor TLB- and cache flushes. kmap_local_prot() will
+ * either map a highmem page with the proper pgprot on HIGHMEM=y systems or
  * reference already set-up mappings.
  *
  * Neither of the buffer objects may be placed in PCI memory
@@ -500,9 +494,9 @@ int vmw_bo_cpu_blit(struct ttm_buffer_ob
 	}
 out:
 	if (d.src_addr)
-		kunmap_atomic(d.src_addr);
+		kunmap_local(d.src_addr);
 	if (d.dst_addr)
-		kunmap_atomic(d.dst_addr);
+		kunmap_local(d.dst_addr);
 
 	return ret;
 }
