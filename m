Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD64D106ACE6
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 19:50:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2976F10EAAA;
	Thu, 12 Mar 2026 19:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZnfOuik6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9A464450E3;
	Thu, 12 Mar 2026 19:40:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773344411;
 b=z5jw3R+W/oNxSi3U1vQhq89DS1EEI4hTbdqjcyaH0YQsMI4iOcFJn9iT18vjaoREqM+pl
 wim3QXfJFHaWHtgpACUX45r1qMd6tJIxoLzMQPi0a3Yp5lL5y9xuCdVrdqg7ZLKPbQ7tXYp
 LB0a7ypYRdUx4uUucGbYBWdKFuyzponkyaVG1XXb/HOQv73ZEPIlo7uyzBJs3mr8t0U7T0F
 nKnep2bL1lmYtAJjSwLBCWZ0dHivsEWlPGpjOSCJ1LQbglcZdo35HJQJa4X2MijP6xVmvam
 ejKO3SlUluhLQwDauR2PcsIOjX9sNn7Np25xndZTXAVrOQQsGFepTmOBeByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773344411; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wOHCpU/qUlJ9QLzJ1oUzFBOjTVtulCOI/8sgb9G5W/A=;
 b=lUnBNnvkRdRrZPV9jvaYXSdsqzEOdA/XSaUW3k4VU3J4m3MPpF0mFyeh6IPrPGN30QQ9K
 +f4QNTAbY5jnwWIYg3SL1llTlgD987N9ha6V0gcoA6PjtbKhhTYJuUGQvhtPrRJ5kyko1/e
 thFzBM63zPY1Q1rz1PCImtGCBwXve7/0OZRGZPBLlV9uCxL8XfWboa9UUoAhtQSSo4IXC4B
 g6VytFcHb3olMpy97J5Rbd1y/E2VyyJ6Qrwed8T7IIzViE/yfTMiKYmVoJg/aWW66NCS0KK
 CIJ8I34dmvpl+zZqfjaohHZx3/FyUHhAy/qc/k6g1U+zl4dcYTjCPGEYjm/g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5364545021
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:40:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDB310EA9E;
	Thu, 12 Mar 2026 19:50:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5127243FAE;
	Thu, 12 Mar 2026 19:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD85C2BC86;
	Thu, 12 Mar 2026 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773345047;
	bh=wOHCpU/qUlJ9QLzJ1oUzFBOjTVtulCOI/8sgb9G5W/A=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=ZnfOuik6oAR63sev2BS1ZVFdfaVftV+psQSvuZthQeM1iH71vFl8qpXyV13mTPMIf
	 WZWoHZO00Sx38lkpSJQR1Onft7yFww72aa2UEcO7oWjoxdF1a8GyzEE8o9Hah9boZq
	 Mul2o5Cx8SMESt7oEn7gkF8Gp8cqHWwdHBFESmtm3oPOKr1Ufj4kjns2gda6L7B9sg
	 bTHvnDaZAWYquD700jGYAAgzjerLPNNBAf6iSWj6AgqzYQhBMCBXCDlj+t3BQRdvF6
	 S5Jue3vIToOjPfQUk2B+8bFtIjDviEBVhdmPlXlPa2Cg6V62TwmhdfYtzitIdMVCay
	 Cp2RCyKYBJ83g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 20:50:34 +0100
Message-Id: <DH12CMFJNDMF.D3F50HV9020X@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked
 list interface
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com>
 <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
In-Reply-To: 
 <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
Message-ID-Hash: GYP4UB4ZYY54CEWAVGYQ4D47SYIOPOYY
X-Message-ID-Hash: GYP4UB4ZYY54CEWAVGYQ4D47SYIOPOYY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GYP4UB4ZYY54CEWAVGYQ4D47SYIOPOYY/>
Archived-At: 
 <https://lore.freedesktop.org/DH12CMFJNDMF.D3F50HV9020X@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Mar 12, 2026 at 8:20 PM CET, Miguel Ojeda wrote:
> On Fri, Mar 6, 2026 at 9:37=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.=
com> wrote:
>>
>> +//! // Create typed [`CList`] from sentinel head.
>> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` w=
ith
>> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over=
 `SampleItemC`.
>> +//! let list =3D clist_create!(unsafe { head, Item, SampleItemC, link }=
);
>
> Was the patch tested with Clippy? It has several issues.

I did not give it a shot yet, but given this and the other nits, this is be=
yond
what I want to fix up when applying the patch.

@Joel, can you please resend?

Thanks,
Danilo
