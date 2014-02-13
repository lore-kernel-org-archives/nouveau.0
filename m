From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50: mark scissors/viewports dirty on context
	switch
Date: Thu, 13 Feb 2014 02:33:37 -0500
Message-ID: <1392276817-19449-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>, mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Commit 246ca4b001 ("nv50: implement multiple viewports/scissors, enable
ARB_viewport_array") added dirty tracking to scissors/viewports. However
it neglected to mark them all as dirty on a context switch. This fixes
an apparent regression in webgl in chrome, but probably in any
application that switches contexts.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

I'm probably going to push this out very shortly, as it is unlikely to be
reviewed quickly and this is an annoying regression, but sending out to list
so that I can make any necessary follow-up fixes, should review comments
arrive.

 src/gallium/drivers/nouveau/nv50/nv50_state_validate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index dfce193..f953422 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -366,6 +366,8 @@ nv50_switch_pipe_context(struct nv50_context *ctx_to)
       ctx_to->state = ctx_from->state;
 
    ctx_to->dirty = ~0;
+   ctx_to->viewports_dirty = ~0;
+   ctx_to->scissors_dirty = ~0;
 
    if (!ctx_to->vertex)
       ctx_to->dirty &= ~(NV50_NEW_VERTEX | NV50_NEW_ARRAYS);
-- 
1.8.3.2
