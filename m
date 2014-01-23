From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH] nv50,
 nvc0: only clear out the buffers that we were asked to clear
Date: Thu, 23 Jan 2014 15:33:20 -0500
Message-ID: <CAKb7Uvi++vUGx1=D9etLH6GggNk=_3JOcg5eSDNrh5X2MoiUZg@mail.gmail.com>
References: <1389925395-22379-1-git-send-email-imirkin@alum.mit.edu>
	<1389925395-22379-2-git-send-email-imirkin@alum.mit.edu>
	<52E17757.2010807@gmail.com>
	<CAKb7UvgEXEUhE6FguyHGBPCBTGuNb=i1324tfibg9x__s63Fmg@mail.gmail.com>
	<52E17C0C.9050305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52E17C0C.9050305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 23, 2014 at 3:31 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 23/01/14 20:15, Ilia Mirkin wrote:
>> On Thu, Jan 23, 2014 at 3:11 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 17/01/14 02:23, Ilia Mirkin wrote:
>>>> Fixes fbo-drawbuffers-none glClearBuffer piglit test.
>>>>
>>>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>>>> ---
>>>>
>>>> Only tested on nv50, but implementations seem similar enough.
>>>>
>>>>  src/gallium/drivers/nouveau/nv50/nv50_surface.c | 17 +++++++++--------
>>>>  src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 17 +++++++++--------
>>>>  2 files changed, 18 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
>>>> index 358f57a..eb27429 100644
>>>> --- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
>>>> +++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
>>>> @@ -408,9 +408,6 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
>>>>        PUSH_DATAf(push, color->f[1]);
>>>>        PUSH_DATAf(push, color->f[2]);
>>>>        PUSH_DATAf(push, color->f[3]);
>>>> -      mode =
>>>> -         NV50_3D_CLEAR_BUFFERS_R | NV50_3D_CLEAR_BUFFERS_G |
>>>> -         NV50_3D_CLEAR_BUFFERS_B | NV50_3D_CLEAR_BUFFERS_A;
>>>>     }
>>>>
>>> I'm not sure why you've dropped the mode from above. I'm guessing that
>>> the initial assumption was that if there is a color buffer it must be at
>>> cbuf[0].
>>
>> Because I cleared the cbufs separately in a for loop below (the 0x3c
>> == the RGBA mask). The first RT may not have been there, and that
>> seemed simpler than the thing that I have now (as evidenced by the
>> code I have now which has more complex logic).
>>
> With the original patch, you explicitly set clear_depth and
> clear_stencil for the first buffer, regardless of what is being passed
> by gallium. I'm not sure that was strictly correct.

Only if buffers & PIPE_CLEAR_DEPTH/STENCIL were set... of which there
can only be one, unlike the color buffers, of which there can be many.
Well, whatever. I think everyone's happy with the new version, right?
