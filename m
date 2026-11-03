Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D61D606D818
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b0v84Ky3
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EF16910F3D8;
	Tue,  3 Nov 2026 07:27:05 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 544B448CCD;
	Tue,  3 Nov 2026 07:07:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793689665;
 b=TExVXonLqlgJJHCsvxoC5xv+zJZVw5gUF5aUMVcBS1XvJ0u3EisoTOv7mjRq0WTq47R+V
 JNt2TPREcK2d7+cTrgOZpyzAKPX1zp6AEmPma/ePozwX5xOwE9Gx8gXXUxsEGxzLUbhxP5/
 OA4abl3FyTvChslMcAmnZEffj/gSmK5/8xnTfNY9mhxVsmpBoOmT/AXe3DaxxSnVc54IXkH
 bgfxPkIz7Wk1xYGA4qrPEVtLyl1rWs+nXNbHfRvD8bx0LWaxlbCSteBrRwhJoD1oLrXA6Y8
 XTsxBDOQWwwO6GIGv/yAsIb8hzSUQgCfEk8zIdV1WB0rvxqRcWOcGP2lZvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793689665; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1W+dLatY9nnSDyIP/7UDjOZciumv9YU0Js0RJ5PhO4s=;
 b=J9xOVmSBvI3Ki3KlbF5jgQcycxdfpnwyvjbCBuqSlgt/EHnAhRfe+2ce8aZfNZ/nuGZwe
 ySj3JNzH/3fux738NrK40NZrfQwcz7XOly5srii/3a7wYd7w3s/zjuIaSQTFfZaCInImnXe
 vnQ1UWGb5cTd5INwi+O9wYNEBWZOwYKHDSOkV+wt6i+CUajEYU/YBnx2EYz+T1KFv3E4h1k
 K96p/nB8Ry31bYJUp6a2xMfpHjsdB5aEA1d49qdVejD0/2h7rvG6x5GH461SRZ5gvD0Vdsh
 syld2UZE9VOVOEhyAScf3XL+ZEuEwqX4j0Ejp9xjYmlwfxfE0heIJRCDCqtw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AD4F248A90
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 07:07:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1C410F3DB;
	Tue,  3 Nov 2026 07:26:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 822E36022E;
	Tue,  3 Nov 2026 07:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400BB1F00A16;
	Tue,  3 Nov 2026 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793690816;
	bh=1W+dLatY9nnSDyIP/7UDjOZciumv9YU0Js0RJ5PhO4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b0v84Ky3dU/Duc4o23FRWcU5iuPmoE2POmJhnPd7BAea3aNMxLwvz5rXBkmS8Nt/n
	 +IyIiw3aa+YmlBx1hOP02leHB9bhbAERAhf75pBpHrFLAuLmfGUXBHEFQJPmpuzczZ
	 ZymLKjUKF2VA9fUcL97G2zPUbW0Y+1cabTzb0x8a1ZD288i4/u5JfuF6uGgUAnn3Xb
	 u/uD0w4ECgP0ZyNo8pQOYlaG3VSeruzMccIdsdY2KZM48zehBhvjg5x1KDUbAWr3tQ
	 XrAA0MFc1zWm4wTimoEZt84qhXlkg2/9Xa9RDqoRZzBm07tDbAIq7u/7MlGPPNSMCG
	 GqqA4+qhdTW1A==
Date: Tue, 3 Nov 2026 08:26:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/nouveau: Remove the audio device link on component
 unbind
Message-ID: <20261103-hungry-fearless-hummingbird-dc7d80@quoll>
References: <20261103070331.1079868-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103070331.1079868-1-vulab@iscas.ac.cn>
Message-ID-Hash: QPX5EQDZGOW2KH6ZNW2HQD52H52YA7ME
X-Message-ID-Hash: QPX5EQDZGOW2KH6ZNW2HQD52H52YA7ME
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: stable@vger.kernel.org, dakr@kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QPX5EQDZGOW2KH6ZNW2HQD52H52YA7ME/>
Archived-At: 
 <https://lore.freedesktop.org/20261103-hungry-fearless-hummingbird-dc7d80@quoll/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 07:03:31 +0000, Wentao Liang wrote:
> nv50_audio_component_bind() creates a stateless device link from the HDA
> device to the GPU. Component unbind clears the audio component pointers
> but never removes that link. Stateless links are reference counted and
> must be explicitly released by their caller, so repeated component binds
> retain a link reference on every cycle.
> 
> Remove the link after disconnecting the audio component in unbind. This
> also covers a later failure of the HDA component master's bind callback.
> 
> Fixes: 742db30c4ee6 ("drm/nouveau: Add HD-audio component notifier support")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 



Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email, thus I doubt
   that we speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




