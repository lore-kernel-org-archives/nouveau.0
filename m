From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH envytools] nva: Add nvaforcetemp to git ignore and
	sort it for better update
Date: Sun, 31 Aug 2014 15:00:40 +0200
Message-ID: <1409490042-8725-2-git-send-email-titan.costa@gmail.com>
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
 nva/.gitignore | 53 +++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/nva/.gitignore b/nva/.gitignore
index 5c9184b..72de056 100644
--- a/nva/.gitignore
+++ b/nva/.gitignore
@@ -1,39 +1,40 @@
+evotiming
+libnva.a
+libnva.so
+nv01dump
+nv01post
+nvacounter
+nvadownload
+nvaevo
+nvafakebios
 nvafill
+nvaforcetemp
+nvafucstart
+nvafuzz
+nvagetbios
+nvagetpmu
 nvahammer
 nvalist
+nvamemtiming
+nvammiotracereplay
 nvapeek
+nvapeeki
 nvapeekstat
+nvapms
 nvapoke
-nvapeeki
-nvagetbios
-nvafakebios
+nvapy.c
+nvapy.so
 nvascan
+nvaspyi2c
+nvastrscan
 nvatiming
-nvapms
-nvafuzz
+nvaupload
+nvavucstart
 nvawatch
-nvacounter
-nvastrscan
-nvaevo
-nvaxttime
-nvaxtstart
+nvaxtinsn
 nvaxtpeek
 nvaxtpoke
 nvaxtrsr
 nvaxtssr
-nvaxtinsn
-nvaupload
-nvadownload
-evotiming
-nvavucstart
-nvafucstart
-nvamemtiming
-nv01post
-nv01dump
-nvammiotracereplay
-nvaspyi2c
-libnva.a
-libnva.so
-nvapy.c
-nvapy.so
-nvagetpmu
+nvaxtstart
+nvaxttime
-- 
1.9.1
