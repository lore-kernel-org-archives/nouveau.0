From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14010] TNT2 generate too much noise in logs
Date: Thu, 10 Jan 2008 17:49:06 -0800 (PST)
Message-ID: <20080111014906.29C61130009@annarchy.freedesktop.org>
References: <bug-14010-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14010-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=14010





------- Comment #4 from randrik-JGs/UdohzUI@public.gmane.org  2008-01-10 17:49 PST -------
simple fix from Ben Skeggs, works really well:

diff --git a/shared-core/nv04_graph.c b/shared-core/nv04_graph.c
index 81a6d5c..50ecc74 100644
--- a/shared-core/nv04_graph.c
+++ b/shared-core/nv04_graph.c
@@ -497,7 +497,8 @@ int nv04_graph_init(struct drm_device *d
        /*haiku same*/

        /*NV_WRITE(NV04_PGRAPH_DEBUG_3, 0xfad4ff31);*/
-       NV_WRITE(NV04_PGRAPH_DEBUG_3, 0x10d4ff31);
+       // NV_WRITE(NV04_PGRAPH_DEBUG_3, 0x10d4ff31);
+       NV_WRITE(NV04_PGRAPH_DEBUG_3, 0xf0d4ff31); 
        /*haiku and blob 10d4*/


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
