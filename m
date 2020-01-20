From: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH v3 20/22] drm/vmwgfx: Convert to CRTC VBLANK callbacks
Date: Mon, 20 Jan 2020 12:15:42 +0000
Message-ID: <MN2PR05MB6141E734C31A7173C906E76DA1320@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20200120082314.14756-1-tzimmermann@suse.de>
 <20200120082314.14756-21-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "christian.koenig@amd.com" <christian.koenig@amd.com>, "David1.Zhou@amd.com" <David1.Zhou@amd.com>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>, "robdclark@gmail.com" <robdclark@gmail.com>, "sean@poorly.run" <sean@poorly.run>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "vincent.abriou@st.com" <vincent.abriou@st.com>, "yannick.fertre@st.com" <yannick.fertre@st.com>, "philippe.cornu@st.com" <philippe.cornu@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>alexand
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 1/20/20 9:23 AM, Thomas Zimmermann wrote:=0A=
> VBLANK callbacks in struct drm_driver are deprecated in favor of=0A=
> their equivalents in struct drm_crtc_funcs. Convert vmwgfx over.=0A=
>=0A=
> v2:=0A=
> 	* remove accidental whitespace fixes=0A=
>=0A=
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>=0A=
> ---=0A=
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c  | 3 ---=0A=
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  | 6 +++---=0A=
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 6 +++---=0A=
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 3 +++=0A=
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 3 +++=0A=
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 3 +++=0A=
>  6 files changed, 15 insertions(+), 9 deletions(-)=0A=
>=0A=
Acked-by: Thomas Hellstrom <thellstrom@vmware.com>=0A=
=0A=
=0A=
