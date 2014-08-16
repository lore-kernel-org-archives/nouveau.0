From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Coordinate systems on on nv10-era cards
Date: Sat, 16 Aug 2014 17:56:29 -0400
Message-ID: <CAKb7UvgE75iasruZ5+d4=eP9cwZAJxAqCYXxHkUmS5-qstYXCA@mail.gmail.com>
References: <CAKb7UviRF5BJhrVuznLuv-iaK45PRs_LzJjrM8xqbgNwteHkuA@mail.gmail.com>
 <CAKb7UvgML8jJXMqMtS8gX-JwvEguapoDe757+UrEqwM6LLOAqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgML8jJXMqMtS8gX-JwvEguapoDe757+UrEqwM6LLOAqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Just to close the loop on this, I tracked down what the issue was --
vbo state updates weren't happening properly, which in turn messed all
sorts of things up. Fixed in
http://cgit.freedesktop.org/mesa/mesa/commit/?id=8867ffbf95808dfa82029ad89d1571799a242d4d

On Fri, Aug 15, 2014 at 3:00 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> So I did a lot more debugging on this. I wrote a program that draws a
> triangle to an fbo, and then blits that to fb 0. If I draw the
> triangle with
>
>   glBegin(GL_TRIANGLES);
>     glColor3f(1, 0, 0); glVertex3f(-0.6*128 + 128, -0.75*128 + 128, 0.5);
>     glColor3f(0, 1, 0); glVertex3f(0.6*128 + 128, -0.75*128 + 128, 0);
>     glColor3f(0, 0, 1); glVertex3f(128, 0.75*128 + 128, 0);
>   glEnd();
>
> Then all is well. However if I do:
>
>   float verts[3][6] = {
>     { -0.6*128 + 128, -0.75*128 + 128, 0.5, 1, 0, 0 },
>     { 0.6*128 + 128, -0.75*128 + 128, 0, 0, 1, 0 },
>     { 128, 0.75*128 + 128, 0, 0, 0, 1 },
>   };
>
>   glVertexPointer(3, GL_FLOAT, 24, verts);
>   glColorPointer(3, GL_FLOAT, 24, &verts[0][3]);
>   glEnableClientState(GL_VERTEX_ARRAY);
>   glEnableClientState(GL_COLOR_ARRAY);
>
>   glDrawArrays(GL_TRIANGLES, 0, 3);
>
>   glDisableClientState(GL_VERTEX_ARRAY);
>   glDisableClientState(GL_COLOR_ARRAY);
>
> Then I see the failure. Looking at the pushbuf for where the blit
> happens (after the draw), for the working case, I'm seeing
>
> PB: 0x00002c22   NV17_3D.VTXBUF_FMT[0] = { TYPE = V32_FLOAT | FIELDS =
> 2 | STRIDE = 44 }
> PB: 0x00002c22   NV17_3D.VTXBUF_FMT[0x3] = { TYPE = V32_FLOAT | FIELDS
> = 2 | STRIDE = 44 }
>
> (0 = position, 3 = texcoord0)
>
> and for the bad case:
>
> PB: 0x00000c32   NV17_3D.VTXBUF_FMT[0] = { TYPE = V32_FLOAT | FIELDS =
> 3 | STRIDE = 12 }
> PB: 0x00000c32   NV17_3D.VTXBUF_FMT[0x1] = { TYPE = V32_FLOAT | FIELDS
> = 3 | STRIDE = 12 }
>
> (1 = color) which is the exact same setup as the one used to perform
> the draw. I'm guessing whatever meta_BlitFramebuffer is doing isn't
> sufficiently overriding the original vbo setup. (Although the actual
> addresses of the buffers are now different, so it's not completely
> ignoring the vertices used for the blit...)
>
> I'll keep looking at this, but if anyone has any ideas, let me know.
>
>
> On Sun, Aug 10, 2014 at 7:32 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>> Hello,
>>
>> I'm trying to debug why fbo-copyteximage-simple is failing, and I'm...
>> failing. It's an extremely simple test. I'm pretty sure that the
>> copyteximage part of it has nothing to do with the failure, at least
>> it behaves identically when I just return tex instead of copiex_tex.
>>
>> Without any modifications, the test just renders one big red square. I
>> think there's something wrong with the coordinate systems since if I
>> change
>>
>> glColor4fv(red);
>> piglit_draw_rect(0, 0, TEX_WIDTH / 2, TEX_HEIGHT / 2);
>>
>> to instead be
>>
>> piglit_draw_rect(1, 1, TEX_WIDTH / 2, TEX_HEIGHT / 2);
>>
>> Then the result is all black. So I think that the coordinates are
>> being scaled up somewhere they're not supposed to be (or, conversely,
>> not being scaled down when they are supposed to be). The projection
>> matrix sent to the card is {x - 128, y - 128, z * 32767.5, 1 }. Should
>> it be scaling the coordinates down to the -1, 1 range instead? i.e. is
>> get_viewport_scale() just totally wrong? Or something in
>> nv10_emit_projection?
>>
>> Ideas welcome :)
>>
>>   -ilia
