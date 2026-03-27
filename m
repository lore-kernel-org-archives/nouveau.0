Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEF010F286F
	for <nouveau@archiver.kernel.org>; Fri, 27 Mar 2026 20:44:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E022C10EF39;
	Fri, 27 Mar 2026 20:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="skL+bkV2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 02CFA45311;
	Fri, 27 Mar 2026 20:33:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774643612;
 b=Pl35FwIiK/tTl11ekhNb2OouoS6p8pwSSqFuTv2i0cuzanZ/cZwYW25cj9iie2OTBcgBH
 qbJrR00EL/mBpBONl42EPjrXsiK4csTYRDma//9Ob3BqUOhWq0Q2JBW4jsLBgiQcF4xWNtK
 RYBtpccp8ygeWD2AeuzOD/jQ7f1qGeGeiR+P4PiBCT3ZJOafkDwKylS8M+il0DhpdmQlvyB
 t1s2dpUCFlF0dJGy/by1/VmD0Z8ppAUm/S2BiXluoTY8Q8NuKc3oJoCpk4qpS5xnq8Xtadd
 OUay9+ogod65qjBle7f2gEPDGZXfGF1267w8Pd/FaavBWDQljOUap6SGPcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774643612; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SGwJYd+teaWa7vcSgABk2b7ymY1eNsxjjWWFk/pfVUw=;
 b=pFYJlJOISqh59/8XmvtrNPYvAy3uW32AEsK1xQAV/N1xuV5dzH9kD+EW+Mkxn41IdfnGs
 PXxJIrC3p8K7FWLUtMy7YMSrB8cqvvSGhMBuwrytXQ0nBzm3t+BRPEKYSCE+uTqSnw3cULY
 +Eum6waOKZlqjmlU1k7rYA6ElTSWxBDhSo4Oy/Xuqx9eQPb5zesZBYSeTl0rsIDPtI9Nv86
 JlzV/3Im1YJVwNM5c4pnKORUFfsVeGT/KqNm7NOCFNQA+p9oBqpDmndj7z5G7qOEzam0rKJ
 TbaO0X38C0ONornBoh6FKPv+cRkA0r0BsLB/SvpBkmmOcFb0URmv9/vMefZA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1D87D44DDF
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 20:33:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC49410EEF2
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 20:44:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4DFA40AFB;
	Fri, 27 Mar 2026 20:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB83C2BC86;
	Fri, 27 Mar 2026 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644281;
	bh=pjtXtS4Kx1HfchVm/8WjMLE03rpfeGZ+zPWKpQMasjk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=skL+bkV2aB0KvWcJBOwBREVSIwrLBax9k1RDfFi2webQZzKwy2F7CY5MfU8uGwAlI
	 OgI5LnXoCigdAkh7QSEdsC0E2nEzUxLqZ12gKKsmtwNQ3idSwjHYdUN4V/ZrQtfsoW
	 bIk6k4X6rXZccNVJIkK1O2NQOpzm2065LEF3HO/gTtYahH2w7K3iECROEkpMvxbsj8
	 taj8vdbVpxuy6aHmILLO1erHo/6LWQPfkZoLD2jEPcZVWiv8+1cFTO2sJju2zaUvlE
	 XaqXMSjeM4yDaFYKMtJzW5UpSJUh5Q9t7QKL4gpjpjiU5YXW9Beenjlfrce8UnkorA
	 +rGkRWqd4mOcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:44:35 +0100
Message-Id: <DHDUW55OWUU6.2YPVSZVHGYPI3@kernel.org>
Subject: (subset) Re: [PATCH v9 0/7] Rust bindings for gem shmem
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260316211646.650074-1-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-1-lyude@redhat.com>
Message-ID-Hash: 4PRXQBADLQOMLUQ3QBRUSWSB6GMBUAZJ
X-Message-ID-Hash: 4PRXQBADLQOMLUQ3QBRUSWSB6GMBUAZJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4PRXQBADLQOMLUQ3QBRUSWSB6GMBUAZJ/>
Archived-At: 
 <https://lore.freedesktop.org/DHDUW55OWUU6.2YPVSZVHGYPI3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:

Applied to drm-rust-next, thanks!

> Asahi Lina (2):
>   rust: drm: gem: shmem: Add DRM shmem helper abstraction

    [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it=
,
        it becomes =3Dm. The Rust kernel crate and its C helpers are always
        built into vmlinux and can't reference symbols from a module,
        causing link errors.

        Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
        DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it=
;
        use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.

      * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
        on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
        that unused warnings are suppressed when shmem is not enabled.

      * Enable const_refs_to_static (stabilized in 1.83) to prevent build
        errors with older compilers.

      * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
        #[allow(unused_unsafe, reason =3D "Safe since Rust 1.82.0")].

      * Fix incorrect C Header path and minor spelling and formatting
        issues.

      * Drop shmem::Object::sg_table() as the current implementation is
        unsound.

        - Danilo ]

>
> Lyude Paul (5):
>   rust: drm: gem: Add raw_dma_resv() function

    [ Fix incorrect reference in safety comment. - Danilo ]
