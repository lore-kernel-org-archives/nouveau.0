From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] x86: mmiotrace: Use cpumask_available for cpumask_var_t variables
Date: Wed,  8 Apr 2020 13:53:23 -0700
Message-ID: <20200408205323.44490-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>
Cc: Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>
List-Id: nouveau.vger.kernel.org

When building with Clang + -Wtautological-compare and
CONFIG_CPUMASK_OFFSTACK unset:

arch/x86/mm/mmio-mod.c:375:6: warning: comparison of array 'downed_cpus'
equal to a null pointer is always false [-Wtautological-pointer-compare]
        if (downed_cpus == NULL &&
            ^~~~~~~~~~~    ~~~~
arch/x86/mm/mmio-mod.c:405:6: warning: comparison of array 'downed_cpus'
equal to a null pointer is always false [-Wtautological-pointer-compare]
        if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
            ^~~~~~~~~~~    ~~~~
2 warnings generated.

Commit f7e30f01a9e2 ("cpumask: Add helper cpumask_available()") added
cpumask_available to fix warnings of this nature. Use that here so that
clang does not warn regardless of CONFIG_CPUMASK_OFFSTACK's value.

Link: https://github.com/ClangBuiltLinux/linux/issues/982
Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/x86/mm/mmio-mod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index 109325d77b3e..43fd19b3f118 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -372,7 +372,7 @@ static void enter_uniprocessor(void)
 	int cpu;
 	int err;
 
-	if (downed_cpus == NULL &&
+	if (!cpumask_available(downed_cpus) &&
 	    !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
 		pr_notice("Failed to allocate mask\n");
 		goto out;
@@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
 	int cpu;
 	int err;
 
-	if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
+	if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
 		return;
 	pr_notice("Re-enabling CPUs...\n");
 	for_each_cpu(cpu, downed_cpus) {

base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
-- 
2.26.0
