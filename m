From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFT 01/13] iomap: Constify ioreadX() iomem argument (as
 in generic implementation)
Date: Tue,  7 Jan 2020 17:52:58 +0100
Message-ID: <1578415992-24054-2-git-send-email-krzk__45587.1141677321$1578771216$gmane$org@kernel.org>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1578415992-24054-1-git-send-email-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Slaby <jirislaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nick Kossifidis <mickflemm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Luis Chamberlain <mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Dave Jiang <dave.jiang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The ioreadX() helpers have inconsistent interface.  On some architectures
void *__iomem address argument is a pointer to const, on some not.

Implementations of ioreadX() do not modify the memory under the address
so they can be converted to a "const" version for const-safety and
consistency among architectures.

Suggested-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 include/asm-generic/iomap.h           | 22 +++++++++++-----------
 include/linux/io-64-nonatomic-hi-lo.h |  4 ++--
 include/linux/io-64-nonatomic-lo-hi.h |  4 ++--
 lib/iomap.c                           | 18 +++++++++---------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/asm-generic/iomap.h b/include/asm-generic/iomap.h
index 9d28a5e82f73..986e894bef49 100644
--- a/include/asm-generic/iomap.h
+++ b/include/asm-generic/iomap.h
@@ -26,14 +26,14 @@
  * in the low address range. Architectures for which this is not
  * true can't use this generic implementation.
  */
-extern unsigned int ioread8(void __iomem *);
-extern unsigned int ioread16(void __iomem *);
-extern unsigned int ioread16be(void __iomem *);
-extern unsigned int ioread32(void __iomem *);
-extern unsigned int ioread32be(void __iomem *);
+extern unsigned int ioread8(const void __iomem *);
+extern unsigned int ioread16(const void __iomem *);
+extern unsigned int ioread16be(const void __iomem *);
+extern unsigned int ioread32(const void __iomem *);
+extern unsigned int ioread32be(const void __iomem *);
 #ifdef CONFIG_64BIT
-extern u64 ioread64(void __iomem *);
-extern u64 ioread64be(void __iomem *);
+extern u64 ioread64(const void __iomem *);
+extern u64 ioread64be(const void __iomem *);
 #endif
 
 #ifdef readq
@@ -41,10 +41,10 @@ extern u64 ioread64be(void __iomem *);
 #define ioread64_hi_lo ioread64_hi_lo
 #define ioread64be_lo_hi ioread64be_lo_hi
 #define ioread64be_hi_lo ioread64be_hi_lo
-extern u64 ioread64_lo_hi(void __iomem *addr);
-extern u64 ioread64_hi_lo(void __iomem *addr);
-extern u64 ioread64be_lo_hi(void __iomem *addr);
-extern u64 ioread64be_hi_lo(void __iomem *addr);
+extern u64 ioread64_lo_hi(const void __iomem *addr);
+extern u64 ioread64_hi_lo(const void __iomem *addr);
+extern u64 ioread64be_lo_hi(const void __iomem *addr);
+extern u64 ioread64be_hi_lo(const void __iomem *addr);
 #endif
 
 extern void iowrite8(u8, void __iomem *);
diff --git a/include/linux/io-64-nonatomic-hi-lo.h b/include/linux/io-64-nonatomic-hi-lo.h
index ae21b72cce85..f32522bb3aa5 100644
--- a/include/linux/io-64-nonatomic-hi-lo.h
+++ b/include/linux/io-64-nonatomic-hi-lo.h
@@ -57,7 +57,7 @@ static inline void hi_lo_writeq_relaxed(__u64 val, volatile void __iomem *addr)
 
 #ifndef ioread64_hi_lo
 #define ioread64_hi_lo ioread64_hi_lo
-static inline u64 ioread64_hi_lo(void __iomem *addr)
+static inline u64 ioread64_hi_lo(const void __iomem *addr)
 {
 	u32 low, high;
 
@@ -79,7 +79,7 @@ static inline void iowrite64_hi_lo(u64 val, void __iomem *addr)
 
 #ifndef ioread64be_hi_lo
 #define ioread64be_hi_lo ioread64be_hi_lo
-static inline u64 ioread64be_hi_lo(void __iomem *addr)
+static inline u64 ioread64be_hi_lo(const void __iomem *addr)
 {
 	u32 low, high;
 
diff --git a/include/linux/io-64-nonatomic-lo-hi.h b/include/linux/io-64-nonatomic-lo-hi.h
index faaa842dbdb9..448a21435dba 100644
--- a/include/linux/io-64-nonatomic-lo-hi.h
+++ b/include/linux/io-64-nonatomic-lo-hi.h
@@ -57,7 +57,7 @@ static inline void lo_hi_writeq_relaxed(__u64 val, volatile void __iomem *addr)
 
 #ifndef ioread64_lo_hi
 #define ioread64_lo_hi ioread64_lo_hi
-static inline u64 ioread64_lo_hi(void __iomem *addr)
+static inline u64 ioread64_lo_hi(const void __iomem *addr)
 {
 	u32 low, high;
 
@@ -79,7 +79,7 @@ static inline void iowrite64_lo_hi(u64 val, void __iomem *addr)
 
 #ifndef ioread64be_lo_hi
 #define ioread64be_lo_hi ioread64be_lo_hi
-static inline u64 ioread64be_lo_hi(void __iomem *addr)
+static inline u64 ioread64be_lo_hi(const void __iomem *addr)
 {
 	u32 low, high;
 
diff --git a/lib/iomap.c b/lib/iomap.c
index e909ab71e995..3b10c0ab2cee 100644
--- a/lib/iomap.c
+++ b/lib/iomap.c
@@ -70,27 +70,27 @@ static void bad_io_access(unsigned long port, const char *access)
 #define mmio_read64be(addr) swab64(readq(addr))
 #endif
 
-unsigned int ioread8(void __iomem *addr)
+unsigned int ioread8(const void __iomem *addr)
 {
 	IO_COND(addr, return inb(port), return readb(addr));
 	return 0xff;
 }
-unsigned int ioread16(void __iomem *addr)
+unsigned int ioread16(const void __iomem *addr)
 {
 	IO_COND(addr, return inw(port), return readw(addr));
 	return 0xffff;
 }
-unsigned int ioread16be(void __iomem *addr)
+unsigned int ioread16be(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read16be(port), return mmio_read16be(addr));
 	return 0xffff;
 }
-unsigned int ioread32(void __iomem *addr)
+unsigned int ioread32(const void __iomem *addr)
 {
 	IO_COND(addr, return inl(port), return readl(addr));
 	return 0xffffffff;
 }
-unsigned int ioread32be(void __iomem *addr)
+unsigned int ioread32be(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read32be(port), return mmio_read32be(addr));
 	return 0xffffffff;
@@ -142,26 +142,26 @@ static u64 pio_read64be_hi_lo(unsigned long port)
 	return lo | (hi << 32);
 }
 
-u64 ioread64_lo_hi(void __iomem *addr)
+u64 ioread64_lo_hi(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64_lo_hi(port), return readq(addr));
 	return 0xffffffffffffffffULL;
 }
 
-u64 ioread64_hi_lo(void __iomem *addr)
+u64 ioread64_hi_lo(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64_hi_lo(port), return readq(addr));
 	return 0xffffffffffffffffULL;
 }
 
-u64 ioread64be_lo_hi(void __iomem *addr)
+u64 ioread64be_lo_hi(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64be_lo_hi(port),
 		return mmio_read64be(addr));
 	return 0xffffffffffffffffULL;
 }
 
-u64 ioread64be_hi_lo(void __iomem *addr)
+u64 ioread64be_hi_lo(const void __iomem *addr)
 {
 	IO_COND(addr, return pio_read64be_hi_lo(port),
 		return mmio_read64be(addr));
-- 
2.7.4
