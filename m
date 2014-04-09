From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Tesla shader ISA question
Date: Wed, 9 Apr 2014 15:41:30 -0400
Message-ID: <CAKb7UvjJO7QRhqE4+W6xpx7VxzqLCgFOWE_AMFcHcA2m7KNwng@mail.gmail.com>
References: <CAKb7UvgtRTaDp_L_D4kSsXHgJGT0o-27bPEN6ZMxUFyQj4PhbA@mail.gmail.com>
 <20140409193003.GF15850@parker.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140409193003.GF15850-4K9zQNqW3/fFT5IIyIEb6QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Apr 9, 2014 at 3:30 PM, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Ilia, sorry for the slow response.
>
> This isn't my area of expertise, but as I understand it:
>
> * You've correctly decoded both instructions:
>    * The first is a float32-to-float32 conversion, applying ceil()
>    * The second is a float32-to-signed-int32 conversion, rounding to
>      the nearest even integer
>
> * For the {float,int}-to-{float,int} operations, bit 48 indicates
>  whether the input is signed (1==signed), but that bit is ignored when
>  the source format is float (always signed). That should apply across
>  the entire Tesla architecture.
>
> Where did the Tesla shader come from that you were decoding? I assume
> it was produced by the NVIDIA proprietary driver?

Yes, it came from looking at how the ARB_texture_cube_map_array stuff
was implemented for GT21x (it has that texprep instruction that munges
the tex args). When comparing to the nouveau-generated code, I noticed
that we limit the array index to 511 "manually", whereas the NVIDIA
proprietary driver did not. But it was setting that unknown bit. I was
hoping that the unknown bit was some "limit to 512" magic. Perhaps we
can just get rid of the clamping, I'm sure that the spec would frown
on trying to access out-of-bounds layers...

>
> If I had to guess, I'd speculate that the shader compiler in the NVIDIA
> proprietary driver used an uninitialized variable, and then overwrote the
> bits that mattered for the opcode it was producing, leaving uninitialized
> data in the unused bits.

Makes sense, thanks so much for looking into it!

>
> I hope that helps,
> - Andy Ritger
>
>
> On Thu, Feb 27, 2014 at 11:37:40PM -0800, Ilia Mirkin wrote:
>> Hello,
>>
>> I've recently run into an unknown bit in Tesla shaders, and was hoping
>> you could shed some light on it. I believe they're related to clamping
>> of some sort. Here are 2 examples (from diff shaders):
>>
>> a0000401 cc054780     cvt rpi f32 $r0 f32 $r2 [unknown: 00000000 00010000]
>> a000060d 8c014780     cvt rni s32 $r3 f32 $r3 [unknown: 00000000 00010000]
>>
>> [This is intel-style syntax, cvt = convert/move, rni/rpi = rounding
>> mode stuff, hope that clears up the syntax...]
>>
>> The destination register tends to go to a texture-related instruction
>> input, in some cases the layer (which is why I suspect clamping). Both
>> of these were seen on shaders compiled for GT215+ chips. What effect
>> does turning it on have exactly? Also, is this bit available on
>> earlier chips (if so, how early)?
>>
>> Thanks,
>>
>>   -ilia
