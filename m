Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19089F47CCD
	for <nouveau@archiver.kernel.org>; Thu,  5 Mar 2026 20:22:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A464A10EC78;
	Thu,  5 Mar 2026 20:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPkmB1Li";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5E56244EF1;
	Thu,  5 Mar 2026 20:11:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772741506;
 b=ssJp+7HYk3L3qLkegyWjvX1o5vhAjuMN1WOHgrMg9hgoMpSLS7CJriYL2S70NdsjH3ZjK
 9lh177j4SXNK75S1Nq/qkv3c2ZNLLhA2TKhfeabrLIerxnPcLGUOKdClSpSedLRASOkR1KJ
 7x5GAnn64OqZ4PzUzfq9MjaE1Yo4oRISRzIGJly4cKMw6RnrOlqlNeAwYBRUbN6oxuwcUke
 7mpAm/HhMOgE6FR7bv8e/u5cLLh0U5eZ9B1OjwIR4C8NNWuvcxnq1DnXu5PfNPU4FHdSs8/
 jK/TGM0vPxfvFPrTBUea0UEG2Lv73hz9J8mGWqZDbhFwXPB5OCajEYNtkSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772741506; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qNjzhhJA95lfgheXfLjVOJq1WVHg6sGeTKn/+LnWKdo=;
 b=AJiRSCTJLfjQtgscTh8k6Mmd88ve9YLQpvWGgKKxZ76UIK6iilHN5jUlgjFfFNFiqXk1t
 7pqNnJCng7ETE9v32Sl2V7xWKZIuOKVC0rGara0Q7uJN+A98o3ii6KYkNro1LIRIpKbFOAm
 oxoAVg/rJ0FxbyLNzhUQT3cqr1IoSyYz7Wvd2Kr5a5kPSwIigiEx7Y+G4+AUS4IcJrenwXm
 Ma/GHTPrEGDDoo+cJEG7jtA/mZV4a8xAAAO/YQTgZHoz604WAtRVNQTJwF1aHv4MqulLa8O
 lL9styEa9y2i5V2aGZT14YOacmfhqEqE7aq8fGrOBP9YVrzgTQw99UOo11Vw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A76044E96
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 20:11:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EC13610E1AA
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 20:22:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 556EF444DE;
	Thu,  5 Mar 2026 20:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C1BC116C6;
	Thu,  5 Mar 2026 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772742126;
	bh=p9SLojOBSqlkRosyKhEeBokvTC98E7rdJMjHdKAKKC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPkmB1LiQs7gd5CVa7SJaO+vqAmkZ+r/LcL1KDErwRBukeywIr5d29izyTu5Je0ov
	 1Cx/66pYIe09lg2rYM2/S1EuB3kL80U5/ziuVpp/3Lxgj4c3sIxSDo2H8y+lmExEEv
	 JtTPDmhfkUhaAtgeigLgibFwVc/WgSUPIFKnGPRe/G/MDpSwfDXzZ5fp7gyYIfZ/sl
	 XQ0mM2mAOY/g6aCBrfTzjy1/uORdW9bUNontWvjBc5J/jjeueS5oXHTjYz84tT8jEW
	 kLxzP1rOACc1UIZOggkexLO3B8bChNTBj8ptCs2w7HgCe67IHW2Vof0c6mX2nKqPoE
	 Hx/E1j/sPl9wA==
Date: Thu, 5 Mar 2026 12:22:03 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Xi Ruoyao <xry111@xry111.site>
Subject: Re: loongarch64 objtool warning with LLVM 18 in Rust object file
Message-ID: <6h2zrsl7xsjd4pa7e7cgtrprez55f2eioc6c652fwnxmadrr72@qe5g6yf7otrx>
References: 
 <CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
 <9bb8b1ae61ccebec6460e2b271cbcc709aba9765.camel@xry111.site>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bb8b1ae61ccebec6460e2b271cbcc709aba9765.camel@xry111.site>
Message-ID-Hash: L5RYNC272LKDN53QG3RJWUT3NNQVRH4V
X-Message-ID-Hash: L5RYNC272LKDN53QG3RJWUT3NNQVRH4V
X-MailFrom: jpoimboe@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, loongarch@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L5RYNC272LKDN53QG3RJWUT3NNQVRH4V/>
Archived-At: 
 <https://lore.freedesktop.org/6h2zrsl7xsjd4pa7e7cgtrprez55f2eioc6c652fwnxmadrr72@qe5g6yf7otrx/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 02, 2026 at 10:22:20AM +0800, Xi Ruoyao wrote:
> On Mon, 2026-03-02 at 00:42 +0100, Miguel Ojeda wrote:
> > Hi objtool & loongarch,
> > 
> > I noticed an objtool warning in a Rust object file for loongarch64 in
> > mainline:
> > 
> > drivers/gpu/nova-core/nova_core.o: warning: objtool:
> > _RNvMs1_NtNtCs3LxSlPxFOnk_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x238:
> > return with modified stack frame
> > 
> > From a quick test, I saw it happened only with older upstream Rust
> > binaries (1.78.0 to 1.81.0), so I suspected a switch of major LLVM
> > version, and indeed with 1.82.0 LLVM 19 is used instead of LLVM 18.
> 
> /* snip */
> 
> > While with LLVM 19 I get:
> 
> /* snip */
> 
> >     lu12i.w         $a2, 1
> >     ori             $a2, $a2, 0x870
> >     sub.d           $sp, $sp, $a2
> >     ...
> >     lu12i.w         $a0, 1
> >     ori             $a0, $a0, 0x870
> >     add.d           $sp, $sp, $a0
> 
> /* snip */
> > 
> > So I suspect the stack pointer is not getting tracked properly and
> > thus the mismatch. Is it a known limitation for `objtool` on
> > loongarch64?
> 
> It indeed looks like objtool cannot handle the sp update using a scratch
> register above.

Indeed.  And I suspect the scratch register is only needed here due to
the extremely large stack allocation?

We could teach objtool to handle this situation, though maybe some kind
of warning is actually a good thing since it found this stack usage
issue, albeit cryptically.

-- 
Josh
