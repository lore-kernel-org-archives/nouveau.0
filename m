Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4C6606A321
	for <nouveau@archiver.kernel.org>; Wed, 25 Nov 2026 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bI8w4cs2
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A668B10FD95;
	Wed, 25 Nov 2026 15:59:34 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 866A5403BE;
	Wed, 25 Nov 2026 15:59:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795622369;
 b=WZlvSVOfovOv1cNMYlURD4hnRE2X2GpEelGauqYihJTJvcEHm+aj3keZ9L7doKs/7j5FR
 Q6baDkJLr29iQhsz10ZOKijPiWEr0Cw8iz9ow6oLbyIDrxFjvP5FAw9bu8v/Abn3Z+3W/p2
 /8jrI4kygqk0SQL3pu/Ery/Gy+A37QG4dvDeG9dwAWmZeD7FoKDfimX9sAzrxqay2rfpERI
 XVLyIVuY6AK6bx2I1VUXcJPGdFFP3EpzLmFJeUAj2kjwoMZm6qXBdbvTkzLyRFhFcKKHF5Z
 JUVoNMpo7d1C2D16l0GSkFGTnzG+Vb7i2R1SBJbQWwWCaPIlGfQz2yQcVg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795622369; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gzngZnWeVoBNyK0vM3pG68W1a+Vad3Q5z/6OD0OHXJ0=;
 b=c7ITJoTRvquR1qCrHeb83u9xu0jGBxfr0VlLtPZDt/ndG1xxbmCMVQsL+IovHXcBPb7Jv
 50wIa8LO6reMcPpwkr/EGEBmE18yNiw991jtO83wTPltuvMVPHjI9TqozL5ZVv0u7dHg74K
 UAiHbkreV6JVsZsWwmg/uJ7p7Glx2Cu0VTMy1Wzj4PlZncyz2ST4EHJOt8ADTrlxsnHYtoQ
 NWc6qs3Fh/QZHgrkv9FQwjgF7G8HZgXnmWDR1pP16yO3wXk4ojLeBRTbSrz68KfEBxlhLih
 IEu3pB7KybwCorFjQah7qeMUZEDPK16O2YjZI6ej1i8ZuS1YnuOMWIemb/eg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none;
 dmarc=pass header.from=linux.intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 17BA940026
	for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2026 15:59:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFA7110FD4A;
	Wed, 25 Nov 2026 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795622361; x=1827158361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6UmMlg9QQaOS1il33yRRnEhhIt7G/Cm/OZEfblVd9Mg=;
  b=bI8w4cs2xwXOYx6+3S4eaHNiJlBFpe7edeQ9aDgjalVT6S4L/fOJrPRu
   A+f+w1B7bivnaVOMeZrle/C0s6HJTlr3JHwhFSOBNcfmJSGYwlo09Cyon
   PSiDTpuykLMzLoF+XvJ9l+Ei5Q4nBUAiwOpnVBIMfVklnSqM2QYo5FlrC
   zhptYWaZi/ZARwDnSjbhuZFhBYdH06ZgOZJMzPk8PFxvm/uaBbMxnoAji
   6ofxcZUmiS/CwdL/wprfXwECVGae5hU1boIkFe7EZj43or/x5lpTKSO5v
   Au4ibRydB8hlNzjuDdzfRFKdyq6UsnZnCgBy3/H8Nt7F0IpgjaU4KUdt8
   Q==;
X-CSE-ConnectionGUID: fQsPHp4uQLCPdqFJc4HO1g==
X-CSE-MsgGUID: wQzH1wV4QZ2SK0sER1yTAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4563336"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400";
   d="scan'208";a="4563336"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:41:49 -0800
X-CSE-ConnectionGUID: bLRALCkxRbmeWeMo+EtOZA==
X-CSE-MsgGUID: BsA3SM6yTjyQu96dFq5UXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400";
   d="scan'208";a="13698968"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:41:47 -0800
Date: Wed, 25 Nov 2026 17:41:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: M Henning <mhenning@darkrefraction.com>
Subject: Re: [PATCH v3 1/2] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
Message-ID: <awcBt3KD-j1sOzhE@intel.com>
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
 <20261124-nova-nouveau-gsp-v3-1-e1440479ded6@redhat.com>
 <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Message-ID-Hash: BRWFVJPKHD6H62E7XDDAWXW5IBUVUHEF
X-Message-ID-Hash: BRWFVJPKHD6H62E7XDDAWXW5IBUVUHEF
X-MailFrom: ville.syrjala@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: airlied@redhat.com, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, nova-gpu@lists.linux.dev
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BRWFVJPKHD6H62E7XDDAWXW5IBUVUHEF/>
Archived-At: <https://lore.freedesktop.org/awcBt3KD-j1sOzhE@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 11:43:59PM -0500, M Henning wrote:
> On Tue, Nov 24, 2026 at 12:50 AM Dave Airlie via B4 Relay
> <devnull+airlied.redhat.com@kernel.org> wrote:
> > +config DRM_NOUVEAU_BIND_GSP
> > +       bool "Make nouveau the default driver for GSP-capable GPUs"
> > +       depends on DRM_NOUVEAU
> > +       default y
> > +       help
> > +         Make nouveau bind to all NVIDIA GPUs by default, as it always
> > +         has.
> > +
> > +         If another NVIDIA driver, such as nova-core, should claim the
> > +         GSP-capable (Turing and later) GPUs instead, say N here; nouveau
> > +         then leaves those GPUs alone and continues to bind to pre-Turing
> > +         GPUs itself. nouveau can also be prevented from binding to
> > +         GSP-capable GPUs at boot with nouveau.bind_gsp=0 on the kernel
> > +         command line.
> > +
> > +         If unsure, say Y.
> 
> Maybe the documentation should make this option sound a little
> scarier? Right now all this does is break nouveau (unless you're a
> nova developer),. We really don't want users or distros turning it on.

I doubt people actually read these descriptions with any real though,
if at all. My suggestion for an option that breaks existing setups is
to mark it BROKEN, or at the very least EXPERT.

-- 
Ville Syrjälä
Intel
