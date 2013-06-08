From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bad performace for NV18 driver
Date: Sat, 08 Jun 2013 21:31:15 +0100
Message-ID: <51B39493.2070207@gmail.com>
References: <CAD-addk1m19g_onyyM1Lx4Rnji32sPDpAffHaJ=39=33aZGnHg@mail.gmail.com>
	<CAKb7UvjVE52o5ZCFg43b-yRGGPgWkRkn7ctEu8EscySfskHX2Q@mail.gmail.com>
	<CAD-add=DhPzgFR-73x54rFc7KtKSSTXAz-WKA7=tKm3MhSHbJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAD-add=DhPzgFR-73x54rFc7KtKSSTXAz-WKA7=tKm3MhSHbJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Carlos Garces <carlos.garces-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 08/06/13 19:06, Carlos Garces wrote:
> After update the system now I use:
> 
> Kernel 3.9.2
> x server 1.12.4
> nouveau 1.0.7
> 
Good call

> the xorg config are at:
> 
> http://pastebin.com/2LUxLiVs
> 
Bad call, your resolution issues are due to messed up config

If you really insist on having such an "interesting" setup, start from
scratch and build on top of it - one section at a time. I would
recommend getting the "minimal" xorg.conf [1] as a base

> It's the one installed by my distro, without any modification
> 
> I have made 2 test.
> 
> Normal boot
> Xorg at http://pastebin.com/reZdAXEF
> GLX Renderer is detected as GLX "Mesa DRI nv18 x86/MMX+/3DNow!+/SSE GLX"
> 
Note that nouveau correctly detects that the monitor is 1024x768 60Hz
capable.

"(II) NOUVEAU(0): Modeline "1024x768"x60.0"

Something is the config you're feeding it causes the issue

> 
> Same configuration with nomodeset
> Xorg log at http://pastebin.com/ZbXBG8sz
> GLX Renderer: Gallium 0.4 on softpipe
> 
> Results for Cairo test with and without nomodeset
> http://openbenchmarking.org/result/1306082-CGAR-CAIROTE23
> 
> Full results from Friday (before update Mesa)
> http://openbenchmarking.org/result/1306072-UT-2DGPUTEST95
> 
> 
> The result with Cairo are better in the updated system, 0.63 FPS vs
> 0.54 FPS but still worse than boot with nomodeset (7,84 FPS)
> 
> Any ideas to improve the results with Cairo?
> 
If you do a bit of search[2] you'll notice that in quite a few cases
cairo/sw is quite fast

Quite a few of the benchmarks in your original post were faster using
nouveau

On that note, I believe that a question in terms of "Program XXX is
rendering very slow, is there any way to improve that ?" would be more
beneficial


Regards
Emil

P.S. Please avoid top-posting


[1]
Section "Device"
  Identifier "my_fancy_identifier"
  Driver "nouveau"
EndSection

[2] http://ickle.wordpress.com/

> On Sat, Jun 8, 2013 at 12:18 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>> On Fri, Jun 7, 2013 at 5:56 PM, Carlos Garces <carlos.garces-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi!
>>>
>>> I have some strange results on my test with nouveau drivers
>>>
>>> I'm using a old GeForce4 MX 4000 (NV18) with 128 MB.
>>>
>>> I have made 2 test.
>>>
>>> -The default configuration, using nomodeset without nouveau_vieux_dri.so
>>>
>>> $inxi -G
>>> Graphics:  Card: NVIDIA NV18 [GeForce4 MX 4000]
>>>            X.Org: 1.12.4 drivers: vesa,nouveau (unloaded: fbdev)
>>> Resolution: 1024x768@0.0hz
>>>            GLX Renderer: N/A GLX Version: N/A
>>>
>>> -The "optimized" configuration, after removing nomodeset, installing
>>> the 3d driver (nouveau_vieux_dri.so, package libgl1-mesa-dri) and
>>> configure the xorg to use only nouveau
>>>
>>> $inxi -G
>>> Graphics:  Card: NVIDIA NV18 [GeForce4 MX 4000] X.Org: 1.12.4 driver:
>>> nouveau Resolution: 800x600-XyBiMD9AD2I@public.gmane.org
>>>            GLX Renderer: Mesa DRI nv18 x86/MMX+/3DNow!+/SSE GLX
>>> Version: 1.2 Mesa 8.0.5
>>>
>>> The resolution is 800x600 because was impossible for me set up  1024x768
>>>
>>> There is the full xorg log
>>> http://pastebin.com/2ZbMwyRK
>>>
>>> The results are strange for me. I expect better performance on
>>> "optimized" configuration but some test using Cairo are very bad (0,54
>>> vs  5,38).
>>>
>>> The test are available at
>>> http://openbenchmarking.org/result/1306076-UT-2DGPUTEST63
>>>
>>> Any idea to improve the performace of NV18?
>>> Any know issue with nouveau_vieux_dri.so and NV18?
>>
>> It's a little difficult to tell anything without seeing your xorg.conf
>> -- it seems like 1024x768 should work fine. You also appear to be in
>> 16-bit mode, and using fairly old software (xorg 1.12, mesa 8.0,
>> xf86-video-nouveau 1.0.1). What kernel version are you on? Although
>> it's a fairly old card so perhaps there hasn't been much improvement
>> on it. In recent X versions, things get auto-detected for the most
>> part and you can forgo most explicit configuration like
>> modelines/etc... not sure if that's the case for xorg 1.12 or not.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 
