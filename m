From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nvbios: Truncate nb of entries to avoid
	displaying garbage
Date: Sat, 30 Aug 2014 19:05:17 +0200
Message-ID: <1409418318-31648-2-git-send-email-titan.costa@gmail.com>
References: <1409418318-31648-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409418318-31648-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

We return an error but this does not prevent the display so just make sure only valid data are printed.
---
 nvbios/mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nvbios/mem.c b/nvbios/mem.c
index e4797e3..00f5cd5 100644
--- a/nvbios/mem.c
+++ b/nvbios/mem.c
@@ -112,6 +112,7 @@ envy_bios_parse_mem_train (struct envy_bios *bios) {
 		entry->offset = mt->offset + mt->hlen + ((mt->rlen + mt->subentries * mt->subentrylen) * i);
 		err |= bios_u8(bios, entry->offset, &entry->u00);
 		if (mt->subentries > sizeof(entry->subentry)) {
+			mt->subentries = sizeof(entry->subentry);
 			ENVY_BIOS_ERR("Error when parsing mem train: subentries = %d > %lu\n", mt->subentries, sizeof(entry->subentry));
 			return -EFAULT;
 		}
-- 
1.9.1
