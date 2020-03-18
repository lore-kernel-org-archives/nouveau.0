From: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH i-g-t 2/4] lib/igt_debugfs: Add
 igt_debugfs_pipe_dir()
Date: Tue, 17 Mar 2020 21:00:45 -0400
Message-ID: <20200318010047.237024-3-lyude@redhat.com>
References: <20200318010047.237024-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200318010047.237024-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

Like igt_debugfs_connector_dir(), but for pipes instead.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 lib/igt_debugfs.c | 29 +++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index bf6be552..3c3b11e1 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -260,6 +260,35 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_pipe_dir:
+ * @device: fd of the device
+ * @pipe: index of pipe
+ * @mode: mode bits as used by open()
+ *
+ * This opens the debugfs directory corresponding to the pipe index on the
+ * device for use with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_pipe_dir(int device, int pipe, int mode)
+{
+	char buf[128];
+	int dir, ret;
+
+	dir = igt_debugfs_dir(device);
+	if (dir < 0)
+		return dir;
+
+	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
+	ret = openat(dir, buf, mode);
+
+	close(dir);
+
+	return ret;
+}
+
 /**
  * igt_debugfs_open:
  * @filename: name of the debugfs node to open
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 7d1a6175..15741a40 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -36,6 +36,7 @@ char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
 int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
-- 
2.24.1
