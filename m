Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5F3C98310
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 20:05:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A04E10F196;
	Wed, 23 Sep 2026 20:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CpH4z28n";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B028448629;
	Wed, 23 Sep 2026 19:48:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790192882;
 b=HQHleMnBhKo5/jwDPtHFbrfAkt4LNxHIlb0xRDMs70jxQqOgf3hxRZsmcntklHAYZ2IKY
 3TAF1JNKj72s8X83SEwbIUjyr8Kt+jQbQpFirfmmaUbvXx35VD4qMuKgw7h7UIERU2pBVkr
 pbgg6iuTFtn462ATpgRzN80TmZpCIuafVUxzqrkFbG/lzXqbJhTQRy0J4iqFh4wolEyQCkb
 hh14Z4eZvZ0vF853VvBXtDSJ1OWOO0GZl7GkrKtwiDwJi9BcSLh/NEnbcuNH91JPow40Q/Z
 uyVL7UvWy7ytmSJsVGtmv1YCWBlm+71dfFbhkhuQjka0xP+AhnvelpnU5BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790192882; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3Ae8Rl5S099tC0SY0KTEywfRG63UpqYux9WWg47ljxY=;
 b=W5pOLf26feH8ipVcRwQtfnvXJTF2JVpP1zE/5PYEBqZBRBmtbFvPWw12lUhC0tcHmIlF0
 oOpAzY1QQ0yrfL8EoB3GR+EfjIJi18wJNHLfTN9BFfzuWRpMIexpeouiU8MnyGwYCM+ka4+
 NIh0tXNpsoLyjQP6WXJDbbn02OY22wVBNmOPd7nogmaM+ggwOWdwPZrmZS91+6lQuzPw3wo
 5r215CM8nuqKfOPs4RCOTAz7G0tvPXAoW3vkz9Ig7rBJpLjm5raIkV9CL6oBkPVq5T99FlW
 BqBOh8cNoYRvlgRPnYM+5dN67s6MglGjFhP/b1SXY0KvEystCGBTB0IrN+IQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BF59148338
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 19:47:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2D10F18B
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 20:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790193949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Ae8Rl5S099tC0SY0KTEywfRG63UpqYux9WWg47ljxY=;
	b=CpH4z28nLL6iibu4ohvydbY/25n4fKMjpdOqXajkwXc5O39WL9pAV5uyHFsnnuON/QWg5O
	/Bw/NTgti341ND+1vN7fZQFpNpqZNhht57VkczoVYc+rOuiyOPB9fE1UOndclXM+lHH74Q
	bXzWo4obVBax7PC+sLvM/Nw81HgCUPU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-LI2Udbs6N_20CvnAIEluuw-1; Wed, 23 Sep 2026 16:05:48 -0400
X-MC-Unique: LI2Udbs6N_20CvnAIEluuw-1
X-Mimecast-MFC-AGG-ID: LI2Udbs6N_20CvnAIEluuw_1790193947
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-90e7f98bcb9so23465256d6.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 23 Sep 2026 13:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790193947; x=1790798747;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Ae8Rl5S099tC0SY0KTEywfRG63UpqYux9WWg47ljxY=;
        b=UN8OFxK2xFWHvBtYIxTAOLxpPx67D1GF17tVaR9R8Q8si2FK3bnzllyJgIr+WtRyxh
         97eomvX1lXROGAL+n2f/Akj8OINZx/lD53VXa8jlaplI2SuIiugj3UBg0S/kj5u1MYZU
         Xhqoaed5zS+3p7LTxZooGiIoMO1qNOpG7hA5egZLrpHSjIjx2wuzJomyGC4tnkbKHvmI
         FrwvvBpiEgvBTEAIs9mRZ6pK4xpInM/263uTwKLQxXOHnqrVZG9BVtCk28ylIDZr7zIn
         SZw/YO9aO5I3NlMEa4XW1caM1D0NdoZOXctPfsflAZC174E4J0xCT1+P93ZZKTrBNvk4
         JKUw==
X-Gm-Message-State: AFuF++kbWMsG6iyvHF2oXtkp2gtIOSrYd/uETezq8Oorzjd//C31KgTx
	Pm7e3ePpHQPX9njyw5tXajKZPn6AMpEiW7tjtNZ2O3facufyKjwkjv8s0IW0rxZYaScgUNl9nn9
	an8ZE37L2Oggfefoa1dqFe4xYzknhRpKgGn87j327gA8d3zeaxv4UTNaylphfJivxsvU=
X-Gm-Gg: AYBFou1zxh7ykyKBU9AfWhW2LHLhWmqnnyKfBXN+i589JNiSmW6xehxFQNXSgmF+uwl
	o5PfzKxr9M2hTVMgPkOOocWbNm5ExkHS0asqHKd2oXtA5HqMJ5L8FhLnLahykiq+aGcjguQFeN4
	HbefYiGCP49KJ8zsFpZlJGLF5Kx/rLRf4vo/uUO30zdcMz/RYQxLOEnrdxXEtKmNnNAEnABSWi/
	yeg4n0H33sERXuDfEhNkVqNc5wzu590IzIx83zwsLZMYjtvY1ez42oT0bzx/E0/8VqH0eUYQpZ3
	ncDdR8Yy9QM85xk1+sUN9kDd/ZGJxs/EouEutABk+FMIQtYqP6ybW5azPjmwfnTdPExx4KI=
X-Received: by 2002:a05:620a:6ccb:b0:93c:17db:d91f with SMTP id
 af79cd13be357-93c3479e348mr42241285a.39.1790193947480;
        Wed, 23 Sep 2026 13:05:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccb:b0:93c:17db:d91f with SMTP id
 af79cd13be357-93c3479e348mr42237785a.39.1790193946917;
        Wed, 23 Sep 2026 13:05:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93c24753395sm301143985a.4.2026.09.23.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:05:46 -0700 (PDT)
Message-ID: <07d66ea7e0f0c7aef313b11d0881ca9170f05c77.camel@redhat.com>
Subject: Re: [PATCH 0/6] drm/nouveau: HDMI output colour format and
 quantization range
From: lyude@redhat.com
To: Daniel Campos Ramos <Capitain_Jack@yahoo.com>,
	dri-devel@lists.freedesktop.org
Date: Wed, 23 Sep 2026 16:05:45 -0400
In-Reply-To: <20260923162348.1037898-1-Capitain_Jack@yahoo.com>
References: <20260922215336.612239-1-Capitain_Jack@yahoo.com>
	 <c78df20bd86437dd3987053765a550b3bac0cc65.camel@redhat.com>
	 <20260923162348.1037898-1-Capitain_Jack@yahoo.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7dZppTKZrlYwhmkcAnq0uNrKS3hmdlGPQwHSyKsWXCE_1790193947
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Q7DOV5QN34XR3NF2OLIZ5D5IVRDIW6AL
X-Message-ID-Hash: Q7DOV5QN34XR3NF2OLIZ5D5IVRDIW6AL
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q7DOV5QN34XR3NF2OLIZ5D5IVRDIW6AL/>
Archived-At: 
 <https://lore.freedesktop.org/07d66ea7e0f0c7aef313b11d0881ca9170f05c77.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Responses below:

On Wed, 2026-09-23 at 13:23 -0300, Daniel Campos Ramos wrote:
> On Wed, 2026-09-23 at 12:13 -0400, lyude@redhat.com=C2=A0wrote:
> > You need to either tag your work with Assisted-by: if it is
> > generated
> > by an LLM. If you did the right thing and wrote it by hand and just
> > used these tools for analysis, that's fine.
> >=20
> > FWIW, If this was entirely generated by an LLM, then this is quite
> > a
> > lot of work and I'm very hesitant to review this. Going off:
> >=20
> > https://github.com/danielcamposramos/awesome-linux-hdr
> >=20
> > I am very concerned just about all of the results here came out of
> > an
> > LLM, according to the LLM generated provenance file, which means an
> > actual real person with experience working on this needs to go back
> > and
> > verify that all of this is correct. That is a lot of work, and the
> > idea
> > that my review comments are just going to get fed back into an LLM
> > are
> > not remotely encouraging to the effort of having to go through and
> > have
> > a real person look this over.
>=20
> Thank you, Lyude, both points are fair.
>=20
> The code was not written by hand: an AI partner wrote it under my
> direction, and I left out the Assisted-by tag the kernel
> documentation asks for. I will resend with it on every patch, and the
> Deep Color series gets the same.
> Sorry for that detail: I disclosed it in the cover letter body, but
> the tag belongs on each patch.
> For the record, the tools: both series were worked on inside Claude
> Code CLI and Codex CLI by several AI partners, Moonshot's Kimi,
> Zhipu's GLM, Anthropic's Claude, and OpenAI's GPT Astra and GPT Sol.
>=20
> What was mine: I found the problem on my own bench (full-range pixels
> to a Sony without a VCDB), set the design rules (follow
> drm_hdmi_state_helper.c, use NVIDIA's open NVKMS as the hardware
> reference), and ran every hardware test myself, 25 configurations,
> checking bars and levels on the set.
>=20
> The OCSC1 values were checked against NVKMS, not taken from the
> model's memory; the BT.601/709/2020 re-derivation was also done with
> the AI.
>=20
> On awesome-linux-hdr: it is an index of links, not the evidence for
> this series.
> Its provenance file names the AI partners for the source surveys; the
> hardware results are my bench measurements, and the logs for these
> patches are run27 and run28 in sony-bravia-linux (tools/stereo-
> modeset).

I'm happy to look at logs if I have something specifically I would like
to verify, but verifying the entirety of how this works from a bunch of
logs and measurements along with knowing whether we're missing anything
from this implementation that would lead to regressions (I already know
we are missing some things, which I will mention below) is more or less
the same as having to go and just do the work by hand myself. At which
point, I would strongly prefer someone to just implement the findings
of those results by hand.

We also have someone who has been working on these features on
nouveau's side already without the help of an LLM, and their work is
pretty much almost complete already and handles the missing bits
properly including:

 * Implementing IMP both for atomic checking and for tile allocation on
   some tegra platforms
 * Implementing display bandwidth allocation. This is needed for deep
   color with higher resolution displays, which will crash the GPU
   otherwise upon trying to set them (which I think would be the case
   with this patch series).
 * Enabling DSC and FRL on HDMI (also needed for higher res HDMI
   displays)

We've already merged some of their work for this, in particular some of
the work for fixing up blackwell and also reading HDR information from
EDIDs. So I'm not really sure we want to use this work anyway, sorry
about that!

One last thing though: it's somewhat of a moot point now, but in the
future: please consider just limiting your usage of LLM tooling for
actually figuring out the details of how things work and then handle
writing the code yourself after you go through the various openrm
sources it points you to. If I had accepted this work, it would have
taken a lot more time for me to actually get across the finish line and
be comfortable with merging it then is really needed. There's a very
hard limit as to the level of confidence anyone can have with LLM
generated code without spending more time reviewing it then you would
have if you wrote the code yourself, because you're now approaching
your own code submissions from the narrow perspective of a reviewer and
not its author.

We do require people take responsibility for LLM submissions. It's easy
to you take responsibility, but this is more complicated then just
"yeah I'll try looking at it again if something breaks". To me, if the
code is LLM generated, then the work in it's entirety needs to be of a
size where the author can reasonably have the exact level of
understanding they would have had if they wrote the code line by line
themselves and also trudged through the actual OpenRM code they were
looking at themselves. Otherwise, I have to be the one to do it in some
form. And that means me taking responsibility for the possible fallout,
and spending a _lot_ time then I would with a normal submission to get
as close to the level of understanding as an author as I can and then
take on the responsibility of dealing with the potential fallout of the
changes myself, quite possibly on my own.

FWIW: I think the approach that was taken recently with reverse-
engineering how ray tracing/BVHs work on nvidia hardare is a great
example of how these tools can be used without creating friction for
maintainers. There was plenty of AI generated code there, but it was
only given to us as a proof of concept with the expectation we might
not actually use any of the code. Which meant we could try implementing
it by hand and learn everything we can about the subject matter
throughout that journey instead of trying to trudge through the LLM's
code and hope very hope we don't miss or glance over anything. Just
approaching stuff this way does genuinely provide a lot more confidence
to maintainers, and does help to reduce the workload we have to deal
with by making sure there's always a person reasonably in the loop.
Otherwise we're struggling to make sure that's the case a lot more then
before.

>=20
> I read review comments and answer them myself.
>=20
> Fixes will again be written with AI help, declared in each version,
> and tested on the same bench before they go out.
>=20
> To make review cheaper, I can resend only patches 1 to 3 first (the
> header, the head programming, and Broadcast RGB, which fixes the
> visible range problem), or wait for whatever priority suits you or
> suites better. Feel free to also include it, if you want.
>=20
> Daniel

