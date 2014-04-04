From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH 2/2] docs: mark ARB_texture_gather
	as done on nvc0
Date: Fri, 4 Apr 2014 14:18:52 -0400
Message-ID: <CAKb7Uvg8bdRwNKCRcXYkV0NJBrDSO1kgh5EdA6mcA479Fy+g=g@mail.gmail.com>
References: <1396589747-17988-1-git-send-email-imirkin@alum.mit.edu>
 <1396589747-17988-2-git-send-email-imirkin@alum.mit.edu>
 <533EE571.2070005@freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <533EE571.2070005-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ian Romanick <idr-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Apr 4, 2014 at 1:01 PM, Ian Romanick <idr-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:
> On 04/03/2014 10:35 PM, Ilia Mirkin wrote:
>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>> ---
>>  docs/GL3.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/docs/GL3.txt b/docs/GL3.txt
>> index d9cc708..bf51e3a 100644
>> --- a/docs/GL3.txt
>> +++ b/docs/GL3.txt
>> @@ -107,7 +107,7 @@ GL 4.0:
>>    GL_ARB_tessellation_shader                           not started
>>    GL_ARB_texture_buffer_object_rgb32                   DONE (i965, nvc0, r600, radeonsi, softpipe)
>>    GL_ARB_texture_cube_map_array                        DONE (i965, nv50, nvc0, r600, softpipe)
>> -  GL_ARB_texture_gather                                DONE (i965, nv50)
>> +  GL_ARB_texture_gather                                DONE (i965, nv50, nvc0)
>
> Do you also want to add this to the release notes?

I wasn't really sure what the policy of what got added to release
notes was, so I just never touched it. Should all new driver extension
support be listed under "New features"? (I had interpreted it as "new
features in core mesa".)
