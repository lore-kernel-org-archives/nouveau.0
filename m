From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Kernel module fails to initialize on AMD751 based
	system with NV34
Date: Thu, 20 May 2010 09:22:14 -0400
Message-ID: <AANLkTilNGyLcP8Dr95RJJx1T5lWBXbRmB1ZtnbRBJBA6@mail.gmail.com>
References: <AANLkTilecapB4FA9X-aufTLQql_-tkjv786dkH8L2H9N@mail.gmail.com>
	<AANLkTim9Eh1tnMgYM_NyGkjQI9cq0wyvUbZkd1IeaVo-@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTim9Eh1tnMgYM_NyGkjQI9cq0wyvUbZkd1IeaVo--JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, May 19, 2010 at 6:17 PM, Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Is there anything I can do in order to debug this?
>
> Thank you in advance, Clemens
>
> 2010/5/14 Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> Today I tried Ubuntu-10.04 on a system with an NV34 (Geforce-5200)
>> AMD-751 (Ironlake) Northbridge,
>> however the kernel-module fails to initialize.
>>
>> Any idea what could be going wrong?
>>
>> Thank you in advance, Clemens
>>
>> PS: I filed a bug at ubuntu's launchpad:
>> https://bugs.launchpad.net/ubuntu/+bug/580656

Seems to be failing on trying to read from the user area (despite the
ioremap of that area succeeding), but before that there is another
failure that forces it to take the channel down before it's fully
initialized. Can you paste the output of lspci -vv for the video card
just out of curiousity?
