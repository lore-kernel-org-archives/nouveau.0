From: trix@redhat.com
Subject: [PATCH] tracing: remove definition of DEBUG
Date: Fri, 15 Jan 2021 07:33:48 -0800
Message-ID: <20210115153348.131791-1-trix@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: rostedt@goodmis.org, mingo@kernel.org, karolherbst@gmail.com, ppaalanen@gmail.com
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Tom Rix <trix@redhat.com>
List-Id: nouveau.vger.kernel.org

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 kernel/trace/trace_mmiotrace.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index 84582bf1ed5f..2c3c31791497 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2008 Pekka Paalanen <pq@iki.fi>
  */
 
-#define DEBUG 1
-
 #include <linux/kernel.h>
 #include <linux/mmiotrace.h>
 #include <linux/pci.h>
-- 
2.27.0
