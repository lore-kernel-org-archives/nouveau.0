From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Date: Tue, 2 Jun 2020 18:39:00 +0300
Message-ID: <20200602153900.GW22511@kadam>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
 <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>
List-Id: nouveau.vger.kernel.org

On Tue, Jun 02, 2020 at 01:10:34PM +0200, Markus Elfring wrote:
> > The original patch was basically fine.
> 
> I propose to reconsider the interpretation of the software situation once more.
> 
> * Should the allocated clock object be kept usable even after
>   a successful return from this function?

Heh.  You're right.  The patch is freeing "clk" on the success path so
that doesn't work.

regards,
dan carpenter
