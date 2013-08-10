From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/4] nouveau: set buffer format of video buffer
Date: Sat, 10 Aug 2013 06:39:56 -0400
Message-ID: <1376131198-3506-2-git-send-email-imirkin@alum.mit.edu>
References: <1376131198-3506-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1376131198-3506-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

I don't think anything looks at this right now, but seems good to store. (Also
ran into it with my vdpau attempt.)

 src/gallium/drivers/nouveau/nouveau_video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/gallium/drivers/nouveau/nouveau_video.c b/src/gallium/drivers/nouveau/nouveau_video.c
index 9357508..2e7f9b1 100644
--- a/src/gallium/drivers/nouveau/nouveau_video.c
+++ b/src/gallium/drivers/nouveau/nouveau_video.c
@@ -810,6 +810,7 @@ nouveau_video_buffer_create(struct pipe_context *pipe,
    buffer->base.get_sampler_view_components = nouveau_video_buffer_sampler_view_components;
    buffer->base.get_surfaces = nouveau_video_buffer_surfaces;
    buffer->base.chroma_format = templat->chroma_format;
+   buffer->base.buffer_format = templat->buffer_format;
    buffer->base.width = width;
    buffer->base.height = height;
    buffer->num_planes = 2;
-- 
1.8.1.5
