From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 3/6] drm/i915: Leave intel_conn->mst_port set, use
 mst_port_gone instead
Date: Wed, 19 Sep 2018 18:01:03 -0400
Message-ID: <9770be8055c2aff2be697aaf014bb0364507eb55.camel@redhat.com>
References: <20180918230637.20700-4-lyude@redhat.com>
         <CY4PR21MB07766A3873241EE2E50CE7EFFB1C0@CY4PR21MB0776.namprd21.prod.outlook.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CY4PR21MB07766A3873241EE2E50CE7EFFB1C0@CY4PR21MB0776.namprd21.prod.outlook.com>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <Alexander.Levin@microsoft.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
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
>     06bfe5b0d892 ("drm/i915: Avoid null dereference if mst_port is unset.")
>     22a2c8e0457f ("drm/i915: Validate mode against max. link data rate for DP
> MST")
>     9301397a63b3 ("drm/i915: Implement Link Rate fallback on Link training
> failure")
>     af2405af07d1 ("drm/fb-helper: Push down modeset lock into FB helpers")
> 
> v4.4.156: Failed to apply! Possible dependencies:
>     0552f7651bc2 ("drm/i915/mst: use reference counted connectors. (v3)")
>     06bfe5b0d892 ("drm/i915: Avoid null dereference if mst_port is unset.")
>     22a2c8e0457f ("drm/i915: Validate mode against max. link data rate for DP
> MST")
>     9301397a63b3 ("drm/i915: Implement Link Rate fallback on Link training
> failure")
>     af2405af07d1 ("drm/fb-helper: Push down modeset lock into FB helpers")
> 
> v3.18.122: Failed to apply! Possible dependencies:
>     0552f7651bc2 ("drm/i915/mst: use reference counted connectors. (v3)")
>     06bfe5b0d892 ("drm/i915: Avoid null dereference if mst_port is unset.")
>     22a2c8e0457f ("drm/i915: Validate mode against max. link data rate for DP
> MST")
>     459485ad3513 ("drm/i915: Fixup dp mst encoder selection")
>     9301397a63b3 ("drm/i915: Implement Link Rate fallback on Link training
> failure")
>     af2405af07d1 ("drm/fb-helper: Push down modeset lock into FB helpers")
>     c6a0aed4d493 ("drm/mst: cached EDID for logical ports (v2)")
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
