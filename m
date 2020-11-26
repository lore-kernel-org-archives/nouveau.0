From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [BUG][NOUVEAU] G70 broken since 5.10-rc1
Date: Thu, 26 Nov 2020 13:41:03 +0100
Message-ID: <47ab20f6-dc56-8ade-29b6-f8fc684628d3@amd.com>
References: <db0e5f78-8271-24b5-62f6-5473f69ac8d6@compro.net>
 <c2ee46af-79a8-9a07-b12d-b755017ee500@amd.com>
 <aa4e3741-b1b2-4ae2-6b35-880b40c985c8@compro.net>
 <e84a7564-921c-d852-b62d-80563bea99b1@amd.com>
 <3f22c4f6-83fd-ef11-ba1d-bc85d6a0d557@cfl.rr.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------093077957EB13B9EC07936BD"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3f22c4f6-83fd-ef11-ba1d-bc85d6a0d557-3tLf1voIkJTQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dmarkh-3tLf1voIkJTQT0dZR+AlfA@public.gmane.org, markh-n2QNKt385d+sTnJN9+BGXg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--------------093077957EB13B9EC07936BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mark,

Am 26.11.20 um 13:26 schrieb Mark Hounschell:
> On 11/26/20 7:05 AM, Christian König wrote:
>> Hi Mark,
>>
>> Am 26.11.20 um 10:59 schrieb Mark Hounschell:
>>> On 11/26/20 3:35 AM, Christian König wrote:
>>>>> I'm running an older "NVIDIA Corporation G70 [GeForce 7800 GT] 
>>>>> (rev a1)" card in a newer BIOSTAR B550GTA MB. Kernel 5.10-rcx does 
>>>>> not work. I get no virtual consoles or X screen.
>>
>> thanks for the dmesg.
>>
>> Problem is I don't have the slightest idea what's going wrong here :)
>>
>> The code should be functional identical, it was just moved from TTM 
>> to nouveau, so we are missing some detail in the handling.
>>
>> Can you run the following test for me: First you need to disable 
>> loading of the nouveau kernel module by adding 
>> modprobe.blacklist=nouveau to the kernel command line.
>>
>> Then log into the system over the network and run the following 
>> commands:
>>
>> sudo modprobe ttm
>> sudo bash -c "echo 'ttm_bo_kmap' > 
>> /sys/kernel/debug/tracing/set_graph_function"
>> sudo bash -c "echo function_graph > 
>> /sys/kernel/debug/tracing/current_tracer"
>> sudo modprobe nouveau
>> sudo bash -c "cat /sys/kernel/debug/tracing/trace" > trace.log
>>
>> Please then send me the resulting trace.log file so that I can 
>> investigate why mapping the framebuffer fails during driver load.
>>
>> Thanks in advance,
>> Christian.
>
> I hope this is what you need. I do normally turn off a lot of debug 
> features. Let me know if I need to change the kernel config.

It was not what I had expected but it pointed me in the right direction. 
I think I've found the problem, it's just an uninitialized return value 
for your hardware generation.

Please try the attached patch and let me know if it fixes the problem.

Thanks in advance,
Christian.

--------------093077957EB13B9EC07936BD
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-nouveau-make-sure-ret-is-initialized-in-nouveau_.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-drm-nouveau-make-sure-ret-is-initialized-in-nouveau_.pa";
 filename*1="tch"

From 293d608f04f7be857739a7403adaf044dd6ef80a Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Date: Thu, 26 Nov 2020 13:35:08 +0100
Subject: [PATCH] drm/nouveau: make sure ret is initialized in
 nouveau_ttm_io_mem_reserve
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This wasn't initialized for pre NV50 hardware.

Signed-off-by: Christian König <christian.koenig-5C7GfCeVMHo@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7aa4286784ae..42292b3a6eb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1135,8 +1135,8 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *reg)
 			}
 
 			reg->bus.offset = handle;
-			ret = 0;
 		}
+		ret = 0;
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.25.1


--------------093077957EB13B9EC07936BD
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--------------093077957EB13B9EC07936BD--
