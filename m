From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 1/5] nvc0: make sure that the local memory
	allocation is aligned to 0x10
Date: Fri, 18 Jul 2014 09:57:25 -0400
Message-ID: <1405691849-18853-2-git-send-email-imirkin@alum.mit.edu>
References: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: mesa-stable@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: <mesa-stable@lists.freedesktop.org>
---

Was getting weird shader errors in dmat4*dmat4 which spilled one double-wide
register (i.e. size 8). envytools docs apparently list this as having to be
aligned to 0x10, and this indeed fixes it.

 src/gallium/drivers/nouveau/nvc0/nvc0_program.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
index 1c82a9a..c624e21 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
@@ -626,7 +626,7 @@ nvc0_program_translate(struct nvc0_program *prog, uint16_t chipset)
    if (info->bin.tlsSpace) {
       assert(info->bin.tlsSpace < (1 << 24));
       prog->hdr[0] |= 1 << 26;
-      prog->hdr[1] |= info->bin.tlsSpace; /* l[] size */
+      prog->hdr[1] |= align(info->bin.tlsSpace, 0x10); /* l[] size */
       prog->need_tls = TRUE;
    }
    /* TODO: factor 2 only needed where joinat/precont is used,
-- 
1.8.5.5
