From: Frantisek Hrbata <frantisek-ktf8V493EB/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: bail out of nouveau_channel_new
 if channel init fails
Date: Fri, 28 Aug 2020 20:29:21 +0200
Message-ID: <20200828182921.GQ3489@localhost.localdomain>
References: <20200828092846.GA11454@localhost.localdomain>
Reply-To: Frantisek Hrbata <frantisek-ktf8V493EB/QT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200828092846.GA11454-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

I'm sorry for another email, but it seems that all lines in the
reproducer starting with '#' got trimmed as they were comments.
Probably something I did on my side :(. Would it be possible to
fix this in the commit msg or do you prefer v2?

Thank you

simplified reproducer
---------------------------------8<----------------------------------------
/*
 * gcc -o crashme crashme.c
 * ./crashme /dev/dri/renderD128
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <drm/drm.h>
#include <drm/nouveau_drm.h>
#include <inttypes.h>
#include <string.h>
#include <error.h>

#define die(format, err, ...)  error(1, err, format, ## __VA_ARGS__)

#ifndef DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC
struct drm_nouveau_channel_alloc {
	uint32_t     fb_ctxdma_handle;
	uint32_t     tt_ctxdma_handle;

	int          channel;
	uint32_t     pushbuf_domains;

	/* Notifier memory */
	uint32_t     notifier_handle;

	/* DRM-enforced subchannel assignments */
	struct {
		uint32_t handle;
		uint32_t grclass;
	} subchan[8];
	uint32_t nr_subchan;
};
#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
#endif

static struct drm_nouveau_channel_alloc channel;

int main(int argc, char *argv[]) {
	int fd;
	int rv;

	if (argc != 2)
		die("usage: %s <dev>", 0, argv[0]);

	if ((fd = open(argv[1], O_RDONLY)) == -1)
		die("open %s", errno, argv[1]);

	if (ioctl(fd, DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC, &channel) == -1 &&
			errno == EACCES)
		die("ioctl %s", errno, argv[1]);

	close(fd);

	printf("PASS\n");

	return 0;
}
---------------------------------8<----------------------------------------

-- 
Frantisek Hrbata
