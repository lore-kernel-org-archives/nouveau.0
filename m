Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A03109E530
	for <nouveau@archiver.kernel.org>; Thu, 26 Mar 2026 01:15:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0097F10E1BA;
	Thu, 26 Mar 2026 01:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IENkgTmB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B3724530B;
	Thu, 26 Mar 2026 01:04:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774487039;
 b=hPwWn2q2x4T0w+WlSGcU2dXG1lKezHaFVfGz0kmcWr7kgSQ4Ps9uGDvajiTH3ftcm84M1
 Kmb48ToKNVoKghJMvrgQVgW46O64JtSa+9d5aUxjsBbjkNkfpAOuXiWJapLjFlJToWNwuuM
 Wi3eTYeH8AB9/B65NBePG5l46dGqIkfL4JVKNZyE36LiGY07EVSQXDZKct/JOZt0FTvaeni
 +3wJ5gKNjxEsUYnm+AJssNMMkTqr++GeMGQDwWnoS9d1KB1liRdzXWSu47MA7HSVihzNvaT
 sIvDZ4q3D1ZH3I7xjFf+DtLhDk68fN3cvcaW4kdLFA5xZMtbENRbOABkCz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774487039; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=chT/f9jDArjp+od804Y8TG8hbibiZePjF7LAF6CzJRE=;
 b=NZ+jw6V/RjmJGS0C4o+IQZfo8KniAmdRHrcpqztF62rqF44AyjqBk/4kC4e9AGc8vh4OL
 nMtywEBdkuTfdemG6RrDk1L9Bf7wvEVW19nyESMNcHBhYzCwdL0HXyRv9RC+I6nP9cxXsQU
 GWXvYv0jE7IcPcOF4uJX8teOOze5C2bzxAeWXVnie5XrTH9OrKTdNr7lxnvfE0lccxJRtQ0
 FDwpoutOu/jsRefDRnm/dYAPscOL+NglUGZV+/OAKuMNpywnvh+s2x45rwNt33kPx2GKy/w
 ZYQchRe0tTolvkkkQWUh1Yxws6zJE65jCgDGjktmpeRoEUC+bkh7/x8YBIbw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 70F4744DDF
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 01:03:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 072FB10E167
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 01:15:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDFA43717;
	Thu, 26 Mar 2026 01:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD11EC4CEF7;
	Thu, 26 Mar 2026 01:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774487704;
	bh=pJd7VIu8T6ytuoYLU/8L0M4NqwWqvsF6jINIz+xx8VM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=IENkgTmBdlGYDsdhZ2+n86H8WxEnX8RMJTrItqqIB4CKZX7dNlnWtvzY1d2W8TetG
	 f3p8OJRu5GHncpxVRmWKHWj9zcqWcfpqU5aqXT1PXVlgWFjfX8Og7Y7S0I6F+NlktO
	 eFMi11p4N0gl+u4Yierf74zaHRoHQfki1jL0/k+UttyLSd5kSFZrGPgqp6oAYVIW9q
	 U0edh3Be6NvioY1wdOvDuFcQZ3LRcQbzi+pLhTfzLJ36tnTr8DPYsR+m3hIBhgcGOe
	 xV8W8m7GoZ3D5DxzkoBQGSiSPOFR87yNUORWP7daYP2B0PGuLw9thcSH9sRag3y1Oz
	 DYspZL5EhsJoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 02:14:58 +0100
Message-Id: <DHCBE2PV3C2G.O9UJNFQX7E5P@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v9 5/7] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
References: <20260316211646.650074-1-lyude@redhat.com>
 <20260316211646.650074-6-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-6-lyude@redhat.com>
Message-ID-Hash: 6IFJN525JVGVYEMCRLSGYJHPUCWZ2IOF
X-Message-ID-Hash: 6IFJN525JVGVYEMCRLSGYJHPUCWZ2IOF
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6IFJN525JVGVYEMCRLSGYJHPUCWZ2IOF/>
Archived-At: 
 <https://lore.freedesktop.org/DHCBE2PV3C2G.O9UJNFQX7E5P@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> +    /// Creates (if necessary) and returns an immutable reference to a s=
catter-gather table of DMA
> +    /// pages for this object.
> +    ///
> +    /// This will pin the object in memory.
> +    #[inline]
> +    pub fn sg_table(&self) -> Result<&scatterlist::SGTable> {
> +        // SAFETY:
> +        // - drm_gem_shmem_get_pages_sgt is thread-safe.
> +        // - drm_gem_shmem_get_pages_sgt returns either a valid pointer =
to a scatterlist, or an
> +        //   error pointer.
> +        let sgt =3D
> +            from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(=
self.as_raw_shmem()) })?;

This is unsound as nothing guarantees that the device used by
drm_gem_shmem_get_pages_sgt() is actually bound to the calling driver. It i=
s
also not guaranteed that the DMA mapping within the returned &SGTable does =
not
out-live driver unbind.

There are two possible solutions.

  (1) Change drm_gem_shmem_get_pages_sgt() to provide this guarantee.

  (2) Don't use drm_gem_shmem_get_pages_sgt() in the first place and instea=
d use
      SGTable::new(), which guarantees to destroy the backing DMA mapping o=
n
      driver unbind.

In any case, this function needs to take a &Device<Bound> argument that mat=
ches
the bus devices stored in the backing GEM object.

> +
> +        // SAFETY: We checked above that `sgt` is not an error pointer, =
so it must be a valid
> +        // pointer to a scatterlist
> +        Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
> +    }
> +}
