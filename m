Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D49606A31A
	for <nouveau@archiver.kernel.org>; Fri, 23 Oct 2026 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wsj0r7BB
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B228A112C68;
	Fri, 23 Oct 2026 17:13:17 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7AC7148B53;
	Fri, 23 Oct 2026 16:54:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792774460;
 b=k05g2cJDi+YnPctM6nKelijm9ByPX/dHs7Vl0jVuhcnTsxSNqtXFn6eZczsfXel83gSUt
 1C7hbTHAcWwSQtrXtGETAxLoQPwV6CKOwrTBZUZh9XUKCfLyjdqaD7XmR8b68Hd47taaeZ2
 sySs94e+VVJuD7ctuEtX0AxFo68NQqnXt8fEJgAr4MSqHaetNT14eKpsSvFUuZ2z6wDADqi
 RL6YSAzRkHdjjx4h+zpxlyJ+/KE+iZpMinenPxCjGlNsnyNdZakaNavAT4zA7sBMWGDgcjf
 KlxlyhHkbRJSpJjC4I33jrNSa3JnrVFRh+qfO5V+BNl0ryjWjGnCWUhszFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792774460; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZXynH80RO/xGHb0t0bbutsjbUgHko3YWihcoLi5HDZQ=;
 b=jh9eIM5/c6r+KQ3hzIJa74c93BgBbFYKxv8id2DFJ7c3yVjlIs7j4WWcopQyRCNzbj4Wn
 d7NxqoIlUj279JIR1sEXM3ggbbmuCMZoPGw7d7sIWRawh44W9Y8rr+NSJxr0W1liWj5rWzD
 ZsuajpYXFWfsMCHarE4vrP9jRCCU0Q0Wn5MVbcrj8q5h0f2opLDBb1TPds3iet0QZ5sAUDf
 aoywXZjFIqTC3AcNyY6q4t/ppMEjNy27yvxOm+RfyGmq15UGUNjAoN7MyazMtDHYLjn5iLm
 2AVhYWsPJsgtiNptucHNGgnyO5jRthrLg3HsKOl9GfGi+2LKrq0KmYD6PvBw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 485FC413B4
	for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2026 16:54:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 340A3112C57
	for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792775588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXynH80RO/xGHb0t0bbutsjbUgHko3YWihcoLi5HDZQ=;
	b=Wsj0r7BB81OtIgZmTRH2FOIfrKlRONHM3/8XebWURipUNlcmXRCYPmR1omWLrIjGkORWSu
	+OpJWdw8vKBrkG5SLWYeHAkxPerl/NeVbmqPZx/7vd0oI/2sbXErGpKFIM+YQ3z3O5P373
	wvJZ4y9NYgQgsYTFyGeCdGSSjb9CDA0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-oCl0pciqNCWCbXgcqtclrA-1; Fri, 23 Oct 2026 13:13:05 -0400
X-MC-Unique: oCl0pciqNCWCbXgcqtclrA-1
X-Mimecast-MFC-AGG-ID: oCl0pciqNCWCbXgcqtclrA_1792775584
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-917baea8e5dso24735546d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 23 Oct 2026 10:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775584; x=1793380384;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXynH80RO/xGHb0t0bbutsjbUgHko3YWihcoLi5HDZQ=;
        b=vSHXcBeOmwZHXBdIT4fC37UOw+zumcYc/rCwLX7NF+24LuiktMMK5ovYolbXDgqfxB
         9NUPEOiXVZCWtMyHjr2AIKTXA2h1EVWY6GUTfU1NWSGD3Px/GA+Sd4QLgKx8fLvaceEB
         czYmdtPHcFQglqx1TuWnGYbJO21SLDZf4B1zzPh58rkOD5nU1eeUdmcRENDeSpsMFy+s
         Ncf5q9ojjH8enjMpaIwkKzKyjJpLRC0wLSw7Qx6otINYJPPQ9t8nB873iANJkq0g6W+c
         XrHUIier9yM5Nz5M3YLxIOK4l13w15FMCJPPDmHp83YvYAtYzqlCqVcXk4hcNnlK0T5P
         YoPw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxu5A3eOZArr64SUUUjejQGNRSOWxhPAFpXXyiwRxNgIRiKpclC0LIwtycBLzMiU8JGhjzoFrIc@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIBqYd22IyrJK0hlcOnNNTtOvWSwolVxtCFcXTMUxHNGSlInlTK
	NPdjC9daTpogZR/z5QAFisvGOwco7mHtTFJfmLTjMII2EvDUgKXHvE50F/SjcEbx6ncrYkqBDAD
	DIT4UCPaAHBuiioZI50L4yF5zJAnQoRsVrEZ1UG8juE/yh4FzR4bSQXAEX7BkqBVxA8U=
X-Gm-Gg: AYBFou2HoZxeVDe+RGA1cMVS84ggXToyTfv1DwFc0LjqF6sSHUVzxORLWl4QUeNnAPf
	Y7JybsdIKPhYDyULziw0EckQ2v9YohCbPe085OZvWDg5acqb8lt4oOXTAYkedeYZgyUoMNk2hxy
	p/627BEfatGPu8RwBc2z8VXoemFMpruGu8YKp+Fzq4Uk1FqoN+nIYGjW3U0jmp6stMOh7aAcd4C
	GKovt2lafCmFrPzgIQdqIHwLbISrZXw4gB4dcpIFrFhmeSJI1EBysDG+TGnachZuBp1pcMuQqJA
	5qmiIAk/uIF/IbCqEVDdJIr18eVo28AWtTm4TOLaDVbQBo93WRLBQsHU5b4pZYAH38NwiYE=
X-Received: by 2002:a05:6214:3d0e:b0:919:7384:99a6 with SMTP id
 6a1803df08f44-91c3a9e79b5mr43112376d6.41.1792775584319;
        Fri, 23 Oct 2026 10:13:04 -0700 (PDT)
X-Received: by 2002:a05:6214:3d0e:b0:919:7384:99a6 with SMTP id
 6a1803df08f44-91c3a9e79b5mr43111616d6.41.1792775583760;
        Fri, 23 Oct 2026 10:13:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c4522855csm6449066d6.16.2026.10.23.10.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:03 -0700 (PDT)
Message-ID: <8a025f783533d40c0486a8a511e8811b0e52f466.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
From: lyude@redhat.com
To: Kush Chandak <kushc451@gmail.com>, Risto Pajula <or.pajula@gmail.com>
Date: Fri, 23 Oct 2026 13:13:02 -0400
In-Reply-To: <20261022153712.11208-1-kushc451@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
	 <20261022153712.11208-1-kushc451@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uXD6c9JBBbBOuqYx_WjkswAZXHiMYVRQOmDvZBjIXBs_1792775584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6YEEI7USCDAC46FXO22KEHSBHBBC5TJW
X-Message-ID-Hash: 6YEEI7USCDAC46FXO22KEHSBHBBC5TJW
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6YEEI7USCDAC46FXO22KEHSBHBBC5TJW/>
Archived-At: 
 <https://lore.freedesktop.org/8a025f783533d40c0486a8a511e8811b0e52f466.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I am going to look at this patch when I have a moment, but I am in the
middle of moving right now so it's likely going to take me a bit,
however:

On Thu, 2026-10-22 at 21:07 +0530, Kush Chandak wrote:
> On Sun, 13 Sep 2026 23:12:23 +0300, Risto Pajula wrote:
> > This series fixes two independent Nouveau regressions affecting
> > VDPAU
> > hardware video decoding on NVIDIA GK107 (Kepler).
>=20
> Tested-by: Kush Chandak <kushc451@gmail.com>
>=20
> I used an AI assistant (Claude) to help debug and test this.

Please don't clog up the mailing list with this. I have seen multiple
people now going through and 'testing' things with LLMs, and the
reality is I'm not going to carry across the tested tags.

If you would like to test, there are plenty of resources available to
figure out how to build a kernel against a patch on a mailing list to
test changes. LLMs frequently hallucinate and lack an understanding of
the tasks they perform. It's already difficult enough keeping up with
code submissions, and given that you cannot use LLM output without both
vetting it, and having the knowledge required to properly vet it, there
really is nothing I can actually establish from "testing" like this. If
you weren't able to actually test without using an LLM and we have
established we can't trust the output of the LLM - how am I supposed to
know it was tested? I can't verify it from what you gave me, and even
if I could - that's just doing what is way too commonplace with these
tools and offloading the work of verifying anything that it spits to
others.

