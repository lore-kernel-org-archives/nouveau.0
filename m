Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5DDFD877B
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 14:12:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C80810E66B;
	Tue, 17 Mar 2026 14:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="umIhIeNu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0BC45451EC;
	Tue, 17 Mar 2026 14:01:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773756110;
 b=aK9g5dw36LRxwf7dMrueZ0cgAXpqTMkvjn4ijg7ZHXxz9Zq6SAzC7U8XmRuXcIKTzl6gQ
 7xn7T088WAZjYuF8oHraObXu6iUQsae30gy2WSVVAzbF+E7IymfF1WDbCkF1HiBnx92KAV9
 i/nG2781A9VGZp8Eys7CdOXsgCcmde11n8djBKu4jyrSC/xghHnHh/0y+drt2QuHex1Wrlo
 8WCSlJdaus23AnmtfP0cmrJX4kUjJynuK0Aeyv8Yo8NLFhTmMe85NCvhVGTzov6xsAFm+Fl
 9X1fzQANMQM1uTLXjnbxB4wrBLEwO5ZXHTpQkTGdXBKqKCABqCmgDj5aEXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773756110; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9CvGjSeRFT89tnDRFkPcN8HFNaThhk35oFd5oOqIkx8=;
 b=NUAQNRBItwR8bwcM17eZFuNrksBGDpgx+9LhgfFY7ziH9YPy3lJRn3BQzr85NA3PyORUF
 q9F8gLMohod1flCc1Dm6p5hlqCgAawnaRL/thVCq/vHAKmM3KBdDrIMImEgp9bERVyNoZJa
 O9ysvILHPulsRHBdYy6oAaJ9kWJgN3hAJFDzVJu0d30ZxQymkzrL58WZlUFwV5CwFBEFOQO
 8hnbuZOwhUR//XJBO+wyPApk4C6NeX7rNVIXVKziYpueNUpIiIQ/Cm+pY1gau6/Yp708+xv
 lLHjyH55zLRk0Phvk8dTwXJzaLWHP+39dxdo5i846jzIEzcyD6XiPs2W7h/g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2259D43446
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 14:01:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD40B10E667;
	Tue, 17 Mar 2026 14:12:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E33A9600AD;
	Tue, 17 Mar 2026 14:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83238C2BC86;
	Tue, 17 Mar 2026 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756755;
	bh=FscJp8fG6/l83AWDASulx8S69mr3uwYUZpt32gs0Ptw=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=umIhIeNuzdhtwil6ASCwtsWdIyDJpercr08h66jww0KNnwbqEWtwZQaOgYun3z3+i
	 SwVaFifNZFhgMZp2a48ixPM63X5gMGJz5J3mavRhy7WDDdkSTYkgN0Bixur4Xf17H3
	 3f/SYlzsUZuoVp9n6XKQUmnOoG3/BANhCRFshl8qW7i7ie5VI914e5uZGRO6HBLXvP
	 DWiOV6u55l3WYGVIAhd9ENbYnZQTT79/PEjfRKgkSepRy7E3ftM8bJqk7hfEg0Q7/h
	 G5GupwB4kDPRwQuoc7cDmzR373kdHiED+NWY9oK2S2u9/zPTA9wQSN9zqLsDDWv0ss
	 //XXE1AY+DWXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 15:12:32 +0100
Message-Id: <DH54AITP8HBY.PPSYM4FA2DZI@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
 <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
 <DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org>
 <DH46IKESDQ3B.2GEUC479WDK3N@nvidia.com>
 <DH47AVPEKN06.3BERUSJIB4M1R@kernel.org>
 <DH4OM17DJ47V.3NJG7G02O7P1L@nvidia.com>
 <DH4ZZD12V0R6.2G7IIL87QTK0S@kernel.org>
 <DH53MXEAVB0Q.2SXHCQTW8WG2Y@nvidia.com>
In-Reply-To: <DH53MXEAVB0Q.2SXHCQTW8WG2Y@nvidia.com>
Message-ID-Hash: DCGUKIQPS7OQX77QN3EW2FELCWERE7LH
X-Message-ID-Hash: DCGUKIQPS7OQX77QN3EW2FELCWERE7LH
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DCGUKIQPS7OQX77QN3EW2FELCWERE7LH/>
Archived-At: 
 <https://lore.freedesktop.org/DH54AITP8HBY.PPSYM4FA2DZI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 17, 2026 at 2:41 PM CET, Alexandre Courbot wrote:
> On Tue Mar 17, 2026 at 7:49 PM JST, Danilo Krummrich wrote:
>> On Tue Mar 17, 2026 at 2:55 AM CET, Alexandre Courbot wrote:
>>> We shouldn't be doing that - I think we are limited by the current
>>> CoherentAllocation API though. But IIUC this is something that I/O
>>> projections will allow us to handle properly?
>>
>> Why do we need projections to avoid UB here? driver_read_area() already =
even
>> peeks into the firmware abstraction layer, which is where MsgqData techn=
ically
>> belongs into (despite being trivial).
>>
>> 	let gsp_mem =3D &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
>> 	let data =3D &gsp_mem.gspq.msgq.data;
>>
>> Why do we need I/O projections to do raw pointer arithmetic where creati=
ng a
>> reference is UB?
>>
>> (Eventually, we want to use IoView of course, as this is a textbook exam=
ple of
>> what I proposed IoSlice for.)
>
> Limiting the amount of `unsafe`s, but I guess we can live with that as
> this is going to be short-term anyway.

Of course it is going to be better with IoSlice, but limiting the number of
unsafe calls regardless is a bit pointless if the "safe" ones can cause
undefined behavior. :)

>> Another option in the meantime would be / have been to use dma_read!() a=
nd
>> extract (copy) the data right away in driver_read_area(), which I'd prob=
ably
>> prefer over raw pointer arithmetic.
>
> I'd personally like to keep the current "no-copy" approach as it
> implements the right reference discipline (i.e. you need a mutable
> reference to update the read pointer, which cannot be done if the buffer
> is read by the driver) and moving to copy semantics would open a window
> of opportunity to mess with that balance further (on top of requiring
> bigger code changes that will be temporary).

I don't even know if we want them to be temporary, i.e. we can copy right a=
way
and IoSlice would still be an improvement in order to make the copy in the =
first
place.

Also, you say "no-copy", but that's not true, we do copy eventually. In fac=
t,
the whole point of this patch is to copy this buffer into a KVVec.

So, why not copy it right away with dma_read!() (later replaced with an IoS=
lice
copy) and then process it further?

I am also very sceptical of the "holding on to the reference prevents the r=
ead
pointer update" argument. Once we have a copy, there is no need not to upda=
te
the read pointer anymore in the first place, no?

>> But in any case, this can (and should) be fixed even without IoView.
>>
>> Besides that, nothing prevents us doing the same thing I did for gsp_wri=
te_ptr()
>> in the meantime to not break out of the firmware abstraction layer.
>>
>>> This is guaranteed by the inability to update the CPU read pointer for
>>> as long as the slices exists.
>>
>> Fair enough.
>>
>>> Unless we decide to not trust the GSP, but that would be opening a whol=
e
>>> new can of worms.
>>
>> I thought about this as well, and I think it's fine. The safety comment =
within
>> the function has to justify why the device won't access the memory. If t=
he
>> device does so regardless, it's simply a bug.
>>
>>>> I don't want to merge any code that builds on top of this before we ha=
ve sorted
>>>> this out.
>>>
>>> If what I have written above is correct, then the fix should simply be
>>> to use I/O projections to create properly-bounded references.
>>
>> I still don't think we need I/O projections for a reasonable fix and I a=
lso
>> don't agree that we should keep UB until new features land.
>
> I have the following (modulo missing safety comments) to fix
> `driver_read_area` - does it look acceptable to you? If so I'll go
> ahead and fix `driver_write_area` as well.

Not pretty (which is of course not on you :), but looks correct.

I still feel like we should just copy right away, as mentioned above.

> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index efa1aab1568f..3bddb5a2923f 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -296,24 +296,53 @@ fn driver_write_area_size(&self) -> usize {
>          let tx =3D self.gsp_write_ptr() as usize;
>          let rx =3D self.cpu_read_ptr() as usize;
>
> +        // Pointer to the start of the GSP message queue.
> +        //
>          // SAFETY:
> -        // - The `CoherentAllocation` contains exactly one object.
> -        // - We will only access the driver-owned part of the shared mem=
ory.
> -        // - Per the safety statement of the function, no concurrent acc=
ess will be performed.
> -        let gsp_mem =3D &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
> -        let data =3D &gsp_mem.gspq.msgq.data;
> +        // - `self.0` contains exactly one element.
> +        // - `gspq.msgq.data[0]` is within the bounds of that element.
> +        let data =3D unsafe { &raw const (*self.0.start_ptr()).gspq.msgq=
.data[0] };
> +
> +        // Safety/Panic comments to be referenced by the code below.
> +        //
> +        // SAFETY[1]:
> +        // - `data` contains `MSGQ_NUM_PAGES` elements.
> +        // - The area starting at `rx` and ending at `tx - 1` modulo `MS=
GQ_NUM_PAGES`,
> +        //   inclusive, belongs to the driver for reading and is not acc=
essed concurrently by
> +        //   the GSP.
> +        //
> +        // PANIC[1]:
> +        // - Per the invariant of `cpu_read_ptr`, `rx < MSGQ_NUM_PAGES`.
> +        // - Per the invariant of `gsp_write_ptr`, `tx < MSGQ_NUM_PAGES`=
.
>
> -        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_=
NUM_PAGES, inclusive,
> -        // belongs to the driver for reading.
> -        // PANIC:
> -        // - per the invariant of `cpu_read_ptr`, `rx < MSGQ_NUM_PAGES`
> -        // - per the invariant of `gsp_write_ptr`, `tx < MSGQ_NUM_PAGES`
>          if rx <=3D tx {
>              // The area is contiguous.
> -            (&data[rx..tx], &[])
> +            (
> +                // SAFETY: See SAFETY[1].
> +                //
> +                // PANIC:
> +                // - See PANIC[1].
> +                // - Per the branch test, `rx <=3D tx`.
> +                unsafe { core::slice::from_raw_parts(data.add(rx), tx - =
rx) },
> +                &[],
> +            )
>          } else {
>              // The area is discontiguous.
> -            (&data[rx..], &data[..tx])
> +            (
> +                // SAFETY: See SAFETY[1].
> +                //
> +                // PANIC: See PANIC[1].
> +                unsafe {
> +                    core::slice::from_raw_parts(
> +                        data.add(rx),
> +                        num::u32_as_usize(MSGQ_NUM_PAGES) - rx,
> +                    )
> +                },
> +                // SAFETY: See SAFETY[1].
> +                //
> +                // PANIC: See PANIC[1].
> +                unsafe { core::slice::from_raw_parts(data, tx) },
> +            )
>          }
>      }

