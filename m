From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: commit 0a1479c829 breaks
	glsl-fs-lots-of-tex.shader_test on nv50/nvc0
Date: Thu, 9 Jan 2014 23:54:00 -0500
Message-ID: <CAKb7UvguAtB24xP+HQ+S6mSp-A30hkcmd7GXEzN_Ww1LgGJy3w@mail.gmail.com>
References: <CAKb7UvjgZx1G0-cSU356TtdRNmEmc8spZL-JoovSWXKrvDpWXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjgZx1G0-cSU356TtdRNmEmc8spZL-JoovSWXKrvDpWXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Thu, Jan 9, 2014 at 4:04 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Hi Marek,
>
> I won't pretend to understand what's going on, but I just bisected a
> failure on tests/shaders/glsl-fs-lots-of-tex.shader_test in piglit
> between 9.1 and HEAD, and it landed on your commit. It's approximately
> the simplest shader known to man (esp at HEAD when all the TEX
> instructions are gone due to CSE), so I'm guessing there's some edge
> condition in the copying logic triggered by it.

Christoph,

I spoke with Marek earlier on IRC, and he thought it was probably an
issue in our ->blit routine. I agree that this makes sense, however
that's the only piglit test that fails in tests/shaders (well, related
to textures), and there are plenty of other texture2D-using tests. I
looked at the mmt traces, and they seem pretty reasonable. What's
unique about this test is that it uses a 0.01 value in the texture
rather than the more common 1/-1.

FWIW the failure looks like:

$ bin/shader_runner tests/shaders/glsl-fs-lots-of-tex.shader_test -auto
Probe color at (187,187)
  Expected: 0.400000 0.000000 0.000000
  Observed: 0.266667 0.000000 0.000000
PIGLIT: {'result': 'fail' }

So it's getting a value... just not the right one. The blit is being
done from RGBA32_FLOAT to RGBA8_UNORM.

So, doing the math, 0.01 * 255 = 2.55, so the value should be 3 (I
guess "norm" is supposed to round?). 3/255 * 34 = 0.4. And 2 / 255 *
34 = 0.266666. So... it's getting rounded down instead of up. Changing
the value to 0.011 "fixes" the piglit test (since 0.011 * 255 = 2.8,
which is unambiguously closer to 3).

Are you aware of any rounding mode stuff, or is the hw just inaccurate
at rounding? i.e. is there a fix here, or should I try to update the
piglit test to use 0.011 instead of 0.01?

  -ilia
