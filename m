From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] Don't try to use bios->parts if NULL
	(parse_pcir function has probably failed).
Date: Wed, 27 Aug 2014 08:24:22 +0200
Message-ID: <1409120662-6412-2-git-send-email-titan.costa@gmail.com>
References: <1409120662-6412-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409120662-6412-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 nvbios/info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/nvbios/info.c b/nvbios/info.c
index 87a33d8..acc40d8 100644
--- a/nvbios/info.c
+++ b/nvbios/info.c
@@ -119,6 +119,10 @@ int envy_bios_parse_bit_i (struct envy_bios *bios, struct envy_bios_bit_entry *b
 			bios->chipset_name = "G72";
 			break;
 		case 0x0573:
+			if (!bios->parts) {
+				ENVY_BIOS_ERR("Failed to detect board (bios->parts is NULL, parse_pcir function has probably failed)\n");
+				break;
+			}
 			/* yeah, ain't this one hilarious... */
 			if ((bios->parts[0].pcir_device & 0xfff0) == 0x7e0) {
 				bios->chipset = 0x63;
-- 
1.9.1
