From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nvbios: Return an error if mem train
	subentries is above the limit to avoid stack corruption.
Date: Mon, 25 Aug 2014 20:58:13 +0200
Message-ID: <1408993096-18883-4-git-send-email-titan.costa@gmail.com>
References: <1408993096-18883-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408993096-18883-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

---
 nvbios/mem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/nvbios/mem.c b/nvbios/mem.c
index 911ce5c..2c8a929 100644
--- a/nvbios/mem.c
+++ b/nvbios/mem.c
@@ -111,6 +111,10 @@ envy_bios_parse_mem_train (struct envy_bios *bios) {
 		struct envy_bios_mem_train_entry *entry = &mt->entries[i];
 		entry->offset = mt->offset + mt->hlen + ((mt->rlen + mt->subentries * mt->subentrylen) * i);
 		err |= bios_u8(bios, entry->offset, &entry->u00);
+		if (mt->subentries > sizeof(entry->subentry)) {
+			ENVY_BIOS_ERR("Error when parsing mem train: subentries = %d > %lu\n", mt->subentries, sizeof(entry->subentry));
+			return -EFAULT;
+		}
 		int j;
 		for (j = 0; j < mt->subentries; j++) {
 			err |= bios_u8(bios, entry->offset+j+1, &entry->subentry[j]);
-- 
1.9.1
