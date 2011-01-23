From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: kill tasks causing the GPU to raise
	errors
Date: Sun, 23 Jan 2011 22:39:32 +0100
Message-ID: <20110123213932.GA3027@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Send SIGBUS (and then SIGKILL) to tasks trying to use channels,
for which hardware raised fatal errors.

As we cannot kill tasks immediately from ISR, mark channels as broken
and send signals to processes when they first try to use them.

Previous behaviour can be restored by appending "nouveau.error_action=0"
to kernel command line.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c  |   23 ++++++
 drivers/gpu/drm/nouveau/nouveau_drv.c      |    7 ++
 drivers/gpu/drm/nouveau/nouveau_drv.h      |   16 ++++
 drivers/gpu/drm/nouveau/nouveau_gem.c      |    4 +
 drivers/gpu/drm/nouveau/nouveau_irq.c      |  111 ++++++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_notifier.c |    2 +
 drivers/gpu/drm/nouveau/nouveau_object.c   |    2 +
 drivers/gpu/drm/nouveau/nv50_fb.c          |   17 ++--
 8 files changed, 152 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 373950e..cc6dfe4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -231,6 +231,9 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 
 	nouveau_debugfs_channel_init(chan);
 
+	chan->state = NV_CHANNEL_OK;
+	chan->error_action = nouveau_default_channel_error_action;
+
 	NV_INFO(dev, "%s: initialised FIFO %d\n", __func__, channel);
 	*chan_ret = chan;
 	return 0;
@@ -416,6 +419,26 @@ nouveau_ioctl_fifo_free(struct drm_device *dev, void *data,
 	return 0;
 }
 
+int nouveau_handle_state(struct nouveau_channel *chan)
+{
+	if (chan->state == NV_CHANNEL_KILLED)
+		return -EBADFD;
+
+	if (chan->state == NV_CHANNEL_BUS) {
+		NV_INFO(chan->dev, "sending SIGBUS to task %d \"%s\"\n",
+					task_pid_nr(current), current->comm);
+		kill_pid(task_pid(current), SIGBUS, 0);
+		chan->state = NV_CHANNEL_KILL;
+	} else if (chan->state == NV_CHANNEL_KILL) {
+		NV_INFO(chan->dev, "sending SIGKILL to task %d \"%s\"\n",
+					task_pid_nr(current), current->comm);
+		kill_pid(task_pid(current), SIGKILL, 0);
+		chan->state = NV_CHANNEL_KILLED;
+	}
+
+	return -EBADFD;
+}
+
 /***********************************
  * finally, the ioctl table
  ***********************************/
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 9087549..3463780 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -115,6 +115,13 @@ MODULE_PARM_DESC(perflvl_wr, "Allow perflvl changes (warning: dangerous!)\n");
 int nouveau_perflvl_wr;
 module_param_named(perflvl_wr, nouveau_perflvl_wr, int, 0400);
 
+MODULE_PARM_DESC(error_action, "Default action on error:\n"
+		"\t\t0 - do nothing\n"
+		"\t\t1 - kill process owning the offending channel (default)");
+int nouveau_default_channel_error_action = NV_KILL_PROCESS;
+module_param_named(error_action, nouveau_default_channel_error_action,
+					int, 0400);
+
 int nouveau_fbpercrtc;
 #if 0
 module_param_named(fbpercrtc, nouveau_fbpercrtc, int, 0400);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 1c7db64..70a320d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -166,6 +166,13 @@ struct nouveau_channel {
 	struct drm_device *dev;
 	int id;
 
+	enum nouveau_channel_state {
+		NV_CHANNEL_OK = 0,
+		NV_CHANNEL_BUS = 1,
+		NV_CHANNEL_KILL = 2,
+		NV_CHANNEL_KILLED = 3,
+	} state;
+
 	/* owner of this fifo */
 	struct drm_file *file_priv;
 	/* mapping of the fifo itself */
@@ -248,6 +255,11 @@ struct nouveau_channel {
 		char name[32];
 		struct drm_info_list info;
 	} debugfs;
+
+	enum nouveau_channel_error_action {
+		NV_DO_NOTHING = 0,
+		NV_KILL_PROCESS = 1,
+	} error_action;
 };
 
 struct nouveau_instmem_engine {
@@ -740,6 +752,7 @@ extern int nouveau_fbpercrtc;
 extern int nouveau_tv_disable;
 extern char *nouveau_tv_norm;
 extern int nouveau_reg_debug;
+extern int nouveau_default_channel_error_action;
 extern char *nouveau_vbios;
 extern int nouveau_ignorelid;
 extern int nouveau_nofbaccel;
@@ -810,6 +823,7 @@ extern int  nouveau_channel_alloc(struct drm_device *dev,
 				  struct drm_file *file_priv,
 				  uint32_t fb_ctxdma, uint32_t tt_ctxdma);
 extern void nouveau_channel_free(struct nouveau_channel *);
+extern int nouveau_handle_state(struct nouveau_channel *chan);
 
 /* nouveau_object.c */
 extern int  nouveau_gpuobj_early_init(struct drm_device *);
@@ -850,6 +864,8 @@ extern irqreturn_t nouveau_irq_handler(DRM_IRQ_ARGS);
 extern void        nouveau_irq_preinstall(struct drm_device *);
 extern int         nouveau_irq_postinstall(struct drm_device *);
 extern void        nouveau_irq_uninstall(struct drm_device *);
+extern void        nouveau_broken_channel(struct nouveau_channel *chan);
+extern void        nouveau_broken_channel_id(struct drm_device *dev, int chid);
 
 /* nouveau_sgdma.c */
 extern int nouveau_sgdma_init(struct drm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 2e21412..36ecbb7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -149,6 +149,8 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 	if (req->channel_hint) {
 		NOUVEAU_GET_USER_CHANNEL_WITH_RETURN(req->channel_hint,
 						     file_priv, chan);
+		if (unlikely(chan->state != NV_CHANNEL_OK))
+			return nouveau_handle_state(chan);
 	}
 
 	if (req->info.domain & NOUVEAU_GEM_DOMAIN_VRAM)
@@ -594,6 +596,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	int i, j, ret = 0, do_reloc = 0;
 
 	NOUVEAU_GET_USER_CHANNEL_WITH_RETURN(req->channel, file_priv, chan);
+	if (unlikely(chan->state != NV_CHANNEL_OK))
+		return nouveau_handle_state(chan);
 
 	req->vram_available = dev_priv->fb_aper_free;
 	req->gart_available = dev_priv->gart_info.aper_free;
diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouveau/nouveau_irq.c
index 7bfd9e6..6544d9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_irq.c
+++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
@@ -140,6 +140,34 @@ nouveau_fifo_swmthd(struct nouveau_channel *chan, uint32_t addr, uint32_t data)
 	return true;
 }
 
+void nouveau_broken_channel(struct nouveau_channel *chan)
+{
+	if (!chan)
+		return;
+	if (chan->state != NV_CHANNEL_OK)
+		return;
+
+	if (chan->error_action == NV_KILL_PROCESS) {
+		NV_INFO(chan->dev, "scheduling kill on task accessing channel %d\n",
+				chan->id);
+		chan->state = NV_CHANNEL_BUS;
+	} else {
+		NV_DEBUG(chan->dev, "error condition on channel %d, but we are instructed to ignore it\n",
+				chan->id);
+	}
+}
+
+void nouveau_broken_channel_id(struct drm_device *dev, int chid)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_engine *engine = &dev_priv->engine;
+	struct nouveau_channel *chan;
+	if (chid < 0 || chid >= engine->fifo.channels)
+		return;
+	chan = dev_priv->fifos[chid];
+	nouveau_broken_channel(chan);
+}
+
 static void
 nouveau_fifo_irq_handler(struct drm_device *dev)
 {
@@ -189,6 +217,8 @@ nouveau_fifo_irq_handler(struct drm_device *dev)
 					     "Mthd 0x%04x Data 0x%08x\n",
 					chid, (mthd >> 13) & 7, mthd & 0x1ffc,
 					data);
+
+				nouveau_broken_channel(chan);
 			}
 
 			nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
@@ -251,6 +281,8 @@ nouveau_fifo_irq_handler(struct drm_device *dev)
 			nv_wr32(dev, 0x003220, 0x00000001);
 			nv_wr32(dev, 0x002100, NV_PFIFO_INTR_DMA_PUSHER);
 			status &= ~NV_PFIFO_INTR_DMA_PUSHER;
+
+			nouveau_broken_channel(chan);
 		}
 
 		if (status & NV_PFIFO_INTR_SEMAPHORE) {
@@ -281,6 +313,8 @@ nouveau_fifo_irq_handler(struct drm_device *dev)
 					status, chid);
 			nv_wr32(dev, NV03_PFIFO_INTR_0, status);
 			status = 0;
+
+			nouveau_broken_channel(chan);
 		}
 
 		nv_wr32(dev, NV03_PFIFO_CACHES, reassign);
@@ -551,8 +585,10 @@ nouveau_pgraph_intr_notify(struct drm_device *dev, uint32_t nsource)
 		unhandled = 1;
 	}
 
-	if (unhandled)
+	if (unhandled) {
 		nouveau_graph_dump_trap_info(dev, "PGRAPH_NOTIFY", &trap);
+		nouveau_broken_channel_id(dev, trap.channel);
+	}
 }
 
 
@@ -579,8 +615,11 @@ nouveau_pgraph_intr_error(struct drm_device *dev, uint32_t nsource)
 		unhandled = 1;
 	}
 
-	if (unhandled && nouveau_ratelimit())
-		nouveau_graph_dump_trap_info(dev, "PGRAPH_ERROR", &trap);
+	if (unhandled) {
+		if (nouveau_ratelimit())
+			nouveau_graph_dump_trap_info(dev, "PGRAPH_ERROR", &trap);
+		nouveau_broken_channel_id(dev, trap.channel);
+	}
 }
 
 static inline void
@@ -829,20 +868,24 @@ nv50_pgraph_trap_handler(struct drm_device *dev)
 			nv50_fb_vm_trap(dev, display, "PGRAPH_TRAP_DISPATCH_FAULT");
 			nv_wr32(dev, 0x400500, 0);
 			if (nv_rd32(dev, 0x400808) & 0x80000000) {
+				if (nouveau_graph_trapped_channel(dev, &trap.channel))
+					trap.channel = -1;
+				trap.class = nv_rd32(dev, 0x400814);
+				trap.mthd = nv_rd32(dev, 0x400808) & 0x1ffc;
+				trap.subc = (nv_rd32(dev, 0x400808) >> 16) & 0x7;
+				trap.data = nv_rd32(dev, 0x40080c);
+				trap.data2 = nv_rd32(dev, 0x400810);
+
 				if (display) {
-					if (nouveau_graph_trapped_channel(dev, &trap.channel))
-						trap.channel = -1;
-					trap.class = nv_rd32(dev, 0x400814);
-					trap.mthd = nv_rd32(dev, 0x400808) & 0x1ffc;
-					trap.subc = (nv_rd32(dev, 0x400808) >> 16) & 0x7;
-					trap.data = nv_rd32(dev, 0x40080c);
-					trap.data2 = nv_rd32(dev, 0x400810);
 					nouveau_graph_dump_trap_info(dev,
 							"PGRAPH_TRAP_DISPATCH_FAULT", &trap);
 					NV_INFO(dev, "PGRAPH_TRAP_DISPATCH_FAULT - 400808: %08x\n", nv_rd32(dev, 0x400808));
 					NV_INFO(dev, "PGRAPH_TRAP_DISPATCH_FAULT - 400848: %08x\n", nv_rd32(dev, 0x400848));
 				}
+
 				nv_wr32(dev, 0x400808, 0);
+
+				nouveau_broken_channel_id(dev, trap.channel);
 			} else if (display) {
 				NV_INFO(dev, "PGRAPH_TRAP_DISPATCH_FAULT - No stuck command?\n");
 			}
@@ -854,19 +897,23 @@ nv50_pgraph_trap_handler(struct drm_device *dev)
 			nv50_fb_vm_trap(dev, display, "PGRAPH_TRAP_DISPATCH_QUERY");
 			nv_wr32(dev, 0x400500, 0);
 			if (nv_rd32(dev, 0x40084c) & 0x80000000) {
+				if (nouveau_graph_trapped_channel(dev, &trap.channel))
+					trap.channel = -1;
+				trap.class = nv_rd32(dev, 0x400814);
+				trap.mthd = nv_rd32(dev, 0x40084c) & 0x1ffc;
+				trap.subc = (nv_rd32(dev, 0x40084c) >> 16) & 0x7;
+				trap.data = nv_rd32(dev, 0x40085c);
+				trap.data2 = 0;
+
 				if (display) {
-					if (nouveau_graph_trapped_channel(dev, &trap.channel))
-						trap.channel = -1;
-					trap.class = nv_rd32(dev, 0x400814);
-					trap.mthd = nv_rd32(dev, 0x40084c) & 0x1ffc;
-					trap.subc = (nv_rd32(dev, 0x40084c) >> 16) & 0x7;
-					trap.data = nv_rd32(dev, 0x40085c);
-					trap.data2 = 0;
 					nouveau_graph_dump_trap_info(dev,
 							"PGRAPH_TRAP_DISPATCH_QUERY", &trap);
 					NV_INFO(dev, "PGRAPH_TRAP_DISPATCH_QUERY - 40084c: %08x\n", nv_rd32(dev, 0x40084c));
 				}
+
 				nv_wr32(dev, 0x40084c, 0);
+
+				nouveau_broken_channel_id(dev, trap.channel);
 			} else if (display) {
 				NV_INFO(dev, "PGRAPH_TRAP_DISPATCH_QUERY - No stuck command?\n");
 			}
@@ -880,10 +927,13 @@ nv50_pgraph_trap_handler(struct drm_device *dev)
 	}
 
 	/* TRAPs other than dispatch use the "normal" trap regs. */
-	if (status && display) {
+	if (status) {
 		nouveau_graph_trap_info(dev, &trap);
-		nouveau_graph_dump_trap_info(dev,
-				"PGRAPH_TRAP", &trap);
+
+		if (display)
+			nouveau_graph_dump_trap_info(dev, "PGRAPH_TRAP", &trap);
+
+		nouveau_broken_channel_id(dev, trap.channel);
 	}
 
 	/* M2MF: Memory to memory copy engine. */
@@ -1063,6 +1113,8 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 						"PGRAPH_NOTIFY", &trap);
 			status &= ~0x00000001;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000001);
+
+			nouveau_broken_channel_id(dev, trap.channel);//?
 		}
 
 		/* COMPUTE_QUERY: Purpose and exact cause unknown, happens
@@ -1074,6 +1126,8 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 						"PGRAPH_COMPUTE_QUERY", &trap);
 			status &= ~0x00000002;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000002);
+
+			nouveau_broken_channel_id(dev, trap.channel);//?
 		}
 
 		/* Unknown, never seen: 0x4 */
@@ -1083,9 +1137,12 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 			nouveau_graph_trap_info(dev, &trap);
 			if (nouveau_pgraph_intr_swmthd(dev, &trap))
 				unhandled = 1;
-			if (unhandled && nouveau_ratelimit())
-				nouveau_graph_dump_trap_info(dev,
+			if (unhandled) {
+				if (nouveau_ratelimit())
+					nouveau_graph_dump_trap_info(dev,
 						"PGRAPH_ILLEGAL_MTHD", &trap);
+				nouveau_broken_channel_id(dev, trap.channel);
+			}
 			status &= ~0x00000010;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000010);
 		}
@@ -1098,6 +1155,8 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 						"PGRAPH_ILLEGAL_CLASS", &trap);
 			status &= ~0x00000020;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000020);
+
+			nouveau_broken_channel_id(dev, trap.channel);
 		}
 
 		/* DOUBLE_NOTIFY: You tried to set a NOTIFY on another NOTIFY. */
@@ -1108,6 +1167,8 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 						"PGRAPH_DOUBLE_NOTIFY", &trap);
 			status &= ~0x00000040;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000040);
+
+			nouveau_broken_channel_id(dev, trap.channel);//?
 		}
 
 		/* CONTEXT_SWITCH: PGRAPH needs us to load a new context */
@@ -1133,6 +1194,8 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 						"PGRAPH_BUFFER_NOTIFY", &trap);
 			status &= ~0x00010000;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00010000);
+
+			nouveau_broken_channel_id(dev, trap.channel);//?
 		}
 
 		/* DATA_ERROR: Invalid value for this method, or invalid
@@ -1149,6 +1212,8 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 			}
 			status &= ~0x00100000;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00100000);
+
+			nouveau_broken_channel_id(dev, trap.channel);
 		}
 
 		/* TRAP: Something bad happened in the middle of command
@@ -1171,6 +1236,8 @@ nv50_pgraph_irq_handler(struct drm_device *dev)
 						"PGRAPH_SINGLE_STEP", &trap);
 			status &= ~0x01000000;
 			nv_wr32(dev, NV03_PGRAPH_INTR, 0x01000000);
+
+			nouveau_broken_channel_id(dev, trap.channel);//?
 		}
 
 		/* 0x02000000 happens when you pause a ctxprog...
diff --git a/drivers/gpu/drm/nouveau/nouveau_notifier.c b/drivers/gpu/drm/nouveau/nouveau_notifier.c
index 2cc59f8..caafbef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_notifier.c
+++ b/drivers/gpu/drm/nouveau/nouveau_notifier.c
@@ -186,6 +186,8 @@ nouveau_ioctl_notifier_alloc(struct drm_device *dev, void *data,
 	int ret;
 
 	NOUVEAU_GET_USER_CHANNEL_WITH_RETURN(na->channel, file_priv, chan);
+	if (unlikely(chan->state != NV_CHANNEL_OK))
+		return nouveau_handle_state(chan);
 
 	ret = nouveau_notifier_alloc(chan, na->handle, na->size, &na->offset);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index dd572ad..704705e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -877,6 +877,8 @@ int nouveau_ioctl_grobj_alloc(struct drm_device *dev, void *data,
 	int ret;
 
 	NOUVEAU_GET_USER_CHANNEL_WITH_RETURN(init->channel, file_priv, chan);
+	if (unlikely(chan->state != NV_CHANNEL_OK))
+		return nouveau_handle_state(chan);
 
 	if (init->handle == ~0)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nv50_fb.c b/drivers/gpu/drm/nouveau/nv50_fb.c
index cd1988b..40a795d 100644
--- a/drivers/gpu/drm/nouveau/nv50_fb.c
+++ b/drivers/gpu/drm/nouveau/nv50_fb.c
@@ -56,9 +56,6 @@ nv50_fb_vm_trap(struct drm_device *dev, int display, const char *name)
 	}
 	nv_wr32(dev, 0x100c90, idx | 0x80000000);
 
-	if (!display)
-		return;
-
 	chinst = (trap[2] << 16) | trap[1];
 	for (ch = 0; ch < dev_priv->engine.fifo.channels; ch++) {
 		struct nouveau_channel *chan = dev_priv->fifos[ch];
@@ -70,9 +67,13 @@ nv50_fb_vm_trap(struct drm_device *dev, int display, const char *name)
 			break;
 	}
 
-	NV_INFO(dev, "%s - VM: Trapped %s at %02x%04x%04x status %08x "
-		     "channel %d (0x%08x)\n",
-		name, (trap[5] & 0x100 ? "read" : "write"),
-		trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff,
-		trap[0], ch, chinst);
+	if (display) {
+		NV_INFO(dev, "%s - VM: Trapped %s at %02x%04x%04x status %08x "
+			     "channel %d (0x%08x)\n",
+			name, (trap[5] & 0x100 ? "read" : "write"),
+			trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff,
+			trap[0], ch, chinst);
+	}
+
+	nouveau_broken_channel_id(dev, ch);
 }
-- 
1.7.3.3
