From: Christoph Bumiller <e0425955@student.tuwien.ac.at>
Subject: Re: [PATCH] nv50: Fix broken assertion
Date: Tue, 07 Feb 2012 14:03:01 +0100
Message-ID: <4F312105.8030406@student.tuwien.ac.at>
References: <1018561156.666958.1328618878593.JavaMail.root@zimbra-prod-mbox-2.vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1018561156.666958.1328618878593.JavaMail.root@zimbra-prod-mbox-2.vmware.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Jose Fonseca <jfonseca@vmware.com>
Cc: nouveau@lists.freedesktop.org, Daniel Stone <daniel@fooishbar.org>, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 07.02.2012 13:47, Jose Fonseca wrote:
> Makes sense.

Very much so ...
http://cgit.freedesktop.org/mesa/mesa/commit/?id=189e6c7e81ce35b89d9b52d4bd0d6271a7e9c10f
(of 26 hours ago).

>
> Jose
>
> ----- Original Message -----
>> The assertion added in f09910f3 broke nv50 completely by asserting
>> that
>> the number of elements in a dereferenced pointer (i.e. 1) was greater
>> than i (which ranged up to six), rather than checking the number of
>> elements in the containing array.
>>
>> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
>> ---
>>  src/gallium/drivers/nv50/nv50_pc_regalloc.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nv50/nv50_pc_regalloc.c
>> b/src/gallium/drivers/nv50/nv50_pc_regalloc.c
>> index 72922cb..12a59cb 100644
>> --- a/src/gallium/drivers/nv50/nv50_pc_regalloc.c
>> +++ b/src/gallium/drivers/nv50/nv50_pc_regalloc.c
>> @@ -421,7 +421,7 @@ phi_opnd_for_bb(struct nv_instruction *phi,
>> struct nv_basic_block *b,
>>     int i, j;
>>  
>>     for (j = -1, i = 0; i < 6 && phi->src[i]; ++i) {
>> -      assert(i < Elements(phi->src[i]));
>> +      assert(i < Elements(phi->src));
>>        srci = phi->src[i];
>>        /* if already replaced, check with original source first */
>>        if (srci->flags & NV_REF_FLAG_REGALLOC_PRIV)
>> --
>> 1.7.9
>>
>> _______________________________________________
>> mesa-dev mailing list
>> mesa-dev@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
>>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
