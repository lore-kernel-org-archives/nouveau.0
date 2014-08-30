From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nvamemtiming: Make deep mode take range
	into account and treat range end as included
Date: Sat, 30 Aug 2014 19:05:18 +0200
Message-ID: <1409418318-31648-3-git-send-email-titan.costa@gmail.com>
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

---
 nva/set_timings.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/nva/set_timings.c b/nva/set_timings.c
index 7376486..6cd831c 100644
--- a/nva/set_timings.c
+++ b/nva/set_timings.c
@@ -448,14 +448,14 @@ deep_dump(struct nvamemtiming_conf *conf)
 	if (conf->range.start == (unsigned char) -1)
 		conf->range.start = 0;
 	if (conf->range.end == (unsigned char) -1)
-		conf->range.end = conf->vbios.timing_entry_length;
+		conf->range.end = conf->vbios.timing_entry_length - 1;
 
 	fprintf(stderr, "Deep mode: Will iterate between %i and %i\n", conf->range.start, conf->range.end);
 
 	launch(conf, outf, 0, NO_COLOR);
 
 	/* iterate through the vbios timing values */
-	for (i = 0; i < conf->vbios.timing_entry_length; i++) {
+	for (i = conf->range.start; i <= conf->range.end; i++) {
 		uint8_t orig = conf->vbios.data[conf->vbios.timing_entry_offset + i];
 
 		if (timing_value_types[i] == VALUE ||
@@ -506,14 +506,14 @@ shallow_dump(struct nvamemtiming_conf *conf)
 	if (conf->range.start == (unsigned char) -1)
 		conf->range.start = 0;
 	if (conf->range.end == (unsigned char) -1)
-		conf->range.end = conf->vbios.timing_entry_length;
+		conf->range.end = conf->vbios.timing_entry_length - 1;
 
 	fprintf(stderr, "Shallow mode: Will iterate between %i and %i\n", conf->range.start, conf->range.end);
 
 	launch(conf, outf, 0, NO_COLOR);
 
 	/* iterate through the vbios timing values */
-	for (i = conf->range.start; i < conf->range.end; i++) {
+	for (i = conf->range.start; i <= conf->range.end; i++) {
 		uint8_t orig = conf->vbios.data[conf->vbios.timing_entry_offset + i];
 
 		if (timing_value_types[i] == VALUE ||
-- 
1.9.1
