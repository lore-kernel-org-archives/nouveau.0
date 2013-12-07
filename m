From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Subject: Re: [PATCH] nv50: enable MPEG-4 for NVA3+ (VP4.0)
Date: Sat, 07 Dec 2013 17:27:41 +0100
Message-ID: <52A34C7D.4070004@labri.fr>
References: <1386391387-26182-1-git-send-email-imirkin@alum.mit.edu>	<1386421882-25352-1-git-send-email-martin.peres@free.fr>
	<CAKb7UviogOGD1XnwpsKyG0H=RKRW+5j1vn85zmOhb45VUiHHHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviogOGD1XnwpsKyG0H=RKRW+5j1vn85zmOhb45VUiHHHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "10.0" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 07/12/2013 17:09, Ilia Mirkin wrote:
> On Sat, Dec 7, 2013 at 8:11 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
>> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>>
>> This patch is a follow-up from Ilia Mirkin's enable H.264 patch which
>> solves the problem that prevented MPEG-4 videos to play correctly.
>>
>> Tested on an nva3.
>
> I might reword this as
>
> """
> VP3/VP4 now work on all the codecs they are supposed to, remove old restriction.
>
> Tested on NVA3
> """
>
> Or something like that...

Yeah, that would make more sense. Feel free to reword it before committing.
