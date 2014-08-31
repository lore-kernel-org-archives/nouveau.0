From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nvamemtiming: Update usage.
Date: Sun, 31 Aug 2014 15:00:41 +0200
Message-ID: <1409490042-8725-3-git-send-email-titan.costa@gmail.com>
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

---
 nva/nvamemtiming.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/nva/nvamemtiming.c b/nva/nvamemtiming.c
index 4468f81..75c6e49 100644
--- a/nva/nvamemtiming.c
+++ b/nva/nvamemtiming.c
@@ -51,6 +51,8 @@ void usage(int argc, char **argv)
 	fprintf(stderr, "\t-e: Only modify the specified index (to be used with -v)\n");
 	fprintf(stderr, "\t-v: Set the specified value to the specified entry\n");
 	fprintf(stderr, "\t-b index: Consider the specified index as a bitfield and RE it\n");
+	fprintf(stderr, "\t-s index: Specify range start in timing entry (Deep & Shallow modes)\n");
+	fprintf(stderr, "\t-f index: Specify range end in timing entry (Deep & Shallow modes)\n");
 	fprintf(stderr, "\t-d timing_entry_high: For each indexes, iterate between the timing_entry and the timing_entry_high value (Deep mode)\n");
 	exit(-1);
 }
-- 
1.9.1
