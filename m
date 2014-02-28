From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Tesla shader ISA question
Date: Fri, 28 Feb 2014 02:37:40 -0500
Message-ID: <CAKb7UvgtRTaDp_L_D4kSsXHgJGT0o-27bPEN6ZMxUFyQj4PhbA@mail.gmail.com>
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
To: gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

I've recently run into an unknown bit in Tesla shaders, and was hoping
you could shed some light on it. I believe they're related to clamping
of some sort. Here are 2 examples (from diff shaders):

a0000401 cc054780     cvt rpi f32 $r0 f32 $r2 [unknown: 00000000 00010000]
a000060d 8c014780     cvt rni s32 $r3 f32 $r3 [unknown: 00000000 00010000]

[This is intel-style syntax, cvt = convert/move, rni/rpi = rounding
mode stuff, hope that clears up the syntax...]

The destination register tends to go to a texture-related instruction
input, in some cases the layer (which is why I suspect clamping). Both
of these were seen on shaders compiled for GT215+ chips. What effect
does turning it on have exactly? Also, is this bit available on
earlier chips (if so, how early)?

Thanks,

  -ilia
