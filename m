Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2789CCC6B1D
	for <nouveau@archiver.kernel.org>; Wed, 14 Oct 2026 02:22:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8657B10FA84;
	Wed, 14 Oct 2026 02:22:40 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8861448A94;
	Wed, 14 Oct 2026 02:04:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791943444;
 b=h8V0MBk+39341Pu9dx8adLEbdOV2EUWkkLL/4QVpXnwwJdlh9cgzXC0A9kCf7aKQCYEIA
 nqoP135Hd6mE8iyLMLtZRPehJf6nSXB6i4zOumK+/lBnoFUPaJ6BbDnStagiFGprf9CIyT7
 68ahSTsCRt4KS7XstT05RtMsccAQzuGZ9j2Sg0DyFUk0NtXXreicXreaq01/YnEPC6ntHW1
 wo5Xf9n/GD6an0EGhqYTscgmzUdShCjysybSaLMWV5ZpBQ4P1RrbGn5TGiIgASaza/bmult
 G4+frKepUIg3izF8lK5ZcIo5/rnU2UXqQNBbw0x7Kdzix4WK5Fa1x3E7MmNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791943444; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
 b=rqJPeEaFdt/KmqDFOycEyCkvitGpbTgQFAvQpInqOAleA4qvQZyFT9CZsbBixuLIOXuml
 rlXw/0CTaif6/eiR7XlY8CFJc57qpE6qHJyoagHBZsMO/wptoR6D9EovzZR9YaOXyremg8N
 e5h8gRriPgBSHlzNlUWfSPx86keofJH86/rgTDIeKq55oJ/gAZwTIqYqI8NhIFpwiowUyw9
 OAGyaBS5/W4ARfyeEJUJW4X3jYTWZ0JGKtT+ObjJvvzilX5eUJoQTGozmnmzKFjjgrVHGpi
 4BbY/E/6jNKXrVPjm0De+nwlzf+r9/PjVVG1nWKfRQfRxBZskaCdu8auWuBA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 568DD46ED7
	for <nouveau@lists.freedesktop.org>; Wed, 14 Oct 2026 02:04:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCED10FA7C
	for <nouveau@lists.freedesktop.org>; Wed, 14 Oct 2026 02:22:32 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5ba41ea31ccso4080958e87.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 13 Oct 2026 19:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791944550; cv=none;
        d=google.com; s=arc-20260327;
        b=m6D04SnwRRQmxRUC/jwC/jh7o/12MnsoH+VmjH2agyhhEKw+n84W3kOfOqV97ZlAts
         2dek1MlIYuY4BezfU9Je8ao4wFdURQELJ8nZ5+9HWXk0hi5fUwVYlTbN/eL3aivFMlF4
         z0X3EQqemS3RRHS4sNMacNBalnvRMo3n7aiNItqVvWwgN8zHIMgdE/sGzSl4XwDPKsg+
         U3SN2xHV7cYq9D05Y5gOEkXwaR7+X0gE1/kLeHKWdnV9/1BlzBJClB6bZDlWjUKrB+8B
         rQye6NhbxJDVZKRzLVMUvu6Oag3qmKxO3S0+d4ILDg04NiF/GAZzniQQBmKcZb+YQeuD
         8Afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        fh=W9yInHQkhGEWtZGkmXhKzlRkNg6BCZhWph/GEO3fAog=;
        b=NkLUaslBNkXY6BEWYlhyiLJ3yL7bb8UJxZV2m+kZyy2yTuEvF/ef2+zzHLQiIJ7lwu
         MkQH+2U15C0YJQdmNC8AazeS1XRJU/l/oo8e/OLesa0wgsineE1aFDJO5I2FWSBNkAPX
         QENj3egEBUy3vOKCflgxjnpifN2dPfdIJcEfSnDlbtP+ax2Y2JAP4fouJP1M8Cq0r6sn
         IDIfRFyHHbXOjj5xvwbwKB3WGZlCArDOQ5Gxx74jWbx05oNtJwzvZIE9Ukvkql+mhgX/
         6FZApkyDb6n/hAz0GEVGMo/6KNow+TCpjc/5a54pJypu736mwtfmUKyAGV1MndjNq9FU
         dh+w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791944550; x=1792549350;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=G3PpvTzjtaoKCeq5EhhWxatuU1IBp3lTY1LU2Yldv2HyWxcRkRP4/db17mt4b8Ff7J
         hHRIRxGO+j79Z02/LMePMp29jC8Wy5I+5C5UgmxQH6DvA45veFeV80QXk6a20GyZn//q
         X0xi8tTjJikPslEbfL+7REhke3f6BOwvPzHYxySft56hjQFQ+9ey5fgrcz1rLWhX3cml
         jGK/4d4LixJ6G38OYNBEpL4Ybcf754Zw7sgLh9KkSVQgGwxAuBvle8iftaLy0jOFq0j4
         ix/ijGZKQxGRsPgOkRzXnsg15c86kalku0hawAxQaQPFoZLEbixyPfTMR73Y/inhh8W5
         Lf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791944550; x=1792549350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=Xnzn9E5OAU4v8dEuQx7nhFEQsCdlEx+OrYvWaXCB8GfP3K4AchetbP1zg5e3OgHWp0
         L1cfK6aizplKpe/PNBoykg0EMVV/x0OtQG91jaJ4CcZ7wjYLQwgN8rSYZ2SFIHdEGgI1
         cw7U/JIOZm+O59RsgABMnksjXC1iFCjyjMomJ6P+GcIl+BvuPEvwg8wt958cNG2YvenV
         jwvHEPfnxOmKgiWbp2zZcJLZbfJ3yeza+StrUOg5y4kUlVVBs+6RyxW2KLVr0neE7RrO
         hFnvmjHI7LhSiNKEzPdKUP45MokknVSmEzoyi7mfBH/V1EspwVO34yYdpVQ8L24JlY9R
         n9eA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxvMjw9QSV9u5OnriHW2OSdYOQYAiljiAfjraLa6w0rDVGt5lW52mr+f8oCgg29ML9YsDQ/JGHg@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJYzOSPwQvELm+qgHaEDSSj07BHbLMEGxgHeF5vU+/JvFhqlaUN
	/5tljXLLgs5cpKHQAUTlTLCrtYBeOt7SVp12XnA9fUAWUsdKT2Wtf+IFaaoXjSsnDyo4Up5yqnq
	IA+xHiQ85lVTFsQtqjvfVYYmHPAyCdQg=
X-Gm-Gg: AYBFou1xhyeBKT9X8RGTD10Vmp/bQf3dryambF2O0uKPJucFHHITw3jDRNt3HzPxUpF
	VThADdM55YDjy+QLNdEuT7v6BaRGXAky7rhBkyxjE+fMHNg4Dn5qQhNp3AG4v84n1VIxRR3dnUG
	h/x/lnfu7s+tzVzNENc3Bo3aC51hJTuZg03BLCWXE5vQEbb+HFj5//nS7R3q/Tt9UCme3ITuvRZ
	DuAPsxZnJa1gacklMK+M28CIcL1MyTi2Ewy5CpIVhHUr6oeS8WTxT8nNTfv9vvC8e57KcGMertj
	9szBUZebAbuJNwJQ+FSJHP4brtJQEqZdp+aMbYyTRSA8Y1bKMj6vbS31/Tz94//oo0h8Z3nURFs
	2GWd86t6ERm3AsNDf7t+wLBA2MjPMMu5cvhonpXVDt4c=
X-Received: by 2002:a05:6512:224c:b0:5bc:f02e:9b2e with SMTP id
 2adb3069b0e04-5bcf02e9c70mr3265873e87.9.1791944549826; Tue, 13 Oct 2026
 19:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261013145210.103565-1-sashal@kernel.org>
 <as5R_xrDv4eVPdtz@orome>
In-Reply-To: <as5R_xrDv4eVPdtz@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 13 Oct 2026 21:22:18 -0500
X-Gm-Features: AclHuK887CDwAvm9A-A5lvdpxpUm0jxZaYwqU9DtjoFJ0z65i4nraDiY5z22Q4Y
Message-ID: 
 <CALHNRZ9zhVaz9UeYJTFRph+0JMM8x+5it_Xv7Qhy5f2kh12MDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
To: Thierry Reding <thierry.reding@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ORYDV3S4LWYVGYJSVFVOBNEZN2LJLMBI
X-Message-ID-Hash: ORYDV3S4LWYVGYJSVFVOBNEZN2LJLMBI
X-MailFrom: webgeek1234@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Sasha Levin <sashal@kernel.org>, Diogo Ivo <diogo.ivo@bootlin.com>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ORYDV3S4LWYVGYJSVFVOBNEZN2LJLMBI/>
Archived-At: 
 <https://lore.freedesktop.org/CALHNRZ9zhVaz9UeYJTFRph+0JMM8x+5it_Xv7Qhy5f2kh12MDQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Oct 13, 2026 at 10:46=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> > GM20B needs both its reference clock and the fuse clock while it is
> > powered, so allow "fuse" as a fourth clock after "ref".
> >
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Aaron, Diogo,
>
> I'm fairly sure I remember at least one of you mentioning that GM20B
> wasn't always working reliably. Would you mind giving this series a spin
> on your devices to see if it fixes any issues you were seeing, too?

I've got a t210 nano a02 that essentially hasn't been able to load
nouveau since I've started my Android Common Kernel effort over two
years ago. I think it came up like twice when I accidentally left it
boot looping for days and forgot about it, but never when I wanted it
to.

With this series, nouveau loaded properly 3/3 boots. I'll keep this in
my 6.18 kernel fork and see if any of my t210 devices hit the probe
hang and will report back if I find a case this doesn't solve. I will
also point other people I know with units affected by the issue to
this series.

Aaron
