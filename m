From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH] renouveau/nv10: remove duplicate vertex
	buffer registers
Date: Mon, 1 Mar 2010 14:18:04 +0100
Message-ID: <ff13bc9a1003010518s1fb4db5cj7ada2adc6d7e2604@mail.gmail.com>
References: <1267211574-2443-1-git-send-email-luca@luca-barbieri.com>
	<87wrxwn7uc.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87wrxwn7uc.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 1, 2010 at 2:34 AM, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
> Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:
>
>> NV10TCL defines the vertex buffer registers both as arrays and as
>> individual named registers.
>>
>> This causes duplicate register definitions and the individual registers
>> are not used either by the DDX or by the Mesa driver.
>>
>> Francisco Jerez said to remove them all.
>>
> I forgot to ask: why do they bother you?

I am experimenting with rewriting renouveau-gen.c in Python, and
stored registers in a dictionary with the register offset as key.

Having multiple registers at the same offset obviously causes issues
with that, and this is the only instance of that problem, so it seems
better to remove it than adding complexity to tools to handle it.
