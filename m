From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: texelFetch sampler1/2DArray on nv50 gallium
Date: Fri, 29 Nov 2013 01:16:18 -0500
Message-ID: <CAKb7Uvi87C5M+RmwOfNDPA0b7VSwazm+jgyg6BEu_qD+f_EujA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Christoph/nouveau folks,

I've noticed that the piglit test "texelFetch" fails on my nv98 for
sampler1DArray and sampler2DArray. I nuked the logic in
nv50_ir_lowering_nv50.cpp:604 that does the f32 -> u32 conversion, and
it seems to be passing now. TBH, I have no clue how the parameters are
passed around and what that a[] is, but it seems like it's a u32 to
begin with? (Or that it's the same format that texfetch expects.)

Perhaps this differs across card revisions? It would be interesting if
someone with an original nv50, nva0, and nva3+ cards (those are the
interesting 3d-related chip revisions) could run texelFetch as well to
see whether it fails for them as well. Here's what I'm running:

piglit $ bin/texelFetch vs sampler1DArray -auto
piglit $ bin/texelFetch vs sampler2DArray -auto
piglit $ bin/texelFetch fs sampler1DArray -auto
piglit $ bin/texelFetch fs sampler2DArray -auto

  -ilia
