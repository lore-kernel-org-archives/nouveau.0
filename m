Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E42BC53219
	for <nouveau@archiver.kernel.org>; Tue, 28 Jul 2026 05:14:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE3A910E51F;
	Tue, 28 Jul 2026 05:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8mXo8Vi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4F3214741E;
	Tue, 28 Jul 2026 04:58:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785214707;
 b=MoQOjBf9Koq0MamVBcmG8VgLxWgH6/ko1cbwOqQuFcstaRHIHwW4HKvlHBOvKtNXuvlLY
 wxcE9wn1uSNUwvCLQQd6Pk55hO6eTg/UZbU5TcsN7p+mOZig5vTcnx2CCzzJ4TkYpXsCAwZ
 hX5z8+7Ilb/1JMoz0PMUq4LdHFHXEwLv8CR8KBY7vkx7WRxdRYaMI2opJr5R4fUNzL56AsT
 YO4TOow6SnX4zOsR3LCQDeh+HUL/mVxOGdNU/0UytbLwN3lsqGsAzc+tue3dXz7oSRvhGb9
 +Z7kpS0CJcGRDCpk9/bCxWuT0nTjmqXoJ1k2fmj42BW1Nh1ybIDE0qAxfQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785214707; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/6ix+2ekyEjmxtNQWG+EytAOJTxYlBnpiXnHByYObJw=;
 b=Pi67ZYH6chSy5+WSsugzyrocMatr6Y5EeoPUkwX+Oj9Y8/n0o1dfOJEPPDfyu+mpPqva/
 azd4dIgnXocMhY7rPcG1FfqxxKlLppFEm97oMXkFyIEiSQWx+Yn233Q2yAzq/1z9UPeu8SK
 NuoYujTKw1f+smkg3UCMrSprLnrf0QSc+/jY7zsHFoB5cBV86WTtlaEXRgLqvYtOLDvEuY8
 7jn/iUHGnNIU71sYbzyriLFnCGuxUBrlJR5mLRRsIL6M2I0KWMZfMSd9mMVg/Ssxt0VejH8
 A+KK1N30ghuP1CjNnuYgBKEKNvkBYa/XBfcS94JwbLTotQOXQhA3/RtYPRdg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BFA83473EA
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 11:21:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E66B10E0A5;
	Mon, 27 Jul 2026 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785152249; x=1816688249;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=/6ix+2ekyEjmxtNQWG+EytAOJTxYlBnpiXnHByYObJw=;
  b=G8mXo8Viqf78xazk9zqbaR8AWKxx3t4VL7oDFw8rAxZ9fV31PanygXol
   GYyxOcnS5F2KOuKBNxorVeH2MINx+MYePQnoH9fxc9PiSWr8QSuLttjKr
   kLW/v8fOVnB4+baLVXDnzBLLGhoO8FMdTKv+rSQtEK8qXX4b5+P2pn29+
   S3bjjeywJrbVeKzapB0yAndUCmJWqOannRsMDFgBgD8QOQAyXHny7F/GV
   +QrqO7gjFmlTJbFT/0mLoOZmxeV/KSvGIl4QJLLKSnr4cC6O0AoXqfTSv
   gWy8eEN7OdOn0swD6VSJjgjsaTmugDFCUwuPsuX4IXK4Jz6UoJQ1cCPB/
   Q==;
X-CSE-ConnectionGUID: FJTeiapPQ+GR3gD77pNrGg==
X-CSE-MsgGUID: FTpwXrnyS2CxdM4F8/Qpsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="103128660"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000";
   d="scan'208";a="103128660"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 04:37:27 -0700
X-CSE-ConnectionGUID: jc740gvBSCmfJ/AOeJRN5Q==
X-CSE-MsgGUID: 4x0a30kMTGOmwHJgJde0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000";
   d="scan'208";a="297617694"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.197])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 04:37:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
In-Reply-To: 
 <CABFDxMFMOAZ_3kYxEGCutnGt1OSSmgvmwx-=M1RxGc3VGKORYQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260724144822.6af8213f@kernel.org>
 <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
 <CABFDxMFMOAZ_3kYxEGCutnGt1OSSmgvmwx-=M1RxGc3VGKORYQ@mail.gmail.com>
Date: Mon, 27 Jul 2026 14:36:57 +0300
Message-ID: <a4703624643e1d2fd1a9dedc1d36ce5d34d3133f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: jani.nikula@intel.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BWQ3RTVCOWQSUSUD6ERCQUTSUW75DF6P
X-Message-ID-Hash: BWQ3RTVCOWQSUSUD6ERCQUTSUW75DF6P
X-Mailman-Approved-At: Tue, 28 Jul 2026 04:58:24 +0000
CC: Jakub Kicinski <kuba@kernel.org>, Julia.Lawall@inria.fr,
 Alex Deucher <alexander.deucher@amd.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Borislav Petkov <bp@alien8.de>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jiri Pirko <jiri@resnulli.us>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Julian Anastasov <ja@ssi.bg>, Leon Romanovsky <leon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthew Sakai <msakai@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Mike Rapoport <rppt@kernel.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>,
 Ping-Ke Shih <pkshih@realtek.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@kernel.org>,
 Steve French <sfrench@samba.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Renninger <trenn@suse.com>, Tony Luck <tony.luck@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Vinod Koul <vkoul@kernel.org>,
 Will Deacon <will@kernel.org>, Yazen Ghannam <Yazen.Ghannam@amd.com>,
 cocci@inria.fr, amd-gfx@lists.freedesktop.org, dmaengine@vger.kernel.org,
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 iommu@lists.linux.dev, linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, lvs-devel@vger.kernel.org,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
 nouveau@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BWQ3RTVCOWQSUSUD6ERCQUTSUW75DF6P/>
Archived-At: 
 <https://lore.freedesktop.org/a4703624643e1d2fd1a9dedc1d36ce5d34d3133f@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 27 Jul 2026, Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
> Hello,
>
> On Mon, Jul 27, 2026 at 5:30=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
>>
>> On Fri, 24 Jul 2026, Jakub Kicinski <kuba@kernel.org> wrote:
>> > On Fri, 24 Jul 2026 03:45:02 +0900 Sang-Heon Jeon wrote:
>> >> Patch 1 adds a Coccinelle script that matches the pattern, including
>> >> negation and constant-comparison variants. Where a local variable is
>> >> assigned right before the check, the assignment and the two returns
>> >> turn into a single return of the assigned expression.
>> >
>> > Huh, I thought we already had such script. Various script children have
>> > been sending such "cleanups" in the past.
>>
>> We did, and it was removed, I believe in 1a617a8475e8 ("coccinelle:
>> misc: remove "complex return code" warnings"), because people just don't
>> want this constant churn.
>>
>> It's perfectly fine to have the error case and happy day scenario
>> separated.
>
> Thanks for sharing the history.
>
> I checked the mailing list. The removed script looks similar to the
> new one, but it is different. The removed script reported a
> conditional return followed by an explicit return 0, where the error
> case and happy day scenario are separated as you mentioned, and Johan
> also complained about this 10 years ago.
>
> But the new script only reports when both branches return the same
> variable, not the explicit 0. So, I think the new script is close to
> the restricted version that Julia mentioned 10 years ago, and it
> should be acceptable.

ret =3D=3D=3D 0 after an if (ret) return.

BR,
Jani.


>
>>
>> BR,
>> Jani.
>>
>>
>> --
>> Jani Nikula, Intel
>
> Best Regards,
> Sang-Heon Jeon

--=20
Jani Nikula, Intel
