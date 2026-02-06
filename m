Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC45EE6B40
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 17:27:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED9D10E86C;
	Fri,  6 Feb 2026 17:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tspf8lha";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0278C41B4C;
	Fri,  6 Feb 2026 17:18:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770398297;
 b=pYO3Cvh2nGXJQyaoEalQvRUvEvy3TwZHIzh8vvsSQje8mpYugVSf7BIzTRCknPfBHMQzA
 D8G5Y+MOjPxB3UWn8q3tOwMxheDFyXW/dwNboaEFWeVvHwzcpiLSBGgf1Bv0Hu0h8IQuc+r
 bGoCLoHkD52HQ1hHDbQt3Qk7euFB/io970rk6qBiN1x6u79p5EVhd5wH7crBUXoBCFZdI4m
 bj2XVDkAAyxJRSfJAKbYmzE3x1URxasaRFq+nRB1FTj7aERMzbNhCLpa7bi7P7zSfs/SkeT
 fcjZA9/HCLXPfzeyxCv1WparsV9O/59uz7P0hs2mYOy8ta5RdZ2jBq2IfcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770398297; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DviuGo6EMO94bRcj+LA1f5jItWFurA9I/2YyGvOCpGU=;
 b=ykwLObHWv9A/qQqdenGwQpmugAyKj2Him3SixCkjTK+zNCTYHe9dzQ/8orlOxv82AdR1S
 md9qrlQnNrNFImD5lFzlLXekyQcDrDZTCRz+w2/13mAOhJbOLtVD7uGInntxRX+jUKMsT7R
 zmjq3BkJh8wYDl03jHczvSpga6XRaVZRM9dAGZsHsjzEuDYmKfrG/+a046CvJUUvGQSdH7R
 W54Pyr1i32Tjn+p3rFRIo9QRnj/aIc/X/n7BVoEHla5w4D/WKBbj9OBlLRqh79Gvt8STWHx
 I4zaZfRvGh2OX4Uiq1Ue0ZR6EwS1m0ckKon2dHFhA1qMxR/AYpubYEZtx2sQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9478640492
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 17:18:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD38010E0C4;
	Fri,  6 Feb 2026 17:27:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A45D760010;
	Fri,  6 Feb 2026 17:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D969FC116C6;
	Fri,  6 Feb 2026 17:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770398855;
	bh=DviuGo6EMO94bRcj+LA1f5jItWFurA9I/2YyGvOCpGU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tspf8lhaOr0S5m6oexxE02FpVJfe/g3YlvPtRQm+ttUhWoSGZvjKcGED7cmiNNhr0
	 eXQFIWQPMSaTrOwn/V0wFtMIYO109qZ75ugwHgsUgCZL6MiaRaAEvMUQtXQWD7LebR
	 13TF7sHuYRfNQfW+U3aHnOJNLYpG25SAMiGbBsDOV7idsq++Y/qd55Cvhrt1Il0S0w
	 /5aki+hD89tgnboX/3KaCzhwQoHPx49DF9Snfl0fEmpdsJhgI1mlUeE8d3FDa1rEWb
	 jiW6OOLaQiolq1nj5e0s4Z0rZuQD8Acylid8Bw10e/s4xEf/CoTT0Lc17tjRFkmoPt
	 i+US+xyzZ0HDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 18:27:23 +0100
Message-Id: <DG820GM5YHJS.11E92OR824CWM@kernel.org>
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with
 C linked lists
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
 <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
 <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
 <DG81V8NG5RC7.38EYLHQZXKTTO@garyguo.net>
In-Reply-To: <DG81V8NG5RC7.38EYLHQZXKTTO@garyguo.net>
Message-ID-Hash: MC6L5PFMGZ526K57CIX2I3W4KDKTIT2X
X-Message-ID-Hash: MC6L5PFMGZ526K57CIX2I3W4KDKTIT2X
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MC6L5PFMGZ526K57CIX2I3W4KDKTIT2X/>
Archived-At: 
 <https://lore.freedesktop.org/DG820GM5YHJS.11E92OR824CWM@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 6, 2026 at 6:20 PM CET, Gary Guo wrote:
> I asked for this to be changed to `pub(crate)` because I think this isn't
> something that should be used by drivers.
>
> As you said, tt might be tricky to enforce that with new build system whe=
n
> subsystems are inside different crates. But until then I think it's bette=
r to
> limit visibility.

It should *usually* not be used by drivers, but there are exceptions. For
instance, it is perfectly valid to be used by Rust drivers that interact wi=
th C
drivers.

Besides that, my take on this is that we know that the new build system wil=
l
come and that pub(crate) won't work in the long term, so why bother. I'd on=
ly
use it in cases where you want to keep things local to the subsystem.
