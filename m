From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nvbios: Write missing null terminating
	byte.
Date: Mon, 25 Aug 2014 20:58:14 +0200
Message-ID: <1408993096-18883-5-git-send-email-titan.costa@gmail.com>
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
 nvbios/nvbios.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/nvbios/nvbios.c b/nvbios/nvbios.c
index 4fc667b..7bb768a 100644
--- a/nvbios/nvbios.c
+++ b/nvbios/nvbios.c
@@ -797,9 +797,9 @@ void find_strap(char *filename) {
 
 	path = (char*) malloc(base_length + strlen(strap_filename)+1);
 	strncpy(path, filename, base_length);
-	strncpy(path+base_length, strap_filename, strlen(strap_filename));
+	strncpy(path+base_length, strap_filename, strlen(strap_filename)+1);
 
-	if(!set_strap_from_file(path))
+	if (!set_strap_from_file(path))
 		printf("Strap register found in '%s'\n", path);
 
 	free(path);
-- 
1.9.1
