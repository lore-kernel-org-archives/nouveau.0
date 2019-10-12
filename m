From: Markus Elfring <Markus.Elfring@web.de>
Subject: drm/nouveau: Checking a kmemdup() call in
 nouveau_connector_of_detect()
Date: Sat, 12 Oct 2019 18:04:15 +0200
Message-ID: <5ff56ca3-0e20-2820-f981-d2d37dded133@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
List-Id: nouveau.vger.kernel.org

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function =E2=80=9Cnouveau_connector_of_detect=E2=80=9D contains sti=
ll
an unchecked call of the function =E2=80=9Ckmemdup=E2=80=9D.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpu/drm/nouveau/nouveau_connector.c?id=3D1c0cc5f1ae5ee5a6913704c0d75=
a6e99604ee30a#n476
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/nouveau/n=
ouveau_connector.c#L476

How do you think about to improve it?

Regards,
Markus
