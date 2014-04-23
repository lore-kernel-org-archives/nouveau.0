From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Proper gl_SampleMask output
Date: Wed, 23 Apr 2014 18:22:50 -0400
Message-ID: <CAKb7Uvi55tkS2kAR6J=s0e0p8em0-d6dWsT1=RCVHEeHrX=2UQ@mail.gmail.com>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

I've been trying to add ARB_sample_shading support to nouveau, and am
being defeated by the gl_SampleMask tests. Everything else works fine.
(And naturally the tests pass with the proprietary driver.) I'm trying
to do this for both GT21x, as well as GF100+.

In the GT21x case, it seems like the low bit of method 0x1928 needs to
be set (as well as the second-to-lowest bit), for GF100+, the low bit
of the last dword of the shader header needs to be set.

But exactly which register is the output supposed to go into? It looks
like with the proprietary driver, r0..r3 get the first color output,
and r4 gets the sample mask. However the way that things are set up
with nouveau, r4..r7 get the first color output (and that part works
fine). But where should the sample mask go at the end of the fragment
program? r0? r8? (I've tried all of those with minimal effect.)
Perhaps there's more configuration that I'm missing regarding the
sample mask? Also, how does this interact with the frag depth (which
also gets implicitly assigned based on color outputs)?

Any insight into this would be hugely helpful. In case you feel like
taking a look at the actual code, these are my commits:
https://github.com/imirkin/mesa/commits/sample_shading . Note that
some bits of the sample mask were already there for nvc0 (like setting
the shader header bit), thus don't appear in my change.

Thanks,

  -ilia
