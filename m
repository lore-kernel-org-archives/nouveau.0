From: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: data error enum documentation
Date: Wed, 30 Apr 2014 08:54:55 -0700
Message-ID: <20140430155455.GB8948@parker.nvidia.com>
References: <CAKb7Uvjjpgn-r1HmsmmPpX=sdMcaE4TA=JBtRaVei-FDM8wZ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvjjpgn-r1HmsmmPpX=sdMcaE4TA=JBtRaVei-FDM8wZ7g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Sorry for the very slow response to this, Ilia.

For the specific error you mentioned: the error code
0x51 is "ErrorSrcLineExceedsPitch", and error code 0x53 is
"ErrorDstLineExceedsPitch". It looks like class 0x9039 will generate
those errors under the following conditions:

       if ((NV9039_LAUNCH_DMA_SRC_MEMORY_LAYOUT == PITCH) &&
           (NV9039_LAUNCH_DMA_SRC_INLINE == FALSE) &&
           (NV9039_LINE_COUNT_VALUE > 1) &&
           (NV9039_PITCH_IN_VALUE >= 0) &&
           (NV9039_LINE_LENGTH_IN_VALUE > NV9039_PITCH_IN_VALUE)) {
           return ErrorSrcLineExceedsPitch;
       }

       if ((NV9039_LAUNCH_DMA_DST_MEMORY_LAYOUT == PITCH) &&
           (NV9039_LINE_COUNT_VALUE > 1) &&
           (NV9039_PITCH_OUT_VALUE >= 0) &&
           (NV9039_LINE_LENGTH_IN_VALUE > NV9039_PITCH_OUT_VALUE)) {
           return ErrorDstLineExceedsPitch;
       }

Where those NV9039_* method values are defined as:

#define NV9039_LAUNCH_DMA                                                                                 0x0300
#define NV9039_LAUNCH_DMA_SRC_INLINE                                                                         0:0
#define NV9039_LAUNCH_DMA_SRC_INLINE_FALSE                                                            0x00000000
#define NV9039_LAUNCH_DMA_SRC_INLINE_TRUE                                                             0x00000001
#define NV9039_LAUNCH_DMA_SRC_MEMORY_LAYOUT                                                                  4:4
#define NV9039_LAUNCH_DMA_SRC_MEMORY_LAYOUT_BLOCKLINEAR                                               0x00000000
#define NV9039_LAUNCH_DMA_SRC_MEMORY_LAYOUT_PITCH                                                     0x00000001
#define NV9039_LAUNCH_DMA_DST_MEMORY_LAYOUT                                                                  8:8
#define NV9039_LAUNCH_DMA_DST_MEMORY_LAYOUT_BLOCKLINEAR                                               0x00000000
#define NV9039_LAUNCH_DMA_DST_MEMORY_LAYOUT_PITCH                                                     0x00000001

#define NV9039_PITCH_IN                                                                                   0x0314
#define NV9039_PITCH_IN_VALUE                                                                               31:0

#define NV9039_PITCH_OUT                                                                                  0x0318
#define NV9039_PITCH_OUT_VALUE                                                                              31:0

#define NV9039_LINE_LENGTH_IN                                                                             0x031c
#define NV9039_LINE_LENGTH_IN_VALUE                                                                         31:0

#define NV9039_LINE_COUNT                                                                                 0x0320
#define NV9039_LINE_COUNT_VALUE                                                                             31:0

As far as I can tell, these checks are not GF106-specific, so I'm not
sure why the problem is only showing up there.  Maybe there is something
else unique about the GF106 user's configuration that causes this to
be triggered?

Thanks,
- Andy


On Tue, Mar 18, 2014 at 06:44:30AM -0700, Ilia Mirkin wrote:
> Hello,
> 
> A user on an NVC3 card (GF106) is running into data errors on m2mf
> (class 0x9039) that we haven't seen before:
> 
> http://people.freedesktop.org/~imirkin/nvc0-comparison/nvc3-2014-03-17-agashlin/glean/fbo.html
> http://people.freedesktop.org/~imirkin/nvc0-comparison/nvc3-2014-03-17-agashlin/spec/!OpenGL%201.1/copyteximage%201D.html
> 
> Specifically the data errors 0x51 and 0x53, when running method 0x300
> ("EXEC"). Any chance you could let us know what those errors are? (Or,
> even better, provide the full table so that we'll have a better idea
> in future cases as well.)
> 
> Here are a few that we know about, so you know exactly what table I'm
> talking about (our full list at
> https://github.com/envytools/envytools/blob/master/rnndb/nv50_defs.xml#L192):
> 
> 0x04: INVALID_VALUE
> 0x05: INVALID_ENUM
> 0x08: INVALID_OBJECT
> 0x0c: INVALID_BITFIELD
> 0x3f: PRIMITIVE_ID_NEEDS_GP
> 
> We read this data error value from mmio reg 0x400110.
> 
> Furthermore, if you could provide any insight as to why we would see
> those errors on GF106 but not any other Fermi/Kepler that we've tested
> (which should all run exactly the same code paths), that would be
> extremely helpful as well. You can see the Fermi piglit runs we have
> on file at http://people.freedesktop.org/~imirkin/nvc0-comparison/problems.html
> 
> Thanks,
> 
>   -ilia
