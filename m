Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61351091914
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 09:31:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 35D8E10EAB9;
	Fri, 20 Mar 2026 09:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="qh8qePOs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D0C234522D;
	Fri, 20 Mar 2026 09:20:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773998427;
 b=EL5HVNrh7bfFppbkfoAe5sYrJ6wLFULryo8sYAAnz6KyZUPpzpTaLA9iaRx4JquHbyngq
 59mLrf4a7nyij5zQ8gjBmUgbWK7btrYXuCKNk3oV1C7+qkMKo0HTEqvsAX+8NgH15w5X7gV
 2d8ehRdHZ1sqPCn0oVZ08w394FxgPQNdv+WRsehZ9XYahYnPg93clenpujQm9fT6m8dstuw
 rqmCSm3At2JTH1ebyFSuWtgTDBP+iKJ+4Wcl0IHV8LwXIqx7lO2dpmwZk8ADqQcEixguD6J
 zr8yibmnL7EZvUgScpHlbkXAAMsOpUG5wgzX2nV1bBgOTuBbDDQvY2TTvf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773998427; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xs00Ae6CSRREPsQBOXwWf0LLHKgACwtESmzoMjwMv4U=;
 b=TdVr89C8yzDCW56aa0vbVmHfyNVWYkSwJjxGlEI+VExaSB5A+G+1YaTqFB0Y7aqSt9u3C
 mUSCEASwx5VhbRB/ZgVyTvT1ePJnpUnoH7R5lOxxmXPTAaos/DiVq2J/NXq7u3umOdWFVSn
 XBznK+KJmb3skAfCaQwsY/BCi2osfHHLk+f8uYQNTDdA03DbTNLYG0Kydgf/joQQNbfqs1V
 uzfGPoE8mvWDngke9qAOltlBfXMIHjdEvN7afbrWSC81tT1DFjAC8yoP8L1mULllKH5EA0/
 KbMY9GY0Vd8j0CKIswjVGyHEvwU6doVMFXiZLNZdU2WDB0TPGVR6Mx4MdiQw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ABED643FC1
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 09:20:23 +0000 (UTC)
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AEA2410EAB5
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 09:31:17 +0000 (UTC)
Message-ID: <897e576b-af3f-4764-9477-d7ac9bd26aa4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773999075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xs00Ae6CSRREPsQBOXwWf0LLHKgACwtESmzoMjwMv4U=;
	b=qh8qePOskK45TrzRAJdCBb+6Y/WKCNAD8ALXoES/18nlXifZC9eQoCxhZ7AuOmsWzSJrfI
	2BHQqfavAtWPtO5rmiAZExPp1TYgAAA96dK1r0RPY1ufyj9lD/Hz6x+tmtSZoAP+iUGj96
	HWqVM/WhUKi3/KM7B1MFSXAdfvpixPo=
Date: Fri, 20 Mar 2026 17:30:56 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v9 7/7] rust: drm/gem: Add vmap functions to shmem
 bindings
To: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <20260316211646.650074-1-lyude@redhat.com>
 <20260316211646.650074-8-lyude@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260316211646.650074-8-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: A6N2OK7HYWEV2HOBO4JXGVI6RTJGA3T3
X-Message-ID-Hash: A6N2OK7HYWEV2HOBO4JXGVI6RTJGA3T3
X-MailFrom: alvin.sun@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A6N2OK7HYWEV2HOBO4JXGVI6RTJGA3T3/>
Archived-At: 
 <https://lore.freedesktop.org/897e576b-af3f-4764-9477-d7ac9bd26aa4@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 3/17/26 05:16, Lyude Paul wrote:
> One of the more obvious use cases for gem shmem objects is the ability to
> create mappings into their contents. So, let's hook this up in our rust
> bindings.
>
> Similar to how we handle SGTables, we make sure there's two different types
> of mappings: owned mappings (kernel::drm::gem::shmem::VMap) and borrowed
> mappings (kernel::drm::gem::shmem::VMapRef).
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V7:
> * Switch over to the new iosys map bindings that use the Io trait
> V8:
> * Get rid of iosys_map bindings for now, only support non-iomem types
> * s/as_shmem()/as_raw_shmem()
> V9:
> * Get rid of some outdated comments I missed
> * Add missing SIZE check to raw_vmap()
> * Add a proper unit test that ensures that we actually validate SIZE at
>    compile-time.
>    Turns out it takes only 34 lines to make a boilerplate DRM driver for a
>    kunit test :)
> * Add unit tests
> * Add some missing #[inline]s
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>   rust/kernel/drm/gem/shmem.rs | 358 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 356 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 3fab5d76c197b..5254338bad394 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -2,7 +2,7 @@
>   
>   //! DRM GEM shmem helper objects
>   //!
> -//! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/linux/drm/drm_gem_shmem_helper.h)
> +//! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/drm/drm_gem_shmem_helper.h)
>   
>   // TODO:
>   // - There are a number of spots here that manually acquire/release the DMA reservation lock using
> @@ -21,6 +21,11 @@
>           from_err_ptr,
>           to_result, //
>       },
> +    io::{
> +        Io,
> +        IoCapable,
> +        IoKnownSize, //
> +    },
>       prelude::*,
>       scatterlist,
>       types::{
> @@ -29,13 +34,22 @@
>       }, //
>   };
>   use core::{
> +    ffi::c_void,
> +    mem::{
> +        self,
> +        MaybeUninit, //
> +    },
>       ops::{
>           Deref,
>           DerefMut, //
>       },
> -    ptr::NonNull,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>   };
>   use gem::{
> +    BaseObject,
>       BaseObjectPrivate,
>       DriverObject,
>       IntoGEMObject, //
> @@ -217,6 +231,88 @@ pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
>               _owner: self.into(),
>           })
>       }
> +
> +    /// Attempt to create a vmap from the gem object, and confirm the size of said vmap.
> +    fn raw_vmap(&self, min_size: usize) -> Result<*mut c_void> {
> +        if self.size() < min_size {
> +            return Err(ENOSPC);
> +        }
> +
> +        let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
> +
> +        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reservation lock held
> +        to_result(unsafe {
> +            // TODO: see top of file
> +            bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_mut());
> +            let ret = bindings::drm_gem_shmem_vmap_locked(self.as_raw_shmem(), map.as_mut_ptr());
> +            bindings::dma_resv_unlock(self.raw_dma_resv());
> +            ret
> +        })?;
> +
> +        // SAFETY: The call to drm_gem_shmem_vunmap_locked succeeded above, so we are guaranteed
> +        // that map is properly initialized.
> +        let map = unsafe { map.assume_init() };
> +
> +        // XXX: We don't currently support iomem allocations
> +        if map.is_iomem {
> +            // SAFETY:
> +            // - The vmap operation above succeeded, making it safe to call vunmap
> +            // - We checked that this is an iomem allocation, making it safe to read vaddr_iomem
> +            unsafe { self.raw_vunmap(map.__bindgen_anon_1.vaddr_iomem) };
> +
> +            Err(ENOTSUPP)
> +        } else {
> +            // SAFETY: We checked that this is not an iomem allocation, making it safe to read vaddr
> +            Ok(unsafe { map.__bindgen_anon_1.vaddr })
> +        }
> +    }
> +
> +    /// Unmap a vmap from the gem object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller promises that addr came from a prior call to [`Self::raw_vmap`] on this gem
> +    ///   object.
> +    /// - The caller promises that the memory pointed to by addr will no longer be accesed through
> +    ///   this instance.
> +    unsafe fn raw_vunmap(&self, vaddr: *mut c_void) {
> +        let resv = self.raw_dma_resv();
> +        let mut map = bindings::iosys_map {
> +            is_iomem: false,
> +            __bindgen_anon_1: bindings::iosys_map__bindgen_ty_1 { vaddr },
> +        };
> +
> +        // SAFETY:
> +        // - This function is safe to call with the DMA reservation lock held
> +        // - Our `ARef` is proof that the underlying gem object here is initialized and thus safe to
> +        //   dereference.
> +        unsafe {
> +            // TODO: see top of file
> +            bindings::dma_resv_lock(resv, ptr::null_mut());
> +            bindings::drm_gem_shmem_vunmap_locked(self.as_raw_shmem(), &mut map);
> +            bindings::dma_resv_unlock(resv);
> +        }
> +    }
> +
> +    /// Creates and returns a virtual kernel memory mapping for this object.
> +    #[inline]
> +    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, SIZE>> {
> +        Ok(VMapRef {
> +            // INVARIANT: `raw_vmap()` checks that the gem object is at least as large as `SIZE`.
> +            addr: self.raw_vmap(SIZE)?,
> +            owner: self,
> +        })
> +    }
> +
> +    /// Creates and returns an owned reference to a virtual kernel memory mapping for this object.
> +    #[inline]
> +    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMap<T, SIZE>> {
> +        Ok(VMap {
> +            // INVARIANT: `raw_vmap()` checks that the gem object is at least as large as `SIZE`.
> +            addr: self.raw_vmap(SIZE)?,
> +            owner: self.into(),
> +        })
> +    }
>   }
>   
>   impl<T: DriverObject> Deref for Object<T> {
> @@ -268,6 +364,147 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
>       };
>   }
>   
> +macro_rules! impl_vmap_io_capable {
> +    ($impl:ident, $ty:ty $(, $lifetime:lifetime )?) => {
> +        impl<$( $lifetime ,)? D: DriverObject, const SIZE: usize> IoCapable<$ty>
> +            for $impl<$( $lifetime ,)? D, SIZE>
> +        {
> +            #[inline(always)]
> +            unsafe fn io_read(&self, address: usize) -> $ty {
> +                let ptr = address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_read` guarantees that address is a valid
> +                // address within the bounds of `Self` of at least the size of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::read(ptr) }
> +            }
> +
> +            #[inline(always)]
> +            unsafe fn io_write(&self, value: $ty, address: usize) {
> +                let ptr = address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_write` guarantees that address is a valid
> +                // address within the bounds of `Self` of at least the size of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::write(ptr, value) }
> +            }
> +        }
> +    };
> +}
> +
> +// Implement various traits common to both VMap types
> +macro_rules! impl_vmap_common {
> +    ($impl:ident $(, $lifetime:lifetime )?) => {
> +        impl<$( $lifetime ,)? D, const SIZE: usize> $impl<$( $lifetime ,)? D, SIZE>
> +        where
> +            D: DriverObject,
> +        {
> +            /// Borrows a reference to the object that owns this virtual mapping.
> +            #[inline(always)]
> +            pub fn owner(&self) -> &Object<D> {
> +                &self.owner
> +            }
> +        }
> +
> +        impl<$( $lifetime ,)? D, const SIZE: usize> Drop for $impl<$( $lifetime ,)? D, SIZE>
> +        where
> +            D: DriverObject,
> +        {
> +            #[inline(always)]
> +            fn drop(&mut self) {
> +                // SAFETY: Our existence is proof that this map was previously created using
> +                // self.owner
> +                unsafe { self.owner.raw_vunmap(self.addr) };
> +            }
> +        }
> +
> +        impl<$( $lifetime ,)? D, const SIZE: usize> Io for $impl<$( $lifetime ,)? D, SIZE>
> +        where
> +            D: DriverObject,
> +        {
> +            #[inline(always)]
> +            fn addr(&self) -> usize {
> +                self.addr as usize
> +            }
> +
> +            #[inline(always)]
> +            fn maxsize(&self) -> usize {
> +                self.owner.size()
> +            }
> +        }
> +
> +        impl<$( $lifetime ,)? D, const SIZE: usize> IoKnownSize for $impl<$( $lifetime ,)? D, SIZE>
> +        where
> +            D: DriverObject,
> +        {
> +            const MIN_SIZE: usize = SIZE;
> +        }
> +
> +        impl_vmap_io_capable!($impl, u8 $( , $lifetime )?);
> +        impl_vmap_io_capable!($impl, u16 $( , $lifetime )?);
> +        impl_vmap_io_capable!($impl, u32 $( , $lifetime )?);
> +        #[cfg(CONFIG_64BIT)]
> +        impl_vmap_io_capable!($impl, u64 $( , $lifetime )?);
> +    };
> +}
> +
> +/// An owned reference to a virtual mapping for a shmem-based GEM object in kernel address space.
> +///
> +/// # Invariants
> +///
> +/// - The size of `owner` is >= SIZE.
> +/// - The memory pointed to by addr remains valid at least until this object is dropped.
> +pub struct VMap<D: DriverObject, const SIZE: usize = 0> {
> +    addr: *mut c_void,
> +    owner: ARef<Object<D>>,
> +}
> +
> +impl_vmap_common!(VMap);
> +
> +impl<D: DriverObject, const SIZE: usize> Clone for VMap<D, SIZE> {
> +    #[inline]
> +    fn clone(&self) -> Self {
> +        // SAFETY: We have a successful vmap already, so this can't fail
> +        unsafe { self.owner.owned_vmap().unwrap_unchecked() }
> +    }
> +}
> +
> +impl<'a, D: DriverObject, const SIZE: usize> From<VMapRef<'a, D, SIZE>> for VMap<D, SIZE> {
> +    #[inline]
> +    fn from(value: VMapRef<'a, D, SIZE>) -> Self {
> +        let this = Self {
> +            addr: value.addr,
> +            owner: value.owner.into(),
> +        };
> +
> +        mem::forget(value);
> +        this
> +    }
> +}
> +
> +// SAFETY: addr is guaranteed to be valid and accessible for the lifetime of VMap, ensuring its
> +// safe to send across threads.
> +unsafe impl<D: DriverObject, const SIZE: usize> Send for VMap<D, SIZE> {}
> +// SAFETY: addr is guaranteed to be valid and accessible for the lifetime of VMap, ensuring its
> +// safe to send across threads.
> +unsafe impl<D: DriverObject, const SIZE: usize> Sync for VMap<D, SIZE> {}
> +
> +/// A borrowed reference to a virtual mapping for a shmem-based GEM object in kernel address space.
> +pub struct VMapRef<'a, D: DriverObject, const SIZE: usize = 0> {
> +    addr: *mut c_void,
> +    owner: &'a Object<D>,
> +}
> +
> +impl_vmap_common!(VMapRef, 'a);
> +
> +impl<'a, D: DriverObject, const SIZE: usize> Clone for VMapRef<'a, D, SIZE> {
> +    #[inline]
> +    fn clone(&self) -> Self {
> +        // SAFETY: We have a successful vmap already, so this can't fail
> +        unsafe { self.owner.vmap().unwrap_unchecked() }
> +    }
> +}
> +
>   /// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
>   ///
>   /// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
> @@ -298,3 +535,120 @@ fn deref(&self) -> &Self::Target {
>           unsafe { self.sgt.as_ref() }
>       }
>   }
> +
> +#[kunit_tests(rust_drm_gem_shmem)]
> +mod tests {
> +    use super::*;
> +    use crate::{
> +        drm,
> +        faux,
> +        page::PAGE_SIZE, //
> +    };
> +
> +    // The bare minimum needed to create a fake drm driver for kunit
> +
> +    #[pin_data]
> +    struct KunitData {}
> +    struct KunitDriver;
> +    struct KunitFile;
> +    #[pin_data]
> +    struct KunitObject {}
> +
> +    const INFO: drm::DriverInfo = drm::DriverInfo {
> +        major: 0,
> +        minor: 0,
> +        patchlevel: 0,
> +        name: c"kunit",
> +        desc: c"Kunit",
> +    };
> +
> +    impl drm::file::DriverFile for KunitFile {
> +        type Driver = KunitDriver;
> +
> +        fn open(_dev: &drm::Device<KunitDriver>) -> Result<Pin<KBox<Self>>> {
> +            Ok(KBox::new(Self, GFP_KERNEL)?.into())
> +        }
> +    }
> +
> +    impl gem::DriverObject for KunitObject {
> +        type Driver = KunitDriver;
> +        type Args = ();
> +
> +        fn new(
> +            _dev: &drm::Device<KunitDriver>,
> +            _size: usize,
> +            _args: Self::Args,
> +        ) -> impl PinInit<Self, Error> {
> +            try_pin_init!(KunitObject {})
> +        }
> +    }
> +
> +    #[vtable]
> +    impl drm::Driver for KunitDriver {
> +        type Data = KunitData;
> +        type File = KunitFile;
> +        type Object = Object<KunitObject>;
> +
> +        const INFO: drm::DriverInfo = INFO;
> +        const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor] = &[];
> +    }
> +
> +    fn create_drm_dev() -> Result<(faux::Registration, ARef<drm::Device<KunitDriver>>)> {
> +        // Create a faux DRM device so we can test gem object creation.
> +        let data = try_pin_init!(KunitData {});
> +        let dev = faux::Registration::new(c"Kunit", None)?;
> +        let drm = drm::Device::<KunitDriver>::new(dev.as_ref(), data)?;

When applying "PATCH v5 0/4 Introduce DeviceContext", I got a 
compilation error:
error[E0049]: associated type `Object` has 0 type parameters but its 
trait declaration has 1 type parameter
    --> rust/kernel/drm/gem/shmem.rs:610:20
     |
610 |         type Object = Object<KunitObject>;
     |                    ^ found 0 type parameters
     |
    ::: rust/kernel/drm/driver.rs:114:17
     |
114 |     type Object<Ctx: drm::DeviceContext>: AllocImpl;
     |                 --- expected 1 type parameter

error[E0599]: no function or associated item named `new` found for 
struct `drm::device::Device<drm::gem::shmem::tests::KunitDriver>` in the 
current scope
    --> rust/kernel/drm/gem/shmem.rs:620:47
     |
620 |         let drm = drm::Device::<KunitDriver>::new(dev.as_ref(), 
data)?;
     |                                               ^^^ function or 
associated item not found in 
`drm::device::Device<drm::gem::shmem::tests::KunitDriver>`
     |
    ::: rust/kernel/drm/device.rs:244:1
     |
244 | pub struct Device<T: drm::Driver, C: DeviceContext = Registered> {
     | ---------------------------------------------------------------- 
function or associated item `new` not found for this struct
     |
     = help: items from traits can only be used if the trait is 
implemented and in scope
note: `drm::gem::DriverObject` defines an item `new`, perhaps you need 
to implement it
    --> rust/kernel/drm/gem/mod.rs:91:1
     |
  91 | pub trait DriverObject: Sync + Send + Sized {
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

error: aborting due to 2 previous errors

> +
> +        Ok((dev, drm))
> +    }
> +
> +    #[test]
> +    fn compile_time_vmap_sizes() -> Result {
> +        let (_dev, drm) = create_drm_dev()?;
> +
> +        // Create a gem object to test with
> +        let cfg_ = ObjectConfig::<KunitObject> {
> +            map_wc: false,
> +            parent_resv_obj: None,
> +        };
> +        let obj = Object::<KunitObject>::new(&drm, PAGE_SIZE, cfg_, ())?;
> +
> +        // Try creating a normal vmap
> +        obj.vmap::<PAGE_SIZE>()?;
> +
> +        // Try creating a vmap that's smaller then the size we specified
> +        obj.vmap::<{ PAGE_SIZE - 100 }>()?;
> +
> +        // Make sure creating a vmap that's too large fails
> +        assert!(obj.vmap::<{ PAGE_SIZE + 200 }>().is_err());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn vmap_io() -> Result {
> +        let (_dev, drm) = create_drm_dev()?;
> +
> +        // Create a gem object to test with
> +        let cfg_ = ObjectConfig::<KunitObject> {
> +            map_wc: false,
> +            parent_resv_obj: None,
> +        };
> +        let obj = Object::<KunitObject>::new(&drm, PAGE_SIZE, cfg_, ())?;
> +
> +        let vmap = obj.vmap::<PAGE_SIZE>()?;
> +
> +        vmap.write8(0xDE, 0x0);
> +        assert_eq!(vmap.read8(0x0), 0xDE);
> +        vmap.write32(0xFFFFFFFF, 0x20);
> +
> +        assert_eq!(vmap.read32(0x20), 0xFFFFFFFF);
> +
> +        assert_eq!(vmap.read8(0x20), 0xFF);
> +        assert_eq!(vmap.read8(0x21), 0xFF);
> +        assert_eq!(vmap.read8(0x22), 0xFF);
> +        assert_eq!(vmap.read8(0x23), 0xFF);
> +
> +        Ok(())
> +    }
> +}
