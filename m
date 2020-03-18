From: Petri Latvala <petri.latvala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests: Add nouveau-crc
 tests
Date: Wed, 18 Mar 2020 10:19:13 +0200
Message-ID: <20200318081913.GJ9497@platvala-desk.ger.corp.intel.com>
References: <20200318010047.237024-1-lyude@redhat.com>
 <20200318010047.237024-5-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200318010047.237024-5-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 09:00:47PM -0400, Lyude wrote:
> From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> =

> We're finally getting CRC support in nouveau, so let's start testing
> this in igt as well! While the normal CRC capture tests are nice,
> there's a number of Nvidia-specific hardware characteristics that we
> need to test as well.
> =

> The most important one is known as a "notifier context flip". Basically,
> Nvidia GPUs store generated CRCs in an allocated memory region, referred
> to as the notifier context, that the driver programs itself. Strangely,
> this region can only hold a limited number of CRC entries, and once it
> runs out of available entries the hardware simply sets an overrun bit
> and stops writing any new CRC entries.
> =

> Since igt-gpu-tools doesn't really have an expectation of only being
> able to grab a limited number of CRCs, we work around this in nouveau by
> allocating two separate CRC notifier regions each time we start
> capturing CRCs, and then flip between them whenever we get close to
> filling our currently programmed notifier context. While this keeps the
> number of CRC entries we lose to an absolute minimum, we are guaranteed
> to lose exactly one CRC entry between context flips. Thus, we add some
> tests to ensure that nouveau handles these flips correctly
> (pipe-[A-F]-ctx-flip-detection), and that igt itself is also able to
> handle them correctly (pipe-[A-F]-ctx-flip-skip-current-frame). Since
> these tests use a debugfs interface to manually control the notifier
> context flip threshold, we also add one test to ensure that any flip
> thresholds we set are cleared after a single CRC capture
> (ctx-flip-threshold-reset-after-capture).
> =

> In addition, we also add some simple tests to test Nvidia-specific CRC
> sources.
> =

> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  lib/drmtest.c       |  10 ++
>  lib/drmtest.h       |   2 +
>  tests/meson.build   |   1 +
>  tests/nouveau_crc.c | 396 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 409 insertions(+)
>  create mode 100644 tests/nouveau_crc.c
> =

> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 1fc39925..53c01754 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -112,6 +112,11 @@ bool is_i915_device(int fd)
>  	return __is_device(fd, "i915");
>  }
>  =

> +bool is_nouveau_device(int fd)
> +{
> +	return __is_device(fd, "nouveau");
> +}
> +
>  bool is_vc4_device(int fd)
>  {
>  	return __is_device(fd, "vc4");
> @@ -537,6 +542,11 @@ void igt_require_intel(int fd)
>  	igt_require(is_i915_device(fd) && has_known_intel_chipset(fd));
>  }
>  =

> +void igt_require_nouveau(int fd)
> +{
> +	igt_require(is_nouveau_device(fd));
> +}
> +
>  void igt_require_vc4(int fd)
>  {
>  	igt_require(is_vc4_device(fd));
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 632c616b..4937e9d2 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -97,10 +97,12 @@ void gem_quiescent_gpu(int fd);
>  =

>  void igt_require_amdgpu(int fd);
>  void igt_require_intel(int fd);
> +void igt_require_nouveau(int fd);
>  void igt_require_vc4(int fd);
>  =

>  bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
> +bool is_nouveau_device(int fd);
>  bool is_vc4_device(int fd);
>  =

>  /**
> diff --git a/tests/meson.build b/tests/meson.build
> index 7629afde..9ff74cc6 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -70,6 +70,7 @@ test_progs =3D [
>  	'kms_vblank',
>  	'kms_vrr',
>  	'meta_test',
> +	'nouveau_crc',
>  	'panfrost_get_param',
>  	'panfrost_gem_new',
>  	'panfrost_prime',
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> new file mode 100644
> index 00000000..09e17a6f
> --- /dev/null
> +++ b/tests/nouveau_crc.c
> @@ -0,0 +1,396 @@
> +/*
> + * Copyright =A9 2019 Red Hat Inc.

Verify that the authoring year is correct.


-- =

Petri Latvala
