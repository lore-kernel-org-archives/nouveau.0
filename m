From: trix@redhat.com
Subject: [PATCH v2] x86 : remove definition of DEBUG
Date: Thu, 14 Jan 2021 13:28:27 -0800
Message-ID: <20210114212827.47584-1-trix@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, rostedt@goodmis.org, karolherbst@gmail.com, ppaalanen@gmail.com, dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, alexandre.chartre@oracle.com, ying-tsun.huang@amd.com, mchehab+huawei@kernel.org, paulmck@kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Tom Rix <trix@redhat.com>
List-Id: nouveau.vger.kernel.org

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v1: merge all 4 in arch/x86/
---
 arch/x86/kernel/cpu/mtrr/generic.c | 1 -
 arch/x86/kernel/cpu/mtrr/mtrr.c    | 2 --
 arch/x86/kernel/pci-iommu_table.c  | 3 ---
 arch/x86/mm/mmio-mod.c             | 2 --
 4 files changed, 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index a29997e6cf9e..b90f3f437765 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -3,7 +3,6 @@
  * This only handles 32bit MTRR on 32bit hosts. This is strictly wrong
  * because MTRRs can span up to 40 bits (36bits on most modern x86)
  */
-#define DEBUG
 
 #include <linux/export.h>
 #include <linux/init.h>
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index 61eb26edc6d2..28c8a23aa42e 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -31,8 +31,6 @@
     System Programming Guide; Section 9.11. (1997 edition - PPro).
 */
 
-#define DEBUG
-
 #include <linux/types.h> /* FIXME: kvm_para.h needs this */
 
 #include <linux/stop_machine.h>
diff --git a/arch/x86/kernel/pci-iommu_table.c b/arch/x86/kernel/pci-iommu_table.c
index 2e9006c1e240..42e92ec62973 100644
--- a/arch/x86/kernel/pci-iommu_table.c
+++ b/arch/x86/kernel/pci-iommu_table.c
@@ -4,9 +4,6 @@
 #include <linux/string.h>
 #include <linux/kallsyms.h>
 
-
-#define DEBUG 1
-
 static struct iommu_table_entry * __init
 find_dependents_of(struct iommu_table_entry *start,
 		   struct iommu_table_entry *finish,
diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index bd7aff5c51f7..cd768dafca9e 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -10,8 +10,6 @@
 
 #define pr_fmt(fmt) "mmiotrace: " fmt
 
-#define DEBUG 1
-
 #include <linux/moduleparam.h>
 #include <linux/debugfs.h>
 #include <linux/slab.h>
-- 
2.27.0
