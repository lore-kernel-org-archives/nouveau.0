From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nouveau: add a nouveau_compiler binary to
	compile TGSI into shader ISA
Date: Fri, 21 Feb 2014 01:18:25 -0500
Message-ID: <1392963505-5230-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This makes it easy to compare output between different cards, especially
for ones that you don't have (and/or not in the current machine).

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

This currently only works for nv50+, but it'd probably be possible to split
the code paths and introduce nv30/40 support.

 src/gallium/drivers/nouveau/.gitignore         |   1 +
 src/gallium/drivers/nouveau/Makefile.am        |  12 +++
 src/gallium/drivers/nouveau/nouveau_compiler.c | 133 +++++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 src/gallium/drivers/nouveau/.gitignore
 create mode 100644 src/gallium/drivers/nouveau/nouveau_compiler.c

diff --git a/src/gallium/drivers/nouveau/.gitignore b/src/gallium/drivers/nouveau/.gitignore
new file mode 100644
index 0000000..829f951
--- /dev/null
+++ b/src/gallium/drivers/nouveau/.gitignore
@@ -0,0 +1 @@
+nouveau_compiler
diff --git a/src/gallium/drivers/nouveau/Makefile.am b/src/gallium/drivers/nouveau/Makefile.am
index 7c05223..ac4f9bb 100644
--- a/src/gallium/drivers/nouveau/Makefile.am
+++ b/src/gallium/drivers/nouveau/Makefile.am
@@ -39,3 +39,15 @@ libnouveau_la_SOURCES = \
 	$(NV50_C_SOURCES) \
 	$(NVC0_CODEGEN_SOURCES) \
 	$(NVC0_C_SOURCES)
+
+noinst_PROGRAMS = nouveau_compiler
+
+nouveau_compiler_SOURCES = \
+	nouveau_compiler.c
+
+nouveau_compiler_LDADD = \
+	libnouveau.la \
+	../../auxiliary/libgallium.la \
+	-lstdc++ \
+	-lm \
+	-ldl
diff --git a/src/gallium/drivers/nouveau/nouveau_compiler.c b/src/gallium/drivers/nouveau/nouveau_compiler.c
new file mode 100644
index 0000000..01d6b14
--- /dev/null
+++ b/src/gallium/drivers/nouveau/nouveau_compiler.c
@@ -0,0 +1,133 @@
+/*
+ * Copyright 2014 Ilia Mirkin
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <errno.h>
+
+#include "tgsi/tgsi_text.h"
+#include "util/u_debug.h"
+
+#include "codegen/nv50_ir_driver.h"
+#include "nv50/nv50_context.h"
+
+static int
+dummy_assign_slots(struct nv50_ir_prog_info *info)
+{
+   return 0;
+}
+
+int
+main(int argc, char *argv[])
+{
+   struct tgsi_token tokens[1024];
+   struct nv50_ir_prog_info info = {0};
+   int i, chipset = 0, type = -1;
+   const char *filename = NULL;
+   FILE *f;
+   char text[65536] = {0};
+
+   for (i = 1; i < argc; i++) {
+      if (!strcmp(argv[i], "-a"))
+         chipset = strtol(argv[++i], NULL, 16);
+      else
+         filename = argv[i];
+   }
+
+   if (!chipset) {
+      _debug_printf("Must specify a chipset (-a)\n");
+      return 1;
+   }
+
+   if (!filename) {
+      _debug_printf("Must specify a filename\n");
+      return 1;
+   }
+
+   if (!strcmp(filename, "-"))
+      f = stdin;
+   else
+      f = fopen(filename, "r");
+
+   if (f == NULL) {
+      _debug_printf("Error opening file '%s': %s\n", filename, strerror(errno));
+      return 1;
+   }
+
+   fread(text, 1, sizeof(text), f);
+   if (ferror(f)) {
+      _debug_printf("Error reading file '%s'\n", filename);
+      return 1;
+   }
+   fclose(f);
+
+   _debug_printf("Compiling for NV%X\n", chipset);
+
+   if (!strncmp(text, "FRAG", 4))
+      type = PIPE_SHADER_FRAGMENT;
+   else if (!strncmp(text, "VERT", 4))
+      type = PIPE_SHADER_VERTEX;
+   else if (!strncmp(text, "GEOM", 4))
+      type = PIPE_SHADER_GEOMETRY;
+   else if (!strncmp(text, "COMP", 4))
+      type = PIPE_SHADER_COMPUTE;
+   else {
+      _debug_printf("Unrecognized TGSI header\n");
+      return 1;
+   }
+
+   if (!tgsi_text_translate(text, tokens, Elements(tokens)))
+      return 1;
+
+   info.type = type;
+   info.target = chipset;
+   info.bin.sourceRep = NV50_PROGRAM_IR_TGSI;
+   info.bin.source = tokens;
+
+   info.io.ucpCBSlot = 15;
+   info.io.ucpBase = NV50_CB_AUX_UCP_OFFSET;
+
+   info.io.resInfoCBSlot = 15;
+   info.io.suInfoBase = NV50_CB_AUX_TEX_MS_OFFSET;
+   info.io.msInfoCBSlot = 15;
+   info.io.msInfoBase = NV50_CB_AUX_MS_OFFSET;
+
+   info.assignSlots = dummy_assign_slots;
+
+   info.optLevel = debug_get_num_option("NV50_PROG_OPTIMIZE", 3);
+   info.dbgFlags = debug_get_num_option("NV50_PROG_DEBUG", 0);
+
+   i = nv50_ir_generate_code(&info);
+   if (i) {
+      _debug_printf("Error compiling program: %d\n", i);
+      return i;
+   }
+
+   _debug_printf("program binary (%d bytes)\n", info.bin.codeSize);
+   for (i = 0; i < info.bin.codeSize; i += 4) {
+      printf("%08x ", info.bin.code[i / 4]);
+      if (i % (8 * 4) == (7 * 4))
+         printf("\n");
+   }
+   if (i % (8 * 4) != 0)
+      printf("\n");
+
+   return 0;
+}
-- 
1.8.3.2
