From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/nv31/mpeg: don't recognize nv3x cards
 as having nv44 graph class
Date: Mon, 29 Jul 2013 19:30:47 -0400
Message-ID: <CAKb7UvimNrAtrPApuvdh6RQFhF+YkWdBn0wSy_jESxxkRpupqA@mail.gmail.com>
References: <1375139118-17398-1-git-send-email-imirkin@alum.mit.edu>
	<1375139118-17398-3-git-send-email-imirkin@alum.mit.edu>
	<51F6FA5A.3030703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <51F6FA5A.3030703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 29, 2013 at 7:27 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 30/07/13 00:05, Ilia Mirkin wrote:
>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>> ---
>>  drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
>> index 9f7c7d5..c190043 100644
>> --- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
>> +++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
>> @@ -284,7 +284,10 @@ nv31_mpeg_init(struct nouveau_object *object)
>>       /* PMPEG init */
>>       nv_wr32(priv, 0x00b32c, 0x00000000);
>>       nv_wr32(priv, 0x00b314, 0x00000100);
>> -     nv_wr32(priv, 0x00b220, nv44_graph_class(priv) ? 0x00000044 : 0x00000031);
>> +     if (nv_device(priv)->chipset >= 0x40 && nv44_graph_class(priv))
>> +             nv_wr32(priv, 0x00b220, 0x00000044);
>> +     else
>> +             nv_wr32(priv, 0x00b220, 0x00000031);
> Might be a nitpicking too much, but I believe the check makes more sense
> inside nv44_graph_class(), despite that this is the only nv3x context
> that uses it

Yeah, I was going back and forth on that. My final conclusion is that
you should only be using nv44_graph_class if you're already nv40, and
this is a bit of an abuse. So it has to do more checking as a result.
But I can definitely see it the other way too... I don't think any of
the uses are in a sufficiently fast path where an extra conditional
would matter. Ben, up to you.

  -ilia
