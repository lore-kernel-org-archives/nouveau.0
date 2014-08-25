From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nvbios: Check if HWEA entry length ==
	-1.
Date: Mon, 25 Aug 2014 20:58:15 +0200
Message-ID: <1408993096-18883-6-git-send-email-titan.costa@gmail.com>
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
 nvbios/bios.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/nvbios/bios.c b/nvbios/bios.c
index fac3840..ca8c54e 100644
--- a/nvbios/bios.c
+++ b/nvbios/bios.c
@@ -276,9 +276,14 @@ int envy_bios_parse (struct envy_bios *bios) {
 					pos += 4;
 					if (entry.type > 1)
 						ENVY_BIOS_WARN("Unknown HWEA entry type %d\n", entry.type);
+					if (entry.len == (uint32_t)-1) {
+						/* Maybe this should be treated as for length == 0 */
+						ENVY_BIOS_ERR("Invalid HWEA entry length %d\n", entry.len);
+						break;
+					}
 				} else {
 					entry.base = word & 0x1fffffc;
-					entry.type = word&3;
+					entry.type = word & 3;
 					switch (entry.type) {
 						case 0:
 						case 1:
-- 
1.9.1
