From: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH i-g-t 1/2] tests/kms_pipe_crc_basic: Use
 igt_display_require_output_on_pipe()
Date: Tue, 17 Mar 2020 20:49:13 -0400
Message-ID: <20200318004914.236815-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 tests/kms_pipe_crc_basic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d169b7bd..f121e27e 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -65,15 +65,14 @@ static void test_bad_source(data_t *data)
 static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
+	igt_output_t *output;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t *crcs = NULL;
 	int c, j;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
-	igt_require_f(output, "No connector found for pipe %s\n",
-		      kmstest_pipe_name(pipe));
+	igt_display_require_output_on_pipe(display, pipe);
+	output = igt_get_single_output_for_pipe(display, pipe);
 
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
-- 
2.24.1
