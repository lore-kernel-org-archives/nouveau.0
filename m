From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Does Nouveau support for vdpau?
Date: Sun, 25 Sep 2011 12:16:00 -0400
Message-ID: <CAMVNhxTEP6T1s6weFw7RFadx5yF+rHS5aQDufEx9oqcEPeLbGA@mail.gmail.com>
References: <CAAMvbhEFvz7mVAxbzZaLSHWoaTXAmzjnY=QivwTQUP5+gQg5VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAMvbhEFvz7mVAxbzZaLSHWoaTXAmzjnY=QivwTQUP5+gQg5VQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: James Courtier-Dutton <james.dutton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Sep 25, 2011 at 5:37 AM, James Courtier-Dutton
<james.dutton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> Does nouveau support vdpau?
> If not, how far is it away from some type of HD Video output accel ?
> Use-case: Zotac mini PC with ION chipset and HDMI output running mythtv.
> This setup works very nicely with the nvidia driver and vdpau. I am
> just wondering about nouveau support.
>
> Kind Regards

Simple answer is no it doesn't. It will probably be quite a while
away, video decoding on that particular chip and most others requires
quite a bit of microcode.
