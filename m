Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1219BFEFB56
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 14:50:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D54D710EBB0;
	Fri, 27 Feb 2026 14:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L915gu6C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B6E0E44CAB;
	Fri, 27 Feb 2026 14:40:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772203235;
 b=AVSyTRHmGVI+TXRCC28jqtEknrUPAydFgTI4MmHNThG5L0nzb1SObqm0blUFRhky7XWwi
 oaRKDCjkFUQSSguX4XwFDf+iDkcVQTAB4Q2aY1JRciFRP0IVPBHoRXCorCikMYOBG4H4ozG
 3ltjAwHW+e4vO0WGqW2olTJ8eHZvHNLPuLkXqRtspcRLfHEGVMjo0o1u4u0lxc+aryqAqk4
 EDFtHbijs0XZadEWODwx1BEflyEf/+l1k+rkKc0EcIe5QYdrn8cc23PP2cVoJZVMBVixGRk
 FpKCYOHFeLjxxrmgIuofXcxmjsZsRAPLFC2CIpLXcZpBQ8lSHV1sTP3J8SHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772203235; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CUbJ26t2M7UwXJGsOi3RgfKyJqzgJBooWg3MSsFG8os=;
 b=SVcqUQFydBcezsRIYehiPCoPaTxRaNK2RLvtpAJgo2Ob6R/1hQNU4EBkcnyEhymRYYvOt
 ePBEUR7ck6Uepd7nxBCO5JdiPheh8qtKZkkTGh5yLzNa8kgjaNDktfYqNO8+xe3MEvcwaL3
 2UJPlX05t0/QpytsGG2iirLo1Bv/5Lt0v9tjSyjsagzvR6DvdiApMW0pjyafFJGjmLL5g39
 D0zijLkd2RfAYx04fJ9Rlx/wK0Tl7HUh8W3aCVixadYkB4nP46DIPsqJ4H6rmktXbJpjPyv
 kL04MGY2UKrEyY5k6oTLqxeIsll0OGfSyOgu51yfZEiQHwkvEWqXAMWJMedA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 744DD41C68
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 14:40:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 560CD10EBAC;
	Fri, 27 Feb 2026 14:50:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E0B960008;
	Fri, 27 Feb 2026 14:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B284EC116C6;
	Fri, 27 Feb 2026 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203841;
	bh=CUbJ26t2M7UwXJGsOi3RgfKyJqzgJBooWg3MSsFG8os=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=L915gu6C5BExF1dsxUKrl0rJsrNDQ/KlGczZKBLI+m7Kn7Xt/vIXGSI0RdEF4uSKV
	 th2Z5740gB6JifhnGTheY/Djgym1/t8dEQJXNGdFuGiYIFENfPtU543dgwh2nWcAg7
	 1AtJHFtUk0sIbGfvi6sY78ShbvbnfJwDTB/ing5ko8w/TVXLyVoVzg6hENVS8mRmeV
	 63xAbfBgwUwoEhD7aMwoAxbYUgkHrYy123VqiI/BZ8evP8HDtR+4VFFW8KDNfVLaYH
	 Kc0idTSa0ivcZGngIUv1s1mMB33ZhrXWkrZFklXsH4IC8ps9Ea/25r4EDkoujlpJEN
	 +c0li+VaaOkYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 15:50:38 +0100
Message-Id: <DGPTTVV1OUVI.2TKQUTUIOZ51G@kernel.org>
Subject: Re: [PATCH] drm/nouveau: Test for imported buffers with
 drm_gem_is_imported()
To: "Thomas Zimmermann" <tzimmermann@suse.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227133113.235940-6-tzimmermann@suse.de>
In-Reply-To: <20260227133113.235940-6-tzimmermann@suse.de>
Message-ID-Hash: F4TXMLE3YH5HZV7JVXGMGK7KQ5K5T6TL
X-Message-ID-Hash: F4TXMLE3YH5HZV7JVXGMGK7KQ5K5T6TL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F4TXMLE3YH5HZV7JVXGMGK7KQ5K5T6TL/>
Archived-At: 
 <https://lore.freedesktop.org/DGPTTVV1OUVI.2TKQUTUIOZ51G@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 27, 2026 at 2:31 PM CET, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The test itself does not change.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: nouveau@lists.freedesktop.org

Applied to drm-misc-next, thanks!
