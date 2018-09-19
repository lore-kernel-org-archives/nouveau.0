From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/6] drm/dp_mst: Introduce
 drm_dp_mst_connector_atomic_check()
Date: Wed, 19 Sep 2018 18:00:55 -0400
Message-ID: <4a074cc77b180bc16f3356012152451bfbf3bffa.camel@redhat.com>
References: <20180918230637.20700-2-lyude@redhat.com>
         <CY4PR21MB0776A3CBF3A154B174C2DCD2FB1C0@CY4PR21MB0776.namprd21.prod.outlook.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CY4PR21MB0776A3CBF3A154B174C2DCD2FB1C0@CY4PR21MB0776.namprd21.prod.outlook.com>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <Alexander.Levin@microsoft.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Gustavo Padovan <gustavo@padovan.org>
List-Id: nouveau.vger.kernel.org

On Wed, 2018-09-19 at 18:58 +0000, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v4.18.8, v4.14.70, v4.9.127, v4.4.156,
> v3.18.122, 
> 
> v4.18.8: Build OK!
> v4.14.70: Build OK!
> v4.9.127: Failed to apply! Possible dependencies:
>     3f3353b7e121 ("drm/dp: Introduce MST topology state to track available
> link bandwidth")
>     edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and release
> vcpi slots")
> 
> v4.4.156: Failed to apply! Possible dependencies:
>     3f3353b7e121 ("drm/dp: Introduce MST topology state to track available
> link bandwidth")
>     edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and release
> vcpi slots")
> 
> v3.18.122: Failed to apply! Possible dependencies:
>     3f3353b7e121 ("drm/dp: Introduce MST topology state to track available
> link bandwidth")
>     edb1ed1ab7d3 ("drm/dp: Add DP MST helpers to atomically find and release
> vcpi slots")
> 
> 
> Please let us know how to resolve this.
...is this the email address I'm supposed to "let you know how to resolve this"
with? if that is the case, it's 100% OK to simply ignore all of the versions
that don't apply with this patch.

> 
> --
> Thanks,
> Sasha
