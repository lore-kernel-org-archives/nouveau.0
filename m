Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6DAFCA17E
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 19:59:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75C6910E5BF;
	Mon,  9 Mar 2026 19:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kWjL+J+h";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 997A844F80;
	Mon,  9 Mar 2026 19:49:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773085759;
 b=PYxn4Lc+HXXnaM7HoQQ6DV3so62/oDMqnh+veEWKQm2IANd6lU8lzBXSE5rruLWEGi89O
 BLJrRrcfTU665nnxrzhPGHeqU0dN8ri8JYRf56PDX6F/gXqsRsp4NX1+VujgMIu9prcYxI7
 NJqFiNka/r3ewdlEiD3YejcF9QGD6rdwpTzjkdSOtciXBC4k0Cq91Xsyny5yMI9MpDSXxLN
 LnPkFt2VR5fSu0Vb3AJwwaqhNYP0j4PlSWyH+IR4pmdYAfjNIhDX51WnoYrR4nyesoKLfx9
 PWtR5o9XHdSJlvlYQgNlRQQ7GeIrMvlrU4NO6dSyn4qy+Noh+ypRQXbWnJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773085759; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2FEkAy/fGIEHBXDyTtz90/EOGvP5hUac3es0Sn++hrI=;
 b=KNBtkgYl7PMZXXnbh/yGdgSNXdUO4IjcPAHClJE2ay2HJLYwuKWV/XGKMefg/NuN+EJJr
 UVp5yW5edtJFJm9YBdNzYAzB7tSwYklueNrXsyS7VNKec2j0n8OfQgkgjMafTtDbG0jIv2I
 Z4sKZGllGJdJOR/FmJpF9shAgipYb+6zOhQrrlSbtQEk3/WCay1AkFHwxqrUhqqN4HWfNF6
 n8sGOtrz4i7CyqJPwDkfaue445GViMSkNJu7tkq+TBpOWf2nMwZNNgrCH/q8t7fq6cDbyzL
 SF4lx6R9OWRV/SsCoEn8FCWDp0G5Wu7nCVcZ50uOvT3S2Oz5zJlARGJGFuqQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2EED044F77
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 19:49:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D29A210E598
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 19:59:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DED8401E2;
	Mon,  9 Mar 2026 19:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C144C2BC9E;
	Mon,  9 Mar 2026 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773086388;
	bh=Tl78mMV6soCSfLvpu1T1j4NlBTgw9RXXeBsUL7JJlBQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=kWjL+J+hqXGQQrNsT8O9Z/e4pRvMk57f6PYAXuGDM0Hl/txD4r+Kmel4j1SZ+NUH7
	 qG6Y801TUpLgCzHpoIkCgLI4KrwnKBU2vkRevcNdoihF1zPLFJqb9lg/XQv5dAVisi
	 G3K6hOewWaIP6eRVsBMSGW6q2+mPTZ5FJbCyGX74Q7SsvtAe6Nkpq0wcu/wXQI5/NU
	 eQkOzRgUd06XZEASsjm9om3duwd2WxoZ/tYCSw54QP4fjsJd3KM+wMWKX6abmu16MV
	 7L7jvA7QoLG+MUWteVk1BjfDNaZXZcuQjjxISx5Nta3B9JkdXf2+vsmhJkcRvTf335
	 aT8BQp6tk1CPA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 20:59:44 +0100
Message-Id: <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
 <20260203224757.871729-3-ttabi@nvidia.com>
In-Reply-To: <20260203224757.871729-3-ttabi@nvidia.com>
Message-ID-Hash: 7GOOMCS75IPOQH2LRFNLNGELJ4I3PSOF
X-Message-ID-Hash: 7GOOMCS75IPOQH2LRFNLNGELJ4I3PSOF
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
 mmaurer@google.com, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7GOOMCS75IPOQH2LRFNLNGELJ4I3PSOF/>
Archived-At: 
 <https://lore.freedesktop.org/DGYIO09FC9VC.5DQNYP82VVFC@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 3, 2026 at 11:47 PM CET, Timur Tabi wrote:
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u=
8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers=
.
>
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
>
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 74 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 11 deletions(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..d29a52f2a878 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -7,6 +7,7 @@
>  use crate::{
>      alloc::{Allocator, Flags},
>      bindings,
> +    dma::CoherentAllocation,
>      error::Result,
>      ffi::{c_char, c_void},
>      fs::file,
> @@ -459,20 +460,20 @@ pub fn is_empty(&self) -> bool {
>          self.length =3D=3D 0
>      }
> =20
> -    /// Writes raw data to this user pointer from a kernel buffer.
> -    ///
> -    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> -    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice even
> -    /// if it returns an error.
> -    pub fn write_slice(&mut self, data: &[u8]) -> Result {
> -        let len =3D data.len();
> -        let data_ptr =3D data.as_ptr().cast::<c_void>();
> +    /// Low-level write from a raw pointer. Caller must ensure ptr is va=
lid for `len` bytes.
> +    fn write_raw(&mut self, ptr: *const u8, len: usize) -> Result {

The method has to be unsafe as the caller has to promise that ptr is indeed=
 a
slice with len elements.

Another option would be to pass a fat pointer, i.e. *const [u8]. write_dma(=
)
would then need to use ptr::slice_from_raw_parts() and the safety requireme=
nt of
this function becomes that ptr simply has to be valid.
