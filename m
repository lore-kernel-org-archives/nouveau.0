From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: GSOC '08 hardware accelerated video decoding
Date: Fri, 28 Mar 2008 11:06:46 +0100
Message-ID: <6a89f9d50803280306q33368524q1d5933ac67aefaa7@mail.gmail.com>
References: <586c2acd0803201155o6f33112ay4ce8421f979068f7@mail.gmail.com>
	<6a89f9d50803201721g3d05ef47q98cb261838c03435@mail.gmail.com>
	<586c2acd0803221925q131e74c4tc83167563fc30e48@mail.gmail.com>
	<6a89f9d50803230511r298fe390u880195765e0ab59c@mail.gmail.com>
	<586c2acd0803272051i15bb894fi5a43091dbbd21a48@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0803272051i15bb894fi5a43091dbbd21a48-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes M <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 3/28/08, Younes M <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I've decided to submit an application for this. If anyone would be
>  kind enough to read through the preliminary and give me opinions,
>  concerns, corrections, etc, I would appreciate it very much. HTML
>  version is here: http://www.bitblit.org/gsoc/gallium3d_xvmc.shtml and
>  a text version is included below.
>
>  Thanks.
>
>  --------
>
>  Younes Manton
>  younes.m at gmail
>
>  Generic GPU-Accelerated Video Decoding
>
>  Synopsis:
>
>  The purpose of this project is to produce a video decoding solution
>  for GPUs that are supported by the Gallium3D driver framework. The
>  project will attempt to implement the XvMC API using the programmable
>  pipeline of a typical GPU, thereby providing accelerated video
>  decoding to a wide variety of hardware. Since the decoding will be
>  implemented using the GPU's programmable pipeline, it is important to
>  note that this solution should support all recent GPUs regardless of
>  whether or not they include dedicated video decoding hardware. It is
>  hoped that this GPU-based acceleration will allow for real-time play
>  back of HD video streams on mid-range and possibly low-end hardware.
>  The implementation will be developed and tested using Gallium3D's
>  SoftPipe driver, a stable software reference implementation, and later
>  on Nvidia hardware and the nouveau driver.
>
>  Benefits:
>
>  Video media has become a pervasive part of the computing landscape and
>  encompasses a variety of formats and resolutions, from low-res MPEG2
>  streams to HD MPEG4 content. From the point of view of the end-user,
>  accelerated video decoding offers potentially better quality, smoother
>  multi-tasking (by way of unburdening the main CPU) and the extension
>  of the lifespan of current mid-range and low-end hardware. From the
>  point of view of the OSS community, accelerated video decoding will
>  offer an incentive to the end-user to adopt open-source drivers, which
>  have traditionally not provided significant video acceleration on the
>  most popular GPUs. This particular project will also provide a
>  multi-vendor solution, as most GPUs supported by the Gallium3D
>  framework can be targeted with the same code base, including some
>  current Nvidia hardware via the nouveau driver, AMD/ATI hardware, and
>  Intel hardware, amongst others.

Although there are plans for a gallium ATI driver, there is nothing
concrete ATM. But it's only a matter of time.

>
>  Deliverables:
>
>  The deliverables for this project have been organized into two
>  categories: the minimum set of deliverables that would make this
>  project worthwhile for all involved (must-haves), and a larger set of
>  goals that would make good contributions to the community and offer
>  greater benefit to the end-user (nice-to-haves).
>  Must-Haves:
>
>     * An XvMC implementation that handles the color space conversion
>  (CSC) and motion compensation (MC) stages of the video decoding
>  pipeline. These two stages represent the bulk of the processing and
>  are good candidates for being handled by the GPU. This should allow
>  for real-time play back of HD video streams according to [1]. As part
>  of this goal it is expected some work will have to be done with the
>  nouveau driver to address possible bugs and add required
>  functionality.
>
>     * Handling of the inverse discrete cosine transform (IDCT) stage
>  of the video decoding pipeline. This stage does not map optimally to
>  the GPU pipeline but represents a large percentage of the processing
>  and would also allow for the preceding stage (inverse quantization -
>  IQ) to also be handled by the GPU without introducing an extra
>  GPU-CPU-GPU round trip between the IQ, IDCT, and MC stages. XvMC was
>  originally intended to handle the MC stage, but has been extended to
>  support IDCT.
>
>  A preliminary timeline with milestones is presented below:
>
>         Preliminary research & experimentation - April weeks 1 & 2
>         mplement CSC with SoftPipe - April weeks 3 & 4
>         Implement MC, IDCT with SoftPipe - May to mid-June (1)
>         Preliminary hardware research & experimentation - June
>         Test with real hardware, add required functionality, fix bugs -
>  mid-June to Aug (2)
>         Bug fixes, performance testing & tuning, documentation - Aug
>
>    1. Working implementation with the SoftPipe driver by mid-June
>    2. Working implementation with nouveau driver by end-July
>
>  Nice-To-Haves:
>
>     * Support for other video formats. XvMC was originally intended
>  for MPEG2 video, but has been extended to support other formats such
>  as MPEG4.
>
>     * An implementation of the Video Acceleration API (VAAPI) which is
>  similar to XvMC but has been designed to support off-loading more
>  stages and more video formats. VAAPI is not currently supported widely
>  by user applications, but this could offer incentive to application
>  developers.
>
>     * Implementation of various filters to improve visual quality.
>  De-interlacing, de-blocking, de-ringing, bi-cubic interpolation, and
>  others would be investigated for possible implementation.
>
>  Project Details:
>
>  The XvMC implementation: This implementation will be written in terms
>  of Gallium3D using the SoftPipe driver, a software driver, and a fork
>  of libXvMC from the openChrome project as a starting point. This will
>  allow the implementation to be tested against a working reference
>  driver, after which point development will switch to actual hardware.
>  The level of support that the current Gallium3D Nvidia implementation
>  offers will be evaluated and any deficiencies will be addressed. It is
>  expected that the XvMC implementation will require vertex and pixel
>  shader support, texturing support, and render target support, amongst
>  other things. The implementation itself will be composed of C source
>  code that will be compiled as part of the nouveau driver (TODO: Get
>  clarification on this--part of nouveau, Gallium3D?)

Yeah, C code in gallium3D. It's actually a frontend to gallium3D
(frontends are called state trackers in gallium3D parlance).

> and vertex and
>  pixel shader code that will execute on the GPU.
>
>  User applications: The user applications will serve as benchmarks for
>  the implementation. Several user applications have support for XvMC
>  and can be used to verify functional and performance characteristics.
>  VLC and MPlayer are good candidates for example.
>
>  Alternative hardware drivers: Alternative hardware drivers, in
>  addition to the SoftPipe driver, can also be used as a reference,
>  especially for performance comparisons. The Nvidia binary driver
>  supports XvMC and implements IDTC and MC for MPEG2 video and can serve
>  as a reference.
>  Related Work:
>
>  [1] "Accelerate Video Decoding With Generic GPU" - Guobin Shen,
>  Guang-Ping Gao, Shipeng Li, Heung-Yeung Shum, and Ya-Qin Zhang -
>  http://research.microsoft.com/~jackysh/publications/Accelerate%20video%20decoding%20with%20generic%20GPU.pdf
>
>  This paper describes the implementation of the color space conversion
>  (CSC) and motion compensation (MC) stages of the video decoding
>  pipeline via the GPU programmable pipeline. The authors state that
>  they were able to achieve real-time 720p HD play back on a Pentium III
>  667 MHz CPU and GeForce3 GPU.
>
>  [2] "Techniques for Efficient DCT/IDCT Implementation on Generic GPU"
>  - Bo Fang, Guobin Shen, Shipeng Li, and Huifang Chen -
>  http://research.microsoft.com/~jackysh/publications/iscas2005%20--%20Techniques%20for%20Efficient%20DCT_IDCT%20Implementation%20on%20Generic%20GPU.pdf
>
>  An extension of the previous paper, where the authors also implement
>  the inverse discrete cosine transform (IDCT) stage of the video
>  decoding pipeline. They note that while their implementation is
>  competitive, an optimized CPU SIMD implementation is still somewhat
>  faster for this stage.
>
>  [3] XvMC via dedicated hardware on Nvidia GPUs -
>  http://nouveau.freedesktop.org/wiki/jb17bsome
>
>  User jb17bsome is working towards XvMC support in the nouveau driver
>  via dedicated video decoding hardware on Nvidia GPUs, as opposed to
>  using the programmable GPU pipeline.
>  Personal Details:
>
>  My name is Younes Manton; I am currently a computer science student at
>  York University in Toronto, Canada. I am interested in low-level
>  computer architecture, compiler theory and design, 2D and 3D graphics
>  technology, and video and audio decoding. For the last year I have
>  been employed as an intern in IBM's compiler group, working on
>  performance analysis for the XL C, C++, and Fortran compilers for
>  PowerPC and CELL. As my internship winds down I hope to participate in
>  the Summer of Code program on a project that is in line with my
>  interests and is useful to the OSS community.
>  Skills:
>
>     * Well-versed in C, C++, and a variety of assembly languages (x86,
>  PPC, CELL-SPU, SuperH, MIPS)
>     * Well-versed in the Direct3D and OpenGL APIs, and various shading languages
>     * Experienced with low-level programming, having worked on various
>  embedded systems
>     * TODO: Add more relevant skills, add evidence
>
>  Plans:
>
>  As my internship at IBM winds down I hope to have sufficient free time
>  to undertake the above. I do not plan on taking any courses during the
>  summer, but will be employed on a part-time basis as a necessity. I
>  hope to devote an average of 20 hours per week to this work and will
>  strive to meet expectations and deliver a successful project. I have
>  identified a minimum set of deliverables that I feel will still make
>  this project worthwhile for myself, the Google Summer of Code program,
>  and the mentoring organization, but have also provided a larger set of
>  goals that will be nice to have and that I am optimistic in achieving,
>  at least partially.
>

Yeah, I don't know about the SoC limits for weekly time, I hope 20 hours is ok ?

Also, I think you should add that you plan to have good modularity of
the components in order to make implementing different video decoding
APIs easy (xvmc, vaapi, ...).

Otherwise, it seems like a fairly solid proposal and the goals seem
reasonable. I also like the idea of getting started with softpipe.

Stephane
