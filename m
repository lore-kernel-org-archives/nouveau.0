Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FCD606A31B
	for <nouveau@archiver.kernel.org>; Wed, 21 Oct 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjJXaQcb
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA73E10F256;
	Wed, 21 Oct 2026 15:00:34 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 156BF413A2;
	Wed, 21 Oct 2026 14:41:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792593701;
 b=iHDF9cWoFVLSesNDE02Xo9ofvfMlC1vxU8kRDGN/L3Uqzh6BrF6NrSWakXYICTZuRqbaC
 mL7580V766gFhedShkg3O5pmPtNk1Vbi8rRkGrZAnwVJE3BvKdk0SMR7DOQ0s7Q3UvgNPLg
 u3M1tPF4mSICoyu3zfy/yB16WSMos7YYrwJqT7IAqjdq0oYppZuOJT0eWU20NIFCAoH68ME
 v/Y9S09dplEkOi4/r4MPCGHNlv/Ulp1kQ/GEdd8m//mquZgOd7xYuo41s6WvrpKUlMZv5hw
 AoWhZBKCLKRCZVzy5i383958cg9nHR1N/CjhDOYlf59yQpd5raNWh5YWfaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792593701; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=J2oZ2Pffx6RFmL4hZYGK3DF77UUAFY+CBcj5PPYK2gw=;
 b=0pGj4BDDRK7zOFrkqdoOxeqTLmbl082O/tESv64e+Q7CAzz9s8123yxHemI2lpBnSD0Fl
 ZphvNTjo/fmU4sx5HR0TA/Kf/glp7rsAKQy0P2TGxtH0oV79cgR2ijYtikY9T4W8Pbk8kH+
 bCFuCABTIqDpHQMzbvRent3bjxaz6cCAExsfo1E4jftgFnASWlUfLzv/Jpd1T83klponIjL
 TwZJe1aUU7XqSVivKNPX1UePelUh7VlGJ1pWetD8EpGbEwMfhSR6j0Ju9KpIwG6/UBzjgKJ
 FIe5RpDXV+fxqyeNAHxp4Spk+LDio80nTroE/nZxoBiP/Gc6wW9BDg1g3OyA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E03E04139A
	for <nouveau@lists.freedesktop.org>; Wed, 21 Oct 2026 14:41:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7A610E316;
	Wed, 21 Oct 2026 15:00:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31DA74036F;
	Wed, 21 Oct 2026 15:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E137A1F000C2;
	Wed, 21 Oct 2026 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594826;
	bh=J2oZ2Pffx6RFmL4hZYGK3DF77UUAFY+CBcj5PPYK2gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WjJXaQcbrfAY9BxH6maCYdJfdDk0EmgTU4q7mbf09sUaFYw6kDhu2XUpCL3HjA+e+
	 /DoHHdy5zKsCXWoDfvl5lK4SBdOHROKmUwXtuXCA795C8w1jSEvivIzACxyKNozs7j
	 GgK4f7f7vBavwniHn4d4YV4l1tG96hX569TYT018lc7WgSrrm+JcorZTfq+oVttLJE
	 TDLF0jpRcaB8lJKDInnlgf1B/SFNNr4KzvydubeTWwSFjGHzipsUNlfUvky90n3nAf
	 tQHdLZGsTviUE50YB2BmFxg9Vr1Ah6gmHCOgDplbSL7fy9ujozutpyr2R+lQI6G8E7
	 /lFOpZ2oJGQYA==
Date: Wed, 21 Oct 2026 10:00:25 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
Message-ID: <20261021150025.GA254364-robh@kernel.org>
References: <20261013145210.103565-1-sashal@kernel.org>
 <as5N73fHztX8hVWh@orome>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5N73fHztX8hVWh@orome>
Message-ID-Hash: 4QHJ7E3DC2K2ESYRWGUU7EE7JIPRHCIV
X-Message-ID-Hash: 4QHJ7E3DC2K2ESYRWGUU7EE7JIPRHCIV
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Sasha Levin <sashal@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4QHJ7E3DC2K2ESYRWGUU7EE7JIPRHCIV/>
Archived-At: 
 <https://lore.freedesktop.org/20261021150025.GA254364-robh@kernel.org/>
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

On Tue, Oct 13, 2026 at 05:36:09PM +0200, Thierry Reding wrote:
> On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> > GM20B needs both its reference clock and the fuse clock while it is
> > powered, so allow "fuse" as a fourth clock after "ref".
> > 
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> > index 4d856a8b674c..ecbc20e6adec 100644
> > --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> > @@ -44,6 +44,7 @@ properties:
> >        - description: GPU clock
> >        - description: Power clock
> >        - description: Reference or fuse clock
> > +      - description: Fuse clock
> >  
> >    clock-names:
> >      minItems: 2
> > @@ -51,6 +52,7 @@ properties:
> >        - const: gpu
> >        - const: pwr
> >        - enum: [ ref, fuse ]
> > +      - const: fuse
> 
> Technically this now allows:
> 
>     clock-names = "gpu", "pwr", "fuse", "fuse";

No, it doesn't. There's a 'uniqueItems: true' in the common schema (via 
a $ref).

> 
> I think we may need a very explicit version to cover this now, something
> like:
> 
>     clock-names:
>       oneOf:
>         # for GK20A, GP10B, and GV11B
>         - minItems: 2
>           items:
>             - const: gpu
>             - const: pwr
>             - const: fuse
> 
>         # for GM20B
>         - minItems: 3
>           items:
>             - const: gpu
>             - const: pwr
>             - const: ref
>             - const: fuse
> 
> We may also want to leave out the minItems property because it turns out
> the FUSE clock is indeed required, so we'll need to add it to all device
> trees anyway to fix this hang.

Please make this kind of change as 1 applied series so we don't get 
transient warnings.

Rob
