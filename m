Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383BACD342F
	for <nouveau@archiver.kernel.org>; Tue,  5 May 2026 10:54:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3170B10E15F;
	Tue,  5 May 2026 10:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="i9tLm2KI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 99AD045DC3;
	Tue,  5 May 2026 10:41:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777977693;
 b=GBRZ08BVTilWn/lFOQIug7/ctykXtOY1n5Oh9x9n7k3rVfltuleVZwgoZ/1eR0yE9i6cB
 cVQnJhEqlX/O8tCHtvRLcXnHRgy67Ygq+chEc4O088r7Q9A6CV97N+tU/v1LZsSf3d0EtRt
 2lG41QQys30WzkLRjjNzdhM9+eRzPKxIzoKdGBzRmA324b5oXg7lsqi7aAY7udndyDTXLox
 4efi3/drR96JbHlEJ7lNc9vddPYADjTbaRTbOntEtKqBu7NkrIlehWGe0mA2HLVeYVwgKDR
 E/u2J7vrRzDck2h5tCEn6IskMFHKGMEMC7JATBCKop0lje9YUtb836cUdhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777977693; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=h801/7LXCD9kwNe9ms/6qfnOisrQsjId3Qwf+1jqbR4=;
 b=hbXwVzh1MDUQOQKMjKCpHf76gC3oppVRqLW8hXxygVZFQtdji5p3jwDsnRBl7q8A8CXf5
 dxxViX3q3Cdph2ykLFieYsrHP/GSrb7OnGr7DXwAf0Wo/IF644CzeJ/oMwovktuCxs8++37
 l3Xp5IrCX+iSyQ0DlJGFJ6avgbu67V9JPrvhgzzZQz72prM6pOCXN+YYZINcnRNdIm0koT0
 Un9rmk/0IVhHm04UkER9UrqYm+AfFNRKLUY0QILhFIhiHbjUUXNnm35cpQsU61wNIjUBVMQ
 3vdzrD5HKwzJUyPdy2DYhEbjAaStR45hcgm+k3XqV2gzhZHFhq560Q/Q2xxg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 029E245D98
	for <nouveau@lists.freedesktop.org>; Tue,  5 May 2026 10:41:31 +0000 (UTC)
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4786A10E10E
	for <nouveau@lists.freedesktop.org>; Tue,  5 May 2026 10:54:08 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-43ff19e54beso3548976f8f.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 05 May 2026 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777978447; x=1778583247;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h801/7LXCD9kwNe9ms/6qfnOisrQsjId3Qwf+1jqbR4=;
        b=i9tLm2KIOpV7gVNxee9Oz1l4uCTkGiC6OLD1GKUdHNKM0RuD76uHRIT8L7rMjQk9vN
         szYaWpcZ/PjnN+Zjo7PGA40nLLytWC6P7xuEvaRDh2nONmNYscGFeyWmRaS09BzwwaEw
         bYf5WHtX1vy5KDLXmEc7FeqMZy7NjtnvprcSj3jI9EuXTMgfEfOwzlos6tLplkZJZbS2
         AeSyhxCWjRexAB2hy1+PU+VTCtPbovbUc4/eo4rNP4VH/eDi2nhh6ieA0I2CQmwQe+xi
         QvGCxSdpIlWbVtpzkYlXos2OUsxaIgbuOtQSVsXItNGgCMr+/JMhpxgxzCw7tVQO1gNm
         LIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978447; x=1778583247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h801/7LXCD9kwNe9ms/6qfnOisrQsjId3Qwf+1jqbR4=;
        b=qsO9IkRB1r32jyr4gDvdv2lf2A94ODiVS1xox1aL9BQMTt3BAaGN+0uJS0nB6B87yq
         r5ub2dG2yRaaFfTdAb0McxG2cNz1Cf3ilrcLzEAKDBPewXTzxDp5XDiXnQLlfcjBVo7P
         0kIhBeX8muDisAT8OGuOWLTkW4e82qc6ciG/Sdr678/QVDKRvPLGuYB/VQmHHsSD0mrc
         7kjY47FDuTUCelB2jqvO4Ntsg6KRzQMWYOg6flC7f4maFL+HLLGzVpGXDm1+MfEgsNIi
         r/h5A7fLjWlB2kD+7X03swpxYhwLnO8d4MsuNnQslyQF7M0R2S5uUdliTleD92AM9PiF
         G/ug==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+7z9A+kVrU4PHkr61R/wF6g7e1yvDqcG/ljpfQy9b5l7dCYpXiDZ6bLhq36voJbOWSsQy3qlT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgiQZjMUx8mOYqu+oOKV5v1OzKUFVfIVSRcoGBaNsZ2pFDy6yw
	mFL+0YXCyCPiLaIKeizzvQBsX++JtqmOGndatk5wxMfslkkovsCoMnW6hEoWtbK319HZLV0MkA2
	1jFjOJhqah98SHO+rTg==
X-Received: from wrbdx9.prod.google.com ([2002:a05:6000:e09:b0:44d:9f32:eb86])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f55:0:b0:44a:1d55:1e20 with SMTP id
 ffacd0b85a97d-44bb2d37c7cmr23705090f8f.5.1777978446484;
 Tue, 05 May 2026 03:54:06 -0700 (PDT)
Date: Tue, 5 May 2026 10:54:05 +0000
In-Reply-To: <20260505092304.108262-2-laura.nao@collabora.com>
Mime-Version: 1.0
References: <20260505092304.108262-1-laura.nao@collabora.com>
 <20260505092304.108262-2-laura.nao@collabora.com>
Message-ID: <afnMTfVfGq_iLXov@google.com>
Subject: Re: [PATCH v2 1/1] rust: drm: add RENDER_CAPABILITY flag for render
 node support
From: Alice Ryhl <aliceryhl@google.com>
To: Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: GEVDN3EGPMZ5YDAZV23KKEPHY3WZFE3Q
X-Message-ID-Hash: GEVDN3EGPMZ5YDAZV23KKEPHY3WZFE3Q
X-MailFrom: 
 3Tsz5aQkKByUBMJDFSZIMHPPHMF.DPNOPVWFBVMJTUT.GSFFEFTLUPQ.PSH@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dakr@kernel.org, simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com, Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GEVDN3EGPMZ5YDAZV23KKEPHY3WZFE3Q/>
Archived-At: <https://lore.freedesktop.org/afnMTfVfGq_iLXov@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, May 05, 2026 at 11:23:04AM +0200, Laura Nao wrote:
> Add RENDER_CAPABILITY bool constant to the Driver trait to control
> render node support. When enabled, the driver exposes /dev/dri/renderDXX
> render nodes to userspace. The flag defaults to false, drivers can opt
> in by setting it to true in their Driver implementation.
> 
> This is then enabled in the Tyr driver, while it's left disabled for
> Nova for the time being.
> 
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Overall looks good to me!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  drivers/gpu/drm/tyr/driver.rs |  1 +
>  rust/kernel/drm/device.rs     | 12 +++++++++++-
>  rust/kernel/drm/driver.rs     |  5 +++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index e20a5978eed6..b7ae37ce3a1b 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -186,6 +186,7 @@ impl drm::Driver for TyrDrmDriver {
>      type Object = drm::gem::shmem::Object<BoData>;
>  
>      const INFO: drm::DriverInfo = INFO;
> +    const RENDER_CAPABILITY: bool = true;
>  
>      kernel::declare_drm_ioctls! {
>          (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, TyrDrmFileData::dev_query),
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index adbafe8db54d..e121303d88f0 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -80,6 +80,16 @@ pub struct Device<T: drm::Driver> {
>  }
>  
>  impl<T: drm::Driver> Device<T> {
> +    const fn compute_features() -> u32 {
> +        let mut features = drm::driver::FEAT_GEM;
> +
> +        if T::RENDER_CAPABILITY {
> +            features |= drm::driver::FEAT_RENDER;
> +        }
> +
> +        features
> +    }
> +
>      const VTABLE: bindings::drm_driver = drm_legacy_fields! {
>          load: None,
>          open: Some(drm::File::<T::File>::open_callback),
> @@ -105,7 +115,7 @@ impl<T: drm::Driver> Device<T> {
>          name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
>          desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
>  
> -        driver_features: drm::driver::FEAT_GEM,
> +        driver_features: Self::compute_features(),
>          ioctls: T::IOCTLS.as_ptr(),
>          num_ioctls: T::IOCTLS.len() as i32,
>          fops: &Self::GEM_FOPS,
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index 5233bdebc9fc..92cbc26ce11f 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -16,6 +16,8 @@
>  
>  /// Driver use the GEM memory manager. This should be set for all modern drivers.
>  pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> +/// Driver supports render nodes, i.e.: /dev/dri/renderDXX devices.
> +pub(crate) const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
>  
>  /// Information data for a DRM Driver.
>  pub struct DriverInfo {
> @@ -115,6 +117,9 @@ pub trait Driver {
>  
>      /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
>      const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
> +
> +    /// Sets the `DRIVER_RENDER` feature for this driver.
> +    const RENDER_CAPABILITY: bool = false;

I think it would be nice for this documentation to elaborate more on
what this feature actually does. After all, it clearly took us a while
to understand it, so probably others are confused too.

Something along these lines:

/// Sets the `DRIVER_RENDER` feature for this driver.
/// 
/// When enabled, the driver exposes `/dev/dri/renderDXX` render nodes to
/// userspace. The render node is an alternate low-priviledge way to access
/// the driver, which is enforced on a per-ioctl level. Userspace processes
/// that open the render node can only invoke ioctls explicitly listed as
/// usable from the render node, whereas userspace processes using the
/// master node can invoke any ioctl.
const RENDER_CAPABILITY: bool = false;

Also, I'd probably call this const `FEAT_RENDER` for consistency / to
make it show up in grep.

Alice

