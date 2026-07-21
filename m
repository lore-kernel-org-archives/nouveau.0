Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE46C44529
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 15:11:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C23310EA77;
	Tue, 21 Jul 2026 15:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oo0DK3La";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 70B714728C;
	Tue, 21 Jul 2026 14:55:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784645758;
 b=gUDIhXMTDMZIfXevVEo3SFKAK1ZcRCPJA4AhcwUeY7OY+Tk9Fa4nBjWgYnl4TN0k2+dQw
 6pRJIV3Tbt0WYdJ8r3X4QHYTTmhStjDNfoN0pVqmvwvSlaPMELjT+SgSEifAlUwLQAIw+e5
 ip3AwdCPWtw4NIcYJxnhAnZz+bMT8x2rfFv1O+lLyA/Za4cOt/WUhx2So165tSpefv83STs
 lMkeFDFd1PnM49hG6v8KA8lII9QE+CEO3jWKGrzGCQmj/JV840iWC2CNvkmwMvQ9vyHJbNU
 gScIl8fCyuzXfXApjX1lyIsHP1N6qLE6eAn4lNLLwZdNm5yg2AT/fwD70o5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784645758; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/sVJ5iSKzdGNeBFDX7R3RcAFMpXgx0svJwjKK7cYX5g=;
 b=0mtdMSO2LZ1WdVFcbFBL0b4A0aDVQZXQriUF6w/wphdXnB1fvfwClaVVU6wt7XCOcABau
 tm5X3AyisBjSjg4l7HGeJScAoXl/0uYtBPfa+A9j2rTosauRrVYOsHfQRoeluOexeJJXnns
 9qHdmfLMPSd/+zqKTDc4EQfw/X4pMdS+wNJ+Lj2s0fifSsHEiPv+H4V7NSrDyO6H5f7r/hZ
 EqveH1chGKcQW2A1lXwsuMJs7gb6dXA4s6bctodLyRgdI8XZIQE+zPUCsE2FmbPqF116JmD
 efCyTCuNu577c2Q4RJrWVsypf9+ddeRJrDHM3deVU9v+ja5CkG2FHz01Zvpg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 69CE4466F6
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 14:55:55 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 033E510E38A
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 15:11:24 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c9d1fc053e0so6977830a12.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 08:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784646683; cv=none;
        d=google.com; s=arc-20260327;
        b=Izrr61E9PfkPBdMJUi06OYpum/Us//+Hx9drS33y1z9b2bYZnkhZPIyw1XJywOq8VO
         9RAp2+kte7mMtNP97R2UY/70fo+qM90mhEB1bL2RAzu0YrEZecxrl+34L9iFhdgeQJ3R
         W6i4sIzn/4H1LaQ6ebVtvSOsPcZ/ft2Ko5dNg2+CytcEaLOH218xF/fBQwBEmP7DHUdc
         m2CrW94evmohCjkf7dXcL8mVCuClGMofKpodg4URHidRuV3Ma7epr0eb7CA2mdArtASi
         rn1mc/GZgi98cDnrrv8aOWEhwjUNO/egj1HE3jMEDOqDT+AfC6X7OW8JFuFjSfiexLUW
         4H5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/sVJ5iSKzdGNeBFDX7R3RcAFMpXgx0svJwjKK7cYX5g=;
        fh=RdCvjg2oTwcixaYC25+4Z5Rkd0/fsITNcrslxAK1K7Y=;
        b=fxV1gPLnUGJFkzdsaIo2ShJ/A9xCFslr83M/eTTk93DgLa/xHJZ4LQgoAKMbmYcfN1
         NXZUQOieETntHmnsh1UsWTAQevuS/7ggRt68QU72XtpNVxnVeNSgHawnZKVmRLh+stE/
         I+I8qfZKFjk4LbIxVp2d1Rz1mf8MW8NYwjZ5YpANwZXeyW2ZXMpGTZ1ImLykKj9a4h4o
         6oVM07bwuOlZQlvJM6U/qyHnNFE7YbNtC6N22kvTlqJ+Mu6LWrPbF1Cenucx6AFEP70+
         pgidfdcWUrQR+GmeMBrz56LXjPdvZN9a5CXBqvrVu9rrNf1H1sivZRvqm0Uqn9Grdc0T
         emEQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784646683; x=1785251483;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sVJ5iSKzdGNeBFDX7R3RcAFMpXgx0svJwjKK7cYX5g=;
        b=Oo0DK3LaSBpYHvnbmx618EkKtMnwC/26QLyL7oUVaAgbibDV1sz9PBDJOHvG4O5HWb
         bVIczyIswCWIMPOiwA0R3q5bsAY6xI+u8Vx4RSeIndnWf1ly3LVTrYGjhw0VPIi/F0/9
         YCyj46Eidixt28c49p8EVVZWXnJjLu3Urjo/NG3GSHCCS5a68jO9KDF3juix0PMTNDrb
         N8ZN2W0FJ+LOGj6RnG6i7GFvHcX7NqpFVKJIo+1bxB5O4VS2CS8S27bM7zv0e9vhUO7Z
         WxrnH7R04atvo4iZniSog8FesW17aEqcjBrFbaA2MPI38dXhk6drKFTRLGvfoQrUig43
         4J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646683; x=1785251483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sVJ5iSKzdGNeBFDX7R3RcAFMpXgx0svJwjKK7cYX5g=;
        b=sT0eNHndYF87IVssksfFagG574/8xXelym043tLikSI86zLgOjWcajluJBy8ZxMgYJ
         w0WuEoNE7JrR4bndLcP8d/SWm9EmjUOxhqm6Qh41taAE4kSTG+19jqZpDGFgA9EeKBNY
         Qbt/aKXy4RLlxf6vL8NraaKUG3IGpDhVzEy0q1MddAtZAMichcfACbvtRCXvTtd2plS1
         ZVKHWFA4UC2dHBfWiu2PEZvLXF9IEorY4pqcyawhXEwzNdFVvOakJvIitLvcYM2RpBDD
         yC45mVXRiBTKLVJum4yFLjbAn1m9XxLqDIw6+oVP1+VhoVyRA3t3acOn5cEmWkMruoh5
         WSRg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrk0jbjESP+WN3DaU1KJZrN9hiiH3n8BSlKJ0qnJVyBJvws6N2XCQ4dW/S8deimknONWnyR4tFG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTo0bXV00iEdNyz7EcgKSQtKFDKqjftArVEJegUu868W1P64rQ
	Y1Bo6OB337AHGweAHSTXtpaYXrcggYwYu7QDAzh6reC5CSK7TCWMRT2NHRkaZ0WYacBQvCXyFHO
	Ho40DNYPpFd9Yg1aIuUvdXfM6KyGmBe0=
X-Gm-Gg: AfdE7cmmvZPdVpsRqdhfOzd+9v+vrSf7/g70c6vQq4j0zEyR8zaGbd0Rs0sTiV2Ersq
	ioEXcKuUpNDVvRjTR+5qg+SxhhM4CkT1N5S0A++l/PHfJGEZGjmbzAwt2rH4kUlaD48tH+gQuW7
	EBJaVmor9mTJ19W2HBmXSUYIw8/dw5SBtrt8CnekFAdLQtJYBJmhdz0o1NO7K9bmutV+nId0tmA
	aDZ+zm2q5qZjpM7ocw+OMo4VWdVikWy67MbwSInRK8v8ilnISxjrBFoWkk=
X-Received: by 2002:a05:6a21:6b16:b0:3c3:a0cd:9d27 with SMTP id
 adf61e73a8af0-3c3ad66ecc0mr21127535637.26.1784646683254; Tue, 21 Jul 2026
 08:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
 <e0cc44dcc3efac7f354ce9a6eba1a9a87a1b096f.camel@nvidia.com>
In-Reply-To: <e0cc44dcc3efac7f354ce9a6eba1a9a87a1b096f.camel@nvidia.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Tue, 21 Jul 2026 19:11:12 +0400
X-Gm-Features: AUfX_mxZoKGz0zjXRIRk9EUOyjgsNzY0GmvxHJjHZRY3DRl5T2oCoNvbrDYpPsA
Message-ID: 
 <CAA+WOBvMAuuxiPec0wNVzPDDrr5jBwoYpd8r46VyKk6hZOVnaQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/nouveau: GSP telemetry via RUSD, and fdinfo
 telemetry exposure
To: Milos Tijanic <mtijanic@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Q7KIOYQKSCK76ZLZC2Y2WFMJ7ULMYIEW
X-Message-ID-Hash: Q7KIOYQKSCK76ZLZC2Y2WFMJ7ULMYIEW
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mary@mary.zone" <mary@mary.zone>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q7KIOYQKSCK76ZLZC2Y2WFMJ7ULMYIEW/>
Archived-At: 
 <https://lore.freedesktop.org/CAA+WOBvMAuuxiPec0wNVzPDDrr5jBwoYpd8r46VyKk6hZOVnaQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 21, 2026 at 2:39=E2=80=AFPM Milos Tijanic <mtijanic@nvidia.com>=
 wrote:
>
> On Wed, 2026-07-15 at 01:14 +0400, Mohamed Ahmed wrote:
> > A section that has
> > not been polled yet, or that the board does not support, reads
> > -ENODATA.
>
> Per hwmon/sysfs-interface.rst: "All entries (except name) are optional,
> and should only be created in a given driver if the chip has the
> feature."
>
> It feels really weird to have a bunch of things there that just give an
> error code when reading. Does anything else use this pattern?
>

The power_supply sysfs group does something similar to this but this
was something I was not sure how to handle and wanted more feedback on
in general. I went with this with the logic that it would be similar
to nvidia-smi's "N/A". The other alternative was going for something
like hwmon where we detect if it's supported early on by probing
everything and latching onto them and then unsupported stuff is simply
dropped, but that approach felt not suitable because of the polling
nature (if for some reason we couldn't latch onto something, it
wouldn't show even if it were supported).

Another alternative now that I think about it more is that we could
block for up to 1 poll interval if we get an invalid read, which would
eliminate the transient errors completely. This would leave the
unsupported items and in that case we could return -EOPNOTSUPP instead
which makes more sense than -ENODATA for everything. It does still
have the tradeoff with missing items having error files though, so I
am not sure.

> >   - The sysfs interface exposed here should be stable and valid for
> > nova as well.
>
> Agreed. Please allow a bit of time for us to review the uAPI for Nova
> and future GSP versions.
>
> >  RUSD is stable and only grows more fields with newer GSP firmware
> > (e.g., fan telemetry gets added in r580), so it is possible   to keep
> > the same interface as we use newer firmware
>
> Don't assume this. Work is underway to significantly rework the RUSD
> layout to make it extensibe in ABI-compatible ways, but there will be
> a single large ABI break compared to 570. This will happen when we add
> RUSD support to Nova, so it's some months out still.
>

Understood, thanks! The FW ABI is fairly insulated from everything
else in my design so the upcoming compatibility break shouldn't be an
issue if nouveau upgrades to that firmware and the main concern is in
the exposed uAPI.

> >   - amdgpu offers a single binary blob with all the telemetry
> > embedded in
> >    addition to the sysfs sensor files. This series currently only
> > exposes
> >     sensor files, but it is possible to add a similar binary for a
> > v2.
> >     This mainly offers a more efficient way to read the telemetry as
> >     clients would read only a few files instead of reading all of
> > them.
>
> IIUC the reason amdgpu does that is so you can take a self-consistent
> atomic snapshot of all the telemetry readings. That's just not how RUSD
> works, so we don't need/want it.
>
> We don't want to expose binary RUSD to userspace while it is unstable.
> Once it does become stable, the way this was meant to be exposed is to
> allow userspace to RO mmap the buffer and read the telemetry directly,
> with no syscall overhead. But I'm kind of loathe to do that even with
> the new format as it will require some parsing and that's easy to get
> wrong on the userspace side and still work in a given version, then
> break with an update.
>
> We can revisit this when ABI-stable RUSD comes, and then maybe have a
> reference librusd that does the parsing.
>
>

Noted, thanks! My original idea was 4 binaries (1 for each poll
domain) but your idea is strictly better, so waiting till then and
revisiting this is a better idea.
