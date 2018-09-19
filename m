From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: Re: [PATCH 1/6] drm/dp_mst: Introduce
 drm_dp_mst_connector_atomic_check()
Date: Wed, 19 Sep 2018 18:58:47 +0000
Message-ID: <CY4PR21MB0776A3CBF3A154B174C2DCD2FB1C0@CY4PR21MB0776.namprd21.prod.outlook.com>
References: <20180918230637.20700-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180918230637.20700-2-lyude@redhat.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <Alexander.Levin@microsoft.com>, Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Gustavo Padovan <gustavo@padovan.org>"stable@vger.kernel.org" <stable@vger.kernel.org>"stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v4.18.8, v4.14.70, v4.9.127, v4.4.1=
56, v3.18.122,=20

v4.18.8: Build OK!
v4.14.70: Build OK!
v4.9.127: Failed to apply! Possible dependencies:
    3f3353b7e121 ("drm/dp: Introduce MST topology state to track available =
link bandwidth")
    edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and releas=
e vcpi slots")

v4.4.156: Failed to apply! Possible dependencies:
    3f3353b7e121 ("drm/dp: Introduce MST topology state to track available =
link bandwidth")
    edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and releas=
e vcpi slots")

v3.18.122: Failed to apply! Possible dependencies:
    3f3353b7e121 ("drm/dp: Introduce MST topology state to track available =
link bandwidth")
    edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and releas=
e vcpi slots")


Please let us know how to resolve this.
