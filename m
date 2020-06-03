From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: drm/nouveau/clk/gm20b: Understanding challenges around
 gm20b_clk_new()
Date: Wed, 3 Jun 2020 07:04:37 +0200
Message-ID: <75a33776-cd69-edba-8d20-ffcf99ca1879@web.de>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam> <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
 <20200602153900.GW22511@kadam>
 <5d580094.f274c.17277fc124e.Coremail.dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d580094.f274c.17277fc124e.Coremail.dinghao.liu@zju.edu.cn>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>
List-Id: nouveau.vger.kernel.org

> Ben has explained this problem:
> https://lore.kernel.org/patchwork/patch/1249592/
> Since the caller will check "pclk" on failure, we don't need to free
> "clk" in gm20b_clk_new() and I think this patch is no longer needed.

* I am curious if it can become easier to see the relationships for
  these variables according to mentioned =E2=80=9Cdestructor=E2=80=9D call=
s.

* Did you notice opportunities to improve source code analysis
  (or software documentation) accordingly?

Regards,
Markus
