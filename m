From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Canvas in Firefox, corruption
Date: Mon, 4 Oct 2010 14:29:05 +0200
Message-ID: <AANLkTineRoqREeC7_pSH9Xf8_zO0n9dxDMAGgZq8HPJr@mail.gmail.com>
References: <4C6690D6.6050507@spider007.net>
	<20100814210400.1faf8378@laptop64.home>
	<4C66EA8B.2010902@spider007.net>
	<AANLkTimYsP=A8YXZNnRR9p5EtVeiCsgHndjeg6U955CW@mail.gmail.com>
	<AANLkTinf9sWfUa1_o9SXtTk2--9zpaxmo+nstyWe4L1Y@mail.gmail.com>
	<AANLkTik06ZjvbDBwTvRZmC3ZWtA2P8u2Sq+Mg79Emu6f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTik06ZjvbDBwTvRZmC3ZWtA2P8u2Sq+Mg79Emu6f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Sjon <archlinux.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Aug 18, 2010 at 11:51 PM, Xavier Chantry
<chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Aug 15, 2010 at 12:48 AM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Maybe someone should tell mozilla to use ARGB instead of XRGB, because
>> that will be hardware accelerated (XRender and opengl disagree on what
>> should be sampled when going outside the texture without an alpha
>> channel).
>>
>
> You are very welcome to add any corrections or clarifications to the report.
> https://bugzilla.mozilla.org/show_bug.cgi?id=587499
>

https://bugzilla.mozilla.org/show_bug.cgi?id=587499#c1
"Or alternatively PAD repeat can be set on the source images at least in some
cases. Everything depends on whether it is preferable (for performance reasons)
to have SRC compositing operation instead of OVER for some images which are
known to be opaque. Also see bug 568767 for more details."

What do you think of this comment, how does nouveau handle that ?
