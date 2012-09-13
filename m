From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: add default debug level override
Date: Thu, 13 Sep 2012 14:20:34 +0200
Message-ID: <20120913122034.GA2762@joi.lan>
References: <20120912225006.GC8067@joi.lan>
	<20120913020920.GA11828@nisroch.bne.redhat.com>
	<20120913112516.GA3243@joi.lan>
	<CACAvsv4QTGOjVDZPNyg1UMxEWkRrOQVceDXfaO7nVoWmP8YMWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACAvsv4QTGOjVDZPNyg1UMxEWkRrOQVceDXfaO7nVoWmP8YMWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Sep 13, 2012 at 10:09:33PM +1000, Ben Skeggs wrote:
>    On Thursday, September 13, 2012, Marcin Slusarz wrote:
> 
>      On Thu, Sep 13, 2012 at 12:09:20PM +1000, Ben Skeggs wrote:
>      > On Thu, Sep 13, 2012 at 12:50:06AM +0200, Marcin Slusarz wrote:
>      > > Useful when we don't know which subsystem is failing.
>      > This is really unnecessary unless I'm missing something.  You can
>      pass nouveau.debug=LEVEL (without specifying a subdev name) to set
>      the default already.
>      Does not work for me: [1]http://bpaste.net/show/45252/
> 
>    nouveau.debug=paranoia ;)
> 
>    As mentioned previously, i'll document this somewhere.

Now it works, thanks.
But please make it accept numbered levels... (optional, of course)

Marcin
