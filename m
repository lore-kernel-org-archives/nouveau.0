Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BBBCDE014
	for <nouveau@archiver.kernel.org>; Fri, 26 Jun 2026 10:57:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1157E10F572;
	Fri, 26 Jun 2026 10:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="nUlhdiN2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 19DE346CFC;
	Fri, 26 Jun 2026 10:43:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782470584;
 b=XhTrGg+s6nSrGSZZcvPIvdn3cUDXWSzIYvxdnJziqYwruRxLBA6mAW+jYdce58xiW1gmx
 5vxE14ikqHiu7fnKifBuzKIgDMNwCQ72Kx0bb/G3WnezqXuKL9JV+I9PsRHSUZapNhGsZrQ
 765lYTC9jo5QVD7+6ne7IsjcXEw6TJRmzbjudBtpQW1r+wPUcJQAh0cQPl0LlE++BLQbYX7
 HbR2WjsR4IMg2b/HFYdtr3UI8jTO7MstAzPS2CXRI33W84x2YNEj7Du2eG1e2Z+tKWy+MCT
 nrMeTJSmkHq6e33Pd2PP5xliJH6wie1WRX5opZ95Pr7AFtyrFlW71XYl5s9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782470584; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sAseHEuLitU2XuzH9XcC23JCBmfXywpYjauwlpSls6I=;
 b=Mz+JiLMzncB0Sd5I8aBRwjGS3D4iNDCaJrr9BcnitW6qk+KBzeeqRz5b5CTFQMgEWGr5r
 xJY90z+4hl+OCVQQBYRWDn2/ogN4M2gTjupJOPGFHB5d4irVFCBlQYNDW8pnzkp0P6Gu3RS
 DgoNX5z1dmWodAvdoZVnMPTjzI/5CaG8silP1pQqGvrje4OgDy9OkDBvmzLr82D9/SIYFPF
 cF+BvZA8mwSJW86tedeAo2BG1K+ixtCsmXZJj9QI5Xl62TZTc7szdWbaL/SvJ/YqXFP0bZR
 I7mZvNr4rv4bahmiP3ZfSl9yJgsU+rW4nj6hmo/YijFt83gDIiF7cz7vLTRA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ursulin.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ursulin.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 43F7646CE9
	for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2026 10:43:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 094F510E353
	for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2026 10:57:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so4743195e9.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 26 Jun 2026 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1782471453; x=1783076253;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAseHEuLitU2XuzH9XcC23JCBmfXywpYjauwlpSls6I=;
        b=nUlhdiN20IwFVbaIIzgd8chiXPiL3BhMZnNrwJR4u0ocXLHRStqffQvtvrLWSZEjwO
         QKVOebBZfMfHUjsSO8TQjYzeJoIlG45gTrmzzff6XL5txjEo8d7g86iEPeRMxA4txYgt
         ZHlmCYK5wjAOQ+7k45ka5MYh/Zg+DeNQ3fi8Syj1r1ctFrBFPXEz2/A36Blpk8KkCpSU
         oR6hjC7lPIvV8NE6gfjn/KhZIFoyB+LjoXTSNj8uB58ecofr3aEQuj5XMNyZDY7Psqyx
         PCZKGc893aIEhPz8ht0sAAG36j6Mmq9r0iN1qgt3hJzVTUHRXkJSjGqxbB7HM41RCaRV
         25cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782471453; x=1783076253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAseHEuLitU2XuzH9XcC23JCBmfXywpYjauwlpSls6I=;
        b=rYPX+esB+ZB+vVWckueTzAnbS48OBI4H2WqsiRXM30VzDNWyvdX/jkdlBSkB9ATtG1
         OFZ+iT/LWs6Ng4Q4+MBecB4Pkr52UcsX6VA4WtXuO7bMHo761+WS0h3ES1++0Qei7SbN
         415vO+0wZGrRYdiIWW5KL/fqwCeiqpECBQVANci7NDsAxn6oarWPPSsWJVXYLaoFYOMZ
         IMhtbByAIUejphcvaLQ0+wBaX7JxjLA7VB6CP+pr5Qhia9qjRWlcLGYP/2KzdMfXxbZr
         w7b3qJjVQ+52cPa2oKW/tIsnmgTpMA+CH2f9Vm+DNo0YJpaOwmZVwZOxpIng+SEEkF8E
         Vc9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+m2VrbZ7KMUbWXRssT+U1Ov5/Q/Zgh3/Zbqq9gS4nxSfcBuj8P/uVlzrXRSuHBEWlPHffIfZmQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw81FeHJX6abYVgJYT/ORtE05eCuocTCdQ4oGfdDNO5U53TXRwa
	IWIWqfENdtjatS5XPoJgyI9791SHnGe8EPdShddlV1WnfnwYUp3n3nHNAsez5S6cIRk=
X-Gm-Gg: AfdE7cm8an/ghyYSc/wDYhyH0IdPlLsrChhe0k50rlK+gAJ0e9jqmbjacCbcIOe3YyT
	rJG9oNUzPr/UYiqnOEyKiOSU+Somk6JwOQm2LYg9nx+XEMDbeUPtdr+MyeVWhbk4VkDqnmkbtE1
	nzDNrEP6tAjrmptyVw3Ud1vRP7QtKjh+HjEVvlt8+1a1gi6FmtWjIzWAyMNqrYa8MTfFkPOt3gA
	Z7vNKB3ryCokER7zPg13rvhqO4hemP1OglUsQJCU7LBjrw/eE2fhs4XHZhO4eNoOam9lJJGT+Ap
	31WEIpKxCyZ8jIIEI/m9qqD52URltKjKowXYHZN3OPbq1x0TMEHlKClm3UmD9mgQ/TV2nMUkez0
	imWRQDbAv/+LCAzNoM0SBrD+2m/9gv1bg6RX53Qouh2z6cP7MPmEBfwQMRpt+EbDgoIngkwHFri
	oPGaurSkoH/R8/IXYNavDQ0iACpPdWOdO0Cw==
X-Received: by 2002:a05:600c:8a1a:10b0:492:488c:f627 with SMTP id
 5b1f17b1804b1-49266872ce4mr69640085e9.11.1782471452665;
        Fri, 26 Jun 2026 03:57:32 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f700c0sm75417365e9.0.2026.06.26.03.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:57:32 -0700 (PDT)
Message-ID: <5021eae6-40f8-4079-9b5d-f511537aa460@ursulin.net>
Date: Fri, 26 Jun 2026 11:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm: add generic drvparam[] alias for
 ttm_place::fpfn/lpfn
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WSCESIHBJRHKYMBAZKIZD37GEAMKJWI4
X-Message-ID-Hash: WSCESIHBJRHKYMBAZKIZD37GEAMKJWI4
X-MailFrom: tursulin@ursulin.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: alexander.deucher@amd.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WSCESIHBJRHKYMBAZKIZD37GEAMKJWI4/>
Archived-At: 
 <https://lore.freedesktop.org/5021eae6-40f8-4079-9b5d-f511537aa460@ursulin.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 26/06/2026 07:36, Arunpravin Paneer Selvam wrote:
> The fpfn/lpfn fields in struct ttm_place are named after page frame
> numbers, but they are really just placement parameters interpreted by
> the backend resource manager. Wrap them in a union with a generic
> drvparam[2] array so backends can access the same storage without the
> PFN-specific naming.
> 
> drvparam[0]/drvparam[1] alias fpfn/lpfn, so existing users and the
> VRAM range manager are unchanged. This decouples the API from
> PFN/range-specific semantics so that these fields can be used more
> flexibly in the future (e.g. mask-based or segment-aware placement
> constraints). No functional change.
> 
> v2: Use a union exposing a generic drvparam[2] array instead of
>      renaming fpfn/lpfn to param1/param2, keeping existing users
>      unchanged (Tvrtko Ursulin)
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Assisted-by: Claude:claude-opus-4-8
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   include/drm/ttm/ttm_placement.h | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index ab2639e42c54..7db2073f3236 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -75,14 +75,22 @@
>    *
>    * @fpfn:	first valid page frame number to put the object
>    * @lpfn:	last valid page frame number to put the object
> + * @drvparam:	generic driver/backend placement parameters; the
> + *		interpretation is defined by the backend resource manager.
> + *		drvparam[0] and drvparam[1] alias @fpfn and @lpfn.
>    * @mem_type:	One of TTM_PL_* where the resource should be allocated from.
>    * @flags:	memory domain and caching flags for the object
>    *
>    * Structure indicating a possible place to put an object.
>    */
>   struct ttm_place {
> -	uint64_t	fpfn;
> -	uint64_t	lpfn;
> +	union {
> +		struct {
> +			uint64_t	fpfn;
> +			uint64_t	lpfn;
> +		};
> +		uint64_t	drvparam[2];
> +	};
>   	uint32_t	mem_type;
>   	uint32_t	flags;
>   };
> 
> base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7

LGTM but then again I suggested it (hint hint) so I may be biased :)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

