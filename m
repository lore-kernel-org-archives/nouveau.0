From: Martin PERES <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Gart to vram/vram to gart transfers broken on NVS 140M
Date: Sun, 25 Apr 2010 18:45:37 +0200
Message-ID: <4BD471B1.8080600@free.fr>
References: <4BD02139.4090506@free.fr>
	<x2g6a89f9d51004220320w47174461l295eac76baa1e0e1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <x2g6a89f9d51004220320w47174461l295eac76baa1e0e1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 22/04/2010 12:20, Stephane Marchesin a =E9crit :
> On Thu, Apr 22, 2010 at 03:13, Martin Peres<martin.peres-GANU6spQydw@public.gmane.org>  wrote:
>    =

>> Hi Nouveau folks,
>>
>> I've been encountering some corruption on pixmaps for a while now, and it
>> seems like the problem comes from the DFS/UTS (Download From Screen / Up=
load
>> To Screen).
>>
>> In fact, I'm pretty sure the problem comes from there as screenshots are
>> garbled and so does a few more things.
>>
>> I may have time to dig this up, where should I start, is there some
>> documentation on the NVS 140M ? Where is the gart2vram code located ?
>> Do you have any idea of where could be the problem ?
>>
>>      =

> If you really think that's UTS/DFS, edit nouveau_exa.c and disable
> them (change the UTS/DFS functions to return FALSE, that'll trigger
> fallbacks to sw copying).
>
> Stephane
>    =

In fact, following your advice triggers a lot more corruption. So, the =

problem comes from elsewhere. My corruption problem seems like  there is =

a codepath that copy a pixmap with wrong height and width.

I'll dig into it. I'll keep in touch.

Martin
