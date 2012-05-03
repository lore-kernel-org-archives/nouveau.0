From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [PATCH] nv50: fix crash in NV50SyncToVBlank
Date: Thu, 03 May 2012 18:25:58 +0200
Message-ID: <4FA2B196.9010308@student.tuwien.ac.at>
References: <20120415010821.GA797@joi.lan> <20120415114642.GA2838@joi.lan>
	<20120503130856.GA8541@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120503130856.GA8541-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 05/03/2012 03:08 PM, Marcin Slusarz wrote:
> On Sun, Apr 15, 2012 at 01:46:42PM +0200, Marcin Slusarz wrote:
>> Regression from "WIP: port to new libdrm".
>> ---
>>  src/nv50_accel.c |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/src/nv50_accel.c b/src/nv50_accel.c
>> index 66d6cb8..7c640f2 100644
>> --- a/src/nv50_accel.c
>> +++ b/src/nv50_accel.c
>> @@ -44,6 +44,9 @@ NV50SyncToVBlank(PixmapPtr ppix, BoxPtr box)
>>  	if (!crtcs)
>>  		return;
>>  
>> +	if (!PUSH_SPACE(push, 10))
>> +		return;
>> +
>>  	BEGIN_NV04(push, SUBC_NVSW(0x0060), 2);
>>  	PUSH_DATA (push, pNv->vblank_sem->handle);
>>  	PUSH_DATA (push, 0);
>> -- 
> 
> Nobody uses "sync to vblank"? It's crashy as hell without this patch...
> 

Apparently not ... I certainly never enable it because I couldn't find
the switch that doesn't require restarting the X server yet (granted, I
haven't looked besides noticing driconf doesn't do it).

Patch pushed, thank you.


> Marcin
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
