Return-Path: <SRS0=o6m/=IQ=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529F6C433DB
	for <nouveau@archiver.kernel.org>; Thu, 18 Mar 2021 09:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DBC64F2A
	for <nouveau@archiver.kernel.org>; Thu, 18 Mar 2021 09:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DBC64F2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F30A6E8B0;
	Thu, 18 Mar 2021 09:26:28 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D976E8B0;
 Thu, 18 Mar 2021 09:26:26 +0000 (UTC)
IronPort-SDR: IHmKWcwvzs16LRLRytVyVkU4G9JfcWHId5yyNP6gHGgR8XjSSSdOiApLO9+ZmEelSPv+pEqkFX
 WJR4Azv1ELgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="253649880"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="253649880"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:26:25 -0700
IronPort-SDR: TZ44fD18g/sL8Z7J8wLVJN30TFDLKnUVAnNBB7gAJ/ZHPhDLI1TFJnszf5G3KOKr6f3GacXk8X
 yoKrQKFXDAqw==
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="372650203"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 02:26:23 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lMovk-0001oS-EC; Thu, 18 Mar 2021 11:27:00 +0200
Date: Thu, 18 Mar 2021 11:27:00 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Martin Peres <martin.peres@mupuf.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <YFMc5Iqzw3hw91iL@platvala-desk.ger.corp.intel.com>
References: <20210317224520.447939-1-lyude@redhat.com>
 <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Test
 32x32 cursors
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 08:39:01AM +0200, Martin Peres wrote:
> On 18/03/2021 00:45, Lyude wrote:
> > From: Lyude Paul <lyude@redhat.com>
> > 
> > Since pre-nve4 only has two cursor sizes (32x32 and 64x64), we should at
> > least test both of them.
> 
> This adds 36 subtests, which take about 1s in average. So the runtime is not
> significantly increased on the Intel side.
> 
> It also seems that Intel should add skips or fix the kernel to support these
> 32xXX format.
> 
> @Petri, could you get someone to investigate this?


Ville, J-P?


-- 
Petri Latvala



> 
> In the mean time, here is my:
> 
> Reviewed-by: Martin Peres <martin.peres@mupuf.org>
> 
> Martin
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Martin Peres <martin.peres@free.fr>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Jeremy Cline <jcline@redhat.com>
> > ---
> >   tests/kms_cursor_crc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index 0be8f7f8..c70c4a8f 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -683,7 +683,7 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
> >   	igt_fixture
> >   		igt_remove_fb(data->drm_fd, &data->fb);
> > -	for (cursor_size = 64; cursor_size <= 512; cursor_size *= 2) {
> > +	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
> >   		int w = cursor_size;
> >   		int h = cursor_size;
> > 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
