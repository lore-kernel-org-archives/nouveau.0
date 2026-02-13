Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7141EF99E2
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 22:22:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8051310E849;
	Fri, 13 Feb 2026 22:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JWFVI9Ff";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE12442FB2;
	Fri, 13 Feb 2026 22:12:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771020763;
 b=vP+caIApBAi/0hV5F8G11KLcvsTCDbqvS4zrdC2pmzR7XnkPFsvuVfIIe+TBA3jGOBvaC
 kG/6nPpj6LYLdXU9groZufg+CqGNdYedlcgj/DbdMDAPFSjgHINP5vGv7VzkEFfxoRzeAzT
 xUhLX7CcrIO7FCdW8YVeDLZJSezIdA75QCt0O5pX8YRBL8pjs2j0JHAKV/x2jagg48sMe08
 nLjK94KjrNo5x43kYaHUXOwb0TX8OjuEhRL9uehBzkrESinzSRrrpXMVCrhkrKaf5sLSLQd
 OcsDXoG+zqvpeubhfeYu9hskKpibRE9LXitCubmhxrXXbq7wKxNHZ4d17zag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771020763; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2accTUOhqguqw3fSnVUG+pChxnDX/EVV4mwBh1taaWE=;
 b=I25VtPlpSLMNU+UXUSKXl/3b0BPJeQrSD0Rk6DL/S1qOiwHcYhoLDy+ZgKXwWtMUzLaup
 4ueJsR+gYBf8UI+ldFdzsRG0lVLx30jNYEcdQQGj/qDcNpBDxKuOY+a0WOPdCpLnN6qJifr
 +dozlinPUeHF0yoRm961Qp4Gr4r/9/1iu2osC2fsePQnUN2yY4nLSdozrSi8cx7YeIH4SNN
 tYcdtrzuPe4kPnk/60rzmf9bH1DT2AneeDQ8MdejVm89Iq5Jophn/encRIuGHQDVrB8Ym1p
 VW6IIlBPgjVZYm+DPtNGNWuMTBELDcUSJa5VILRqPmqtmyklG02SME4GWV3A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1B9AF40686
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 22:12:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8DC10E308;
	Fri, 13 Feb 2026 22:22:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5060042AF9;
	Fri, 13 Feb 2026 22:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B957C116C6;
	Fri, 13 Feb 2026 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771021339;
	bh=JZG9zpO3v26S4FfIoUMCHmNqp0Ksq9OU7wxZoT298/g=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=JWFVI9FfTpCRFluJKQFdWPC0eQ8LKFMbZkCTuWMLXd8u8taybBVw59hcDTR/NKju8
	 d2iCaDIrlDcc5iN8tNy8KRlXUkArJpVfICH8XY9ENMkLNTniEHVjP8vYZ333vGD4Xk
	 FaUBJgnq/iGGYAclZspPyB70Smyh8A3uEPnwkG9C+KV5QxDzIQal5/zxRR8yg9rwqB
	 Ew9AYbLgpD6doQp8Hx4lVBl4drJrHNaAUetdPJ5iyjhsQXaOORdJ9DpM6+H5DTnQu+
	 OBEmddjmnjhSc+U+Mb4c1B0nJsGJfuthVTJ+QfdXu2FhEqC/m1CFZ7/nQuVrg42idq
	 fy1ivTUTXAMgw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 23:22:15 +0100
Message-Id: <DGE6O1OYR4F3.2PSFQLJ8XXJ78@kernel.org>
To: "M Henning" <mhenning@darkrefraction.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
 <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
 <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
In-Reply-To: 
 <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
Message-ID-Hash: VKSZOSC6GMM3J5N3Q4L5EDUP6GVDV65N
X-Message-ID-Hash: VKSZOSC6GMM3J5N3Q4L5EDUP6GVDV65N
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VKSZOSC6GMM3J5N3Q4L5EDUP6GVDV65N/>
Archived-At: 
 <https://lore.freedesktop.org/DGE6O1OYR4F3.2PSFQLJ8XXJ78@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 13, 2026 at 10:48 PM CET, M Henning wrote:
> On Fri, Feb 13, 2026 at 12:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>>
>> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
>> > This information will be exposed to userspace in the following commit.
>> >
>> > Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
>>
>> For someone looking at this commit, this commit message is not very usef=
ul.
>>
>> Please add at least a brief explanation of what the patch does and - eve=
n more
>> important - why it does it. See also [1].
>>
>> [1] https://docs.kernel.org/process/submitting-patches.html#describe-you=
r-changes
>
> What I'm struggling with is that I don't know how to do this without
> repeating myself. If you want, I can copy-paste my explanation of
> zcull here too and then it will appear three times, once in each
> commit and once in the cover letter. But that kind of repetition
> doesn't seem very helpful to me.

Again, the commit message should explain what the commit does and why. For
instance, I asked you why you did combine those two callbacks below.

The commit message could mention this, e.g. it could be something along the=
 lines
of:

"Add struct nvkm_gr_zcull_info, which serves as abstraction layer between t=
he
corresponding uAPI (added in a subsequent patch) and the firmware (version
specific) structure.

This is needed in order to not leak the uAPI layer into nvkm. Also note tha=
t we
are bypassing the nvif layer, since ...

Also note that we reuse the get_ctxbufs_info() callback, since ..."

I.e. make it obvious to maintainers what's going on and what's the motivati=
on
for the patch and it's implementation details.

> Because of this, I decided that it was simplest to combine them in a
> single call, which avoids repeated rpc calls to the gpu without the
> complexity of handling partially complete states.

Ok, that seems reasonable.

>> > +     if (WARN_ON(IS_ERR(zcull_info)))
>>
>> What justifies this WARN_ON()? To me this seems like normal error handli=
ng, i.e.
>> it is not a violation of some API invariant, etc. Also, this is in the d=
river's
>> probe() path.
>
> I was just copying the error handling that already exists in this functio=
n.
>
> I do think these are weird error cases though - they mean that the gpu
> was partially but not fully initialized which shouldn't happen during
> normal usage. The only cases I can think of that would trigger this
> warning are a kernel bug or an intermittent PCI link, which I think
> are both reasonable to warn on.

It could also be that the firmware is buggy, etc. In any case, I don't see =
that
a WARN_ON() is justified. Please use dev_err() instead.
