From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Date: Fri, 17 May 2019 16:27:37 +0900
Message-ID: <20190517072737.GA651@jagdpanzerIV>
References: <20190517061340.GA709@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517061340.GA709@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: nouveau.vger.kernel.org

On (05/17/19 15:13), Sergey Senozhatsky wrote:

> ... but most likely it's utterly wrong.
> 

JFI, I removed kmemleak annotation and added the following
thing:

@@ -360,6 +360,7 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
                        return -EINVAL;
                }

+               kfree(map->tags);
                ret = nvkm_memory_tags_get(memory, device, tags,
                                           nvkm_ltc_tags_clear,
                                           &map->tags);

	-ss
