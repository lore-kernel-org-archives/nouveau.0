From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 21/28] hal2: convert from dma_cache_sync to
 dma_sync_single_for_device
Date: Wed, 19 Aug 2020 08:55:48 +0200
Message-ID: <20200819065555.1802761-22-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200819065555.1802761-1-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvme-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Use the proper modern API to transfer cache ownership for incoherent DMA.
This also means we can allocate the buffer memory with the proper
direction instead of bidirectional.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 sound/mips/hal2.c | 44 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 746c410bd9bf11..c8e429a5f48f85 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -441,7 +441,8 @@ static inline void hal2_stop_adc(struct snd_hal2 *hal2)
 	hal2->adc.pbus.pbus->pbdma_ctrl = HPC3_PDMACTRL_LD;
 }
 
-static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
+static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec,
+		enum dma_data_direction buffer_dir)
 {
 	struct device *dev = hal2->card->dev;
 	struct hal2_desc *desc;
@@ -450,14 +451,14 @@ static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
 	int i;
 
 	codec->buffer = dma_alloc_pages(dev, H2_BUF_SIZE, &buffer_dma,
-					DMA_BIDIRECTIONAL, GFP_KERNEL);
+					buffer_dir, GFP_KERNEL);
 	if (!codec->buffer)
 		return -ENOMEM;
 	desc = dma_alloc_pages(dev, count * sizeof(struct hal2_desc), &desc_dma,
 			       DMA_BIDIRECTIONAL, GFP_KERNEL);
 	if (!desc) {
 		dma_free_pages(dev, H2_BUF_SIZE, codec->buffer, buffer_dma,
-				DMA_BIDIRECTIONAL);
+				buffer_dir);
 		return -ENOMEM;
 	}
 	codec->buffer_dma = buffer_dma;
@@ -470,20 +471,22 @@ static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
 		      desc_dma : desc_dma + (i + 1) * sizeof(struct hal2_desc);
 		desc++;
 	}
-	dma_cache_sync(dev, codec->desc, count * sizeof(struct hal2_desc),
-		       DMA_TO_DEVICE);
+	dma_sync_single_for_device(dev, codec->desc_dma,
+				   count * sizeof(struct hal2_desc),
+				   DMA_BIDIRECTIONAL);
 	codec->desc_count = count;
 	return 0;
 }
 
-static void hal2_free_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
+static void hal2_free_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec,
+		enum dma_data_direction buffer_dir)
 {
 	struct device *dev = hal2->card->dev;
 
 	dma_free_pages(dev, codec->desc_count * sizeof(struct hal2_desc),
 		       codec->desc, codec->desc_dma, DMA_BIDIRECTIONAL);
 	dma_free_pages(dev, H2_BUF_SIZE, codec->buffer, codec->buffer_dma,
-			DMA_BIDIRECTIONAL);
+			buffer_dir);
 }
 
 static const struct snd_pcm_hardware hal2_pcm_hw = {
@@ -509,21 +512,16 @@ static int hal2_playback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
-	int err;
 
 	runtime->hw = hal2_pcm_hw;
-
-	err = hal2_alloc_dmabuf(hal2, &hal2->dac);
-	if (err)
-		return err;
-	return 0;
+	return hal2_alloc_dmabuf(hal2, &hal2->dac, DMA_TO_DEVICE);
 }
 
 static int hal2_playback_close(struct snd_pcm_substream *substream)
 {
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
 
-	hal2_free_dmabuf(hal2, &hal2->dac);
+	hal2_free_dmabuf(hal2, &hal2->dac, DMA_TO_DEVICE);
 	return 0;
 }
 
@@ -579,7 +577,9 @@ static void hal2_playback_transfer(struct snd_pcm_substream *substream,
 	unsigned char *buf = hal2->dac.buffer + rec->hw_data;
 
 	memcpy(buf, substream->runtime->dma_area + rec->sw_data, bytes);
-	dma_cache_sync(hal2->card->dev, buf, bytes, DMA_TO_DEVICE);
+	dma_sync_single_for_device(hal2->card->dev,
+			hal2->dac.buffer_dma + rec->hw_data, bytes,
+			DMA_TO_DEVICE);
 
 }
 
@@ -597,22 +597,16 @@ static int hal2_capture_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
-	struct hal2_codec *adc = &hal2->adc;
-	int err;
 
 	runtime->hw = hal2_pcm_hw;
-
-	err = hal2_alloc_dmabuf(hal2, adc);
-	if (err)
-		return err;
-	return 0;
+	return hal2_alloc_dmabuf(hal2, &hal2->adc, DMA_FROM_DEVICE);
 }
 
 static int hal2_capture_close(struct snd_pcm_substream *substream)
 {
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
 
-	hal2_free_dmabuf(hal2, &hal2->adc);
+	hal2_free_dmabuf(hal2, &hal2->adc, DMA_FROM_DEVICE);
 	return 0;
 }
 
@@ -667,7 +661,9 @@ static void hal2_capture_transfer(struct snd_pcm_substream *substream,
 	struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
 	unsigned char *buf = hal2->adc.buffer + rec->hw_data;
 
-	dma_cache_sync(hal2->card->dev, buf, bytes, DMA_FROM_DEVICE);
+	dma_sync_single_for_cpu(hal2->card->dev,
+			hal2->adc.buffer_dma + rec->hw_data, bytes,
+			DMA_FROM_DEVICE);
 	memcpy(substream->runtime->dma_area + rec->sw_data, buf, bytes);
 }
 
-- 
2.28.0
