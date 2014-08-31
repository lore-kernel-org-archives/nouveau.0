From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nvamemtiming: Handle target < initial
	case when iterating values
Date: Sun, 31 Aug 2014 15:00:42 +0200
Message-ID: <1409490042-8725-4-git-send-email-titan.costa@gmail.com>
References: <1409490042-8725-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409490042-8725-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Otherwise some values are not tested at all.
---
 nva/set_timings.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/nva/set_timings.c b/nva/set_timings.c
index 6cd831c..7a8f845 100644
--- a/nva/set_timings.c
+++ b/nva/set_timings.c
@@ -408,7 +408,7 @@ static void
 iterate_values(struct nvamemtiming_conf *conf, FILE *outf, uint8_t index, enum color color)
 {
 	uint8_t initial, target;
-	int v;
+	int v, incr;
 
 	if (conf->mode != MODE_DEEP)
 		return;
@@ -416,7 +416,8 @@ iterate_values(struct nvamemtiming_conf *conf, FILE *outf, uint8_t index, enum c
 	initial = conf->vbios.data[conf->vbios.timing_entry_offset + index];
 	target = conf->vbios.data[conf->deep.timing_entry_offset + index];
 
-	for (v = initial+1; v <= target; v++) {
+	incr = target > initial ? 1 : -1;
+	for (v = initial+incr; v != target+incr; v+=incr) {
 		conf->vbios.data[conf->vbios.timing_entry_offset + index] = v;
 		launch(conf, outf, index + 1 , COLOR);
 	}
-- 
1.9.1
