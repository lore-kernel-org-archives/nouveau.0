From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Canvas in Firefox, corruption
Date: Tue, 5 Oct 2010 11:58:42 +0200
Message-ID: <AANLkTi=aoSJo3pppE1L5_B+g5STgc0CCOOw9V+e1QwUF@mail.gmail.com>
References: <4C6690D6.6050507@spider007.net>
	<20100814210400.1faf8378@laptop64.home>
	<4C66EA8B.2010902@spider007.net>
	<AANLkTimYsP=A8YXZNnRR9p5EtVeiCsgHndjeg6U955CW@mail.gmail.com>
	<AANLkTinf9sWfUa1_o9SXtTk2--9zpaxmo+nstyWe4L1Y@mail.gmail.com>
	<AANLkTik06ZjvbDBwTvRZmC3ZWtA2P8u2Sq+Mg79Emu6f@mail.gmail.com>
	<AANLkTineRoqREeC7_pSH9Xf8_zO0n9dxDMAGgZq8HPJr@mail.gmail.com>
	<AANLkTikX6cL2+TzzErgF_iwzrTHmRKp8sj9H=TY0XHju@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTikX6cL2+TzzErgF_iwzrTHmRKp8sj9H=TY0XHju-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 4, 2010 at 6:27 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Oct 4, 2010 at 2:29 PM, Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> https://bugzilla.mozilla.org/show_bug.cgi?id=587499#c1
>> "Or alternatively PAD repeat can be set on the source images at least in some
>> cases. Everything depends on whether it is preferable (for performance reasons)
>> to have SRC compositing operation instead of OVER for some images which are
>> known to be opaque. Also see bug 568767 for more details."
>>
>> What do you think of this comment, how does nouveau handle that ?
>>
>
> nv40+ will be fine, older cards can't repeat NPOT textures. So in that
> sense switching to ARGB is better than RepeatPad.
>
>

3 new comments after I posted your answer there.
It would really be awesome if you could just check directly in the bug
report what they are saying, and comment if necessary :)
