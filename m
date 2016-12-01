From: David Howells <dhowells@redhat.com>
Subject: [PATCH 02/39] Annotate hardware config module parameters in
 arch/x86/mm/
Date: Thu, 01 Dec 2016 12:29:54 +0000
Message-ID: <148059539475.31612.10627688627153687405.stgit@warthog.procyon.org.uk>
References: <148059537897.31612.9461043954611464597.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <148059537897.31612.9461043954611464597.stgit@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gnomes@lxorguk.ukuu.org.uk, minyard@acm.org, nouveau@lists.freedesktop.org, x86@kernel.org, Steven Rostedt <rostedt@goodmis.org>, dhowells@redhat.com, linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
List-Id: nouveau.vger.kernel.org

When the kernel is running in secure boot mode, we lock down the kernel to
prevent userspace from modifying the running kernel image.  Whilst this
includes prohibiting access to things like /dev/mem, it must also prevent
access by means of configuring driver modules in such a way as to cause a
device to access or modify the kernel image.

To this end, annotate module_param* statements that refer to hardware
configuration and indicate for future reference what type of parameter they
specify.  The parameter parser in the core sees this information and can
skip such parameters with an error message if the kernel is locked down.
The module initialisation then runs as normal, but just sees whatever the
default values for those parameters is.

Note that we do still need to do the module initialisation because some
drivers have viable defaults set in case parameters aren't specified and
some drivers support automatic configuration (e.g. PNP or PCI) in addition
to manually coded parameters.

This patch annotates drivers in arch/x86/mm/.

Suggested-by: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steven Rostedt <rostedt@goodmis.org>
cc: Ingo Molnar <mingo@kernel.org>
cc: Thomas Gleixner <tglx@linutronix.de>
cc: "H. Peter Anvin" <hpa@zytor.com>
cc: x86@kernel.org
cc: linux-kernel@vger.kernel.org
cc: nouveau@lists.freedesktop.org
---

 arch/x86/mm/testmmiotrace.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
index 38868adf07ea..f6ae6830b341 100644
--- a/arch/x86/mm/testmmiotrace.c
+++ b/arch/x86/mm/testmmiotrace.c
@@ -9,7 +9,7 @@
 #include <linux/mmiotrace.h>
 
 static unsigned long mmio_address;
-module_param(mmio_address, ulong, 0);
+module_param_hw(mmio_address, ulong, iomem, 0);
 MODULE_PARM_DESC(mmio_address, " Start address of the mapping of 16 kB "
 				"(or 8 MB if read_far is non-zero).");
 
