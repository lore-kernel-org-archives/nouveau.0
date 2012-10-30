From: Andreas Boll <andreas.boll.dev@gmail.com>
Subject: Re: [PATCH][8.0] nvfx: handle some unknown PIPE_CAPs
Date: Tue, 30 Oct 2012 18:49:05 +0100
Message-ID: <CACiKqBcx6JXGKotbxmK0sRgpjnfZRdpNUNFp1jkOkB5P1hPrWw@mail.gmail.com>
References: <1351616616-29106-1-git-send-email-andreas.boll.dev@gmail.com>
	<1351618403.1434.49.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1351618403.1434.49.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

2012/10/30 Lucas Stach <dev@lynxeye.de>:
> Am Dienstag, den 30.10.2012, 18:03 +0100 schrieb Andreas Boll:
>> fixes these warnings:
>>
>> nvfx_screen_get_param:95 - Warning: unknown PIPE_CAP 30
>> nvfx_screen_get_param:95 - Warning: unknown PIPE_CAP 55
>> nvfx_screen_get_param:95 - Warning: unknown PIPE_CAP 56
>> nvfx_screen_get_param:95 - Warning: unknown PIPE_CAP 58
>> nvfx_screen_get_param:95 - Warning: unknown PIPE_CAP 59
>>
>> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=47442
>> Bugzilla: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=674965
>> Signed-off-by: Andreas Boll <andreas.boll.dev@gmail.com>
>
> While this doesn't really fix anything:
> Reviewed-by: Lucas Stach <dev@lynxeye.de>

Yeah I know, but it's pretty annoying for users who don't know it and
it's easy to fix.

>> ---
>>
>> Note: This patch is only for the 8.0 branch.
>> Compile tested only.
>>
>>  src/gallium/drivers/nvfx/nvfx_screen.c |    6 ++++++
>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nvfx/nvfx_screen.c b/src/gallium/drivers/nvfx/nvfx_screen.c
>> index b4a1b3a..26c2d8d 100644
>> --- a/src/gallium/drivers/nvfx/nvfx_screen.c
>> +++ b/src/gallium/drivers/nvfx/nvfx_screen.c
>> @@ -88,6 +88,12 @@ nvfx_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
>>       case PIPE_CAP_MAX_TEXEL_OFFSET:
>>       case PIPE_CAP_CONDITIONAL_RENDER:
>>       case PIPE_CAP_TEXTURE_BARRIER:
>> +     case PIPE_CAP_MAX_STREAM_OUTPUT_BUFFERS:
>> +     case PIPE_CAP_MAX_STREAM_OUTPUT_SEPARATE_COMPONENTS:
>> +     case PIPE_CAP_MAX_STREAM_OUTPUT_INTERLEAVED_COMPONENTS:
>> +     case PIPE_CAP_STREAM_OUTPUT_PAUSE_RESUME:
>> +     case PIPE_CAP_TGSI_CAN_COMPACT_VARYINGS:
>> +     case PIPE_CAP_TGSI_CAN_COMPACT_CONSTANTS:
>>                  return 0;
>>       case PIPE_CAP_MIXED_COLORBUFFER_FORMATS:
>>                  return 0;
>
>
